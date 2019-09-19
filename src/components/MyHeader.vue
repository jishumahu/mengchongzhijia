<template>
    <div>
        <!-- 主体 -->
        <div class="container-fluid p-0">
            <!-- 上部分 -->
            <div class="row hupper">
                <!-- 中间 -->
                <h6 class="huptxt">宠物之家欢迎您~</h6>
                <!-- 右侧 -->
                <div class="hupleft">
                    <ul id="d1" class="d-flex hupul">
                        <li>
                            <router-link :to="{path:'login'}">登录</router-link>
                        </li>
                        <li class="hupline">|</li>
                        <li>
                            <router-link :to="{path:'reg'}">注册</router-link>
                        </li>
                    </ul>
                    <ul id="d2" class="row hupul"  style="display:none">
                        <li>
                            <span class="text-success pr-2">欢迎<span class="my_bigger px-2">{{this.uname}}</span></span>
                        </li>
                        <li class="hupline">|</li>
                        <li>
                            <a href="javascript:;" @click="gotocart" >
                                <img src="../assets/img/header/shop_car1.png" alt="" title="我的购物车" class="px-3"/>
                            </a>
                        </li>
                        <li class="hupline">|</li>
                        <li>
                            <a href="javascript:;" @click="signout" class="text-muted px-2">注销</a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- 中部分 -->
            <div class="hbet row m-0">
                <!-- 左侧logo图 -->
                <div class="hbetlogo col-3 p-0">
                    <img class="logo" src="../assets/img/header/logo.png" alt="">
                </div>
                <!-- 中间搜索框 -->
                <div class="hbetinput col-5 p-0">
                    <input type="text" placeholder="请输入关键词搜索" v-model="kw" @keydown.13="search" @blur="search">
                </div>
                <!-- 右侧练习QQ-微信-二维码 -->
                <div class="hbetdown col-4 p-0">
                    <!-- QQ-WX -->
                    <div class="hbettxt">
                        <h4>QQ:5645613165</h4>
                        <h4>WX:5645613165</h4>
                    </div>
                    <!-- 二维码 -->
                    <div class="picture">
                        <img class="hbetimg" src="../assets/img/header/ch.png">
                    </div>
                </div>
            </div>
            <!-- 下部分 -->
            <div class="hdown">
                <ul class="hdownul">
                    <!-- 刷新页面的作用 -->
                    <li class="hdownli">
                        <router-link :to="{path:'index'}">萌宠之家</router-link>
                    </li>
                    <li class="hdownli">
                        <router-link :to="{path:'cutepets'}">喵之窝</router-link>
                    </li>
                    <li class="hdownli">
                        <router-link :to="{path:'products'}">宠物用品</router-link>
                    </li>
                    <li class="hdownli">
                        <router-link :to="{path:'aboutpet'}">铲屎官的自我修养</router-link>
                    </li>
                    <li class="hdownli">
                        <a href="javascript:;">关于我们</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            kw:"", //搜索框文本中的关键字，用于模糊查询
            uname:"",
            islogin:false
        }
    },
    methods:{
        //搜索框中点击回车，即可跳转到商品列表界面，根据kw搜索对应商品
        search(){
            this.$router.replace("products/"+this.kw)
        },
        signout(){//注销
            $("#d1").css("display","inline-block");
            $("#d2").css("display","none");
            this.$store.commit("signout");
            sessionStorage.removeItem('uname');
            sessionStorage.removeItem('islogin');
        },
        begin(){//页面DOM树构建完成，根据用户登陆状态判断d1,d2显示状态
            if(this.islogin){
                $("#d1").css("display","none");
                $("#d2").css("display","inline-block");
            }else{
                $("#d1").css("display","inline-block");
                $("#d2").css("display","none");
            }
        },
        gotocart(){//前往购物车
            this.$router.push("carts")
        }
    },
    created(){
        this.kw=this.$route.params.kw;//获取地址栏中的kw值
        //刷新页面时调用，根据sessionStorage中islogin判断登录状态，并修改store中的值
        this.$store.commit("isLogin");
        //获取vuex中保存的用户信息
        var user=this.$store.getters.getUser;
        //修改data中的uname和islogin
        this.islogin=user.islogin;
        this.uname=user.uname;
    },
    mounted(){
        this.begin();
    },
    watch:{
        //如果地址栏中已经有用户输入的关键词参数kw，则自动获取到搜索文本框中保持同步
        $route(){
            this.kw=this.$route.params.kw;
        }
    }
}
</script>
<style  scoped>
/* 头部大体分为上中下三部分 */
/* 上部分css */
/* 上部分背景 */
body{margin:0;}
ul{list-style:none;}
.row{display:flex;}
/* .container-fluid{width:100%;} */
.container-fluid>.hupper{background:#FAB7DA;width:100%;height:40px;}
.container-fluid>.hupper>.huptxt{line-height:40px;margin:0 auto;color:#833535;}
.container-fluid>.hupper>.hupleft{line-height:40px;margin:0}
.container-fluid>.hupper>.hupleft>.hupul{padding:0;margin:0;margin-right:150px;}
.container-fluid>.hupper>.hupleft>.hupul>.hupline{margin:0 20px;}
.container-fluid>.hupper>.hupleft>.hupul>li>a{font-family:"Microsoft YaHei";font-size:14px;color:#833535;text-decoration:none;}
.container-fluid>.hupper>.hupleft>.hupul>li>a:hover{color:#000;font-weight:700;}
/* 中部分css */
.hbet>.hbetlogo>.logo{width:90px;margin-left:23rem}
.hbet>.hbetinput>input{
    width:20rem;
    height:2.5rem;
    padding-left:0.8rem;
    border-radius:2.5rem;
    background-color:#f5f5f5 !important;
    outline:0;border:0;
    margin-top:2rem;
    margin-left:18rem;
    background:url("../assets/img/header/search.png") no-repeat 97% center;
    background-size: 10%;
}
.hbet>.hbetdown{padding-left:20px;display:flex}
.hbet>.hbetdown>.hbettxt{float:left;margin:20px 30px 0 0;color:#FAB7DA;}
.hbet>.hbetdown>.picture{float:left;} 
.hbet>.hbetdown>.picture>.hbetimg{width:61px;overflow:hidden;margin-top:20px;}

/* 下部分css */
.hdown{width:100%;height:50px;background:#e9ecef;text-align:center;padding:0 200px;}
.hdown>.hdownul>.hdownli{line-height:50px;}
.hdown>.hdownul{align-items:center;flex-direction:row;display:flex;justify-content:space-around;}
.hdown>.hdownul>.hdownli>a{color:#333;text-decoration:none;}
/* .hdown>.hdownul>.hdownli>a>img{} */
.hdown>.hdownul>.hdownli>a:hover{
    color:#FAB7DA; 
    background:url("../assets/img/header/cat.png") no-repeat 100% center;
    background-size:contain; 
}
</style>