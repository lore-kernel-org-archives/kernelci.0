Subject: Re: "kernelci/kernelci-docker$ sudo ./start.sh" command keep on wait at "echo '-> waiting for backend...'"
References: <CAFW5HqQcEZEuFTpFjN3Cf7ESuZ9v7XrWGFMw8NTR0gBfghcY3g@mail.gmail.com>
 <CAFW5HqRQMTKeApPd=mhUX7ncpW0HCO764V6ZTfj3fcOzc+cr3Q@mail.gmail.com>
 <167dcd1a-7dc3-6bd1-efd2-2491da3ab46c@collabora.com>
 <CAFW5HqQiM8kjLFxXScSHOO-zg1h+Ch0X4r2wqe1Qw3X-WjBNFg@mail.gmail.com>
 <CAFW5HqSrwZn2E+OKJb1qEdP1po8MRaAc2qCo+C20HtH5FozFwg@mail.gmail.com>
 <c640d6a8-8f97-cd63-cee2-849d4d6e1da4@collabora.com>
 <CAFW5HqSOrE7f2CGwd0XFMPQag1sT81FNkt_drgd7PxNBTYJ+xA@mail.gmail.com>
 <CAFW5HqSC=o26JX4=tL-ts-CJkHpyV9Fw=HQOiewkC_=fOxybpw@mail.gmail.com>
From: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>
Message-ID: <9ecdf287-6208-e495-c1b0-523548f40ab3@collabora.com>
Date: Thu, 5 Mar 2020 08:44:59 +0100
MIME-Version: 1.0
In-Reply-To: <CAFW5HqSC=o26JX4=tL-ts-CJkHpyV9Fw=HQOiewkC_=fOxybpw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: koti koti <kotisoftwaretest@gmail.com>
Cc: kernelci@groups.io

Hi Koti,

On 03.03.2020 17:46, koti koti wrote:
> Hi Michal,
>
> I forgot to add one more info i.e=C2=A0=C2=A0 I am able to access below =
url in=20
> web also i.e
>
> http://172.18.0.1:8081/ or http://localhost:8081/
> http://172.18.0.1:8082/ or http://localhost:8081/
> http://172.18.0.1:8083/ or http://localhost:8081/
>
> 2.=C2=A0 Can you let me know next step to configure LAVA to my kerneCI a=
nd=C2=A0=20
> run the test by load QEMU?=C2=A0 ( I have plan to see the QEMU simple bo=
ot=20
> test case results in webpage)
>
Have you tried to follow the instructions at=20
https://github.com/kernelci/kernelci-doc/wiki/Setting-up-a-local-developme=
nt-instance=20
?

You'll also need to exchange the API tokend between your KernelCI and=20
LAVA instances. This link may be helpful=20
https://github.com/kernelci/kernelci-backend-config/blob/master/INSTALL.md


> 3.=C2=A0 I am not sure why my curl is working with sudo only and is this=
=
=20
> give any issues in feature while running test frame work?

My first guess would be that you may have a proxy defined in the=20
environment variable which makes all your curl calls go through it. It's=
=20
probably not defined for the root user hence it works well with sudo. If=
=20
this is the case, you may want to consider using no_proxy env variable=20
or --noproxy option in curl.


Regards,

Micha=C5=82

