<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Share/BootstrapFrame.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">

    <div class="container">
        <h3>审核</h3>
        <table class="table">
            <tr>
                <th>被举报人</th>
                <th>欠款</th>
                <th>审核</th>
                <th>举报时间</th>
                <th></th>
            </tr>
            <%foreach (var item in ViewBag.rpList)
              {
                  var rp = item as DBC.ReportedPerson;
                  var person = new DBC.Person(item.PersonId);
            %>
            <tr>
                <td><%=person.Name %></td>
                <td><%=rp.Arrears %></td>
                <td>
                    <%
                  switch (rp.CheckState)
                  {
                      case ReportedPersonCheckState.NotChecked:
                          Response.Write("未审核");
                          break;
                      case ReportedPersonCheckState.NotPass:
                          Response.Write("<span class=\"text-danger\">未通过</span>");
                          break;
                      case ReportedPersonCheckState.Pass:
                          Response.Write("<span class=\"text-success\">通过</span>");
                          break;
                  }
                    %>
                </td>
                <td><%=rp.ReportDate.ToShortDateString() %></td>
                <td><a href="/admin/reportdetail?id=<%=rp.ID %>">详情</a></td>
            </tr>
            <%
              } %>
        </table>
    </div>

</asp:Content>
