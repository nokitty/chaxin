using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace chaxin.Controllers
{
    public class AreaController : Controller
    {
        //
        // GET: /Area/

        public ActionResult Index()
        {
            var province = Request.QueryString["province"];
            var city = Request.QueryString["city"];
            var p = 0;

            try
            {
                p = Convert.ToInt32(Request.QueryString["p"]);
            }
            catch { }

            if (string.IsNullOrWhiteSpace(province))
                province = "";

            if (string.IsNullOrWhiteSpace(city))
                city = "";

            //省份为空则按照当前的ip地址定位查找
            if(province=="")
            {
                var ip = Request.UserHostAddress;
                var wc = new WebClient();
                wc.Headers.Add("apikey", "f9c4affb79fd86bd0627132d83d629a6");
                var url = "http://apis.baidu.com/apistore/iplookupservice/iplookup?ip=" + ip;

                var jsonStr = wc.DownloadString(url);
                var json = JObject.Parse(jsonStr);

                if ((int)json["errNum"] == 0)
                {
                    province = (string)json["retData"]["province"];
                    city = (string)json["retData"]["city"];
                }
            }

            var filter = "";
            var args =new List<object>();
            var sql = "select id from " + DBTables.Person + " where ";
            var limitCount=20;
            var limit=string.Format(" limit {0},{1}",p*limitCount,limitCount);

            if(province=="")
            {
                ViewBag.area = "全国";
                filter = "1=1";
            }
            else
            {
                if (city == "")
                {
                    ViewBag.area = province;
                    filter = "province like concat(?,'%')";
                    args.Add(province);
                }
                else
                {
                    ViewBag.area = province + " " + city;
                    filter = "province like concat(?,'%') and city like concat(?,'%')";
                    args.Add(province);
                    args.Add(city);
                }
            }

            var res = DB.SExecuteReader(sql + filter + limit,args.ToArray());
            var list = new List<DBC.Person>();
            foreach (var item in res)
            {
                list.Add(new DBC.Person(Convert.ToInt32(item[0])));
            }
            return Json(list, JsonRequestBehavior.AllowGet);
        }

    }
}
