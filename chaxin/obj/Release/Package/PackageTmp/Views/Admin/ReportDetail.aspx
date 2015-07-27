<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Share/BootstrapFrame.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">

    <div class="container">
        <h3>举报详情</h3>
        <%
            var rp = ViewBag.rp as DBC.ReportedPerson;
            var p = new DBC.Person(rp.PersonId);
        %>
        <table class="table">
            <tr>
                <th>姓名</th>
                <td><%=p.Name %></td>
            </tr>
            <tr>
                <th>身份证</th>
                <td><%=p.CardNum %></td>
            </tr>
            <tr>
                <th>性别</th>
                <td><%=rp.Sexy=="m"?"男":"女" %></td>
            </tr>
            <tr>
                <th>省份</th>
                <td><%=rp.Province %></td>
            </tr>
            <tr>
                <th>城市</th>
                <td><%=rp.City %></td>
            </tr>
            <tr>
                <th>电话号码</th>
                <td><%=rp.Tel %></td>
            </tr>
            <tr>
                <th>欠款</th>
                <td><%=rp.Arrears %></td>
            </tr>
            <tr>
                <th>欠款笔数</th>
                <td><%=rp.Count %></td>
            </tr>
            <tr>
                <th>借款日期</th>
                <td><%=rp.LoanDate.ToShortDateString() %></td>
            </tr>
            <tr>
                <th>约定还款日期</th>
                <td><%=rp.RepayDate.ToShortDateString() %></td>
            </tr>
            <tr>
                <th>备注</th>
                <td><%=rp.Remark %></td>
            </tr>
            <tr>
                <th>附件</th>
                <%var pics = rp.Pics.Split(new char[] { '|' }, StringSplitOptions.RemoveEmptyEntries); %>
                <td>
                    <%if (pics.Length == 0)
                      { %>
                    无
                    <%}
                      else
                      { %>
                    <%foreach (var pic in pics)
                      {
                    %>
                    <a href="/upload/<%=pic %>">
                        <img src="/upload/<%=pic %>" class="img-thumbnail" style="max-height: 200px; max-width: 200px;" />
                    </a>
                    <%
                      }
                      }%>
                </td>
            </tr>
            <tr>
                <th>审核状态</th>
                <td>
                    <%
                        switch (rp.CheckState)
                        {
                            case ReportedPersonCheckState.NotChecked:
                                Response.Write("未审核");
                                break;
                            case ReportedPersonCheckState.NotPass:
                                Response.Write("未通过");
                                break;
                            case ReportedPersonCheckState.Pass:
                                Response.Write("通过");
                                break;
                        }
                    %>
                </td>
            </tr>
            <tr>
                <th>举报提交日期</th>
                <td><%=rp.ReportDate.ToShortDateString() %></td>
            </tr>
        </table>

        <%if (rp.CheckState == ReportedPersonCheckState.NotChecked)
          { %>
        <div style="margin: 20px 0;" class="text-center">
            <a href="/admin/check?id=<%=rp.ID %>&value=pass" class="btn btn-success" style="margin: 0 10px;">通过</a>
            <a href="/admin/check?id=<%=rp.ID %>&value=notpass" class="btn btn-danger" style="margin: 0 10px;">不通过</a>
        </div>
        <%} %>
    </div>

</asp:Content>
