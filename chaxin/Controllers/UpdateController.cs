using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Diagnostics;
using System.Text;
using System.Text.RegularExpressions;
using System.Net;
using System.IO;
using Newtonsoft.Json.Linq;

namespace chaxin.Controllers
{
    public class UpdateController : Controller
    {
        //
        // GET: /Update/

        public ActionResult Index()
        {
            
            //string str = System.IO.File.ReadAllText(Server.MapPath("~/area.txt"));
            //var regex = new Regex("\"([^|\"]+\\|\\d{6})\"");
            //var matches = regex.Matches(str);

            //foreach (Match match in matches)
            //{
            //    bb(match.Groups[1].Value);
            //}
           //var b=  Request.ServerVariables[""];
           //var ip= Request.UserHostAddress;
            //using (DB db = new DB())
            //{
            //    var command = db.CommandPrepare("select cardnum,id from person");
            //    using (var reader = command.ExecuteReader())
            //    {
            //        while (reader.Read())
            //        {
            //            var num = reader.GetString(0);
            //            if (num.Length != 18)
            //                continue;

            //            var areaCode = num.Substring(0, 6);
            //            var address = cc(areaCode);

            //            if (address.City != "" && address.Province != "")
            //            {
            //                var id = reader.GetInt32(1);
            //                DB.SExecuteNonQuery("update person set province=?,city=? where id=?", address.Province, address.City, id);
            //            }
            //        }
            //    }
            //}

            //var ip = "113.71.252.247";
            //var wc = new WebClient();
            //wc.Headers.Add("apikey", "f9c4affb79fd86bd0627132d83d629a6");
            //var url = "http://apis.baidu.com/apistore/iplookupservice/iplookup?ip=" + ip;

            //var jsonStr = wc.DownloadString(url);
            //var json = JObject.Parse(jsonStr);

            //return Content("ip是:" + ip + ",来自" + json["retData"]["province"] + " " + json["retData"]["city"]);

            //return Content("OK");
            return HttpNotFound();
        }

        Address cc(string str)
        {
            var province="";
            var res1=DB.SExecuteScalar("select name from area where province=? and city='00' and area='00'", str.Substring(0, 2));
            if(res1!=null)
                province=(string)res1;

            var city = "";
            var res2=DB.SExecuteScalar("select name from area where province=? and city=? and area='00'",str.Substring(0,2),str.Substring(2,2));
            if(res2!=null)
            {
                city = (string)res2;
            }
            else
            {
                var res3=DB.SExecuteScalar("select name from area where province=? and city=? and area=?",str.Substring(0,2),str.Substring(2,2),str.Substring(4,2));
                if (res3 != null)
                    city = (string)res3;
            }

            return new Address() { Province = province, City = city };
        }

        void bb(string str)
        {
            var sp = str.Split('|');
            var code = sp[1];
            var name = sp[0];

            try
            {
                DB.SExecuteNonQuery("insert into area(province,city,area,name) values (?,?,?,?)", code.Substring(0, 2), code.Substring(2, 2), code.Substring(4, 2), name);
            }
            catch { }
        }
    }

    public class Address
    {
        public string Province { get; set; }
        public string City { get; set; }
    }
}
