using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

static public class DBTables
{
    static readonly public string ReportedPerson = WebConfigurationManager.AppSettings["DBTables.ReportedPerson"];
    static readonly public string Person = WebConfigurationManager.AppSettings["DBTables.Person"];
    static readonly public string Area = WebConfigurationManager.AppSettings["DBTables.Area"];
}