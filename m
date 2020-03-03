Subject: Re: "kernelci/kernelci-docker$ sudo ./start.sh" command keep on wait at "echo '-> waiting for backend...'"
References: <CAFW5HqQcEZEuFTpFjN3Cf7ESuZ9v7XrWGFMw8NTR0gBfghcY3g@mail.gmail.com>
 <CAFW5HqRQMTKeApPd=mhUX7ncpW0HCO764V6ZTfj3fcOzc+cr3Q@mail.gmail.com>
 <167dcd1a-7dc3-6bd1-efd2-2491da3ab46c@collabora.com>
 <CAFW5HqQiM8kjLFxXScSHOO-zg1h+Ch0X4r2wqe1Qw3X-WjBNFg@mail.gmail.com>
 <CAFW5HqSrwZn2E+OKJb1qEdP1po8MRaAc2qCo+C20HtH5FozFwg@mail.gmail.com>
From: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>
Message-ID: <c640d6a8-8f97-cd63-cee2-849d4d6e1da4@collabora.com>
Date: Tue, 3 Mar 2020 14:12:41 +0100
MIME-Version: 1.0
In-Reply-To: <CAFW5HqSrwZn2E+OKJb1qEdP1po8MRaAc2qCo+C20HtH5FozFwg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: koti koti <kotisoftwaretest@gmail.com>
Cc: kernelci@groups.io

Hi,

The screenshots seem to confirm that backend and frontend are up and=20
running while curl says something different. Maybe you could pass=20
--verbose option to curl and have more insight in what's happening there?

5.

You could possibly run a whole setup on a single PC, however you'll need=
=20
to make sure that frontend, backend, LAVA web and Jenkins run on=20
different ports. I have never tried it on Ubuntu 16.04.

My usual setup is Debian Buster with frontend/backend and mongo running=20
there + separate Debian based VM running LAVA.


Cheers,

Micha=C5=82

On 03.03.2020 12:27, koti koti wrote:
> Hi Michal,
>
> sorry, I forgot to attach screenshots as mentioned in my previous email.
>
> Please find the same attachments.

