﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

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

    <div class="mask-bg" id="errorMsgWrap" style="display: none;">

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



    <link rel="stylesheet" href="/css/WdatePicker.css">

    <link rel="stylesheet" href="/css/zyUpload.css">

    <input type="hidden" id="flagId" value="null" />

    <input type="hidden" id="reportPersonIdAccessId" value="null" />

    <input type="hidden" id="reportedPersonIdAccessId" value="null" />

    <!--maskTips-->

    <div class="form-tips-wrap" id="formErrorMsgWrap" style="display: none;">

        <div class="mask-tips-wrap" style="height: 56px;">

            <div class="mask-tips-iner" style="height: 56px;">

                <div class="mask-tips">验证码输入错误</div>

            </div>

        </div>

    </div>

    <!--maskTips-->

    <div class="header cbody">

        <p>曝光老赖</p>

        <a href="lawMobile/law.jsp" class="ico-home"></a>

    </div>

    <div class="cbody" style="padding-bottom: 40px;">

        <div class="exposure-title border-bottom">举报详情</div>

        <form id="exposureFormId" action="/report/result" method="post" enctype="multipart/form-data">

            <input type="hidden" id="exposureDataAccessId" name="accessId" />

            <input type="hidden" id="reportedPersonId" name="reportedPerson.reportedPersonId" />

            <input type="hidden" id="reportPersonId" name="reportPersonId" />

            <input type="hidden" id="reportPeronTelNum" name="reportPersonTelNum" />

            <div>

                <table class="ctable">

                    <tr>

                        <td class="border-bottom" style="background-color: #e7e7e7; padding-left: 26px; color: #000; height: 14px; font-size: 14px; line-height: 14px;">出借人信息

                        </td>

                        <tr>

                    <tr>

                        <td class="border-bottom" style="height: 60px;">

                            <span class="ctable-label" style="width: 54px; left: 46px; top: 12px;">姓名：</span>

                            <input class="ctable-input" placeholder="请输入出借人" id="name" data-valida-type="other" data-valida-msg="请输入欠款人姓名！" data-valida-input="false" style="padding-left: 80px;" />

                        </td>

                    </tr>

                    <tr>

                        <td class="border-bottom" style="background-color: #e7e7e7; padding-left: 26px; color: #000; height: 14px; font-size: 14px; line-height: 14px;">欠款人信息

                        </td>

                        <tr>

                    <tr>

                        <td class="border-bottom">

                            <span class="ctable-label" style="width: 60px; left: 42px;"><span class="star">*</span>姓名：</span>

                            <input class="ctable-input" placeholder="请输入欠款人" id="reportedPersonName" name="name" data-valida-type="other" data-valida-msg="请输入欠款人姓名！" data-valida-input="false" style="padding-left: 82px;" />

                        </td>

                    </tr>

                    <tr>

                        <td class="border-bottom" style="padding-left: 44px;" id="sexyId">

                            <span class="star">*</span>性别：
                            <input type="radio" name="sexy" data-valida-msg="请选择性别！" data-sexy-value="" data-valida-type="sexy" data-valida-input="false" value="m" />

                            <span class="sexy" style="margin-right: 14px; margin-left: 12px;">男</span>

                            <input type="radio" name="sexy" data-valida-msg="请选择性别！" data-sexy-value="" data-valida-type="sexy" data-valida-input="false" value="w" />

                            <span class="sexy" style="margin-right: 14px; margin-left: 12px;">女</span>



                        </td>

                    </tr>

                    <tr>

                        <td class="border-bottom">

                            <span class="ctable-label"><span class="star">*</span>身份证号：</span>

                            <input class="ctable-input" placeholder="请输入身份证号码" id="cardNum" name="cardnum" data-valida-msg="身份证号码错误！" data-valida-type="idcard" data-valida-input="false" />

                        </td>

                    </tr>

                    <tr>

                        <td class="border-bottom city-select-wrap">

                            <input type="hidden" id="provinceValue" name="province" data-valida-msg="请选择所在省份！" data-valida-type="province" data-valida-input="false" />

                            <div class="cselect-title" id="province">

                                <div class="cselect-title-bg">

                                    <span class="city-name">请选择</span>

                                    <span class="arrow"></span>

                                </div>

                            </div>

                            <span class="ctable-label" style="background-color: #fff;"><span class="star">*</span>所在省份：</span>

                            <ul class="city-wrap province" id="provinceList" style="z-index: 126;">
                            </ul>

                        </td>

                    </tr>

                    <tr>

                        <td class="border-bottom city-select-wrap">

                            <input type="hidden" id="cityValue" name="city" data-valida-msg="请选择所在城市！" data-valida-type="city" data-valida-input="false" />

                            <div class="cselect-title" id="city">

                                <div class="cselect-title-bg">

                                    <span class="city-name">请选择</span>

                                    <span class="arrow"></span>

                                </div>

                            </div>

                            <span class="ctable-label" style="background-color: #fff;"><span class="star">*</span>所在市区：</span>

                            <ul class="city-wrap city" id="cityList">

                                <li class="city-items border-none">请先选择省份</li>

                            </ul>

                        </td>

                    </tr>

                    <tr>

                        <td class="border-bottom">

                            <span class="ctable-label"><span class="star">*</span>手机号码：</span>

                            <input class="ctable-input" placeholder="请输入手机号码" id="telNum" name="tel" data-valida-msg="手机号码错误！" data-valida-type="telNum" data-valida-input="false" />

                        </td>

                    </tr>

                    <tr>

                        <td class="border-bottom">

                            <span class="ctable-label"><span class="star">*</span>欠款总额：</span>

                            <input class="ctable-input" placeholder="请输入欠款总额" id="totalDebt" name="arrears" data-valida-msg="请输入欠款总额！" data-valida-type="other" data-valida-input="false" style="padding-right: 30px;" />

                            <span class="ctable-unit">元</span>

                        </td>

                    </tr>

                    <tr>

                        <td class="border-bottom">

                            <span class="ctable-label"><span class="star">*</span>欠款笔数：</span>

                            <input class="ctable-input" placeholder="请输入欠款笔数" id="borrowNum" name="count" data-valida-msg="请输入欠款笔数！" data-valida-type="other" data-valida-input="false" style="padding-right: 30px;" />

                            <span class="ctable-unit">笔</span>

                        </td>

                    </tr>

                    <tr>

                        <td class="border-bottom">

                            <span class="ctable-label"><span class="star">*</span>借款日期：</span>

                            <input class="ctable-input" placeholder="请选择借款日期" id="starData" name="loan-date" data-valida-msg="请选择借款日期！" data-valida-type="data" data-valida-input="false" onclick="WdatePicker()" />

                        </td>

                    </tr>

                    <tr>

                        <td class="border-bottom">

                            <span class="ctable-label"><span class="star">*</span>到期日期：</span>

                            <input class="ctable-input" placeholder="请选择到期日期" id="endData" name="repay-date" data-valida-msg="请选择到期日期！" data-valida-type="data" data-valida-input="false" onclick="WdatePicker()" />

                        </td>

                    </tr>

                </table>

            </div>

            <div class="report-other-des border-bottom">

                <p id="tapId">其他描述</p>

                <textarea class="otherDes" id="note" name="remark" style="padding: 8px;"></textarea>

            </div>

            <div class="report-other-des border-bottom">

                <p><span class="star">*</span>上传凭据(请上传真实有效的借款合同，或者能够证明借贷情况的照片)</p>

                <input type="file"  name="reportedProofList" data-valida-msg="请上传凭据图片！" data-valida-type="other" data-valida-input="false" value="" />

        

            </div>

            <div class="btn-wrap text-center" style="margin-top: 20px;"><a href="javascript:;" onclick="subExposureForm()" class="btn">提交</a></div>

        </form>

    </div>

    <script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>

    <script type="text/javascript" src="/js/zepto.js"></script>

    <script type="text/javascript" src="/js/touch.js"></script>

    <script type="text/javascript" src="/js/jquery.cookie.js"></script>

    <script type="text/javascript" src="/js/common.js"></script>

    <script type="text/javascript" src="/js/talk.area.js"></script>

    <!-- 上传图片 -->

    <script type="text/javascript" src="/js/zyUpload.js"></script>

    <script type="text/javascript" src="/js/zyFile.js"></script>

    <script type="text/javascript" src="/js/upLoadImg.js"></script>

    <!-- 日期控件 -->

    <link href="/css/mobiscroll.core-2.5.2.css" rel="stylesheet" type="text/css" />

    <link href="/css/mobiscroll.animation-2.5.2.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/js/mobiscroll.core-2.5.2.js"></script>

    <script type="text/javascript" src="/js/mobiscroll.datetime-2.5.1.js"></script>

    <script type="text/javascript" src="/js/mobiscroll.core-2.5.2-zh.js"></script>

    <script type="text/javascript" src="/js/mobiscroll.datetime-2.5.1-zh.js"></script>

    <script type="text/javascript" src="/js/exposureForm.js"></script>

    <script type="text/javascript">

        (function ($) {

            $(document).on("tap", "#provinceList li", function () {

                var index = $(this).attr("data-province-value");

                var value = $(this).text();

                $("#province").attr("data-province-num", index);

                $("#province").attr("data-province-value", value);

                $("#province .city-name").empty().text(value);

                $("#provinceValue").attr("data-valida-input", "true");

                $("#provinceValue").val(value);

                $("#city .city-name").empty().text("请选择");

                //加载市

                loadCityList(index);

                setTimeout(function () {

                    $("#provinceList").hide();

                }, 350);

            });

            //获取市

            $(document).on("tap", "#cityList li", function () {

                var index = $(this).attr("data-city-value");

                var value = $(this).text();

                $("#city").attr("data-city-num", index);

                $("#city").attr("data-city-value", value);

                $("#city .city-name").empty().text(value);

                $("#cityValue").attr("data-valida-input", "true");

                $("#cityValue").val(value);

                //$(this).parent().hide();

                var _this = $(this);

                setTimeout(function () {

                    _this.parent().hide();

                }, 350);

            });

        })(Zepto);

        $(function () {

            var currYear = (new Date()).getFullYear();

            var opt = {};

            opt.date = { preset: 'date' };

            //opt.datetime = { preset : 'datetime', minDate: new Date(2012,3,10,9,22), maxDate: new Date(2014,7,30,15,44), stepMinute: 5  };

            opt.datetime = { preset: 'datetime' };

            opt.time = { preset: 'time' };

            opt.default = {

                theme: 'android-ics light', //皮肤样式

                display: 'modal', //显示方式 

                mode: 'scroller', //日期选择模式

                lang: 'zh',

                startYear: currYear - 20, //开始年份

                endYear: currYear + 20 //结束年份

            };



            $("#starData").val('').scroller('destroy').scroller($.extend(opt['date'], opt['default']));

            $("#endData").val('').scroller('destroy').scroller($.extend(opt['date'], opt['default']));





        });

    </script>

</body>

</html>
