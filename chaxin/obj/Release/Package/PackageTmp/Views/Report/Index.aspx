﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!doctype html>

<html class="no-js">

<head>

<meta charset="UTF-8">

<meta name="format-detection" content="telephone=no" />

<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<title>老赖曝光</title>

<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

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

<style>

.free-href{

	color:#af072b;

	text-decoration:none;

}

.free-href:hover{text-decoration:none;}

</style>

<div class="header cbody">

     <p>曝光老赖</p>

     <a href="/" class="ico-back"></a>

</div>

<div class="cbody" style="padding-bottom:40px;">

    <div class="exposure-tips" style="padding-top:30px;">

         <div class="step-tips" style="padding-top:8px;"><img src="/images/step-tips.png" /></div>

    </div>

    <div class="outer-wrap" style="padding-top:0px;">

         <div class="tips-out-wrap">

              <div class="tips-error" id="tipsFormError"><span class="tips-error-msg">请输入有效的身份证号码！</span></div>

      </div>

          <div class="form-wrap">

              <form>

               <div class="form-logo-wrap"><span class="exposure-logo"></span></div>

               <ul class="form-iner-wrap" id="exposureId">

                   <li class="input-items">

                       <label class="form-label">举报人</label>

                       <input type="text" class="form-input" id="name" data-valida-input="false" placeholder="请输入您的姓名" />

                   </li>

                   <li class="input-items">

                       <label class="form-label">身份证</label>

                       <input type="text" class="form-input" id="idcard" data-valida-input="false" placeholder="请输入身份证号码" />

                   </li>

                   <li class="input-items">

                       <label class="form-label">手机号</label>

                       <input type="text" class="form-input" style="padding-right:90px;" id="tel" data-valida-input="false" placeholder="请输入您的手机号" />

                       <span class="get-tel-code-wrap">

                          <span class="get-tel-code" id="getTelCodeId">获取验证码</span>

                       </span>

                   </li>

                   <li class="input-items no-boreder-bottom">

                       <label class="form-label">验证码</label>

                       <input type="text" class="form-input" id="verify" data-valida-input="false" placeholder="请输入验证码" />

                   </li>

               </ul>

              </form>

          </div>

    </div>

    <div class="text-center" style="padding-top:4px; padding-bottom:20px;">

         <span class="check-box-wrap"><span id="checkBoxId" class="check-box check-box-checked"></span>同意<a href="http://mp.weixin.qq.com/s?__biz=MzAxMjUwNzk5MQ==&mid=208536065&idx=1&sn=0d77f424deae04c2eab38f292ba84e04#rd" class="free-href">《平台免责协议》</a></span>

    </div>

    <div class="btn-wrap text-center"><a href="javascript:;" class="btn" onClick="toExposure()">马上曝光</a></div>

</div>

<div id="validaPersonID" data-valida-personID="true">

   <input type="hidden" id="personNameId" value="" />

   <input type="hidden" id="personIdcardId" value="" />

</div>

<script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>

<script type="text/javascript" src="/js/jquery.cookie.js"></script>

<script type="text/javascript" src="/js/common.js"></script>

<script type="text/javascript" src="/js/exposure.js"></script>

</body>

</html>