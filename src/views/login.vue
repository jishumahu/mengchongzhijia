<template>
    <div>
        <div>
            <h3>猫咪会员登录</h3>
            <p>用户名:<input placeholder="请输入用户名" id="uname" v-model="uname" @blur="unameblur" @focus="unamefocus"><span id="utxt">请输入3~12位数字或字母，不能以数字开头</span></p>
            <p>密&nbsp;&nbsp;&nbsp;&nbsp;码:<input placeholder="请输入密码" v-model="upwd" id="upwd" @focus="upwdfocus" @blur="upwdblur"><span id="ptxt">请输入6~12位数字或字母</span></p>
            <p>验证码:<input placeholder="请输入下方验证码" id="test" v-model="reg" @blur="testblur"><span id="ttest"></span></p>
            <canvas width="200" height="50" id="check">您的浏览器不支持canvas标签！请升级浏览器</canvas><span @click="drawCanvas">看不清楚？点击切换</span>
            <mt-button @click="login">登录</mt-button>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            uname:"",
            upwd:"",
            reg:"",
            n:5,
            str:""
        }
    },
    methods:{
        unamefocus(){
            // var utxt=document.getElementById("utxt");
            // utxt.style.display="block"
            $("#utxt").css("display","block");
        },
        upwdfocus(){
            if($("#utxt").css("display")=="block"){
                $("#txt").css("display","none")
            };
            $("#ptxt").css("display","block");
        },
        unameblur(){
            var reg=/^\w{3,12}$/;
            if(!reg.test(uname)){
                $("#utxt").css("color","red");
                $("#utxt").innerHTML="用户名格式不正确！！";
                this.uname="";
            }else{
                $("#utxt").css("color","green");
                $("#utxt").innerHTML="用户名输入成功！！";
                $("#upwd").focus();
            }
        },
        upwdblur(){
            var upwd=this.upwd;
            var reg=/^[0~9a~z]{6,12}$/;
            if(reg.test(upwd)){
                $("#ptxt").css("color","green");
                $("#ptxt").innerHTML="密码可用！";
                $("#test").focus();
            }else{
                $("#ptxt").css("color","red");
                $("#ptxt").innerHTML="密码格式不正确！";
                this.upwd="";
            }
        },
        login(){/*定时器不确定是否执行，后续验证，如果不行，尝试将n放在data中*/
            var uname=this.uname;
            var upwd=this.upwd;
            if(!uname){
                this.$messagebox("消息","用户名不能为空！");
                $("#uname").focus();
                return;
            };
            if(!upwd){
                this.$messagebox("消息","密码不能为空！");
                $("#upwd").focus();
                return;
            }
            if($("#ttest").innerHTML!="验证成功！"){
                this.$messagebox("消息","请先进行验证！");
                $("#test").focus();
                return;
            }
            var obj={params:{uname,upwd}};
            var url="user/login";
            this.axios.get(url,obj).then(res=>{
                if(res.data.code==1){
                    this.$toast(`登陆成功!${this.n}s后跳转到首页`); 
                    var timer=setInterval(()=>{                  
                        this.n--;
                        if(this.n==0){
                        clearInterval(timer);
                        this.$router.push("/")
                        }
                    },1000); 
                }else{
                    this.$toast("用户名或密码错误！");
                    this.uname="";
                    this.upwd="";
                    $("#uname").focus();
                }

            })
        },
        drawCanvas(){
            var ctx=$("#check").getContext("2d");
            var ctxW=$("#check").clientWidth;
            var ctxH=$("#check").clientHeight;
            /*产生一个随机数 可设置随机数区间*/
            function ranNum(min,max){
                return Math.random()*(max-min)+min
            };
            /*返回一个随机颜色，可设置颜色区间*/
            function ranColor(min,max){
                var r=ranNum(min,max);
                var g=ranNum(min,max);
                var b=ranNum(min,max);
                return `rgb(${r},${g},${b})`;
            };
            /*随机字符串数组*/
            function ranStr(){
                var str="QWERTYUIOPASDFGHJLZXCVBNMqwertyuiopasdfghjlzxcvbnm0123456789";
                return str.split("").sort(function(){//数组乱序排列
                    return Math.random()-0.5
                });
            };
            /*绘制文本字符串*/
            function drawText(cId,cW,cH,num,fsMin,fsMax,frMin,frMax,min,max){
                var str="";
                for(var i=0;i<num;i++){
                    var char=ranStr()[Math.floor(0,ranStr().length)];
                    var fs=ranNum(fsMin,fsMax);
                    cId.font=fs+"px Verdana";
                    cId.fillStyle=ranColor(min,max);
                    cId.save();//保存绘制的状态
                    cId.translate(cW/num*i+cW/20,0);//偏移
                    cId.rotate(ranNum(frMin,frMax)*Math.PI/180);//变换角度
                    cId.fillText(char,0,(cH+fs)/2.5,cW/num);
                    ctx.restore();
                    str+=char;
                }
                return str;
            };
            /*绘制背景*/
            function drawBg(cId,cW,cH,min,max){
                cId.fillStyle=ranColor(min,max);
                cId.fillRect(0,0,cW,cH);
            };
            /*绘制干扰圆点*/
            function drawCircle(cId,cW,cH,num,r,min,max){
                cId.beginPath();
                cId.arc(ranNum(0,cW),ranNum(0,cH),r,0,2*Math.PI);
                cId.fillStyle=ranColor(min,max);
                cId.fill();
                cId.closePath();
            };
            /*绘制干扰线段*/
            function drawLine(cId,cW,cH,num,min,max){
                for(var i=0;i<num;i++){
                    cId.beginPath();
                    cId.moveTo(ranNum(0,cW),ranNum(0,cH));
                    cId.lineTo(ranNum(0,cW),ranNum(0,cH));
                    cId.strokeStyle=ranColor(min,max);
                    cId.stroke();
                    cId.closePath();
                }
            };
            ctx.clearRect(0,0,200,50);//清空canvas
            drawBg(ctx,ctxW,ctxH,200,255);
            drawCircle(ctx,ctxW,ctxH,20,5,200,255);
            drawLine(ctx,ctxW,ctxH,20,0,255);
            this.str=drawText(ctx,ctxW,ctxH,4,10,50,-30,30,0,100)
            
        },
        testblur(){
            var str=this.str;
            var reg=this.reg;
            if(str==reg){
                $("#ttest").css("color","green");
                $("#ttest").innerHTML="验证成功！"
            }else{
                $("#ttest").css("color","red");
                $("#ttest").innerHTML="验证失败！"
            }
        }
    },
    created(){
        this.drawCanvas();
    }
}
</script>
<style  scoped>
    #check{
        border:1px solid #000;
    }
    #utxt,#ptxt{
        display:none;
        font-size:12px;
    }
</style>