using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBC
{
    public class PublicPerson
    {
        static string _tableName = "public_person";
        public int ID { get; set; }
        public string Casecode { get; set; }
        public int Age { get; set; }
        public string Sexy { get; set; }
        public string CourtName { get; set; }
        public string AreaName { get; set; }
        public string GistId { get; set; }
        public DateTime RegDate { get; set; }
        public string GistUnit { get; set; }
        public string Duty { get; set; }
        public string Performance { get; set; }
        public string DisruptTypeName { get; set; }
        public DateTime PublishDate { get; set; }
        public int PersonId { get; set; }

        PublicPerson() { }
        public PublicPerson(int id)
        {
            var res = DB.SExecuteReader("select id,casecode,age,sexy,courtname,areaname,gistid,regdate,gistunit,duty,performance,disrupttypename,publishdate,personid from " + _tableName + " where id=?", id);

            if (res.Count == 0)
                throw new Exception("无此数据记录");

            var row = res[0];
            ID = Convert.ToInt32(row[0]);
            Casecode = (string)row[1];
            Age = Convert.ToInt32(row[2]);
            Sexy = (string)row[3];
            CourtName = (string)row[4];
            AreaName = (string)row[5];
            GistId = (string)row[6];
            RegDate = Convert.ToDateTime(row[7]);
            GistUnit = (string)row[8];
            Duty = (string)row[9];
            Performance = (string)row[10];
            DisruptTypeName = (string)row[11];
            PublishDate = Convert.ToDateTime(row[12]);
            PersonId = Convert.ToInt32(row[13]);
        }
    }
}