>
> Regards,
> Koti
>
> On Tue, 3 Mar 2020 at 22:14, koti koti <kotisoftwaretest@gmail.com=20
> <mailto:kotisoftwaretest@gmail.com>> wrote:
>
>     Hi Michal,
>
>     Really appreciated your support.
>
>     1. I have debugged and it is working as expected if we place
>     "sudo" before "curl" in the start.sh script.=C2=A0 Now my start scri=
pt
>     is executed successfully and attached the log.
>
>     "
>     echo "-> waiting for backend..."
>     while [ $(sudo curl -s -m 3 -o /dev/null -w "%{http_code}"
>     $IP:8081 --verbose) -ne 200 ]; do
>     =C2=A0 =C2=A0sleep 1
>     done
>     echo "-> waiting for frontend..."
>     while [ $(sudo curl -s -m 3 -o /dev/null -w "%{http_code}"
>     $IP:8080 --verbose) -ne 200 ]; do
>     =C2=A0 sleep 1
>     done"
>
>     2.=C2=A0 Can you let me know next step to configure LAVA to my kerne=
CI
>     and=C2=A0 run the test by load QEMU?=C2=A0 ( I have plan to see the =
QEMU
>     simple boot test case results in webpage)
>
>     3.=C2=A0 I am not sure why my curl is working with sudo only and is
>     this give any issues in feature while running test frame work?
>
>     Regards,
>     Koti
>
>     On Tue, 3 Mar 2020 at 18:42, Micha=C5=82 Ga=C5=82ka
>     <michal.galka@collabora.com <mailto:michal.galka@collabora.com>>
>     wrote:
>
>         Hi,
>
>         The screenshots seem to confirm that backend and frontend are
>         up and
>         running while curl says something different. Maybe you could pas=
s
>         --verbose option to curl and have more insight in what's
>         happening there?
>
>         5.
>
>         You could possibly run a whole setup on a single PC, however
>         you'll need
>         to make sure that frontend, backend, LAVA web and Jenkins run on
>         different ports. I have never tried it on Ubuntu 16.04.
>
>         My usual setup is Debian Buster with frontend/backend and
>         mongo running
>         there + separate Debian based VM running LAVA.
>
>
>         Cheers,
>
>         Micha=C5=82
>
>         On 03.03.2020 12:27, koti koti wrote:
>         > Hi Michal,
>         >
>         > sorry, I forgot to attach screenshots as mentioned in my
>         previous email.
>         >
>         > Please find the same attachments.
>
>         >
>         > Regards,
>         > Koti
>         >
>         > On Tue, 3 Mar 2020 at 16:36, koti koti
>         <kotisoftwaretest@gmail.com <mailto:kotisoftwaretest@gmail.com>
>         > <mailto:kotisoftwaretest@gmail.com
>         <mailto:kotisoftwaretest@gmail.com>>> wrote:
>         >
>         >=C2=A0 =C2=A0 =C2=A0Hi Michal,
>         >
>         >=C2=A0 =C2=A0 =C2=A0Thanks for your reply. Please find my respo=
nses and
>         queries below.
>         >
>         >=C2=A0 =C2=A0 =C2=A01.=C2=A0 I have ran the start script (#sudo=
 ./start.sh" ) by
>         update the
>         >=C2=A0 =C2=A0 =C2=A0IP statically as docker bridge ip (172.18.0=
.1 ).=C2=A0=C2=A0 Now I
>         am seeing
>         >=C2=A0 =C2=A0 =C2=A0the response as "000" instead of "200"=C2=
=A0 and my ./start
>         script
>         >=C2=A0 =C2=A0 =C2=A0stuck at "echo "-> waiting for backend...""
>         >
>         >=C2=A0 =C2=A0 =C2=A0"
>         >=C2=A0 =C2=A0 =C2=A0# Get IP of Docker host from the DOCKER_HOS=
T environment
>         variable
>         >=C2=A0 =C2=A0 =C2=A0#IP=3D$(echo $DOCKER_HOST | cut -d'/' -f3 |=
 cut -d':' -f1)
>         >=C2=A0 =C2=A0 =C2=A0IP=3D"172.18.0.1"
>         >=C2=A0 =C2=A0 =C2=A0"
>         >
>         >=C2=A0 =C2=A0 =C2=A0log:
>         >=C2=A0 =C2=A0 =C2=A0####
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         172.18.0.1:8081 <http://172.18.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://172.18.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 000 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         172.18.0.1:8081 <http://172.18.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://172.18.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 000 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         172.18.0.1:8081 <http://172.18.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://172.18.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 000 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         172.18.0.1:8081 <http://172.18.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://172.18.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 000 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         172.18.0.1:8081 <http://172.18.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://172.18.0.1:8081>
>         >
>         >
>         >=C2=A0 =C2=A0 =C2=A02. As you suggested I have check the ports =
(8080 and
>         8181) and the
>         >=C2=A0 =C2=A0 =C2=A0ports are free before start my "./start.sh"=
 script,
>         >=C2=A0 =C2=A0 =C2=A0log:
>         >=C2=A0 =C2=A0 =C2=A0###
>         >=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$=
 sudo lsof -i
