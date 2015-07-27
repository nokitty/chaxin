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
        void Pick(string name,string cardNum)
        {
            var url = "http://shixin.court.gov.cn/search";
            var currentPage = 1;
            while (true)
            {
                var wc = new WebClient();
                var values = new System.Collections.Specialized.NameValueCollection();
                values.Add("currentPage", currentPage.ToString());
                values.Add("pName", name);
                values.Add("pProvince", "0");
                values.Add("pCardNum", cardNum);

                var buffer = wc.UploadValues(url, values);
                var htmlStr = UTF8Encoding.UTF8.GetString(buffer);

                var doc = new HtmlDocument();
                doc.LoadHtml(htmlStr);

                var collection = doc.DocumentNode.SelectNodes("//td[@align='center']/a[@class='View']");
                // var collection = doc.DocumentNode.SelectNodes("//tr[@style='height: 28px;']");
                if (collection == null)
                    break;

                foreach (var item in collection)
                {
                    var nameNode = item.SelectSingleNode("../../td[2]/a");
                    if (nameNode.InnerText.Trim() != name)
                        continue;

                    var id = item.Attributes["id"].Value;
                    if (DB.SExecuteScalar("select id from public_person where id=? ", id) != null)
                    {
                        continue;
                    }
                    var buffer1 = wc.DownloadData("http://shixin.court.gov.cn/detail?id=" + id);
                    var jsonStr = UTF8Encoding.UTF8.GetString(buffer1);

                    var json = JObject.Parse(jsonStr);

                    var iname = (string)json["iname"];
                    var cardnum = (string)json["cardNum"];
                    var personid = Convert.ToInt32(DB.SExecuteScalar("select id from person where name=? and cardnum=?", iname, cardnum));
                    if (personid == 0)
                        personid = DB.SInsert("insert into person (name,cardnum) values (?,?)", iname, cardnum);


                    DB.SExecuteNonQuery("insert ignore into public_person (id,casecode,age,sexy,courtname,areaname,gistid,regdate,gistunit,duty,performance,disrupttypename,publishdate,personid) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
                       (string)json["id"], (string)json["caseCode"], Convert.ToInt32(json["age"]), (string)json["sexy"], (string)json["courtName"], (string)json["areaName"], (string)json["gistId"], Convert.ToDateTime((string)json["regDate"]), (string)json["gistUnit"], (string)json["duty"], (string)json["performance"], (string)json["disruptTypeName"], Convert.ToDateTime((string)json["publishDate"]), personid);
                }

                currentPage++;
            }
        }

        public ActionResult Index()
        {
            try
            {

                string name = Tools.GetStringFromRequest(Request.QueryString["name"]);
                string cardnum = Request.QueryString["cardnum"];
                if (string.IsNullOrWhiteSpace(cardnum))
                    cardnum = "";
                
                //Pick(name,cardnum);
                List<object[]> res = null;
                res = DB.SExecuteReader("select id from person where name=? and cardnum like concat(?,'%')", name,cardnum);

                var list = new List<ExpandoObject>();
                foreach (var item in res)
                {
                    dynamic d = new ExpandoObject();
                    var p = new DBC.Person(Convert.ToInt32(item[0]));
                    //基本信息
                    d.id = p.ID;
                    d.name = p.Name;
                    d.cardnum = p.CardNum;

                    //法院公布次数
                    var res1 = DB.SExecuteScalar("select count(*) from public_person where personid=?", p.ID);
                    d.publicCount = res1;

                    //用户举报次数
                    var res2 = DB.SExecuteScalar("select count(*) from upload_person where personid=?", p.ID);
                    d.reportCount = res2;

                    //p2p不良记录
                    var res3 = DB.SExecuteScalar("select count(*) from p2p_person where personid=?", p.ID);
                    d.p2pCount = res3;

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

        public ActionResult PersonDetail(int id)
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
    }
}
