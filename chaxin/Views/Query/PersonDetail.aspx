<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<html class="no-js">

<head>



    <meta charset="UTF-8">

    <meta name="format-detection" content="telephone=no" />

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <title>结果详情</title>

    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

    <link rel="stylesheet" href="/css/lawMobile.css">

    <script type="text/javascript">basePath = "http://www.kuaicha.info:80/"</script>

</head>

<body>

    <div class="cbody">

        <div class="result_details">

            <div class="header">

                <p>结果详情</p>
                <a class="ico-back" onclick="history.back()"></a>

            </div>
            <div style="margin: 15px;"></div>
            <div class="result_details_tittle">
                <p>姓名：<span><%=ViewBag.person.Name %></span></p>
                <p>身份证号：<span><%=ViewBag.person.CardNum %></span></p>
            </div>

            <div style="color: white; margin: 10px 0px; padding: 12px; background-color: rgb(197, 51, 83); background-image: linear-gradient(rgb(201, 8, 50), rgb(176, 7, 44) 50%, rgb(152, 6, 38));">法院公布的失信记录(共<%=ViewBag.ppList.Count %>条)</div>

            <table border="0">
                <%for (int i = 0, n = ViewBag.ppList.Count; i < n; i++)
                  {
                      var item = ViewBag.ppList[i];
                %>
                <tr>
                    <th scope="col" class="xuhao biaoti_left">记录<%=i+1 %>:</th>
                    <th scope="col" class="biaoti_right"></th>
                </tr>
                <tr>
                    <td class="biaoti_left">执行法院：</td>
                    <td class="biaoti_right">
                        <p><%= item.CourtName%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">省份：</td>
                    <td class="biaoti_right">
                        <p><%= item.AreaName%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">案号：</td>
                    <td class="biaoti_right">
                        <p><%= item.Casecode%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">生效法律文书确定的义务：</td>
                    <td class="biaoti_right">
                        <p><%= item.Duty%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">被执行人的履行情况：</td>
                    <td class="biaoti_right">
                        <p><%= item.Performance%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">失信被执行人行为具体情形：</td>
                    <td class="biaoti_right">
                        <p><%= item.DisruptTypeName%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">发布时间：</td>
                    <td class="biaoti_right">
                        <p><%= item.PublishDate.ToShortDateString()%></p>
                    </td>
                </tr>
                <%} %>
            </table>

            <div style="color: white; margin: 10px 0px; padding: 12px; background-color: rgb(197, 51, 83); background-image: linear-gradient(rgb(201, 8, 50), rgb(176, 7, 44) 50%, rgb(152, 6, 38));">站内举报记录(共<%=ViewBag.upList.Count %>条)</div>

            <table border="0">
                <%for (int i = 0, n = ViewBag.upList.Count; i < n; i++)
                  {
                      var item = ViewBag.upList[i];
                %>
                <tr>
                    <th scope="col" class="xuhao biaoti_left">记录<%=i+1 %>:</th>
                    <th scope="col" class="biaoti_right"></th>
                </tr>
                <tr>
                    <td class="biaoti_left">省份：</td>
                    <td class="biaoti_right">
                        <p><%= item.Province%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">欠款金额：</td>
                    <td class="biaoti_right">
                        <p><%= item.Arrears%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">借款日期：</td>
                    <td class="biaoti_right">
                        <p><%= item.LoanDate.ToShortDateString()%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">应还款日期：</td>
                    <td class="biaoti_right">
                        <p><%= item.RepayDate.ToShortDateString()%></p>
                    </td>
                </tr>
                <%} %>
            </table>

            <div style="color: white; margin: 10px 0px; padding: 12px; background-color: rgb(197, 51, 83); background-image: linear-gradient(rgb(201, 8, 50), rgb(176, 7, 44) 50%, rgb(152, 6, 38));">P2P借贷黑名单(共<%=ViewBag.p2pList.Count %>条)</div>
            <table border="0">
                <%for (int i = 0, n = ViewBag.p2pList.Count; i < n; i++)
                  {
                      var item = ViewBag.p2pList[i];
                %>
                <tr>
                    <th scope="col" class="xuhao biaoti_left">记录<%=i+1 %>:</th>
                    <th scope="col" class="biaoti_right"></th>
                </tr>
                <tr>
                    <td class="biaoti_left">手机号码：</td>
                    <td class="biaoti_right">
                        <p><%= item.Tel%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">借款金额：</td>
                    <td class="biaoti_right">
                        <p><%= item.LoanAccount%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">借款日期：</td>
                    <td class="biaoti_right">
                        <p><%= item.LoanDate%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">已还款金额：</td>
                    <td class="biaoti_right">
                        <p><%= item.RepayAccount%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">未还款金额：</td>
                    <td class="biaoti_right">
                        <p><%= item.ExpireAccount%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">借款期数：</td>
                    <td class="biaoti_right">
                        <p><%= item.InstalmentCount%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_left">信息来源：</td>
                    <td class="biaoti_right">
                        <p><%= item.Source%></p>
                    </td>
                </tr>
                <%} %>
            </table>

        </div>

    </div>

</body>

</html>