>         -P -n |
>         >=C2=A0 =C2=A0 =C2=A0grep =C2=A08080
>         >=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$=
 sudo lsof -i
>         -P -n |
>         >=C2=A0 =C2=A0 =C2=A0grep =C2=A08081
>         >=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$
>         >
>         >=C2=A0 =C2=A0 =C2=A03. But these port are in LISTEN mode after =
run the
>         ./start.sh script.
>         >=C2=A0 =C2=A0 =C2=A0log:
>         >=C2=A0 =C2=A0 =C2=A0####
>         >=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$=
 sudo lsof -i
>         -P -n |
>         >=C2=A0 =C2=A0 =C2=A0grep =C2=A08080
>         >=C2=A0 =C2=A0 =C2=A0dockerd =C2=A0 4186 =C2=A0 root =C2=A0 44u =
=
=C2=A0IPv6 =C2=A067713 =C2=A0 =C2=A0 =C2=A00t0 =C2=A0TCP
>         *:8080 (LISTEN)
>         >=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$=
 sudo lsof -i
>         -P -n |
>         >=C2=A0 =C2=A0 =C2=A0grep =C2=A08081
>         >=C2=A0 =C2=A0 =C2=A0dockerd =C2=A0 4186 =C2=A0 root =C2=A0 45u =
=
=C2=A0IPv6 =C2=A067722 =C2=A0 =C2=A0 =C2=A00t0 =C2=A0TCP
>         *:8081 (LISTEN)
>         >=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$
>         >
>         >=C2=A0 =C2=A0 =C2=A04. I am able to open the below URL's in web=
 page. but
