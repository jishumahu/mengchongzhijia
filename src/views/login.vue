<template>
    <div>
        <my-header></my-header>
        <main>
            <div>
                <h3>猫咪会员登录</h3>
                <p>用户名:<input placeholder="请输入用户名" id="uname" v-model="uname" @blur="unameblur" @focus="unamefocus"><span id="utxt">请输入3~12位数字或字母，不能以数字开头</span></p>
                <p>密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" placeholder="请输入密码" v-model="upwd" id="upwd" @focus="upwdfocus" @blur="upwdblur"><span id="ptxt">请输入6~12位数字或字母</span></p>
                <p>验证码:<input placeholder="请输入下方验证码" id="test" v-model="reg" @blur="testblur"><span id="ttest"></span></p>
                <canvas width="200" height="60" id="check">您的浏览器不支持canvas标签！请升级浏览器</canvas><a @click="drawCanvas" href="javascript:;">看不清楚？点击切换</a>
                <mt-button @click="login">登录</mt-button>
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
            reg:"",
            n:5,
            str:""
        }
    },
    methods:{
        testblur(){//转小写再比较
            var str=this.str;
            var reg=this.reg;
            if(str==reg){
                $("#ttest").css("color","green")
                html("验证成功！")
            }else{
                $("#ttest").css("color","red")
                .html("验证失败！")
            }
        },
        unamefocus(){//用户名输入框获取焦点
            // var utxt=document.getElementById("utxt");
            // utxt.style.display="block"
            $("#utxt").css({display:"block",color:"#000"});
        },
        upwdfocus(){//焦点输入框获取焦点
            if($("#utxt").css("display")=="block"){
                $("#txt").css("display","none")
            };
            $("#ptxt").css("display","block");
        },
        unameblur(){//用户名输入框失去焦点验证
            var reg=/^\w{3,12}$/i;
            if(!reg.test(this.uname)){
                $("#utxt").css("color","red");
                $("#utxt").html("用户名格式不正确！！");
                this.uname="";
                return;
            }else{
                $("#utxt").css("color","green");
                $("#utxt").html("用户名输入成功！！");
                $("#upwd").focus();
            }
        },
        upwdblur(){//密码输入框失去焦点验证
            var reg=/^[0-9a-z]{6,12}$/i;
            if(!reg.test(this.upwd)){
                $("#ptxt").css("color","red")
                .html("密码格式不正确！");
                this.upwd="";
                return;
            }else{
                $("#ptxt").css("color","green")
                .html("密码输入成功！");
                return;
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
        /*产生一个随机数 可设置随机数区间*/
        ranNum(min,max){
            return Math.random()*(max-min)+min;
        },
        /*返回一个随机颜色，可设置颜色区间*/
        ranColor(min,max){
            var r = this.ranNum(min, max);
            var g = this.ranNum(min, max);
            var b = this.ranNum(min, max);
            // return "rgb(" + r + "," + g + "," + b + ")";
            return `rgb(${r},${g},${b})`;
        },
        /*随机字符串数组*/
        ranStr(){
            var str = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0123456789";
            return str.split("").sort(function () {
                return Math.random() - 0.5
            });
        },
        /*绘制文本字符串*/
        drawText(canvasId, canvasW, canvasH, num, fsMin, fsMax, frMin, frMax, min, max) {
            var ctx = document.getElementById("check").getContext("2d");
            var str = "";
            for (var i = 0; i < num; i++) {
                var char = this.ranStr()[Math.floor(0, this.ranStr().length)];
                var fs = this.ranNum(fsMin, fsMax);
                canvasId.font = fs + "px Verdana";
                canvasId.fillStyle = this.ranColor(min, max);
                // 保存绘制的状态
                canvasId.save();
                // context.translate(x,y);
                // x    添加到水平坐标（x）上的值
                // y    添加到垂直坐标（y）上的值
                // 偏移
                canvasId.translate(canvasW / num * i + canvasW / 20, 0);
                // 变换角度
                canvasId.rotate(this.ranNum(frMin, frMax) * Math.PI / 180);
                // context.fillText(text,x,y,maxWidth);
                // text    规定在画布上输出的文本。
                // x    开始绘制文本的 x 坐标位置（相对于画布）。
                // y    开始绘制文本的 y 坐标位置（相对于画布）。
                // maxWidth    可选。允许的最大文本宽度，以像素计。
                canvasId.fillText(char, 0, (canvasH + fs) / 2.5, canvasW / num);
                // 返回之前保存过的路径状态和属性
                ctx.restore();
                str += char;
            }
            // console.log(str);
            return str;
        },
        /*绘制背景*/
        drawBg(canvasId, canvasW, canvasH, min, max) {
            // 绘制canvas背景
            canvasId.fillStyle = this.ranColor(min, max);
            // 填充颜色
            canvasId.fillRect(0, 0, canvasW, canvasH);
        },
        /*绘制干扰圆点*/
        drawCircle(canvasId, canvasW, canvasH, num, r, min, max) {
            for (var i = 0; i < num; i++) {
                // 开始绘制 （拿起笔）
                canvasId.beginPath();
                // context.arc(x,y,r,sAngle,eAngle,counterclockwise); （绘制）
                // x    圆的中心的 x 坐标。
                // y    圆的中心的 y 坐标。
                // r    圆的半径。
                // sAngle    起始角，以弧度计。（弧的圆形的三点钟位置是 0 度）。
                // eAngle    结束角，以弧度计。
                // counterclockwise    可选。规定应该逆时针还是顺时针绘图。False = 顺时针，true = 逆时针。
                canvasId.arc(this.ranNum(0, canvasW), this.ranNum(0, canvasH), r, 0, 2 * Math.PI);
                // 填充颜色
                canvasId.fillStyle = this.ranColor(min, max);
                // 填充
                canvasId.fill();
                // 闭合绘制 （放开笔）
                canvasId.closePath();
            }
        },
        /*绘制干扰线段*/
        drawLine(canvasId, canvasW, canvasH, num, min, max) {
            for (var i = 0; i < num; i++) {
                // 开始绘制 （拿起笔）
                canvasId.beginPath();
                // 绘制开始点
                canvasId.moveTo(this.ranNum(0, canvasW), this.ranNum(0, canvasH));
                // 绘制结束点
                canvasId.lineTo(this.ranNum(0, canvasW), this.ranNum(0, canvasH));
                canvasId.strokeStyle = this.ranColor(min, max);
                canvasId.stroke();
                canvasId.closePath();
            }
        },
        drawCanvas(){
            var ctx = document.getElementById("check").getContext("2d");
            var ctxW = document.getElementById("check").clientWidth;
            var ctxH = document.getElementById("check").clientHeight;
            // 清空canvas
            ctx.clearRect(0, 0, 200, 60);
            // 绘制背景
            this.drawBg(ctx, ctxW, ctxH, 200, 255);
            // 绘制干扰圆点
            this.drawCircle(ctx, ctxW, ctxH, 20, 5, 200, 255);
            // 绘制干扰线段
            this.drawLine(ctx, ctxW, ctxH, 20, 0, 255);
            // 绘制验证码
            var str = this.drawText(ctx, ctxW, ctxH, 4, 10, 50, -30, 30, 0, 100);
            this.str=str;
            return str;
        }
    },
    mounted(){
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