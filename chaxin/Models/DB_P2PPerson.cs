using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBC
{
    public class P2PPerson
    {
        static string _tableName = "p2p_person";
        public int ID { get; set; }
        public string Tel { get; set; }
        public string LoanAccount { get; set; }
        public string ExpireAccount { get; set; }
        public string LoanDate { get; set; }
        public string InstalmentCount { get; set; }
        public string RepayAccount { get; set; }
        public int PersonId { get; set; }
        public string Source { get; set; }


        P2PPerson() { }
        public P2PPerson(int id)
        {
            var res = DB.SExecuteReader("select id,tel,loanaccount,expireaccount,loandate,instalmentcount,repayaccount,personid,source from " + _tableName + " where id=?", id);

            if (res.Count == 0)
                throw new Exception("无此数据记录");

            var row = res[0];
            ID = Convert.ToInt32(row[0]);
            Tel = (string)row[1];
            LoanAccount = (string)row[2];
            ExpireAccount = (string)row[3];
            LoanDate = (string)row[4];
            InstalmentCount = (string)row[5];
            RepayAccount = (string)row[6];
            PersonId = Convert.ToInt32(row[7]);
            Source = (string)row[8];
        }
    }
}