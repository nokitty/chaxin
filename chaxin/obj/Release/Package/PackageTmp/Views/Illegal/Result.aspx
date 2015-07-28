<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Share/BootstrapFrame.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    <div class="container">
        <%
            var json = ViewBag.json as Newtonsoft.Json.Linq.JObject;
            if ((string)json["resultcode"] == "200")
            {
                var list = (Newtonsoft.Json.Linq.JArray)json["result"]["lists"];
                if (list.Count == 0)
                {
        %>
        <div>恭喜你,没有查询到相关的违章记录</div>
        <%
                }
                else
                {
        %>
<div>查询的车牌号为:<%=json["hphm"] %></div>
        <%
                    foreach (Newtonsoft.Json.Linq.JObject item in list)
                    {
        %>
        <table class="table">
            <tr>
                <th>违章时间</th>
                <td><%=item["date"] %></td>
            </tr>
            <tr>
                <th>违章地点</th>
                <td><%=item["area"] %></td>
            </tr>
            <tr>
                <th>违章行为</th>
                <td><%=item["act"] %></td>
            </tr>
            <tr>
                <th>违章扣分</th>
                <td><%=item["fen"] %></td>
            </tr>
            <tr>
                <th>违章罚款</th>
                <td><%=item["money"] %></td>
            </tr>
            <tr>
                <th>是否已处理</th>
                <td><%=(string)item["handled"]=="0"?"未处理":"已处理" %></td>
            </tr>
        </table>
        <%
                    }
                }
            }
            else
            {
        %>
        <div>查询错误:<%=json["reason"] %></div>
        <%
            }
        %>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="server">
</asp:Content>
