From: Matthew Hart <Matthew.Hart@arm.com>
Subject: Jenkins example configuration
Date: Fri, 4 Feb 2022 20:31:10 +0000
Message-ID: 
 <AM5PR0801MB1777F53F11B189594ACC524E9C299@AM5PR0801MB1777.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Return-Path: Matthew.Hart@arm.com
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_AM5PR0801MB1777F53F11B189594ACC524E9C299AM5PR0801MB1777_"
List-ID: <kernelci.groups.io>
To: "kernelci@groups.io" <kernelci@groups.io>

--_000_AM5PR0801MB1777F53F11B189594ACC524E9C299AM5PR0801MB1777_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm deploying jenkins using the kernelci-jenkins repo and using AWS EKS as =
the kubernetes backend. I can't find any recent examples that include the k=
8s configuration (nodes.yaml i assume) so had a few questions:

  *   Any complaints if I upstream a patch for adding the AWS cli to the k8=
s Docker image?
  *   How is the K8S_CONTEXT environment variable is set in jenkins, to be =
used in jobs/build.jpl?
  *   Is there a record of all the node labels needed to run a full build (=
monitor, build-trigger, k8s etc
  *   Could I get a secrets-redacted example nodes.yaml for casc?

Cheers,
Matt

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_AM5PR0801MB1777F53F11B189594ACC524E9C299AM5PR0801MB1777_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi all,<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
I'm deploying jenkins using the kernelci-jenkins repo and using AWS EKS as =
the kubernetes backend. I can't find any recent examples that include the k=
8s configuration (nodes.yaml i assume) so had a few questions:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<ul>
<li><span>Any complaints if I upstream a patch for adding the AWS cli to th=
e k8s Docker image?</span></li><li><span>How is the K8S_CONTEXT environment=
 variable is set in jenkins, to be used in jobs/build.jpl?</span></li><li><=
span>Is there a record of all the node labels needed to run a full build (m=
onitor, build-trigger, k8s etc</span></li><li><span>Could I get a secrets-r=
edacted example nodes.yaml for casc?<br>
</span></li></ul>
<div>Cheers,<br>
Matt<br>
</div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_AM5PR0801MB1777F53F11B189594ACC524E9C299AM5PR0801MB1777_--
