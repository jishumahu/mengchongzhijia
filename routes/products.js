//商品相关路由
const express=require('express');
var router=express.Router();
var pool=require('../pool');
// 功能一：请求获取轮播图
// router.get("/products/getbanners",(req,res)=>{
    // var sql="select bid,title,pic,aid from pet_banner";
    // pool.query(sql,(err,result)=>{
    //     if(err) throw err;
    //     res.send({code:1,msg:"查询成功",data:result})
    // })
// })
//定义异步函数，查询数据库
function getData(sql,params){
    return new Promise(
        function(resolve,reject){
            pool.query(sql,params,(err,result)=>{
                if(err) reject(err);
                resolve(result)
            })
        }
    )
}
// 功能一：请求首页商品 轮播图 首页萌宠 首页宠物用品
router.get("/products/index",(req,res)=>{
    var output={
        banners:[],
        cutepet:[],
        supply:[]
    };
    var sql1="select bid,title,pic,aid from pet_banner";
    getData(sql1,[]).then(result=>{
        output.banners=result;
        var sql2="select cid,pic,details,cname,price,fid from pet_cutepet";
        return getData(sql2,[]);
    }).then(result=>{
        output.cutepet=result;
        var sql3="select sid,pic,sname,details,price,pid from pet_supply";
        return getData(sql3,[]);
    }).then(result=>{
        output.supply=result;
        res.send(output);
    }).catch(err=>{throw err})
})
//功能二：请求宠物用品列表 分页查询 模糊查询
router.get("/products/list",(req,res)=>{
    var output={
        count:0,//商品总数
        pageSize:9,//每页商品数量
        pageCount:0,//页码总数
        pno:req.query.pno||0,//当前页码数
        data:[] //商品列表
    };
    var kw=req.query.kw;
    if(!kw){
        var sql=`select pid,sf_id,title,subtitle,price,details,lg,md,sm,nums,is_onsale from pet_products`;
    }else{
        var kws=kw.split(" ");
        kws.forEach((elem,i,arr)=>{
            return `details like '%${elem}%'`;
        })
        var where=kws.join(" and ");
        var sql=`select pid,sf_id,title,subtitle,price,details,lg,md,sm,nums,is_onsale from pet_products where ${where}`;
    }
    getData(sql,[]).then(result=>{
        output.count=result.length;
        output.pageCount=Math.ceil(output.count/output.pageSize);
        sql+=` limit ?,?`;
        return getData(sql,[output.pageCount*output.pno,output.pageSize]);
    }).then(result=>{
        output.data=result;
        res.send(output);
    }).catch(err=>{throw err})
})
//功能三：获取商品详情
router.get("/products/details",(req,res)=>{
    var pid=req.query.pid;
    var sql="select pid,sf_id,title,subtitle,price,details,lg,md,sm,nums,is_onsale from pet_products where pid=?";
    pool.query(sql,[pid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result})
        }else{
            res.send({code:-1,msg:"查询失败"})
        }
    })
})
//功能四：获取宠物详情
router.get("/products/petdetails",(req,res)=>{
    var aid=req.query.aid;
    var sql="select aid,family_id,title,subtitle,price,aname,age,details,oldmaster,says,lg,md,sm,saletime,is_onsale from pet_products where aid=?";
    pool.query(sql,[pid],(err,result)=>{
        if(err) throw err;
        if(result.length>0){
            res.send({code:1,msg:"查询成功",data:result})
        }else{
            res.send({code:-1,msg:"查询失败"})
        }
    })
})
//功能五：将商品添加到购物车
router.get("/products/addcart",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var pid=req.query.pid;
    var price=req.query.price;
    var pname=req.query.title;
    var details=req.query.subtitle;
    var count=req.query.count;
    var pic=req.query.pic;
    //先查询用户是否购买过此商品
    var sql="select id from pet_pro_carts where uid=? and pid=?";
    getData(sql,[uid,pid]).then(result=>{
        if(result.length==0){//如果没买过
            var  sql=`insert into pet_pro_carts values(null,${pid},${price},${pname},${details},${count},${pic},${uid})`;
        }else{
            var sql=`update pet_pro_carts set count+=1 where uid=${uid} and pid=${pid}`
        }
        return getData(sql,[]);
    }).then(result=>{
        if(result.affectedRows>0){
            res.send({code:1,msg:"添加成功"})
        }else{
            res.send({code:-2,msg:"添加失败"})
        }
    }).catch(err=>{
        throw err
    })
})
// 功能六：查询指定用户购物车
router.get("/products/carts",(req,res)=>{
    var uid=req.session.uid;
    if(!uid){
        res.send({code:-1,msg:"请登录"});
        return;
    }
    var sql="select id,pid,price,pname,details,count,pic from pet_pro_carts where uid=?";
    pool.query(sql,[uid],(err,result)=>{
        if(err) throw err;
        res.send({code:1,msg:"查询成功",data:result})
    })
})
// 功能七：购物车中删除按钮
router.get("/products/delItem",(req,res)=>{
    var id=req.query.id;
    var sql="delete from pet_pro_carts where id=?";
    pool.query(sql,[id],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
})
// 功能八：购物车种删除多个商品
router.get("/products/delItems",(req,res)=>{
    var id=req.query.id;
    var sql=`delete from pet_pro_carts where id in (${id}`;
    pool.query(sql,[],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({code:1,msg:"删除成功"})
        }else{
            res.send({code:-1,msg:"删除失败"})
        }
    })
})















module.exports=router;