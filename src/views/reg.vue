<template>
    <div>
        <my-header></my-header>
        <!-- 注册页面 -->
        <main>
            <div class="reg">
                <div class="d-flex">
                    <p>新用户注册</p>
                    <router-link :to="{path:'login'}">已有账号</router-link>
                </div>
                <div>
                    用户名：<input id="uname" placeholder="请输入您的用户名" v-model="uname" @blur="blur" @focus="focus" class="p-2 mr-3 my-1">  
                    <span id="name"></span>
                </div>
                <div>
                    密码：<input type="password" id="upwd" v-model="upwd" @blur="blur" @focus="focus" placeholder="请输入您的密码" class="p-2 mr-3 my-1">
                    <span id="pwd"></span>
                </div>
                <div>
                    确认密码：<input type="password" id="cpwd" @blur="blur" @focus="focus" v-model="cpwd" placeholder="请再次输入密码" class="p-2 mr-3 my-1">
                    <span id="tpwd"></span>
                </div>
                <div>
                    邮箱：<input id="email" placeholder="请输入您的邮箱" @blur="blur" v-model="email" class="p-2 mr-3 mb-2">
                    <span id="mail"></span>
                </div>
                <div>
                    电话：<input id="phone" placeholder="请输入您的电话" @blur="blur" v-model="phone" class="p-2 mr-3">
                    <span id="tel"></span>
                </div>
                <div>
                    性别：<label><input type="radio" value="1" name="sex">男</label><label><input type="radio" value="0" name="sex" checked>女</label>
                </div>
                <div>
                    <button @click="reg">注册</button>
                </div>
            </div>
        </main>
        <my-footer></my-footer>
    </div>
</template>
<script>
export default {
    data(){
        return {
            uname:"",
            upwd:"",
            cpwd:"",
            email:"",
            phone:"",
            sex:0
        }
    },
    methods:{
        focus(e){//获得焦点事件
            var that=e.target;
            if(this.id=="uname"){
                $("#name").css("color","#fff")
                .html("请输入3~12位数字、字母或下划线，不能以数字开头")
                return;
            }else if(this.id=="upwd"){
                $("#pwd").css("color","#fff")
                .html("请输入6~12位数字或字母")
                return;
            }else if(this.id=="cpwd"){
                $("#tpwd").css("color","#fff")
                .html("请输入6~12位数字或字母")
                return;
            }
        },
        blur(e){
            var input=e.target;
            if(input.id=="uname"){
                var u=this.uname;
                if(!u){
                    this.$toast("用户名不能为空");
                    return
                };
                var reg=/^[a-z]\w{3,12}$/i;
                if(!reg.test(u)){
                    this.uname="";
                    $("#name").css("color","red")
                    .html("用户名格式不正确");
                    return;
                }else{
                    var url="user/check";
                    var obj={params:{uname:this.uname}};
                    this.axios.get(url,obj).then(res=>{
                        if(res.data.code==1){
                            $("#name").css("color","red").html("用户名已存在！");
                            this.uname="";
                            return;
                        }else{
                            $("#name").css("color","green").html("用户名可用！")
                            return;
                        }
                    })
                }
            }else if(input.id=="upwd"){
                var p=this.upwd;
                if(!p){
                    this.$toast("密码不能为空！");
                    return;
                }
                var reg=/^[0-9a-z]{6,12}$/i;
                if(!reg.test(p)){
                    this.upwd="";
                    $("#pwd").css("color","red")
                    .html("密码格式不正确！");
                    return;
                }else{
                    $("#pwd").css("color","green")
                    .html("密码输入成功！");
                    return;
                }
            }else if(input.id=="cpwd"){
                var p=this.upwd;
                var t=this.cpwd;
                if(!t){
                    this.$toast("密码验证不能为空！");
                    return;
                }
                if(p!=t){
                    this.cpwd="";
                    $("#tpwd").css("color","red")
                    .html("两次密码不一致！");
                    return;
                }else{
                    $("#tpwd").css("color","green")
                    .html("两次密码相同！");
                    return;
                }
            }else if(input.id=="email"){
                var e=this.email;
                if(!e){
                    this.$toast("邮箱不能为空！");
                    return;
                }
                var reg=/^[0-9a-z]\w*@\w+\.\w+(\.cn)?$/i;
                if(!reg.test(e)){
                    $("#mail").css("color","red")
                    .html("邮箱格式不正确");
                    return;
                }else{
                    $("#mail").css("color","green").html("邮箱输入成功");
                    return;
                }
            }else if(input.id=="phone"){
                var ph=this.phone;
                if(!ph){
                    this.$toast("电话不能为空！");
                    return;
                }
                var reg=/^1[3-9]\d{9}$/;
                if(!reg.test(ph)){
                    $("#tel").css("color","red")
                    .html("电话格式不正确");
                    return;
                }else{
                    $("#tel").css("color","green").html("电话号码可用");
                    return;
                }
            }
        },
        reg(){
            var name=this.uname;
            var pwd=this.upwd;
            var cp=this.cpwd;
            var em=this.email;
            var ph=this.phone;
            var sex=document.getElementsByName("sex");
            if(sex[0].checked){
                this.sex=1
            }else{
                this.sex=0
            }
            var gender=this.sex;
            if(name==""){
                this.$messagebox("消息","用户名不能为空");
                uname.focus();
                return;
            }
            if(pwd==""){
                this.$messagebox("消息","密码不能为空");
                upwd.focus();
                return;
            }
            if(cp==""){
                this.$messagebox("消息","请进行密码验证");
                cpwd.focus();
                return;
            }
            if(em==""){
                this.$messagebox("消息","请输入您的邮箱");
                email.focus();
                return;
            }
            if(ph==""){
                this.$messagebox("消息","请输入您的联系方式");
                phone.focus();
                return;
            }
            var url="user/reg";
            var obj={params:{uname:name,upwd:pwd,email:em,phone:ph,gender}};
            this.axios.get(url,obj).then(res=>{
                if(res.data.code==-1){
                    this.$messagebox("消息","注册失败,请重试").then(()=>{
                        this.$router.push("Reg");
                        $("#uname").focus(); 
                    })
                }else{
                    this.$messagebox("消息","注册成功").then(this.$router.push("Index") ) 
                }
            })
        }
    }
}
</script>
<style  scoped>
main{
        height:800px;
        background: url('../assets/img/others/reg.jpg') no-repeat center center;
        background-size:cover;
        position:relative
    }
    .reg{
        position:absolute;
        top:15%;
        left:50%
    }
</style>