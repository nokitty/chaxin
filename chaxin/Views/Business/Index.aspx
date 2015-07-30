<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Share/BootstrapFrame.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">

    <div class="container">
        <form>
            <div class="form-group">
                <label>请选择企业登记机关所在地</label>
                <div>
                    <select>
                        <%
                            var list = ViewBag.list as Dictionary<string, string>;
                            foreach (var key in list.Keys)
                            {                   
                        %>
                        <option value="<%=key %>"><%=key %></option>
                        <%
                            }
                        %>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label>请输入企业名</label>
                <input type="text" class="form-control" id="text" />
            </div>
            <div class="form-group">
                <div id="btn" class="btn btn-default">确定</div>
            </div>
        </form>

        <div class="panel panel-default">
            <div class="panel-body">
                <div>请根据下图内容进行判断，输入汉字或算术题计算结果。</div>
                <img id="img" src="" />
                <input type="text" id="code" />
                <button class="btn btn-primary" id="code_btn">确定</button>
            </div>
        </div>

        <table id="tab" class="table">
        </table>
    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="server">
    <script>
        $(function () {
            $("#btn").click(function () {
                $("#img").attr("src", "/business/verify?data=" + Math.random());
            })

            $("#code_btn").click(function () {
                $.post("/business/check", { "code": $("#code").val(), "text": $("#text").val() }, function (data) {
                    for (var i = 0, n = data.length; i < n; i++) {
                        $("#tab").append('<tr><td><span class="click" data-href="' + data[i].data + '">' + data[i].name + '</span></td><td>' + data[i].brief + '</td></tr>');
                    }
                }, "json")
            })

            $(document).on("click",".click" ,(function () {
                var t = $(this);
                var href = t.attr("data-href");
                $.post("/business/detail", { "data": href }, function (data) {
                    alert(data);
                })
            }))
        })
    </script>
</asp:Content>
