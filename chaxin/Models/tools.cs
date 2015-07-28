using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public static class Tools
{
    static public string GetStringFromRequest(string s, string errorMsg = "请求参数错误")
    {
        if(string.IsNullOrWhiteSpace(s))
            throw new CLLParamException(errorMsg);

        return HttpUtility.HtmlDecode(s).Trim();
    }

    static public int GetUIntFromRequest(string s, string errorMsg = "数字非法")
    {
        s = GetStringFromRequest(s, errorMsg);

        try
        {
            return Convert.ToInt32(s);
        }
        catch
        {
            throw new CLLParamException(errorMsg);
        }
    }

    static public DateTime GetDateTimeFromRequest(string s,string errorMsg = "日期格式错误")
    {
        s = GetStringFromRequest(s,errorMsg);

        try
        {
            return DateTime.Parse(s);
        }
        catch
        {
            throw new CLLParamException(errorMsg);
        }
    }
}

public static class DateTimeExtend
{
    public static string ToChsString(this DateTime date)
    {
        return date.ToString("yyyy年MM月dd日");
    }

}