>         still we are
>         >=C2=A0 =C2=A0 =C2=A0seeing the curl response as "000" instead o=
f "200" .
>         (Attached the
>         >=C2=A0 =C2=A0 =C2=A0screen shots)
>         > http://172.18.0.1:8081
>         > http://172.18.0.1:8080
>         >
>         >=C2=A0 =C2=A0 =C2=A05. After I run the "./start.sh", I am seein=
g so many
>         networks in
>         >=C2=A0 =C2=A0 =C2=A0"ifconfig -a" (in this en01 / loop/=C2=A0 w=
lp111s0 are=C2=A0 physical
>         >=C2=A0 =C2=A0 =C2=A0port/loop/wifi port respectively) .=C2=A0 D=
o I need to assign
>         any IP's
>         >=C2=A0 =C2=A0 =C2=A0to them to use my KerneCI features?
>         >
>         >=C2=A0 =C2=A0 =C2=A0"
>         >=C2=A0 =C2=A0 =C2=A0docker0 =C2=A0 Link encap:Ethernet =C2=A0HW=
addr
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet add=
r:172.17.0.1 =C2=A0Bcast:172.17.255.255
>         =C2=A0Mask:255.255.0.0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:0 errors:0 dropped:0 overruns:0 frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:0 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:0 (0.0 B) =C2=A0TX bytes:0 (0.0 B)
>         >
>         >=C2=A0 =C2=A0 =C2=A0docker_gwbridge Link encap:Ethernet =C2=A0H=
Waddr
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet add=
r:172.18.0.1 =C2=A0Bcast:172.18.255.255
>         =C2=A0Mask:255.255.0.0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 ad=
dr: =C2=A0Scope:Link
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:110 errors:0 dropped:0 overruns:0
>         frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:139 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:632971 (632.9 KB) =C2=A0TX bytes:20143
>         (20.1 KB)
>         >
>         >=C2=A0 =C2=A0 =C2=A0eno1 =C2=A0 =C2=A0 =C2=A0Link encap:Etherne=
t =C2=A0HWaddr
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:0 errors:0 dropped:0 overruns:0 frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:0 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:1000
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:0 (0.0 B) =C2=A0TX bytes:0 (0.0 B)
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interrup=
t:16 Memory:b5300000-b5320000
>         >
>         >=C2=A0 =C2=A0 =C2=A0enx8c04ba689132 Link encap:Ethernet =C2=A0H=
Waddr
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:0 errors:0 dropped:0 overruns:0 frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:0 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:1000
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:0 (0.0 B) =C2=A0TX bytes:0 (0.0 B)
>         >
>         >=C2=A0 =C2=A0 =C2=A0lo =C2=A0 =C2=A0 =C2=A0 =C2=A0Link encap:Lo=
cal Loopback
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet add=
r:127.0.0.1 =C2=A0Mask:255.0.0.0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 ad=
dr: ::1/128 Scope:Host
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPB=
ACK RUNNING =C2=A0MTU:65536 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:1361 errors:0 dropped:0 overruns:0
>         frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:1361 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:1000
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:108755 (108.7 KB) =C2=A0TX bytes:108755
>         (108.7 KB)
>         >
>         >=C2=A0 =C2=A0 =C2=A0veth0b28762 Link encap:Ethernet =C2=A0HWadd=
r
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 ad=
dr: =C2=A0Scope:Link
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:0 errors:0 dropped:0 overruns:0 frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:34 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:0 (0.0 B) =C2=A0TX bytes:4083 (4.0 KB)
>         >
>         >=C2=A0 =C2=A0 =C2=A0veth11e0835 Link encap:Ethernet =C2=A0HWadd=
r
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 ad=
dr: Scope:Link
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:0 errors:0 dropped:0 overruns:0 frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:32 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:0 (0.0 B) =C2=A0TX bytes:3906 (3.9 KB)
>         >
>         >=C2=A0 =C2=A0 =C2=A0veth64e481a Link encap:Ethernet =C2=A0HWadd=
r
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 ad=
dr: Scope:Link
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:0 errors:0 dropped:0 overruns:0 frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:30 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:0 (0.0 B) =C2=A0TX bytes:3729 (3.7 KB)
>         >
>         >=C2=A0 =C2=A0 =C2=A0veth6ad0ac6 Link encap:Ethernet =C2=A0HWadd=
r
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 ad=
dr: =C2=A0Scope:Link
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:0 errors:0 dropped:0 overruns:0 frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:31 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:0 (0.0 B) =C2=A0TX bytes:3836 (3.8 KB)
>         >
>         >=C2=A0 =C2=A0 =C2=A0vethc5582f5 Link encap:Ethernet =C2=A0HWadd=
r
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 ad=
dr: =C2=A0Scope:Link
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:0 errors:0 dropped:0 overruns:0 frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:32 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:0 (0.0 B) =C2=A0TX bytes:3906 (3.9 KB)
>         >
>         >=C2=A0 =C2=A0 =C2=A0vethc8c5721 Link encap:Ethernet =C2=A0HWadd=
r
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 ad=
dr: =C2=A0Scope:Link
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:110 errors:0 dropped:0 overruns:0
>         frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:166 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:634511 (634.5 KB) =C2=A0TX bytes:23307
>         (23.3 KB)
>         >
>         >=C2=A0 =C2=A0 =C2=A0vethe5d7629 Link encap:Ethernet =C2=A0HWadd=
r
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 ad=
dr: =C2=A0Scope:Link
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:0 errors:0 dropped:0 overruns:0 frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:32 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:0 (0.0 B) =C2=A0TX bytes:3906 (3.9 KB)
>         >
>         >=C2=A0 =C2=A0 =C2=A0wlp111s0 =C2=A0Link encap:Ethernet =C2=A0HW=
addr
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet add=
r: =C2=A0Bcast:10.118.213.255
>         =C2=A0Mask:255.255.254.0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 ad=
dr: =C2=A0Scope:Link
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROAD=
CAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:32160 errors:0 dropped:0 overruns:0
>         frame:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:15689 errors:0 dropped:0 overruns:0
>         carrier:0
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisio=
ns:0 txqueuelen:1000
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes=
:23377024 (23.3 MB) =C2=A0TX bytes:5250217
>         (5.2 MB)
>         >=C2=A0 =C2=A0 =C2=A0"
>         >
>         >=C2=A0 =C2=A0 =C2=A05. can I run all below modules in my single=
 Ubuntu 16.04
