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
            <%var pp = ViewBag.pp as DBC.PublicPerson;
              var p = ViewBag.p as DBC.Person; %>
            <div style="margin: 15px;"></div>
            <div class="result_details_tittle">
                <p>姓名：<span><%=p.Name%></span></p>
                <p>身份证号：<span><%=p.CardNum %></span></p>
            </div>
            <table border="0">

                <tr>
                    <td colspan="2" class="mthead">失信被执行详情</td>
                </tr>
                <tr>
                    <td class="biaoti_right">执行法院</td>
                    <td class="biaoti_left">
                        <p><%=pp.CourtName %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">省份</td>
                    <td>
                        <p><%=pp.AreaName %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">执行依据文号</td>
                    <td>
                        <p><%=pp.GistId %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">立案时间</td>
                    <td>
                        <p><%=pp.RegDate.ToChsString() %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">案号</td>
                    <td>
                        <p><%=pp.Casecode %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">做出执行依据单位</td>
                    <td>
                        <p><%=pp.GistUnit %></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">生效法律文书确定的义务</td>
                    <td>
                        <p><%=pp.Duty%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">被执行人的履行情况</td>
                    <td>
                        <p><%=pp.Performance%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">失信被执行人行为具体情形</td>
                    <td>
                        <p><%=pp.DisruptTypeName%></p>
                    </td>
                </tr>
                <tr>
                    <td class="biaoti_right">发布时间</td>
                    <td>
                        <p><%=pp.PublishDate.ToChsString()%></p>
                    </td>
                </tr>
            </table>
        </div>

    </div>

</body>

</html>
