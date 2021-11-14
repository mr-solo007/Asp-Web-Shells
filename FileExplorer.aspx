<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileExplorer.aspx.cs" Inherits="WebApplication1.FileExplorer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <div>
        <telerik:RadFileExplorer ID="RadFileExplorer1" runat="server" AllowPaging="true" PageSize="30" Width="80%" >
                    <Configuration EnableAsyncUpload="true" MaxUploadFileSize="45000000" ViewPaths="~/" UploadPaths="~/" DeletePaths="~/">
                    </Configuration>
        </telerik:RadFileExplorer>
    </div>
    </form>
</body>
</html>
