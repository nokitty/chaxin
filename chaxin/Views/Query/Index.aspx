﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!doctype html>

<html class="no-js">

<head>



    <meta charset="UTF-8">

    <meta name="format-detection" content="telephone=no" />

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <title>查询结果</title>

    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

    <link rel="stylesheet" href="css/lawMobile.css">
</head>

<body>

    <div class="cbody">

        <div class="result">

            <div class="header">

                <p>查询结果</p>
                <a class="ico-back" href="/"></a>

            </div>
            <div style="margin: 15px;"></div>
            <%if (ViewBag.result.Count == 0)
              {%>
            <p style="width: 92%; margin: 0 3%;">
                恭喜您！！您的借款人不在"查老赖"黑名单数据库中。
如果其已经逾期，建议您将其提交到黑名单，以对其进行信用惩罚。同时帮助您尽可能收回欠款。
            </p>
            <div class="bottom-nav-wrap">

                <div class="bottom-nav cbody" style="background-color: #af072b;">

                    <a href="/report" class="btn-nav" style="width: 100%; color: #fff;">前往举报</a>

                </div>

            </div>

            <%}
              else
              {
            %>
            <ul class="result_wrap">
                <%
                  for (int i = 0, n = ViewBag.result.Count; i < n; i++)
                  {
                      var item = ViewBag.result[i];
                %>
                <li class="list-items">
                    <span class="lawIndex"><%=i+1 %></span>
                    <div class="law-list-items">
                        <p class="law-result-title">
                            <span class="law-list-name"><%=item.person.Name %></span>
                            <span class="fr"><%=item.person.CardNum %></span>
                        </p>
                        <p class="law-list-record">
                            <span class="law-list-address"><%=item.person.Province+item.person.City %></span>
                            失信记录：
                            <span class="record-num"><%=item.count %></span>
                            条
                        </p>
                    </div>
                    <span class="ico-arrow"></span>
                    <a class="btn-law-detail-href" href="/query/person/<%=item.person.ID %>"></a>
                </li>
                <%
                  }
                %>
            </ul>
            <%
              } %>
        </div>

    </div>

</body>

</html>
