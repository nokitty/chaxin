<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!doctype html>

<html class="no-js">

<head>



    <meta charset="UTF-8">

    <meta name="format-detection" content="telephone=no" />

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

    <title>查询结果</title>

    <link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

    <link rel="stylesheet" href="css/lawMobile.css">

    <script type="text/javascript">basePath = "http://www.kuaicha.info:80/"</script>

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
                  for (int i = 0, n = ViewBag.result.Count; i < n; i++)
                  {
                      var item = ViewBag.result[i];
            %>
            <table border="0">
                <tr>
                    <th scope="col" class="xuhao">序号<%=i+1 %></th>
                    <th scope="col" class="result_details"><a href="/query/person/<%=item.id %>">查看详情</a></th>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td><%=item.name %></td>
                </tr>
                <tr>
                    <td>身份证号</td>
                    <td><%=item.cardnum %></td>
                </tr>
                <tr>
                    <td>法院公布次数</td>
                    <td><%=item.publicCount %></td>
                </tr>
                <tr class="result_last">
                    <td>用户举报次数</td>
                    <td><%=item.reportCount %></td>
                </tr>
                <tr class="result_last">
                    <td>P2P借贷黑名单次数</td>
                    <td><%=item.p2pCount %></td>
                </tr>
            </table>
            <div style="border-bottom: 1px solid #e2e2e2; margin: 0 1%;"></div>
            <%
                  }
              } %>
        </div>

    </div>

</body>

</html>
