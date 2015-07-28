using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBC
{
    public class Person
    {
        static string _tableName = "person";
        public int ID { get; set; }
        public string Name { get; set; }
        public string CardNum { get; set; }
        public string Province { get; set; }
        public string City { get; set; }

        public Person(int id)
        {
            Initialize("id=?", id);
        }

        public Person(string name,string cardnum)
        {            
            Initialize("name=? and cardnum=?", name.Trim(), cardnum.Trim());
        }

        void Initialize(string filter, params object[] args)
        {
            var sql = "select id,name ,cardnum,province,city from " + _tableName + " where " + filter;
            var res = DB.SExecuteReader(sql, args);

            if (res.Count == 0)
                throw new Exception("无该记录");

            var row = res[0];
            ID = Convert.ToInt32(row[0]);
            Name = (string)row[1];
            CardNum = (string)row[2];
            Province = (string)row[3];
            City = (string)row[4];
        }

        static public Person Create(string name,string cardnum)
        {
            name = name.Trim();
            cardnum = cardnum.Trim();
            try
            {
                return new Person(name, cardnum);
            }
            catch
            {
                string province;
                string city;
                GetPosition(cardnum,out province,out city);
                var id = DB.SInsert("insert into " + _tableName + " (name,cardnum,province,city) values (?,?,?,?)", name, cardnum,province,city);
                return new Person(id);
            }
        }

        static public void GetPosition(string num, out string province ,out string city)
        {
            province = "";
            city = "";

            if (num.Length != 18)
                return;

            var str = num.Substring(0, 6);

            var sql = "select name from "+DBTables.Area+" where province=? and city=? and area=?";

            var res1 = DB.SExecuteScalar(sql, str.Substring(0, 2),"00","00");
            if (res1 != null)
                province = (string)res1;

            var res2 = DB.SExecuteScalar(sql, str.Substring(0, 2), str.Substring(2, 2),"00");
            if (res2 != null)
            {
                city = (string)res2;
            }
            else
            {
                var res3 = DB.SExecuteScalar(sql, str.Substring(0, 2), str.Substring(2, 2), str.Substring(4, 2));
                if (res3 != null)
                    city = (string)res3;
            }
        }
    }
}