>
> Regards,
> Koti
>
> On Tue, 3 Mar 2020 at 16:36, koti koti <kotisoftwaretest@gmail.com=20
> <mailto:kotisoftwaretest@gmail.com>> wrote:
>
>     Hi Michal,
>
>     Thanks for your reply. Please find my responses and queries below.
>
>     1.=C2=A0 I have ran the start script (#sudo ./start.sh" ) by update =
the
>     IP statically as docker bridge ip (172.18.0.1 ).=C2=A0=C2=A0 Now I a=
m seeing
>     the response as "000" instead of "200"=C2=A0 and my ./start script
>     stuck at "echo "-> waiting for backend...""
>
>     "
>     # Get IP of Docker host from the DOCKER_HOST environment variable
>     #IP=3D$(echo $DOCKER_HOST | cut -d'/' -f3 | cut -d':' -f1)
>     IP=3D"172.18.0.1"
>     "
>
>     log:
>     ####
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
>     <http://172.18.0.1:8081>
>     + '[' 000 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
>     <http://172.18.0.1:8081>
>     + '[' 000 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
>     <http://172.18.0.1:8081>
>     + '[' 000 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
>     <http://172.18.0.1:8081>
>     + '[' 000 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
>     <http://172.18.0.1:8081>
>
>
>     2. As you suggested I have check the ports (8080 and 8181) and the
>     ports are free before start my "./start.sh" script,
>     log:
>     ###
>     machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n |
>     grep =C2=A08080
>     machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n |
>     grep =C2=A08081
>     machine@machine:~/kernelci/kernelci-docker$
>
>     3. But these port are in LISTEN mode after run the ./start.sh script=
.
>     log:
>     ####
>     machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n |
>     grep =C2=A08080
>     dockerd =C2=A0 4186 =C2=A0 root =C2=A0 44u =C2=A0IPv6 =C2=A067713 =
=C2=A0 =C2=A0 =C2=A00t0 =C2=A0TCP *:8080 (LISTEN)
>     machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n |
>     grep =C2=A08081
>     dockerd =C2=A0 4186 =C2=A0 root =C2=A0 45u =C2=A0IPv6 =C2=A067722 =
=C2=A0 =C2=A0 =C2=A00t0 =C2=A0TCP *:8081 (LISTEN)
>     machine@machine:~/kernelci/kernelci-docker$
>
>     4. I am able to open the below URL's in web page. but still we are
>     seeing the curl response as "000" instead of "200" . (Attached the
>     screen shots)
>     http://172.18.0.1:8081
>     http://172.18.0.1:8080
>
>     5. After I run the "./start.sh", I am seeing so many networks in
>     "ifconfig -a" (in this en01 / loop/=C2=A0 wlp111s0 are=C2=A0 physica=
l
>     port/loop/wifi port respectively) .=C2=A0 Do I need to assign any IP=
's
>     to them to use my KerneCI features?
>
>     "
>     docker0 =C2=A0 Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:172.17.0.1 =C2=A0Bcast:=
172.17.255.255 =C2=A0Mask:255.255.0.0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MULTICAST =C2=A0MTU:=
1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 o=
verruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 o=
verruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes=
:0 (0.0 B)
>
>     docker_gwbridge Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:172.18.0.1 =C2=A0Bcast:=
172.18.255.255 =C2=A0Mask:255.255.0.0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=A0Scope:Link
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =
=C2=A0MTU:1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:110 errors:0 dropped:0=
 overruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:139 errors:0 dropped:0=
 overruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:632971 (632.9 KB) =C2=A0=
TX bytes:20143 (20.1 KB)
>
>     eno1 =C2=A0 =C2=A0 =C2=A0Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MULTICAST =C2=A0MTU:=
1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 o=
verruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 o=
verruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes=
:0 (0.0 B)
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interrupt:16 Memory:b5300000-b532=
0000
>
>     enx8c04ba689132 Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MULTICAST =C2=A0MTU:=
1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 o=
verruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 o=
verruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes=
:0 (0.0 B)
>
>     lo =C2=A0 =C2=A0 =C2=A0 =C2=A0Link encap:Local Loopback
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:127.0.0.1 =C2=A0Mask:25=
5.0.0.0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1/128 Scope:Host
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUNNING =C2=A0MTU:655=
36 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:1361 errors:0 dropped:=
0 overruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:1361 errors:0 dropped:=
0 overruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:108755 (108.7 KB) =C2=A0=
TX bytes:108755 (108.7 KB)
>
>     veth0b28762 Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=A0Scope:Link
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =
=C2=A0MTU:1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 o=
verruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:34 errors:0 dropped:0 =
overruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes=
:4083 (4.0 KB)
>
>     veth11e0835 Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: Scope:Link
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =
=C2=A0MTU:1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 o=
verruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:32 errors:0 dropped:0 =
overruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes=
:3906 (3.9 KB)
>
>     veth64e481a Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: Scope:Link
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =
=C2=A0MTU:1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 o=
verruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:30 errors:0 dropped:0 =
overruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes=
:3729 (3.7 KB)
>
>     veth6ad0ac6 Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=A0Scope:Link
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =
=C2=A0MTU:1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 o=
verruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:31 errors:0 dropped:0 =
overruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes=
:3836 (3.8 KB)
>
>     vethc5582f5 Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=A0Scope:Link
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =
=C2=A0MTU:1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 o=
verruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:32 errors:0 dropped:0 =
overruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes=
:3906 (3.9 KB)
>
>     vethc8c5721 Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=A0Scope:Link
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =
=C2=A0MTU:1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:110 errors:0 dropped:0=
 overruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:166 errors:0 dropped:0=
 overruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:634511 (634.5 KB) =C2=A0=
TX bytes:23307 (23.3 KB)
>
>     vethe5d7629 Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=A0Scope:Link
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =
=C2=A0MTU:1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 o=
verruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:32 errors:0 dropped:0 =
overruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes=
:3906 (3.9 KB)
>
>     wlp111s0 =C2=A0Link encap:Ethernet =C2=A0HWaddr
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr: =C2=A0Bcast:10.118.213=
.255 =C2=A0Mask:255.255.254.0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=A0Scope:Link
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =
=C2=A0MTU:1500 =C2=A0Metric:1
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:32160 errors:0 dropped=
:0 overruns:0 frame:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:15689 errors:0 dropped=
:0 overruns:0 carrier:0
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:23377024 (23.3 MB) =C2=
=A0TX bytes:5250217 (5.2 MB)
>     "
>
>     5. can I run all below modules in my single Ubuntu 16.04 PC?=C2=A0 (=
I
>     just want to run "QEMU" test in Ubuntu PC for POC (Proof of
>     concept) of Kerneci framework . Is it possible to run these in my
>     Single PC?
>
>       * *frontend* (for kernelci frontend)
>       * *backend* with a second CNAME *storage* (for the kernelci
>         backend and for the storage of builds logs and files)
>       * *lava* (for LAVA)
>       * *ci* (for jenkins)
>
>
>     Regards,
>     Koti
>
>     On Tue, 3 Mar 2020 at 15:46, Micha=C5=82 Ga=C5=82ka
>     <michal.galka@collabora.com <mailto:michal.galka@collabora.com>>
>     wrote:
>
>         Hi Koti,
>
>         I tried to reproduce your issue, with no luck so far. I've
>         never needed
>         to set the DOCKER_HOST variable on my machine and everything
>         worked.
>         A bit suspicious is that during the start you're getting HTTP
>         403 from
>         the backend URL. Have you checked that nothing is listening on
>         port 8081
>         before you call the ./start.sh script?
>         It may also be a good idea to check in a browser or with curl,
>         what's
>         the output you'll get when accessing localhost:8080 and
>         localhost8081.
>
>         I tried the stuff on my box with Ubuntu 18.04 LTS and docker
>         19.03.6
>
>         Regards,
>
>         Micha=C5=82
>
>
>         On 02.03.2020 14:13, koti koti wrote:
>
>         > Hi,
>         >
>         > I fell some thing wrong at this=C2=A0 line in .start.shi.e
>         >
>         > # Get IP of Docker host from the DOCKER_HOST environment
>         variable
>         > IP=3D$(echo $DOCKER_HOST | cut -d'/' -f3 | cut -d':' -f1)
>         > can some one let me know how can I get the "$DOCKER_HOST" in
>         my ubuntu
>         > environment?
>         >
>         > Regards,
>         > Koti
>         >
>         > On Mon, 2 Mar 2020 at 18:37, koti koti
>         <kotisoftwaretest@gmail.com <mailto:kotisoftwaretest@gmail.com>
>         > <mailto:kotisoftwaretest@gmail.com
>         <mailto:kotisoftwaretest@gmail.com>>> wrote:
>         >
>         >=C2=A0 =C2=A0 =C2=A0Hi,
>         >
>         >=C2=A0 =C2=A0 =C2=A0Today I have tried to install "kernelci" in=
 my Ubuntu
>         machine (LTS
>         >=C2=A0 =C2=A0 =C2=A016.04) using this README file i.e
>         > https://github.com/lucj/kernelci-docker/blob/master/README.md.
>         >=C2=A0 =C2=A0 =C2=A0But, the "./start .sh"=C2=A0 script keep on=
 waiting at the
>         message
>         >=C2=A0 =C2=A0 =C2=A0"echo '-> waiting for backend...'".
>         >
>         >=C2=A0 =C2=A0 =C2=A0I have tried to debug more by put "debug me=
ssages (set
>         -x) in that
>         >=C2=A0 =C2=A0 =C2=A0start.sh script and noticed below messages =
keep on.
>         >
>         >=C2=A0 =C2=A0 =C2=A0can some one help me as how can i resolve t=
his issue?
>         >
>         >=C2=A0 =C2=A0 =C2=A01. Do I need to setup any network IP before=
 start this
>         command?=C2=A0 (
>         >=C2=A0 =C2=A0 =C2=A0I am new for this dockers)
>         >=C2=A0 =C2=A0 =C2=A02. Do I need to set=C2=A0 any Docker HostIP=
=
=C2=A0 in environment
>         before
>         >=C2=A0 =C2=A0 =C2=A0start the ./start script?=C2=A0 . if yes, h=
ow can I know this
>         Docker
>         >=C2=A0 =C2=A0 =C2=A0Host IP? ( I am new for this dockers)
>         >
>         >=C2=A0 =C2=A0 =C2=A0log:
>         >=C2=A0 =C2=A0 =C2=A0###
>         >=C2=A0 =C2=A0 =C2=A0|"|
>         >=C2=A0 =C2=A0 =C2=A0|machine@machine:~/kernelci/kernelci-docker=
$ sudo ./start.sh
>         >=C2=A0 =C2=A0 =C2=A0+ STACK_NAME=3Dkernelci
>         >=C2=A0 =C2=A0 =C2=A0+ getopts t: option
>         >=C2=A0 =C2=A0 =C2=A0+ export TAG=3Dlatest
>         >=C2=A0 =C2=A0 =C2=A0+ TAG=3Dlatest
>         >=C2=A0 =C2=A0 =C2=A0++ docker node ls
>         >=C2=A0 =C2=A0 =C2=A0+ NODES=3D'ID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTN=
AME =C2=A0STATUS
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0AVAILABILITY =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0MANAGER STATUS =C2=A0ENGINE VERSION
>         >=C2=A0 =C2=A0 =C2=A02l2zca1iuj5yyzujtrlv3m7xq * =C2=A0 7Y561X2 =
Ready
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Active =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0Leader =C2=A018.09.7'
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 0 =3D 1 ']'
>         >=C2=A0 =C2=A0 =C2=A0++ echo
>         >=C2=A0 =C2=A0 =C2=A0++ cut -d/ -f3
>         >=C2=A0 =C2=A0 =C2=A0++ cut -d: -f1
>         >=C2=A0 =C2=A0 =C2=A0+ IP=3D
>         >=C2=A0 =C2=A0 =C2=A0+ '[' '' =3D '' ']'
>         >=C2=A0 =C2=A0 =C2=A0+ IP=3D127.0.0.1
>         >=C2=A0 =C2=A0 =C2=A0+ echo '-> deploying the application...'
>         >=C2=A0 =C2=A0 =C2=A0-> deploying the application...
>         >=C2=A0 =C2=A0 =C2=A0+ docker stack deploy -c docker-stack.yml k=
ernelci
>         >=C2=A0 =C2=A0 =C2=A0Creating network kernelci_default
>         >=C2=A0 =C2=A0 =C2=A0Creating service kernelci_proxy
>         >=C2=A0 =C2=A0 =C2=A0Creating service kernelci_frontend
>         >=C2=A0 =C2=A0 =C2=A0Creating service kernelci_backend
>         >=C2=A0 =C2=A0 =C2=A0Creating service kernelci_celery
>         >=C2=A0 =C2=A0 =C2=A0Creating service kernelci_redis
>         >=C2=A0 =C2=A0 =C2=A0Creating service kernelci_mongo
>         >=C2=A0 =C2=A0 =C2=A0+ echo '-> application deployed'
>         >=C2=A0 =C2=A0 =C2=A0-> application deployed
>         >=C2=A0 =C2=A0 =C2=A0+ echo '-> waiting for backend...'
>         >=C2=A0 =C2=A0 =C2=A0-> waiting for backend...
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1
>         >=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w '%{http_cod=
e}'
>         127.0.0.1:8081 <http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0<http://127.0.0.1:8081>
>         >=C2=A0 =C2=A0 =C2=A0+ '[' 403 -ne 200 ']'
>         >=C2=A0 =C2=A0 =C2=A0+ sleep 1"
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|"|
>         >=C2=A0 =C2=A0 =C2=A0|My output for sudo docker ps -a" is"|
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|machine@machine:~/kernelci/kernelci-docker=
$ sudo docker
>         ps -a
>         >=C2=A0 =C2=A0 =C2=A0CONTAINER ID =C2=A0 =C2=A0 =C2=A0 =C2=A0IMA=
GE COMMAND =C2=A0CREATED
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0STATUS =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0PORTS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 NAMES
>         >=C2=A0 =C2=A0 =C2=A0422fd26822d2 =C2=A0 =C2=A0 =C2=A0 =C2=A0red=
is:3.2 "docker-entrypoint.s=E2=80=A6" =C2=A0
>         About a
>         >=C2=A0 =C2=A0 =C2=A0minute ago =C2=A0 Up About a minute =C2=A0 =
6379/tcp
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0kernelci_redis.1.y81ztnwmn38bbrnemxmo=
n2ihd
>         >=C2=A0 =C2=A0 =C2=A04ed73ff801aa =C2=A0 =C2=A0 =C2=A0 =C2=A0mon=
go:3.4 "docker-entrypoint.s=E2=80=A6" =C2=A0
>         About a
>         >=C2=A0 =C2=A0 =C2=A0minute ago =C2=A0 Up About a minute =C2=A0 =
27017/tcp
>         >=C2=A0 =C2=A0 =C2=A0kernelci_mongo.1.qy065rijglhxyqpr9u84dngmu
>         >=C2=A0 =C2=A0 =C2=A07b43dc0aaf35 =C2=A0 =C2=A0 =C2=A0 =C2=A0luc=
j/kernelci-celery:latest
>         >=C2=A0 =C2=A0 =C2=A0"/srv/entrypoint.sh" =C2=A0 =C2=A0 About a =
minute ago =C2=A0 Up About a
>         minute
>         >=C2=A0 =C2=A0 =C2=A0kernelci_celery.1.zc7ba4wchal8xqi2j236lvcx7
>         >=C2=A0 =C2=A0 =C2=A075377d2684ce =C2=A0 =C2=A0 =C2=A0 =C2=A0luc=
j/kernelci-backend:latest
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0"/srv/entrypoint.sh" =C2=A0 =C2=A0 Ab=
out a minute ago =C2=A0 Up About
>         a minute
>         >=C2=A0 =C2=A0 =C2=A08888/tcp =C2=A0kernelci_backend.1.o9fqdun7f=
f5djays1zhfzvtzh
>         >=C2=A0 =C2=A0 =C2=A0c163b138f787 =C2=A0 =C2=A0 =C2=A0 =C2=A0luc=
j/kernelci-frontend:latest
>         >=C2=A0 =C2=A0 =C2=A0"/srv/entrypoint.sh" =C2=A0 =C2=A0 About a =
minute ago =C2=A0 Up About a
>         minute
>         >=C2=A0 =C2=A0 =C2=A05000/tcp =C2=A0kernelci_frontend.1.k71cutuy=
w805d384wzv9398ua
>         >=C2=A0 =C2=A0 =C2=A023a921a60479 =C2=A0 =C2=A0 =C2=A0 =C2=A0luc=
j/kernelci-proxy:latest
>         >=C2=A0 =C2=A0 =C2=A0=C2=A0"/usr/bin/entrypoint=E2=80=A6" =C2=A0=
 About a minute ago =C2=A0 Up About
>         a minute
>         >=C2=A0 =C2=A0 =C2=A080/tcp =C2=A0kernelci_proxy.1.waurwpa2vftkp=
sw662aj84otu
>         >=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|
>         >=C2=A0 =C2=A0 =C2=A0|Regards,|
>         >=C2=A0 =C2=A0 =C2=A0|Koti
>         >=C2=A0 =C2=A0 =C2=A0|
>         >
>         >=20
>
