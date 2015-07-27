using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public abstract class CLLException : Exception
{
    public CLLException(string msg)
        : base(msg)
    { }
}

public class CLLParamException : CLLException
{
    public CLLParamException(string msg) : base(msg) { }
}
