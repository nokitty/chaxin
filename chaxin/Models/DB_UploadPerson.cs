using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBC
{
    public class ReportedPerson
    {
        static string _tableName = "upload_person";
        public int ID { get; set; }
        public string Sexy { get; set; }
        public string Province { get; set; }
        public string City { get; set; }
        public string Tel { get; set; }
        public uint Arrears { get; set; }
        public uint Count { get; set; }
        public DateTime LoanDate { get; set; }
        public DateTime RepayDate { get; set; }
        public string Remark { get; set; }
        public string Pics { get; set; }
        public int PersonId { get; set; }
        ReportedPersonCheckState _checkState;
        public ReportedPersonCheckState CheckState
        {
            get
            {
                return _checkState;
            }
            set
            {
                if (value == _checkState)
                    return;

                SetAttribute("checkstate", value);
            }
        }
        public DateTime ReportDate { get; set; }

        public ReportedPerson(int id)
        {
            var res = DB.SExecuteReader("select id,sexy,province,city,tel,arrears,count,loandate,repaydate,remark,pics,personid,checkstate,reportdate from " + _tableName + " where id=?", id);

            if (res.Count == 0)
                throw new Exception("没有找到改记录");

            var row = res[0];
            ID = Convert.ToInt32(row[0]);
            Sexy = (string)row[1];
            Province = (string)row[2];
            City = (string)row[3];
            Tel = (string)row[4];
            Arrears = Convert.ToUInt32(row[5]);
            Count = Convert.ToUInt32(row[6]);
            LoanDate = Convert.ToDateTime(row[7]);
            RepayDate = Convert.ToDateTime(row[8]);
            Remark = (string)row[9];
            Pics = (string)row[10];
            PersonId = Convert.ToInt32(row[11]);
            _checkState = (ReportedPersonCheckState)Convert.ToByte(row[12]);
            ReportDate = Convert.ToDateTime(row[13]);
        }

        public static ReportedPerson Create(string name, string sexy, string cardnum, string province, string city, string tel, int arrears, int count, DateTime loandate, DateTime repaydate, string remark, string pics)
        {
            var p = DBC.Person.Create(name, cardnum);
            var id = DB.SInsert("insert into " + _tableName + " (sexy,province,city,tel,arrears,count,loandate,repaydate,remark,pics,personid,reportdate) values (?,?,?,?,?,?,?,?,?,?,?,?)",  sexy, province, city, tel, arrears, count, loandate, repaydate, remark, pics,p.ID,DateTime.Now);

            return new ReportedPerson(id);
        }

        void SetAttribute(string name,object value)
        {
            var sql="update "+DBTables.ReportedPerson+" set "+name+"=? where id=?";
            DB.SExecuteNonQuery(sql, value, ID);
        }
    }
}