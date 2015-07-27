<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Share/BootstrapFrame.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">

    <div class="container">
            <div class="panel panel-primary" style="margin-top:20px;">
                <div class="panel-heading text-center">审核成功</div>
                <div class="panel-body">
                    5秒后返回首页
                </div>
                <div class="panel-footer">
                    <a class="btn btn-primary" href="/admin"><span class="glyphicon glyphicon-arrow-left"></span>立刻返回</a>
                </div>
            </div>
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="script">
        <script>
            $(function () {
                setTimeout(function () { location.href = "/admin"; }, 5000);
            })
    </script>
</asp:Content>
