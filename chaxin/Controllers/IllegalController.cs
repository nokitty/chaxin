using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Text;
using Newtonsoft.Json.Linq;

namespace chaxin.Controllers
{
    public class IllegalController : Controller
    {
        //
        // GET: /Illegal/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Result()
        {
            var cityCode = Request.Form["city"];
            var num = Request.Form["num"];
            var type = Request.Form["type"];
            var engineNo = Request.Form["engineno"];
            var frameNo = Request.Form["frameno"];

            var appKey = "5277812473d4404992cb8441c93b9c78";
            var url = string.Format("http://v.juhe.cn/wz/query?dtype=json&city={0}&hphm={1}&hpzl={2}&engineno={3}&classno={4}&key={5}", Server.UrlEncode(cityCode), Server.UrlEncode(num), type, engineNo, frameNo, appKey);

            var wc = new WebClient();
            var jsonStr = UTF8Encoding.UTF8.GetString(wc.DownloadData(url));
            var json = JObject.Parse(jsonStr);

            ViewBag.json = json;
            return View();
        }
    }
}
