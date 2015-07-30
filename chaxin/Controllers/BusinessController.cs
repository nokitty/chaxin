using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;

namespace chaxin.Controllers
{
    public class BusinessController : Controller
    {
        //
        // GET: /Business/

        public ActionResult Index()
        {
            //华北
            var d = new Dictionary<string, string>();
            d.Add("北京", "http://qyxy.baic.gov.cn/beijing");
            d.Add("天津", "http://tjcredit.gov.cn/platform/saic/index.ftl");
            d.Add("河北", "http://www.hebscztxyxx.gov.cn/notice");
            d.Add("山西", "http://218.26.1.108/");
            d.Add("内蒙古", "http://www.nmgs.gov.cn:7001/aiccips");


            //东北
            d.Add("辽宁", "http://gsxt.lngs.gov.cn/");
            d.Add("吉林", "http://211.141.74.198:8081/aiccips");
            d.Add("黑龙江", "http://222.171.175.16:9080/ECPS");

            //华东
            d.Add("上海", "https://www.sgs.gov.cn/notice");
            d.Add("江苏", "http://www.jsgsj.gov.cn:58888/province/");
            d.Add("浙江", "http://gsxt.zjaic.gov.cn/zhejiang.jsp");
            d.Add("安徽", "http://www.ahcredit.gov.cn/");
            d.Add("福建", "http://wsgs.fjaic.gov.cn/creditpub/home");
            d.Add("江西", "http://gsxt.jxaic.gov.cn/");
            d.Add("山东", "http://218.57.139.24/");

            //华南
            d.Add("广东", "http://gsxt.gdgs.gov.cn/");
            d.Add("广西", "http://gxqyxygs.gov.cn/");
            d.Add("海南", "http://aic.hainan.gov.cn:1888/aiccips");

            //华中
            d.Add("河南", "http://222.143.24.157/");
            d.Add("湖北", "http://xyjg.egs.gov.cn/ECPS_HB/index.jsp");
            d.Add("湖南", "http://gsxt.hnaic.gov.cn/");

            //西南
            d.Add("重庆", "http://gsxt.cqgs.gov.cn/");
            d.Add("四川", "http://gsxt.scaic.gov.cn/");
            d.Add("贵州", "http://gsxt.gzgs.gov.cn/");
            d.Add("云南", "http://gsxt.ynaic.gov.cn/");
            d.Add("西藏", "http://gsxt.xzaic.gov.cn/");

            //西北
            d.Add("陕西", "http://117.22.252.219:8002/");
            d.Add("甘肃", "http://xygs.gsaic.gov.cn/gsxygs");
            d.Add("青海", "http://218.95.241.36/");
            d.Add("宁夏", "http://gsxt.ngsh.gov.cn/");
            d.Add("新疆", "http://gsxt.xjaic.gov.cn:7001/");

            ViewBag.list = d;
            return View();
        }
        public ActionResult Verify()
        {
            xWebClient wc = new xWebClient();

            var rand = new Random();
            var url = "http://gsxt.gdgs.gov.cn/aiccips//verify.html?random=" + rand.NextDouble();
            var buffer = wc.DownloadData(url);

            Session["cookies"] = wc.CookieContainer;
            return File(buffer, "image/png");
        }
        public ActionResult Check()
        {
            var code = Request.Form["code"];
            var text = Request.Form["text"];

            var wc = new xWebClient();
            if (Session["cookies"] != null)
                wc.CookieContainer = Session["cookies"] as CookieContainer;

            var values = new System.Collections.Specialized.NameValueCollection();
            values.Add("code", code);
            values.Add("textfield", text);

            var str = wc.UploadValues("http://gsxt.gdgs.gov.cn/aiccips/CheckEntContext/checkCode.html", values);
            var json = JObject.Parse(str);

            if ((int)json["flag"] != 1)
                return Content("验证码错误");

            values.Clear();
            values.Add("code", code);
            values.Add("textfield", (string)json["textfield"]);
            var htmlStr = wc.UploadValues("http://gsxt.gdgs.gov.cn/aiccips/CheckEntContext/showInfo.html", values);

            var doc = new HtmlAgilityPack.HtmlDocument();
            doc.LoadHtml(htmlStr);

            var nodes = doc.DocumentNode.SelectNodes("//div[@class='list']/ul");
            var list = new List<object>();
            foreach (var node in nodes)
            {
                var li1 = node.SelectSingleNode("li[1]/a");
                var li2 = node.SelectSingleNode("li[2]");

                var o = new { name = li1.InnerText, brief = li2.InnerText, data = li1.Attributes["href"].Value };
                list.Add(o);
            }

            return Content(JsonConvert.SerializeObject(list));
        }

