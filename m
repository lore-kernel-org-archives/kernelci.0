Subject: Need help to connect kernelci main instance with our lava-docker instance
From: brown.teh@gmail.com
MIME-Version: 1.0
Date: Tue, 21 Jan 2020 07:08:36 -0800
Message-ID: <uXqW.1579619316616468927.7OCH@groups.io>
Content-Type: multipart/alternative; boundary="oramy2j0tzD6PGD5lTJ4"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--oramy2j0tzD6PGD5lTJ4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm new to kernelci, started to setup a lava-docker instance and managed t=
o run a basic job to qemu device recently. Now I'm amid of integrating an a=
ctual x86_64 board(running a yocto image) with the IPXE boot scenario , the=
 integration is still halfway done though.
After gone through some previously posted message thread,
I have learned that in order to connect my LAVA instance to kernelci main =
frontend/backend instance there's couple of flow involved as following
1) kernelci-core: jenkins jobs to watch kernel trees for changes
2) kernelci-core: create LAVA jobs and submit to multiple LAVA labs(requir=
e LAVA instance token to be shared to kernelci admin group)
3) LAVA labs: run LAVA jobs on hardware/VMs etc.
4) LAVA labs: submit results to kernelci-backend(Required kernelci admin g=
roup to share their token to LAVA)

Based on the context above, I have couple of questions to ask before I can=
 proceed with the connection enabling
1) If I'm just want to add my LAVA instance to the official main kernelci =
instance, other than sharing my LAVA instance API token and requesting kern=
elci API token from kernelci admin group, do I still have to setup the kern=
elci-core myself?
2) If the new device type that I'm integrating is required a custom kernel=
 source in order to boot up the image, will kernelci support the build of c=
ustom kernel artifacts, if yes where can I feed the custom kernel source in=
formation?
3) For the communication between kernelci and LAVA instance, what are the =
ports that are involved? If it's REST API based, can I assume it's mostly o=
nly involving HTTP/HTTPS protocol? (The reason behind this question is I'll=
 need to apply for a DMZ connection behind a corporate network, so might ne=
ed the details of ports involved)

Really appreciate if someone can answer my questions. Thanks

--oramy2j0tzD6PGD5lTJ4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,&nbsp;<br /><br />I'm new to kernelci, started to setup a lava-docke=
r instance and managed to run a basic job to qemu device recently. Now I'm =
amid of integrating an actual x86_64 board(running a yocto image) with the =
IPXE boot scenario , the integration is still halfway done though.<br />Aft=
er gone through some previously posted message thread,<br />I have learned =
that in order to connect my LAVA instance to kernelci main frontend/backend=
 instance there's couple of flow involved as following<br />1)&nbsp;<span s=
tyle=3D"white-space: pre-wrap;">kernelci-core: jenkins jobs to watch kernel=
 trees for changes<br />2) </span><span style=3D"white-space: pre-wrap;">ke=
rnelci-core: create LAVA jobs and submit to multiple LAVA labs(require LAVA=
 instance token to be shared to kernelci admin group)<br />3) </span><span =
style=3D"white-space: pre-wrap;">LAVA labs: run LAVA jobs on hardware/VMs e=
tc.<br />4) </span><span style=3D"white-space: pre-wrap;">LAVA labs: submit=
 results to kernelci-backend(Required kernelci admin group to share their t=
oken to LAVA)<br /><br />Based on the context above, I have couple of quest=
ions to ask before I can proceed with the connection enabling<br />1) If I'=
m just want to add my LAVA instance to the official main kernelci instance,=
 other than sharing my LAVA instance API token and requesting kernelci API =
token from kernelci admin group, do I still have to setup the kernelci-core=
 myself?<br />2) If the new device type that I'm integrating is required a =
custom kernel source in order to boot up the image, will kernelci support t=
he build of custom kernel artifacts, if yes where can I feed the custom ker=
nel source information?<br />3) For the communication between kernelci and =
LAVA instance, what are the ports that are involved? If it's REST API based=
, can I assume it's mostly only involving HTTP/HTTPS protocol? (The reason =
behind this question is I'll need to apply for a DMZ connection behind a co=
rporate network, so might need the details of ports involved)<br /><br />Re=
ally appreciate if someone can answer my questions. Thanks </span>

--oramy2j0tzD6PGD5lTJ4--
