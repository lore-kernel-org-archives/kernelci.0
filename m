From: Simon Xiao <sixiao@microsoft.com>
Subject: run kernelci test on Microsoft Azure VMs
Date: Tue, 3 Aug 2021 19:43:15 +0000
Message-ID: 
 <CO1PR21MB1284A336E5D08818DC665D1EC4F09@CO1PR21MB1284.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CO1PR21MB1284A336E5D08818DC665D1EC4F09CO1PR21MB1284namp_"
List-ID: <kernelci.groups.io>
To: "kernelci@groups.io" <kernelci@groups.io>
Cc: Johnson George <Johnson.George@microsoft.com>, Isaiah Duncan <isaiahduncan@microsoft.com>, KY Srinivasan <kys@microsoft.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, khilman <khilman@baylibre.com>

--_000_CO1PR21MB1284A336E5D08818DC665D1EC4F09CO1PR21MB1284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Johnson, Isaiah and me come from Microsoft Azure Linux System Group, and we=
 are looking at possible ways to run kernelci test on Azure to cover the Hy=
perV virtual hardware environment.

Looks like there are a lot of existing things we can leverage, including th=
e builds from kernelci with various of config options, and with covered mul=
tiple branches and trees.
We are going to consume those kernels and run LISA (https://github.com/micr=
osoft/lisa/) smoke test on Azure with different hardware configuration opti=
ons (which are represented by various of Azure VM SKUs, for example, GPU, R=
DMA, NVMe, etc VM SKUs). We are also looking for ways to report results bac=
k to kernelci dashboard too.

Currently we are interested in validating the kernel revisions from stable,=
 next and the HyperV tree (https://git.kernel.org/pub/scm/linux/kernel/git/=
hyperv/linux.git).
After we have run the smoke test in kernelci successfully, we will run more=
 applicable LISA test cases in kernelci.

Can you please share any comments to this plan, and/or share any best pract=
ice to onboard the Azure VM tests to kernelci please?

Thanks,
Simon



--_000_CO1PR21MB1284A336E5D08818DC665D1EC4F09CO1PR21MB1284namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Johnson, Isaiah and me come from Microsoft Azure Lin=
ux System Group, and we are looking at possible ways to run kernelci test o=
n Azure to cover the HyperV virtual hardware environment.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Looks like there are a lot of existing things we can=
 leverage, including the builds from kernelci with various of config option=
s, and with covered multiple branches and trees.
<o:p></o:p></p>
<p class=3D"MsoNormal">We are going to consume those kernels and run LISA (=
https://github.com/microsoft/lisa/) smoke test on Azure with different hard=
ware configuration options (which are represented by various of Azure VM SK=
Us, for example, GPU, RDMA, NVMe,
 etc VM SKUs). We are also looking for ways to report results back to kerne=
lci dashboard too.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Currently we are interested in validating the kernel=
 revisions from stable, next and the HyperV tree (https://git.kernel.org/pu=
b/scm/linux/kernel/git/hyperv/linux.git).<o:p></o:p></p>
<p class=3D"MsoNormal">After we have run the smoke test in kernelci success=
fully, we will run more applicable LISA test cases in kernelci.<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you please share any comments to this plan, and/=
or share any best practice to onboard the Azure VM tests to kernelci please=
?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Simon<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CO1PR21MB1284A336E5D08818DC665D1EC4F09CO1PR21MB1284namp_--
