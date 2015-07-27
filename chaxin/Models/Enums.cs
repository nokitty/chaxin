using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public enum ReportedPersonCheckState :byte
{
    /// <summary>
    /// 未审核
    /// </summary>
    NotChecked=0,
    /// <summary>
    /// 未通过审核
    /// </summary>
    NotPass=1,
    /// <summary>
    /// 通过
    /// </summary>
    Pass=2
}