        public ActionResult Detail()
        {
            var data = Request.Form["data"];

            var url = new Uri(data, UriKind.RelativeOrAbsolute);
            if (url.IsAbsoluteUri == false)
            {
                url = new Uri(new Uri("http://gsxt.gdgs.gov.cn/aiccips"), url);
            }

            var wc = new xWebClient();
            wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 6.1; rv:39.0) Gecko/20100101 Firefox/39.0");
            if (Session["cookies"] != null)
                wc.CookieContainer = Session["cookies"] as CookieContainer;

            var htmlStr = wc.DownloadString(url);
            //var html=UTF8Encoding.UTF8.GetString(buffer);
            var doc = new HtmlAgilityPack.HtmlDocument();
            doc.LoadHtml(htmlStr);

            var list = new List<object>();
            var trs = doc.DocumentNode.SelectNodes("//table[@class='detailsList' and position()=1]//tr");
            foreach (var tr in trs)
            {
                int i = 1;
                while(true)
                {
                    var th = tr.SelectSingleNode(string.Format("th[{0}]", i));
                    var td = tr.SelectSingleNode(string.Format("td[{0}]", i));

                    if (th == null || td == null)
                        break;

                    var o = new { name = th.InnerText, value =td.InnerText };
                    list.Add(o);

                    i++;
                }
                //if (tr.ChildNodes.Count % 2 != 0)
                //    continue;

                //for (int i = 0; i < tr.ChildNodes.Count / 2; i++)
                //{
                //    var o = new { name = tr.ChildNodes[i * 2].InnerText, value = tr.ChildNodes[i * 2 + 1].InnerText };
                //    list.Add(o);
                //}
            }

            return Content(JsonConvert.SerializeObject(list));
        }
    }

    public class xWebClient : WebClient
    {
        public CookieContainer CookieContainer { set; get; }
        private int _timeOut;
        public xWebClient(int timeOut = 5000)
        {
            _timeOut = timeOut;
            CookieContainer = new CookieContainer();
        }

        public string GetData(string url)
        {
            while (true)
            {
                try
                {
                    return UTF8Encoding.UTF8.GetString(DownloadData(url));
                }
                catch (WebException e)
                {
                    if (e.Status != WebExceptionStatus.Timeout)
                    {
                        throw e;
                    }
                }
            }
        }

        public string UploadValues(string url, System.Collections.Specialized.NameValueCollection nvc, string method = "post")
        {
            while (true)
            {
                try
                {
                    return UTF8Encoding.UTF8.GetString(UploadValues(url, method, nvc));
                }
                catch (WebException e)
                {
                    if (e.Status != WebExceptionStatus.Timeout)
                    {
                        throw e;
                    }
                }
            }
        }

        protected override WebRequest GetWebRequest(Uri address)
        {
            WebRequest request = base.GetWebRequest(address);
            if (request is HttpWebRequest)
            {
                HttpWebRequest httpRequest = request as HttpWebRequest;
                httpRequest.CookieContainer = CookieContainer;
                httpRequest.Timeout = _timeOut;
                httpRequest.ReadWriteTimeout = _timeOut;
            }
            return request;
        }
    }

}
