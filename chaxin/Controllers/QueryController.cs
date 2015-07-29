using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net;
using System.Text;
using HtmlAgilityPack;
using Newtonsoft.Json.Linq;

namespace chaxin.Controllers
{
    public class QueryController : Controller
    {
        public ActionResult Index()
        {
            try
            {
                string name = Tools.GetStringFromRequest(Request.QueryString["name"],"请先输入查询的姓名");
                string cardnum = Request.QueryString["cardnum"];
                if (cardnum==null || System.Text.RegularExpressions.Regex.IsMatch(cardnum,@"\d{6}")==false)
                    cardnum = "";
                
                //Pick(name,cardnum);
                List<object[]> res = null;
                res = DB.SExecuteReader("select id from person where name=? and cardnum like concat(?,'%')", name,cardnum);

                var list = new List<ExpandoObject>();
                foreach (var item in res)
                {
                    dynamic d = new ExpandoObject();
                    //基本信息
                    var p = new DBC.Person(Convert.ToInt32(item[0]));
                    d.person = p;

                    //法院公布次数
                    var res1 = DB.SExecuteScalar("select count(*) from public_person where personid=?", p.ID);                    

                    //用户举报次数
                    var res2 = DB.SExecuteScalar("select count(*) from upload_person where personid=?", p.ID);                   

                    //p2p不良记录
                    var res3 = DB.SExecuteScalar("select count(*) from p2p_person where personid=?", p.ID);

                    //举报总次数
                    d.count = Convert.ToInt32(res1) + Convert.ToInt32(res2) + Convert.ToInt32(res3);

                    list.Add(d);
                }

                ViewBag.result = list;

                return View();
            }
            catch (CLLParamException exception)
            {
                return Content(exception.Message);
            }
        }

        public ActionResult Person(int id)
        {
            try
            {
                var p = new DBC.Person(id);
                var ppList = new List<DBC.PublicPerson>();
                var upList = new List<DBC.ReportedPerson>();
                var p2pList = new List<DBC.P2PPerson>();

                {
                    var res = DB.SExecuteReader("select id from public_person where personid=?", p.ID);
                    foreach (var item in res)
                    {
                        ppList.Add(new DBC.PublicPerson(Convert.ToInt32(item[0])));
                    }
                }

                {
                    var res = DB.SExecuteReader("select id from upload_person where personid=?", p.ID);
                    foreach (var item in res)
                    {
                        upList.Add(new DBC.ReportedPerson(Convert.ToInt32(item[0])));
                    }
                }

                {
                    var res = DB.SExecuteReader("select id from p2p_person where personid=?", p.ID);
                    foreach (var item in res)
                    {
                        p2pList.Add(new DBC.P2PPerson(Convert.ToInt32(item[0])));
                    }
                }

                ViewBag.person = p;
                ViewBag.ppList = ppList;
                ViewBag.upList = upList;
                ViewBag.p2pList = p2pList;
                return View();
            }
            catch
            {
                return HttpNotFound();
            }
        }

        public ActionResult Public(int id)
        {
            try
            {
                var pp =new DBC.PublicPerson(id);
                var p = new DBC.Person(pp.PersonId);

                ViewBag.pp = pp;
                ViewBag.p = p;

                return View();
            }
            catch
            {
                return HttpNotFound();
            }
        }

        public ActionResult P2P(int id)
        {
            try
            {
                var p2p = new DBC.P2PPerson(id);
                var p = new DBC.Person(p2p.PersonId);

                ViewBag.p2p = p2p;
                ViewBag.p = p;

                return View();
            }
            catch
            {
                return HttpNotFound();
            }
        }

        public ActionResult Report(int id)
        {
            try
            {
                var rp = new DBC.ReportedPerson(id);
                var p = new DBC.Person(rp.PersonId);

                ViewBag.rp = rp;
                ViewBag.p = p;

                return View();
            }
            catch
            {
                return HttpNotFound();
            }
        }
    }
}