>         PC?=C2=A0 (I
>         >=C2=A0 =C2=A0 =C2=A0just want to run "QEMU" test in Ubuntu PC f=
or POC (Proof of
>         >=C2=A0 =C2=A0 =C2=A0concept) of Kerneci framework . Is it possi=
ble to run
>         these in my
>         >=C2=A0 =C2=A0 =C2=A0Single PC?
>         >
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0* *frontend* (for kernelci frontend)
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0* *backend* with a second CNAME *sto=
rage* (for the
>         kernelci
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backend and for the storage o=
f builds logs and files)
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0* *lava* (for LAVA)
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0* *ci* (for jenkins)
>         >
>         >
>         >=C2=A0 =C2=A0 =C2=A0Regards,
>         >=C2=A0 =C2=A0 =C2=A0Koti
>         >
>         >=C2=A0 =C2=A0 =C2=A0On Tue, 3 Mar 2020 at 15:46, Micha=C5=82 Ga=
=
=C5=82ka
>         >=C2=A0 =C2=A0 =C2=A0<michal.galka@collabora.com
>         <mailto:michal.galka@collabora.com>
>         <mailto:michal.galka@collabora.com
>         <mailto:michal.galka@collabora.com>>>
>         >=C2=A0 =C2=A0 =C2=A0wrote:
>         >
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Koti,
>         >
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I tried to reproduce your iss=
ue, with no luck so
>         far. I've
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0never needed
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to set the DOCKER_HOST variab=
le on my machine and
>         everything
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0worked.
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A bit suspicious is that duri=
ng the start you're
>         getting HTTP
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0403 from
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the backend URL. Have you che=
cked that nothing is
>         listening on
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port 8081
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0before you call the ./start.s=
h script?
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0It may also be a good idea to=
 check in a browser or
>         with curl,
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0what's
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the output you'll get when ac=
cessing localhost:8080 and
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localhost8081.
>         >
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I tried the stuff on my box w=
ith Ubuntu 18.04 LTS
>         and docker
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A019.03.6
>         >
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Regards,
>         >
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Micha=C5=82
>         >
>         >
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 02.03.2020 14:13, koti kot=
i wrote:
>         >
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Hi,
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> I fell some thing wrong at =
this=C2=A0 line in .start.shi.e
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> # Get IP of Docker host fro=
m the DOCKER_HOST
>         environment
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variable
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> IP=3D$(echo $DOCKER_HOST | =
cut -d'/' -f3 | cut -d':'
>         -f1)
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> can some one let me know ho=
w can I get the
>         "$DOCKER_HOST" in
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my ubuntu
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> environment?
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Regards,
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> Koti
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> On Mon, 2 Mar 2020 at 18:37=
, koti koti
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<kotisoftwaretest@gmail.com
>         <mailto:kotisoftwaretest@gmail.com>
>         <mailto:kotisoftwaretest@gmail.com
>         <mailto:kotisoftwaretest@gmail.com>>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> <mailto:kotisoftwaretest@gm=
ail.com
>         <mailto:kotisoftwaretest@gmail.com>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<mailto:kotisoftwaretest@gmai=
l.com
>         <mailto:kotisoftwaretest@gmail.com>>>> wrote:
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Hi,
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Today I =
have tried to install "kernelci" in my
>         Ubuntu
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machine (LTS
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A016.04) u=
sing this README file i.e
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         https://github.com/lucj/kernelci-docker/blob/master/README.md.
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0But, the=
 "./start .sh"=C2=A0 script keep on waiting
>         at the
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0"echo '-=
> waiting for backend...'".
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0I have t=
ried to debug more by put "debug
>         messages (set
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-x) in that
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0start.sh=
 script and noticed below messages
>         keep on.
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0can some=
 one help me as how can i resolve this
>         issue?
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A01. Do I =
need to setup any network IP before
>         start this
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command?=C2=A0 (
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0I am new=
 for this dockers)
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A02. Do I =
need to set=C2=A0 any Docker HostIP=C2=A0 in
>         environment
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0before
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0start th=
e ./start script?=C2=A0 . if yes, how can I
>         know this
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Docker
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Host IP?=
 ( I am new for this dockers)
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0log:
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0###
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|"|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> =C2=A0|machine@machine:~/ke=
rnelci/kernelci-docker$ sudo
>         ./start.sh
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ STACK_=
NAME=3Dkernelci
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ getopt=
s t: option
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ export=
 TAG=3Dlatest
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ TAG=3D=
latest
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ docke=
r node ls
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ NODES=
=3D'ID =C2=A0 =C2=A0HOSTNAME =C2=A0STATUS
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0=C2=A0 =
=C2=A0 =C2=A0AVAILABILITY =C2=A0 =C2=A0 =C2=A0 =C2=A0MANAGER STATUS
>         =C2=A0ENGINE VERSION
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A02l2zca1i=
uj5yyzujtrlv3m7xq * 7Y561X2 Ready
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0=C2=A0 =
=C2=A0 Active =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Leader =C2=
=A018.09.7'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 0 =
=
=3D 1 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ echo
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ cut -=
d/ -f3
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ cut -=
d: -f1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ IP=3D
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' ''=
 =3D '' ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ IP=3D1=
27.0.0.1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ echo '=
-> deploying the application...'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0-> deplo=
ying the application...
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ docker=
 stack deploy -c docker-stack.yml kernelci
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Creating=
 network kernelci_default
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Creating=
 service kernelci_proxy
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Creating=
 service kernelci_frontend
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Creating=
 service kernelci_backend
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Creating=
 service kernelci_celery
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Creating=
 service kernelci_redis
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0Creating=
 service kernelci_mongo
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ echo '=
-> application deployed'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0-> appli=
cation deployed
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ echo '=
-> waiting for backend...'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0-> waiti=
ng for backend...
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0++ curl =
-s -m 3 -o /dev/null -w '%{http_code}'
>         > 127.0.0.1:8081 <http://127.0.0.1:8081> <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0<http://=
127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ '[' 40=
3 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0+ sleep =
1"
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|"|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|My outp=
ut for sudo docker ps -a" is"|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> =C2=A0|machine@machine:~/ke=
rnelci/kernelci-docker$ sudo
>         docker
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ps -a
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0CONTAINE=
R ID =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE COMMAND =C2=A0CREATED
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0=C2=A0 =
=C2=A0 =C2=A0STATUS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PORTS =C2=A0 =C2=A0 =
NAMES
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0422fd268=
22d2 =C2=A0 =C2=A0 =C2=A0 =C2=A0redis:3.2
>         "docker-entrypoint.s=E2=80=A6"
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0About a
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0minute a=
go =C2=A0 Up About a minute 6379/tcp
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> =C2=A0=C2=A0kernelci_redis.=
1.y81ztnwmn38bbrnemxmon2ihd
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A04ed73ff8=
01aa =C2=A0 =C2=A0 =C2=A0 =C2=A0mongo:3.4
>         "docker-entrypoint.s=E2=80=A6"
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0About a
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0minute a=
go =C2=A0 Up About a minute 27017/tcp
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> =C2=A0kernelci_mongo.1.qy06=
5rijglhxyqpr9u84dngmu
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A07b43dc0a=
af35 =C2=A0lucj/kernelci-celery:latest
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0"/srv/en=
trypoint.sh" =C2=A0 =C2=A0 About a minute ago =C2=A0
>         Up About a
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minute
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> =C2=A0kernelci_celery.1.zc7=
ba4wchal8xqi2j236lvcx7
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A075377d26=
84ce =C2=A0lucj/kernelci-backend:latest
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0=C2=A0"/=
srv/entrypoint.sh" =C2=A0 =C2=A0 About a minute ago =C2=A0
>         Up About
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a minute
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A08888/tcp
>         =C2=A0kernelci_backend.1.o9fqdun7ff5djays1zhfzvtzh
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0c163b138=
f787 =C2=A0lucj/kernelci-frontend:latest
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0"/srv/en=
trypoint.sh" =C2=A0 =C2=A0 About a minute ago =C2=A0
>         Up About a
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minute
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A05000/tcp
>         =C2=A0kernelci_frontend.1.k71cutuyw805d384wzv9398ua
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A023a921a6=
0479 =C2=A0lucj/kernelci-proxy:latest
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0=C2=A0"/=
usr/bin/entrypoint=E2=80=A6" =C2=A0 About a minute ago =C2=A0
>         Up About
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a minute
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A080/tcp =
=C2=A0kernelci_proxy.1.waurwpa2vftkpsw662aj84otu
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0> =C2=A0machine@machine:~/ker=
nelci/kernelci-docker$
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|Regards=
,|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|Koti
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>
>         >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0>=20
>         >
>
