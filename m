From: "Krishnan, Neelima" <neelima.krishnan@intel.com>
Subject: Re: Kernel CI setup
Date: Wed, 7 Apr 2021 23:32:15 +0000
Message-ID: <MWHPR11MB16792C1BD352FA2CD4B6775B8C759@MWHPR11MB1679.namprd11.prod.outlook.com>
References: <MWHPR11MB167972C23BB767F62F00B1CE8C769@MWHPR11MB1679.namprd11.prod.outlook.com>
 <b7b039ff-cd75-3f60-912f-5b4414420115@collabora.com>
 <MWHPR11MB1679269692B2F44C908CC2AB8C759@MWHPR11MB1679.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB1679269692B2F44C908CC2AB8C759@MWHPR11MB1679.namprd11.prod.outlook.com>
MIME-Version: 1.0
Return-Path: neelima.krishnan@intel.com
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_MWHPR11MB16792C1BD352FA2CD4B6775B8C759MWHPR11MB1679namp_";
	type="multipart/alternative"
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@collabora.com>, "kernelci@groups.io" <kernelci@groups.io>

--_004_MWHPR11MB16792C1BD352FA2CD4B6775B8C759MWHPR11MB1679namp_
Content-Type: multipart/alternative;
	boundary="_000_MWHPR11MB16792C1BD352FA2CD4B6775B8C759MWHPR11MB1679namp_"

--_000_MWHPR11MB16792C1BD352FA2CD4B6775B8C759MWHPR11MB1679namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Following up here... I was able to install kernelci frontend and backend lo=
cally. I commented off the Centos 7.3 nodejs Hack In roles/install-deps/tas=
ks/main.yml And installed libhttp-parser-dev
In Debian buster VM manually. I am now able to see frontend running at http=
://127.0.0.1:5000/

I will send a PR to update the documentation with some gaps I see.

I want to integrate the Jenkins and Lava to this local setup. Do I do this =
using the https://github.com/kernelci/kernelci-jenkins and https://github.c=
om/kernelci/lava-docker? Is there a BKM I could use?

Thanks,
Neelima
From: Krishnan, Neelima
Sent: Tuesday, April 6, 2021 6:35 PM
To: Guillaume Tucker <guillaume.tucker@collabora.com>
Cc: kernelci@groups.io
Subject: RE: Kernel CI setup

Hi Guillaume,

Thank you for the quick reply. I was able to go forward with backend instal=
lation. The problem was setting of the url I had set in the curl command.
curl -v -XPOST -H "Content-Type: application/json" -H "Authorization: maste=
r-key" "http://localhost:8888/token" -d '{"email": "xxxx@xx.xx<mailto:xxxx@=
xx.xx>", "username": "xxx", "admin": 1}'
I had set this to point to http://api.mydomain.local:8888.
I got a token from the backend.

For setting up the front end, do I use the https://github.com/kernelci/kern=
elci-frontend-config.git ? Do I use the same VM as the one I had set up for=
 back end or do I create a new VM "kernelci-frontend"?

Either way, when I run the ansible command I get this:

