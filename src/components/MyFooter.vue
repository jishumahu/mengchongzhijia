<template>
    <div>
         <!-- 主体 -->
        <div class="fall">
            <!-- 第一层 -->
            <div class="fone">
                <ul class="fone_1 breadcrumb p-0 m-0">
                    <li class="breadcrumb-item">
                        <router-link :to="{path:'index'}">网站首页</router-link>
                    </li>
                    <li class="breadcrumb-item">
                        <router-link :to="{path:'products'}">宠物用品</router-link>
                    </li>
                    <li class="breadcrumb-item">
                        <router-link :to="{path:'products'}">宠物服饰</router-link>
                    </li>
                    <li class="breadcrumb-item">
                        <router-link :to="{path:'aboutpet'}">宠物常识</router-link>
                    </li>
                    <li class="breadcrumb-item">
                        <router-link :to="{path:'cutepets'}">萌宠中心</router-link>
                    </li>
                    <li class="breadcrumb-item">
                        <router-link :to="{path:'aboutus'}">关于我们</router-link>
                    </li>
                    <li class="breadcrumb-item">
                        <router-link :to="{path:'aboutus'}">联系我们</router-link>
                    </li>
                </ul>
            </div>
            <img class="fline" src="../assets/img/footer/footmx.png">
            <!-- 第二层 -->
            <div class="row ftwo">
                <!-- 左一 -->
                <div class="col-2 lone">
                    <img src="../assets/img/header/logo.png">
                    <p>宠物之家</p>
                </div>
                <!-- 左二 -->
                <div class="col ltwo">
                    <h6>公司信息:</h6>
                    <div>
                        <p><img src="../assets/img/footer/house.png"> 公司名称:郑州市达内科创有限公司</p>
                        <p><img src="../assets/img/footer/house1.png"> 公司地址:郑州市金水区硅谷大厦24楼</p>
                    </div>
                </div>
                <!-- 左三 -->
                <div class="col lthree">
                    <h6>联系方式:</h6>
                    <div>
                        <p><img src="../assets/img/footer/house2.png"> 传 真:0769-86019328</p>
                        <p><img src="../assets/img/footer/house3.png"> 联系电话:18925833588 | 0769-86019318</p>
                    </div>
                </div>
                <!-- 左四 -->
                <div class="col lfour">
                    <div class="lfour_1">
                        <img src="../assets/img/footer/gmy.jpg" alt="">
                        <p>微信</p>
                    </div>
                    <div class="lfour_2">
                        <img src="../assets/img/footer/wr.jpg" alt="">
                        <p>微信</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- 第三层 -->
        <div class="fthree">
            <span>版权所有© 河南F4</span>
            <span>豫ICP备5211314号-1</span>
            <span>技术支持:</span>
            <a href="javascript:;">河南F4</a>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style  scoped>
    /* 主体 */
.fall{width:100%;background:#e9ecef;padding:0 350px;}
/* 第一层 */
.fone{flex-direction:row;padding:50px 0 40px;}
.fone>.fone_1{display:flex;justify-content:space-between;}
.fone>.fone_1>li>a{color:#666;text-decoration:none;}
.fone>.fone_1>li>a:hover{color:#FAB7DA;}
/* 中间的线 */
.fline{width:1220px;}
/* 第一层面包屑导航 */
.breadcrumb-item + .breadcrumb-item::before {
    display: inline-block;
    padding-right: 0.5rem;
    padding-left: 0.5rem;
    color: #6c757d;
    content: "";
}

.breadcrumb {
    border-radius:0;
}
/* 第二层 */
/* 左一 LOGO*/
.fall>div>div>img{width:90px;}
.ftwo{padding:50px 0 40px;}
.ftwo>.lone>p{margin-left:15px;}
/* 左二 */
.ftwo>.ltwo{margin-top:10px;}
.ftwo>.ltwo>div>p{font-size:14px;}
.ftwo>.ltwo>div{margin-top:30px;}
/* 左三 */
.ftwo>.lthree{margin-top:10px;}
.ftwo>.lthree>div>p{font-size:14px;}
.ftwo>.lthree>div{margin-top:30px;}
/* 左四 */
.ftwo>.lfour>div>img{width:110px;height:100px;}
.ftwo>.lfour>div>p{text-align:center;margin-top:10px;}
.ftwo>.lfour>.lfour_1{float:left;}
.ftwo>.lfour>.lfour_2{float:left;margin-left:40px;}
/* 第三层 */
.fthree{background-color:#a4a4a4;padding:10px 350px;text-align:center;}
.fthree>span{font-size:14px;color:#fff;}
.fthree>span~span{margin-left:10px;}
.fthree>a{font-size:14px;color:#fff;text-decoration:none;}
.fthree>a:hover{color:#FAB7DA;}
</style>