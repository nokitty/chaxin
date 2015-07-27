using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace chaxin.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        [AdminAuthorize("")]
        public ActionResult Index()
        {
            var sql = "select id from " + DBTables.ReportedPerson;
            var res = DB.SExecuteReader(sql);
            var rpList = new List<DBC.ReportedPerson>();
            foreach (var item in res)
            {
                var rp = new DBC.ReportedPerson(Convert.ToInt32(item[0]));
                rpList.Add(rp);
            }

            ViewBag.rpList = rpList;

            return View();
        }

        [AdminAuthorize("1123")]
        public ActionResult ReportDetail()
        {
            var id = Convert.ToInt32(Request.QueryString["id"]);
            var rp = new DBC.ReportedPerson(id);

            ViewBag.rp = rp;
            return View();
        }

        [AdminAuthorize("2234")]
        public ActionResult Check()
        {
            var id = Tools.GetUIntFromRequest(Request.QueryString["id"]);
            var value = Tools.GetStringFromRequest(Request.QueryString["value"]);

            var rp = new DBC.ReportedPerson(id);
            if(rp.CheckState== ReportedPersonCheckState.NotChecked)
            {
                if (value == "pass")
                    rp.CheckState = ReportedPersonCheckState.Pass;
                else if (value == "notpass")
                    rp.CheckState = ReportedPersonCheckState.NotPass;
            }

            return View();
        }
        public ActionResult Login()
        {
            ViewBag.Title = "登录";
            if (Request.HttpMethod == "POST")
            {
                var name = Request.Form["name"];
                var password = Request.Form["password"];
                if (name == "test" && password == "test")
                {
                    Session["isAdmin"] = true;
                    return Redirect("~/admin");
                }
                else
                {
                    ViewBag.loginFail = true;
                    return View();
                }
            }
            else
            {
                return View();
            }
        }
    }

    class AdminAuthorizeAttribute : AuthorizeAttribute
    {
        string _authorityCode;
        public AdminAuthorizeAttribute(string authorityCode)
        {
            _authorityCode = authorityCode;
        }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            return httpContext.Session["isAdmin"] != null;
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
        {
            filterContext.Result = new RedirectResult("~/admin/login");
        }
    }
}
