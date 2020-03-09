MIME-Version: 1.0
From: "koti koti" <kotisoftwaretest@gmail.com>
Date: Mon, 9 Mar 2020 14:29:56 +0530
Message-ID: <CAFW5HqR0s08vJ9gASnMijtZVf-68JOxM9XsDTmV4Uq12JQGLWw@mail.gmail.com>
Subject: Ubunut-16.04: KernelCI Setting up a local development instance issues
Content-Type: multipart/alternative; boundary="000000000000b900f105a0683a37"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>

--000000000000b900f105a0683a37
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to setup the KernelCI local development instance in my
Ubuntu-16.04 machine.

But, I am facing some issues while setup. Please can some clarify my
queries.

My Installation Machine environment:
##############################
"
No LSB modules are available.
Distributor ID: Ubuntu
Description: Ubuntu 16.04.6 LTS
Release: 16.04
Codename: xenial
"

Steps:
#########
1. I have installed the "kernelci" using docker as per the guide "For
installing the KernelCI services on docker containers there is a solution
being worked on at https://github.com/lucj/kernelci-docker/"  mentioned in
the page "
https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-local-development-instance
"
2.  After 1st Step I am able to access the below pages
http://172.18.0.1:8081/ or http://localhost:8081/
http://172.18.0.1:8082/ or http://localhost:8081/
http://172.18.0.1:8083/ or http://localhost:8081/
3.  From 1st step , I have started to install the LAVA using
https://github.com/kernelci/lava-docker .


Queries:
###########

1.  I fell that all below services might be installed after running the 1st
step (1st step mentioned under above "Steps" section).   is it not?

   - KernelCI frontend
   - KernelCI backend along with the KernelCI storange
   - KernelCI Jenkins
   - LAVA

2. How to conform  below services installed from 1st step?

-              KernelCI frontend
-              KernelCI backend along with the KernelCI storange
-              KernelCI Jenkins
-              LAVA
-
3. If not,  is it wrong which stays that "
https://github.com/lucj/kernelci-docker/" will install all KernelCI
services like " KernelCI frontend"/"kernelCI backend"/"KerneclCI
jenkins"/"LAVA" ?
4. After 1st step I have started LAVA installation  as per the page   "
https://github.com/kernelci/lava-docker" .   I fell that 1st step might
have not installed LAVA also. is my understanding correct?
5. Can some give me right direction to install and run the tests using
KernelCI in my Ubuntu16.04 machine?

Regards,
Koti

--000000000000b900f105a0683a37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I am trying to setup the=
 KernelCI local development instance in my Ubuntu-16.04 machine.</div><div>=
<br></div><div>But, I am facing some issues while setup. Please can some cl=
arify my queries.</div><div><br></div><div><div>My Installation Machine env=
ironment:</div><div>##############################</div><div>&quot;</div><d=
iv>No LSB modules are available.<br>Distributor ID:	Ubuntu<br>Description:	=
Ubuntu 16.04.6 LTS<br>Release:	16.04<br>Codename:	xenial</div><div>&quot;<b=
r></div><div><br></div><div>Steps:</div><div>#########<br></div><div>1. I h=
ave installed the &quot;kernelci&quot; using docker as per the guide &quot;=
For installing the KernelCI services on docker containers there is a soluti=
on being worked on at <a href=3D"https://github.com/lucj/kernelci-docker/">=
https://github.com/lucj/kernelci-docker/</a>&quot;=C2=A0 mentioned in the p=
age &quot; <a href=3D"https://github.com/kernelci/kernelci-doc/wiki/Setting=
-up-a-local-development-instance">https://github.com/kernelci/kernelci-doc/=
wiki/Setting-up-a-local-development-instance</a> &quot; <br></div><div>2.=
=C2=A0 After 1st Step I am able to access the below pages<br><div><a href=
=3D"http://172.18.0.1:8081/" target=3D"_blank">http://172.18.0.1:8081/</a> =
or <a href=3D"http://localhost:8081/" target=3D"_blank">http://localhost:80=
81/</a></div><div><a href=3D"http://172.18.0.1:8082/" target=3D"_blank">htt=
p://172.18.0.1:8082/</a> or  <a href=3D"http://localhost:8081/" target=3D"_=
blank">http://localhost:8081/</a></div><div><a href=3D"http://172.18.0.1:80=
83/" target=3D"_blank">http://172.18.0.1:8083/</a> or  <a href=3D"http://lo=
calhost:8081/" target=3D"_blank">http://localhost:8081/</a></div><div>3.=C2=
=A0 From 1st step , I have started to install the LAVA using <a href=3D"htt=
ps://github.com/kernelci/lava-docker">https://github.com/kernelci/lava-dock=
er</a> .<br></div><div><br></div><div><br></div><div>Queries:</div><div>###=
########</div><div><br></div><div>1.=C2=A0 I fell that all below services m=
ight be installed after running the 1st step (1st step mentioned under abov=
e &quot;Steps&quot; section). =C2=A0 is it not?</div><div><ul><li>KernelCI =
frontend</li><li>KernelCI backend along with the KernelCI storange</li><li>=
KernelCI Jenkins</li><li>LAVA</li></ul><div>2. How to conform=C2=A0 below s=
ervices installed from 1st step?</div><div>=C2=A0<br><li>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KernelCI frontend</l=
i><li>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 KernelCI backend along with the KernelCI storange</li><li>=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 KernelCI Jenki=
ns</li><li>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 LAVA</li><li><br></li></div><div>3. If not,=C2=A0 is it wrong whi=
ch stays that &quot;<a href=3D"https://github.com/lucj/kernelci-docker/">ht=
tps://github.com/lucj/kernelci-docker/</a>&quot; will install all KernelCI =
services like &quot; KernelCI frontend&quot;/&quot;kernelCI backend&quot;/&=
quot;KerneclCI jenkins&quot;/&quot;LAVA&quot; ?</div><div>4. After 1st step=
 I have started LAVA installation=C2=A0 as per the page=C2=A0=C2=A0 &quot;<=
a href=3D"https://github.com/kernelci/lava-docker">https://github.com/kerne=
lci/lava-docker</a>&quot; . =C2=A0 I fell that 1st step might have not inst=
alled LAVA also. is my understanding correct?</div><div>5. Can some give me=
 right direction to install and run the tests using KernelCI in my Ubuntu16=
.04 machine? <br></div><div><br></div><div>Regards,</div><div>Koti</div></d=
iv></div></div></div>

--000000000000b900f105a0683a37--
