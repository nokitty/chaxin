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

            </div>
            <%var rp = ViewBag.rp as DBC.ReportedPerson;
              var p = ViewBag.p as DBC.Person; %>
            <div style="margin: 15px;"></div>
            <div class="result_details_tittle">
                <p>姓名：<span><%=p.Name%></span></p>
                <p>身份证号：<span><%=p.CardNum %></span></p>
            </div>
            <table border="0">

                <tr>
                    <td colspan="2" class="mthead">个人举报失信详情</td>
                </tr>
                <tr>
                    <td class="biaoti_right">省份</td>
                    <td class="biaoti_left">
                        <p><%=rp.Province %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">城市</td>
                    <td>
                        <p><%=rp.City%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">电话</td>
                    <td>
                        <p><%=rp.Tel %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">借款</td>
                    <td>
                        <p><%=rp.Arrears%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">借款笔数</td>
                    <td>
                        <p><%=rp.Count %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">约定还款日期</td>
                    <td>
                        <p><%=rp.RepayDate.ToChsString() %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">其他信息</td>
                    <td>
                        <p><%=rp.Remark%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">举报日期</td>
                    <td>
                        <p><%=rp.ReportDate.ToChsString()%></p>
                    </td>
                </tr>
                <%if (rp.Pics != "")
                  {
                      var pics = rp.Pics.Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries);
                %>
                <tr>
                    <td class="biaoti_right">欠款证明</td>
                    <td>
                        <p>
                            <%foreach (var pic in pics)
                              { %>
                            <a href="/upload/<%=pic %>">
                                <img src="/upload/<%=pic %>" style="max-height: 200px; max-width: 200px; border: 3px solid white; box-shadow: 0px 0px 3px 0px rgb(102, 102, 102); margin: 10px;" />
                            </a>
                            <%} %>
                        </p>
                    </td>
                </tr>
                <%} %>
            </table>
        </div>

    </div>

</body>

</html>