TASK [install-deps : Centos 7.3 nodejs Hack (bug 1481008 / 1481470)] ******=
***************************************************************************=
*********
fatal: [kernelci-frontend]: FAILED! =3D> {"msg": "The conditional check 'an=
sible_distribution =3D=3D \"CentOS\" and ansible_distribution_major_version=
 =3D=3D \"7\" and ansible_distribution_version | search(\"7.3\")' failed. T=
he error was: template error while templating string: no filter named 'sear=
ch'. String: {% if ansible_distribution =3D=3D \"CentOS\" and ansible_distr=
ibution_major_version =3D=3D \"7\" and ansible_distribution_version | searc=
h(\"7.3\") %} True {% else %} False {% endif %}\n\nThe error appears to be =
in '/home/labuser/kernelci/kbc/kernelci-frontend-config/roles/install-deps/=
tasks/main.yml': line 28, column 3, but may\nbe elsewhere in the file depen=
ding on the exact syntax problem.\n\nThe offending line appears to be:\n\n\=
n- name: Centos 7.3 nodejs Hack (bug 1481008 / 1481470)\n  ^ here\n"}
I did update the secret.yml with the token I for from backend.
Neelima

From: Guillaume Tucker <guillaume.tucker@collabora.com<mailto:guillaume.tuc=
ker@collabora.com>>
Sent: Tuesday, April 6, 2021 1:29 AM
To: Krishnan, Neelima <neelima.krishnan@intel.com<mailto:neelima.krishnan@i=
ntel.com>>
Cc: kernelci@groups.io<mailto:kernelci@groups.io>
Subject: Re: Kernel CI setup

+kernelci@groups.io<mailto:+kernelci@groups.io>

Hello,

On 06/04/2021 05:47, Krishnan, Neelima wrote:
Guillaume,

I am trying to setup the kernel ci local instance in my lab, as per instruc=
tions from: https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-loca=
l-development-instance
This documentation should still be mostly correct although it
might have a few inaccuracies and gaps to fill.  Also, the
installation steps are quite lengthy and complicated even for
someone familiar with the code.  Having new people like you
trying to install it and providing feedback is a great way of
improving things.
I am not using dockers for installation. Instead I am trying out the VM met=
hod. I was able to use the kernelci-backend-config git to install the backe=
nd on a VM. Now I am trying to generate the tokens as per instructions in t=
he INSTALL.md @ https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-=
local-development-instance

Here is what I get.. This is not a proxy issue. I am not sure how to move f=
orward. Can you please advise on how to proceed

* Connected to api.mydomain.local (127.0.0.1) port 8888 (#0)
> POST /token HTTP/1.1
> Host: api.mydomain.local:8888
> User-Agent: curl/7.64.0
> Accept: */*
> Content-Type: application/json
> Authorization: master-key
> Content-Length: 63
>
* upload completely sent off: 63 out of 63 bytes
< HTTP/1.1 403 Operation not permitted: provided token is not authorized
< Content-Length: 12
< Vary: Accept-Encoding
< Server: TornadoServer/3.2.2
< Date: Tue, 06 Apr 2021 01:45:25 GMT
< Access-Control-Allow-Headers: authorization
< Content-Type: application/json; charset=3DUTF-8
<
* Connection #0 to host api.mydomain.local left intact

A few things to check:

* Is the kernelci-backend server process running?

To start it manually (for example, on port 5001):

cd kernelci-backend/app
python server.py --port=3D5001

To start the Celery process manually:

cd kernelci-backend/app
sudo python \
    -OO \
    -R \
    /srv/.venv/kernelci-backend/bin/celery worker \
    -Ofair \
    --without-gossip \
    -autoscale=3D24,6 \
    --loglevel=3DINFO \
    --app=3Dtaskqueue \
    --pidfile=3D/tmp/kernelci-celery.pid

If you start them manually, you'll see the logs directly in the
terminals and that should help debugging issues.  On a real
deployment, these services are typically run with systemd and the
backend is behind a web server such as nginx.

* Is the Mongo DB service running?

$ sudo systemctl | grep mongo
mongod.service  loaded active running   MongoDB Database Server

* Which API tokens have been created?

$ mongo kernel-ci
> db['api-token'].find({}, {token: 1, properties: 1})
{ "_id" : ObjectId("5bc51d7bb8d49ee75dbd5a6e"), "properties" : [ 1, 1, 1, 1=
, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0 ], "token" : "XXXXXXXX-XXXX-XXXX-XXXX-=
XXXXXXXXXXXX" }
{ "_id" : ObjectId("5dd80903469d6ddc79e7f7cc"), "token" : "XXXXXXXX-XXXX-XX=
XX-XXXX-XXXXXXXXXXXX", "properties" : [ 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0,=
 0, 0, 0, 0 ] }

* Can the token be used with the API?

$ curl -X GET -H "Authorization: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX" http=
://localhost:5001/version
{"code":200,"result":[{"full_version":"2020.11.2","version":"2020.11.2"}]}

If all these things work, then it's possible to start sending
build and test results to it manually.  Setting up a frontend
instance would be a logical next step, and potentially Jenkins to
have a fully automated pipeline although that's not really needed
in a local development setup.

Hope this helps!

Best wishes,
Guillaume



[cid:image001.jpg@01D72BCB.90AD4930]



--_000_MWHPR11MB16792C1BD352FA2CD4B6775B8C759MWHPR11MB1679namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"purple" style=3D"word-wrap:b=
reak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Following up here&#8230; I was able to install kerne=
lci frontend and backend locally. I commented off the Centos 7.3 nodejs Hac=
k In roles/install-deps/tasks/main.yml And installed
<i><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,sans-se=
rif">libhttp-parser-dev</span></i><span style=3D"font-size:10.5pt;font-fami=
ly:&quot;Segoe UI&quot;,sans-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal">In Debian buster VM manually. I am now able to see f=
rontend running at
<a href=3D"http://127.0.0.1:5000/">http://127.0.0.1:5000/</a><o:p></o:p></p=
>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I will send a PR to update the documentation with so=
me gaps I see.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I want to integrate the Jenkins and Lava to this loc=
al setup. Do I do this using the
<a href=3D"https://github.com/kernelci/kernelci-jenkins">https://github.com=
/kernelci/kernelci-jenkins</a> and
<a href=3D"https://github.com/kernelci/lava-docker">https://github.com/kern=
elci/lava-docker</a>? Is there a BKM I could use?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Neelima<o:p></o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Krishnan, Neelima <br>
<b>Sent:</b> Tuesday, April 6, 2021 6:35 PM<br>
<b>To:</b> Guillaume Tucker &lt;guillaume.tucker@collabora.com&gt;<br>
<b>Cc:</b> kernelci@groups.io<br>
<b>Subject:</b> RE: Kernel CI setup<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Guillaume,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you for the quick reply. I was able to go forw=
ard with backend installation. The problem was setting of the url I had set=
 in the curl command.<o:p></o:p></p>
<p class=3D"MsoNormal">curl -v -XPOST -H &quot;Content-Type: application/js=
on&quot; -H &quot;Authorization: master-key&quot; &quot;<span style=3D"back=
ground:yellow;mso-highlight:yellow"><a href=3D"http://localhost:8888/token"=
>http://localhost:8888/token</a></span>&quot; -d '{&quot;email&quot;: &quot=
;<a href=3D"mailto:xxxx@xx.xx">xxxx@xx.xx</a>&quot;,
 &quot;username&quot;: &quot;xxx&quot;, &quot;admin&quot;: 1}'<o:p></o:p></=
p>
<p class=3D"MsoNormal">I had set this to point to <a href=3D"http://api.myd=
omain.local:8888">
http://api.mydomain.local:8888</a>. <o:p></o:p></p>
<p class=3D"MsoNormal">I got a token from the backend. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For setting up the front end, do I use the <a href=
=3D"https://github.com/kernelci/kernelci-frontend-config.git">
https://github.com/kernelci/kernelci-frontend-config.git</a> ? Do I use the=
 same VM as the one I had set up for back end or do I create a new VM &#822=
0;kernelci-frontend&#8221;?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Either way, when I run the ansible command I get thi=
s:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">TASK [install-deps : Centos 7.3 nodejs Hack (bug 148=
1008 / 1481470)] **********************************************************=
********************************<o:p></o:p></p>
<p class=3D"MsoNormal">fatal: [kernelci-frontend]: FAILED! =3D&gt; {&quot;m=
sg&quot;: &quot;The conditional check 'ansible_distribution =3D=3D \&quot;C=
entOS\&quot; and ansible_distribution_major_version =3D=3D \&quot;7\&quot; =
and ansible_distribution_version | search(\&quot;7.3\&quot;)' failed. The e=
rror was: template
 error while templating string: no filter named 'search'. String: {% if ans=
ible_distribution =3D=3D \&quot;CentOS\&quot; and ansible_distribution_majo=
r_version =3D=3D \&quot;7\&quot; and ansible_distribution_version | search(=
\&quot;7.3\&quot;) %} True {% else %} False {% endif %}\n\nThe error appear=
s
 to be in '/home/labuser/kernelci/kbc/kernelci-frontend-config/roles/instal=
l-deps/tasks/main.yml': line 28, column 3, but may\nbe elsewhere in the fil=
e depending on the exact syntax problem.\n\nThe offending line appears to b=
e:\n\n\n- name: Centos 7.3 nodejs
 Hack (bug 1481008 / 1481470)\n&nbsp; ^ here\n&quot;}<o:p></o:p></p>
<p class=3D"MsoNormal">I did update the secret.yml with the token I for fro=
m backend.
<o:p></o:p></p>
<p class=3D"MsoNormal">Neelima<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Guillaume Tucker &lt;<a href=3D"mailto:=
guillaume.tucker@collabora.com">guillaume.tucker@collabora.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, April 6, 2021 1:29 AM<br>
<b>To:</b> Krishnan, Neelima &lt;<a href=3D"mailto:neelima.krishnan@intel.c=
om">neelima.krishnan@intel.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:kernelci@groups.io">kernelci@groups.io</a><br>
<b>Subject:</b> Re: Kernel CI setup<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><a href=3D"mailto:+kernelci@groups.io">+kernelci@gro=
ups.io</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">On 06/04/2021 05:47, Krishnan, Neelima wrote:<o:p></=
o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">Guillaume,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">I am trying to setup the kernel ci local instance in=
 my lab, as per instructions from:
<a href=3D"https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-local=
-development-instance">
https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-local-developmen=
t-instance</a><o:p></o:p></p>
</blockquote>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">This documentation sh=
ould still be mostly correct although it<br>
might have a few inaccuracies and gaps to fill.&nbsp; Also, the<br>
installation steps are quite lengthy and complicated even for<br>
someone familiar with the code.&nbsp; Having new people like you<br>
trying to install it and providing feedback is a great way of<br>
improving things.<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">I am not using dockers for installation. Instead I a=
m trying out the VM method. I was able to use the kernelci-backend-config g=
it to install the backend on a VM. Now I am trying to generate the tokens a=
s per instructions in the INSTALL.md
 @ <a href=3D"https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-lo=
cal-development-instance">
https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-local-developmen=
t-instance</a><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Here is what I get.. This is not a proxy issue. I am=
 not sure how to move forward. Can you please advise on how to proceed
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">* Connected to api.mydomain.local (127.0.0.1) port 8=
888 (#0)<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; POST /token HTTP/1.1<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Host: api.mydomain.local:8888<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; User-Agent: curl/7.64.0<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Accept: */*<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Content-Type: application/json<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Authorization: master-key<o:p></o:p></p>
<p class=3D"MsoNormal">&gt; Content-Length: 63<o:p></o:p></p>
<p class=3D"MsoNormal">&gt;&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">* upload completely sent off: 63 out of 63 bytes<o:p=
></o:p></p>
<p class=3D"MsoNormal">&lt; <span style=3D"background:yellow;mso-highlight:=
yellow">HTTP/1.1 403 Operation not permitted: provided token is not authori=
zed</span><o:p></o:p></p>
<p class=3D"MsoNormal">&lt; Content-Length: 12<o:p></o:p></p>
<p class=3D"MsoNormal">&lt; Vary: Accept-Encoding<o:p></o:p></p>
<p class=3D"MsoNormal">&lt; Server: TornadoServer/3.2.2<o:p></o:p></p>
<p class=3D"MsoNormal">&lt; Date: Tue, 06 Apr 2021 01:45:25 GMT<o:p></o:p><=
/p>
<p class=3D"MsoNormal">&lt; Access-Control-Allow-Headers: authorization<o:p=
></o:p></p>
<p class=3D"MsoNormal">&lt; Content-Type: application/json; charset=3DUTF-8=
<o:p></o:p></p>
<p class=3D"MsoNormal">&lt;&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">* Connection #0 to host api.mydomain.local left inta=
ct<o:p></o:p></p>
</blockquote>
<p>A few things to check:<br>
<br>
<b>* Is the kernelci-backend server process running?</b><br>
<br>
To start it manually (for example, on port 5001):<o:p></o:p></p>
<p><span style=3D"font-family:&quot;Courier New&quot;">cd kernelci-backend/=
app<br>
python server.py --port=3D5001</span><br>
<br>
To start the Celery process manually:<o:p></o:p></p>
<p style=3D"margin-bottom:12.0pt"><span style=3D"font-family:&quot;Courier =
New&quot;">cd kernelci-backend/app<br>
sudo python \<br>
&nbsp;&nbsp;&nbsp; -OO \<br>
&nbsp;&nbsp;&nbsp; -R \<br>
&nbsp;&nbsp;&nbsp; /srv/.venv/kernelci-backend/bin/celery worker \<br>
&nbsp;&nbsp;&nbsp; -Ofair \<br>
&nbsp;&nbsp;&nbsp; --without-gossip \<br>
&nbsp;&nbsp;&nbsp; -autoscale=3D24,6 \<br>
&nbsp;&nbsp;&nbsp; --loglevel=3DINFO \<br>
&nbsp;&nbsp;&nbsp; --app=3Dtaskqueue \<br>
&nbsp;&nbsp;&nbsp; --pidfile=3D/tmp/kernelci-celery.pid</span><br>
<br>
If you start them manually, you'll see the logs directly in the<br>
terminals and that should help debugging issues.&nbsp; On a real<br>
deployment, these services are typically run with systemd and the<br>
backend is behind a web server such as nginx.<br>
<br>
<b>* Is the Mongo DB service running?</b><br>
<span style=3D"font-family:&quot;Courier New&quot;"><br>
$ sudo systemctl | grep mongo<br>
mongod.service&nbsp; loaded active running&nbsp;&nbsp; MongoDB Database Ser=
ver</span><br>
<b><br>
* Which API tokens have been created?</b><br>
<br>
<span style=3D"font-family:&quot;Courier New&quot;">$ mongo kernel-ci<br>
&gt; db['api-token'].find({}, {token: 1, properties: 1})<br>
{ &quot;_id&quot; : ObjectId(&quot;5bc51d7bb8d49ee75dbd5a6e&quot;), &quot;p=
roperties&quot; : [ 1, 1, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0 ], &quot=
;token&quot; : &quot;XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX&quot; }<br>
{ &quot;_id&quot; : ObjectId(&quot;5dd80903469d6ddc79e7f7cc&quot;), &quot;t=
oken&quot; : &quot;XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX&quot;, &quot;proper=
ties&quot; : [ 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0 ] }</span><br=
>
<b><br>
* Can the token be used with the API?</b><br>
<br>
<span style=3D"font-family:&quot;Courier New&quot;">$ curl -X GET -H &quot;=
Authorization: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX&quot;
<a href=3D"http://localhost:5001/version">http://localhost:5001/version</a>=
<br>
{&quot;code&quot;:200,&quot;result&quot;:[{&quot;full_version&quot;:&quot;2=
020.11.2&quot;,&quot;version&quot;:&quot;2020.11.2&quot;}]}</span><o:p></o:=
p></p>
<p>If all these things work, then it's possible to start sending<br>
build and test results to it manually.&nbsp; Setting up a frontend<br>
instance would be a logical next step, and potentially Jenkins to<br>
have a fully automated pipeline although that's not really needed<br>
in a local development setup.<o:p></o:p></p>
<p>Hope this helps!<o:p></o:p></p>
<p>Best wishes,<br>
Guillaume<o:p></o:p></p>
<p><o:p>&nbsp;</o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><img border=3D"0" width=3D"806" height=3D"614" style=
=3D"width:8.4in;height:6.4in" id=3D"Picture_x0020_1" src=3D"cid:image001.jp=
g@01D72BCB.90AD4930"><o:p></o:p></p>
</blockquote>
<p><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_MWHPR11MB16792C1BD352FA2CD4B6775B8C759MWHPR11MB1679namp_--

--_004_MWHPR11MB16792C1BD352FA2CD4B6775B8C759MWHPR11MB1679namp_
Content-Type: image/jpeg; name="image001.jpg"
Content-Description: image001.jpg
Content-Disposition: inline; filename="image001.jpg"; size=45789;
	creation-date="Wed, 07 Apr 2021 23:32:15 GMT";
	modification-date="Wed, 07 Apr 2021 23:32:15 GMT"
Content-ID: <image001.jpg@01D72BCB.90AD4930>
Content-Transfer-Encoding: base64

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
3uR6t3CZ03THiI3uT3QnShB0aM6VGGTO/9k=

--_004_MWHPR11MB16792C1BD352FA2CD4B6775B8C759MWHPR11MB1679namp_--
