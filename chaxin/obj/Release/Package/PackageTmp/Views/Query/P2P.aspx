<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!doctype html>

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
                <a class="ico-back" href="history.back()"></a>

            </div>
            <%var p2p = ViewBag.p2p as DBC.P2PPerson;
              var p = ViewBag.p as DBC.Person; %>
            <div style="margin: 15px;"></div>
            <div class="result_details_tittle">
                <p>姓名：<span><%=p.Name%></span></p>
                <p>身份证号：<span><%=p.CardNum %></span></p>
            </div>
            <table border="0">

                <tr>
                    <td colspan="2" class="mthead">P2P网贷公布失信详情</td>
                </tr>
                <tr>
                    <td class="biaoti_right">信息来源</td>
                    <td class="biaoti_left">
                        <p><%=p2p.Source%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">电话号码</td>
                    <td>
                        <p><%=p2p.Tel %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">借款金额</td>
                    <td>
                        <p><%=p2p.LoanAccount %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">借款期数</td>
                    <td>
                        <p><%=p2p.InstalmentCount%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">已还款金额</td>
                    <td>
                        <p><%=p2p.RepayAccount %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">逾期未还金额(含利息)</td>
                    <td>
                        <p><%=p2p.ExpireAccount %></p>
                    </td>
                </tr>
            </table>
        </div>

    </div>

</body>

</html>

