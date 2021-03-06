﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<!doctype html>

<html class="no-js">

<head>



<meta charset="UTF-8">

<meta name="format-detection" content="telephone=no" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>追踪老赖</title>

<link rel="shortcut icon" type="image/x-icon" href="../favicon.ico" />

<link rel="stylesheet" href="/css/lawMobile.css">

<script type="text/javascript">basePath = "http://www.kuaicha.info:80/"</script>

</head>

<body>

<!--maskTips-->

<div class="mask-bg" id="errorMsgWrap" style="display:none;">

     <div class="mask-tips-wrap">

         <div class="mask-tips-iner">

            <div class="mask-tips" id="errorMsg">验证码输入错误</div>

         </div>

     </div>

</div>

<!--maskTips-->

<!-- loading -->

<div class="load-out-wrap" id="loading">

    <div class="cbody load-iner-wrap">

        <div class="loading-bg"><span class="loading"></span></div>

    </div>

</div>

<!--maskTips-->

<div style="padding-bottom:42px;">

<div class="header cbody">

     <p>追踪老赖</p>

     <a class="ico-back" href="/"></a>

</div>

<div class="cbox_2 cbody">
                <script type="text/javascript">
                    // 自动滚动 
                    function boxmove(d1, d2, d3, e, obj) {
                        var speed = 200;
                        var demo = document.getElementById(d1);
                        var demo1 = document.getElementById(d2);
                        var demo2 = document.getElementById(d3);
                        demo2.innerHTML = demo1.innerHTML;
                        function boxTop() {
                            if (demo2.offsetTop - demo.scrollTop <= 0) { demo.scrollTop -= demo1.offsetHeight }
                            else { demo.scrollTop++ }
                        }
                        function boxRight() {
                            if (demo.scrollLeft <= 0) { demo.scrollLeft += demo2.offsetWidth }
                            else { demo.scrollLeft-- }
                        }
                        function boxBottom() {
                            if (demo1.offsetTop - demo.scrollTop >= 0) { demo.scrollTop += demo2.offsetHeight }
                            else { demo.scrollTop-- }
                        }
                        function boxLeft() {
                            if (demo2.offsetWidth - demo.scrollLeft <= 0) { demo.scrollLeft -= demo1.offsetWidth }
                            else { demo.scrollLeft++ }
                        }
                        if (e == 1) {
                            var MoveTop = setInterval(boxTop, speed);
                            demo.onmouseover = function () { clearInterval(MoveTop); }
                            demo.onmouseout = function () { MoveTop = setInterval(boxTop, speed) }
                        }
                        if (e == 2) {
                            var MoveRight = setInterval(boxRight, speed);
                            demo.onmouseover = function () { clearInterval(MoveRight) }
                            demo.onmouseout = function () { MoveRight = setInterval(boxRight, speed) }
                        }
                        if (e == 3) {
                            var MoveBottom = setInterval(boxBottom, speed);
                            demo.onmouseover = function () { clearInterval(MoveBottom); }
                            demo.onmouseout = function () { MoveBottom = setInterval(boxBottom, speed) }
                        }
                        if (e == 4) {
                            var MoveLeft = setInterval(boxLeft, speed)
                            demo.onmouseover = function () { clearInterval(MoveLeft) }
                            demo.onmouseout = function () { MoveLeft = setInterval(boxLeft, speed) }
                        }
                        if (e == "top") {
                            MoveTop = setInterval(boxTop, speed)
                            obj.onmouseout = function () { clearInterval(MoveTop); }
                        }
                        if (e == "right") {
                            MoveRight = setInterval(boxRight, speed)
                            obj.onmouseout = function () { clearInterval(MoveRight); }
                        }
                        if (e == "bottom") {
                            MoveBottom = setInterval(boxBottom, speed)
                            obj.onmouseout = function () { clearInterval(MoveBottom); }
                        }
                        if (e == "left") {
                            MoveLeft = setInterval(boxLeft, speed)
                            obj.onmouseout = function () { clearInterval(MoveLeft); }
                        }
                    }
                    </script> 
                    <style type="text/css"> 
                        h2 { clear:both; }
                        .cbox2_left h1,.cbox2_right h1{ 
                            font-size:1.48rem;
                            color:#a30000;
                            font-weight:400;
                            display:block;
							margin:1% auto;
                        }
                        .cbox2_left span, .cbox2_right span {
                            font-size:16px;
                            color:#808080;
                        }
                        .xsbd {
                        }
                        .xsbd span{
                            display:inline-block;
                            text-align:center;
                            height:30px;
                        }
                        .ml {
                            width:50%;
                        }
                        .ml1 {
                             width:50%;
                        }
                        .lsb {
                        }
                        .lsb span {
                            display:inline-block;
                            height:30px;
                            text-align:center;
                        }
                        .pl {
                            width:50%;
                        }
                        .cl {
                            width:50%;
                        }
                    </style>
                    
                    <div class="cbox_header ">
                    
                        <span ><img src="/images/20150410045530382_easyicon_net_16.png"></span>
                        
                        <span> 今日奖池剩余悬赏金￥654158.21元，已有65841人次领取赏金，共计￥354125.85元</span> 
                    
                    </div>
                <div class="cbox2_content">
                    <div class="cbox2_left">
                      <h1>悬赏榜单</h1>
                      <div class="cbox2_left_tittle" >
                          <span>被悬赏人</span>
                          <span>赏金总额</span>
                      </div> 
                      <div id="a" class="cbox2_left_content">  
                          <div id="a1"> 
                              <div class="xsbd">
                                  <span class="cl">陈加恺</span><span class="ml">850.00</span>
                                  <span class="cl">郭秀珊</span><span class="ml">650.00</span>
                                  <span class="cl">杜承贤</span><span class="ml">950.00</span>
                                  <span class="cl">祁云</span><span class="ml">900.00</span>
                                  <span class="cl">龚平</span><span class="ml">700.00</span>
                                  <span class="cl">王丽丽</span><span class="ml">750.00</span>
                                  <span class="cl">夏正红</span><span class="ml">650.00</span>
                                  <span class="cl">李琼芳</span><span class="ml">850.00</span>
                                  <span class="cl">夏正伟</span><span class="ml">600.00</span>
                                  <span class="cl">付文清</span><span class="ml">650.00</span>
                                  <span class="cl">谭家炳</span><span class="ml">950.00</span>
                              </div> 
                          </div>  
                          <div id="a2"> 
                              <div class="xsbd">
                                  <span class="cl">陈加恺</span><span class="ml">850.00</span>
                                  <span class="cl">郭秀珊</span><span class="ml">650.00</span>
                                  <span class="cl">杜承贤</span><span class="ml">950.00</span>
                                  <span class="cl">祁云</span><span class="ml">900.00</span>
                                  <span class="cl">龚平</span><span class="ml">700.00</span>
                                  <span class="cl">王丽丽</span><span class="ml">750.00</span>
                                  <span class="cl">夏正红</span><span class="ml">650.00</span>
                                  <span class="cl">李琼芳</span><span class="ml">850.00</span>
                                  <span class="cl">夏正伟</span><span class="ml">600.00</span>
                                  <span class="cl">付文清</span><span class="ml">650.00</span>
                                  <span class="cl">谭家炳</span><span class="ml">950.00</span>
                              </div> 
                          </div> 
                      </div>  
                      <script type="text/javascript">
                          boxmove("a", "a1", "a2", 1);
                      </script> 
                  </div>
                    <div class="cbox2_right">
                      <h1>领赏榜单</h1>
                       <div class="cbox2_right_tittle">
                            <span>领赏人</span><span>领赏金额</span>
                       </div> 
                        <div id="b" class="cbox2_right_content">  
	                        <div id="b1">
                            <div class="lsb">
                               <span class="pl">1856907*****</span><span class="ml1">50.00</span>
                               <span class="pl">1375487*****</span><span class="ml1">50.00</span>
                               <span class="pl">1862739*****</span><span class="ml1">50.00</span>
                               <span class="pl">1860735*****</span><span class="ml1">50.00</span>
                               <span class="pl">1348212*****</span><span class="ml1">50.00</span>
                               <span class="pl">1872151*****</span><span class="ml1">50.00</span>
                               <span class="pl">1381846*****</span><span class="ml1">50.00</span>
                               <span class="pl">1538801*****</span><span class="ml1">50.00</span>
                               <span class="pl">1383411*****</span><span class="ml1">50.00</span>
                               <span class="pl">1521094*****</span><span class="ml1">50.00</span>
                               <span class="pl">1360172*****</span><span class="ml1">50.00</span>
                               <span class="pl">1585813*****</span><span class="ml1">50.00</span>
                               <span class="pl">1550211*****</span><span class="ml1">50.00</span>
                               <span class="pl">1507495*****</span><span class="ml1">50.00</span>
                               <span class="pl">1897311*****</span><span class="ml1">50.00</span>
                               <span class="pl">1887426*****</span><span class="ml1">50.00</span>
                               <span class="pl">1360171*****</span><span class="ml1">50.00</span>
                            </div> 
	                        </div>  
                            <div id="b2">
                            <div class="lsb">
                               <span class="pl">1856907*****</span><span class="ml1">50.00</span>
                               <span class="pl">1375487*****</span><span class="ml1">50.00</span>
                               <span class="pl">1862739*****</span><span class="ml1">50.00</span>
                               <span class="pl">1860735*****</span><span class="ml1">50.00</span>
                               <span class="pl">1348212*****</span><span class="ml1">50.00</span>
                               <span class="pl">1872151*****</span><span class="ml1">50.00</span>
                               <span class="pl">1381846*****</span><span class="ml1">50.00</span>
                               <span class="pl">1538801*****</span><span class="ml1">50.00</span>
                               <span class="pl">1383411*****</span><span class="ml1">50.00</span>
                               <span class="pl">1521094*****</span><span class="ml1">50.00</span>
                               <span class="pl">1360172*****</span><span class="ml1">50.00</span>
                               <span class="pl">1585813*****</span><span class="ml1">50.00</span>
                               <span class="pl">1550211*****</span><span class="ml1">50.00</span>
                               <span class="pl">1507495*****</span><span class="ml1">50.00</span>
                               <span class="pl">1897311*****</span><span class="ml1">50.00</span>
                               <span class="pl">1887426*****</span><span class="ml1">50.00</span>
                               <span class="pl">1360171*****</span><span class="ml1">50.00</span>
                            </div> 
	                        </div> 
                        </div>  
                        <script type="text/javascript">
                            boxmove("b", "b1", "b2", 1);
                        </script> 
                </div>
                </div>
            </div>







<div class="bottom-nav-wrap">

    <div class="bottom-nav cbody" style="background-color:#af072b;">

         <a href="/report" class="btn-nav" style="width:100%;color:#fff;">前往举报</a>

    </div>

</div>

</div>

<script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>

<script type="text/javascript">

    //window.onload= function (){

    //	document.body.style.backgroundColor="#f0f0f0";

    //}

    $(function () {

        $("body").css("background-color", "#f0f0f0");

        $.ajax({

            type: "GET",

            async: true,

            dataType: "json",

            url: "queryBlackList.action",

            success: function (data) {

                if (data.ErrorCode == 0) {

                    $("#theWholeNumId").text(data.data.blackListSize);

                    $("#queryNumId").text(data.data.blackListQuerySize);

                }

            }

        });

    });

</script>

</body>

</html>
