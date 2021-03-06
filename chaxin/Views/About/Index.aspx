﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>

<html lang="zh-cn">

<head>

	<meta charset="utf-8">

<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">

<meta content="yes" name="apple-mobile-web-app-capable">

<meta content="black" name="apple-mobile-web-app-status-bar-style">

<meta content="telephone=no" name="format-detection">

<meta content="email=no" name="format-detection">

<meta content="" name="pgv">

	<title>关于查老赖</title>

	<link href="css/intro_min.css?v=20150605" rel="stylesheet" type="text/css">

</head>

<body>

	<div class="slide-pages" id="slidebox">

        <div class="item" style="display:block;">
        
            <div class="item1-logo">
        
                <div class="ilogo1 anishow lscaleIn animated"></div>
        
                <div class="ilogo2">
        
        
                    <div class="logoover anishow imgIn animated"></div>
        
                </div>
        
            </div>
        
            <div class="item1-text">
        

        
                <div class="bgover anishow imgIn animated"></div>
        
            </div>
        
            <div class="item-next anishow slidenext animated infinite"></div>
        
        </div>

		<div class="item" style="display:none;">

			<div class="item3-title anishow fadeInRight animated">人们对贷款公司的普遍印象：门槛低，审批活，放款快</div>

			<h1 class="item3-txt-1 anishow fadeInRight animated">

               贷款人却带给贷款公司很多困扰

			</h1>

			<div class="itemcon">

				<div class="item3-zp anishow bounceIn animated"></div>

			</div>

			<div class="item-next anishow slidenext animated infinite"> <!--next.png--> </div>

		</div>

		<div class="item" style="display:none;">

			<div class="item4-title anishow fadeInRight animated">查老赖能给您带来什么？</div>

			<div class="item4-txt anishow fadeInRight animated">

				为广大金融机构提供高效、便捷的互联网征信技术<br />

				让您的放贷更放心，为您的资金保驾护航

			</div>

			<div class="itemcon">

				<div class="item4-cont">

					<div class="item4-qq anishow bounceIn animated">

						<i class="ic4-qq"><!--item4_qq.png--></i>

					</div>

					<div class="item4-jr anishow tranleft animated"></div>

					<div class="item4-sh anishow tranright animated"></div>

				</div>

			</div>

			<div class="item-next anishow slidenext animated infinite"><!-- next.png--> </div>

		</div>

		<div class="item" style="display:none;">

			<div class="item5-title anishow fadeInRight animated">客户跑路了，如何让追回款项？</div>

			<div class="item5-txt anishow fadeInRight animated">

				只需加入我们的平台，输入老赖的相关信息<br />

				我们会通过各种渠道追踪老赖的跑路走向

			</div>

			<div class="itemcon">

				<div class="item5-cont">

					<div class="item5-contlis anishow fadeInUp animated"><i><!-- item5_21.png --></i>加入查老赖平台，输入老赖信息</div>

					<div class="item5-contlis anishow fadeInUp animated"><i><!-- item5_31.png --></i>我们根据老赖信息，发起各种渠道搜索</div>

					<div class="item5-contlis anishow fadeInUp animated"><i><!-- item5_41.png --></i>上传老赖失信记录到平台实现同门互助</div>

					<div class="item5-dian">

						<div class="item5-d anishow opacity animated"></div>

						<div class="item5-d anishow opacity animated"></div>

					</div>

					<div class="item5-point1 anishow tranzoomout animated"></div>

					<div class="item5-point anishow tranup animated"></div>

				</div>

			</div>

			<!--<div class="item-next anishow slideOutDown animated infinite"></div>-->

		</div>

	</div>

	<script type="text/javascript" src="js/lib.min.js?v=20141226" charset="utf-8" id="js_mix_seazepto"></script>

	<script type="text/javascript" id="js_dynamic_entry">

	    seajs.config({

	        'map': [["intro.js", "intro.js?v=20150216"]]

	    });

	    seajs.use(["credit/js/intro"], function (page) {

	        page.init();

	    })

	</script>



	<script type="text/javascript" src="js/ping.js"></script>

	<script type="text/javascript">

	    if (typeof (pgvMain) == 'function') {

	        pgvMain();

	    }

	</script>

</body>

</html>
