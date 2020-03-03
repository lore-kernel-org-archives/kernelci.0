MIME-Version: 1.0
References: <CAFW5HqQcEZEuFTpFjN3Cf7ESuZ9v7XrWGFMw8NTR0gBfghcY3g@mail.gmail.com>
 <CAFW5HqRQMTKeApPd=mhUX7ncpW0HCO764V6ZTfj3fcOzc+cr3Q@mail.gmail.com>
 <167dcd1a-7dc3-6bd1-efd2-2491da3ab46c@collabora.com> <CAFW5HqQiM8kjLFxXScSHOO-zg1h+Ch0X4r2wqe1Qw3X-WjBNFg@mail.gmail.com>
 <CAFW5HqSrwZn2E+OKJb1qEdP1po8MRaAc2qCo+C20HtH5FozFwg@mail.gmail.com>
 <c640d6a8-8f97-cd63-cee2-849d4d6e1da4@collabora.com> <CAFW5HqSOrE7f2CGwd0XFMPQag1sT81FNkt_drgd7PxNBTYJ+xA@mail.gmail.com>
In-Reply-To: <CAFW5HqSOrE7f2CGwd0XFMPQag1sT81FNkt_drgd7PxNBTYJ+xA@mail.gmail.com>
From: "koti koti" <kotisoftwaretest@gmail.com>
Date: Tue, 3 Mar 2020 22:16:58 +0530
Message-ID: <CAFW5HqSC=o26JX4=tL-ts-CJkHpyV9Fw=HQOiewkC_=fOxybpw@mail.gmail.com>
Subject: Re: "kernelci/kernelci-docker$ sudo ./start.sh" command keep on wait at "echo '-> waiting for backend...'"
Content-Type: multipart/alternative; boundary="00000000000008fd5e059ff60eb2"
List-ID: <kernelci.groups.io>
To: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>
Cc: kernelci@groups.io

--00000000000008fd5e059ff60eb2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

I forgot to add one more info i.e   I am able to access below url in web
also i.e

http://172.18.0.1:8081/ or http://localhost:8081/
http://172.18.0.1:8082/ or http://localhost:8081/
http://172.18.0.1:8083/ or http://localhost:8081/

2.  Can you let me know next step to configure LAVA to my kerneCI and  run
the test by load QEMU?  ( I have plan to see the QEMU simple boot test cas=
e
results in webpage)

3.  I am not sure why my curl is working with sudo only and is this give
any issues in feature while running test frame work?

Regards,
Koti

On Tue, 3 Mar 2020 at 22:14, koti koti <kotisoftwaretest@gmail.com> wrote:

> Hi Michal,
>
> Really appreciated your support.
>
> 1. I have debugged and it is working as expected if we place "sudo" befo=
re
> "curl" in the start.sh script.  Now my start script is executed
> successfully and attached the log.
>
> "
> echo "-> waiting for backend..."
> while [ $(sudo curl -s -m 3 -o /dev/null -w "%{http_code}" $IP:8081
> --verbose) -ne 200 ]; do
>    sleep 1
> done
> echo "-> waiting for frontend..."
> while [ $(sudo curl -s -m 3 -o /dev/null -w "%{http_code}" $IP:8080
> --verbose) -ne 200 ]; do
>   sleep 1
> done"
>
> 2.  Can you let me know next step to configure LAVA to my kerneCI and  r=
un
> the test by load QEMU?  ( I have plan to see the QEMU simple boot test c=
ase
> results in webpage)
>
> 3.  I am not sure why my curl is working with sudo only and is this give
> any issues in feature while running test frame work?
>
> Regards,
> Koti
>
> On Tue, 3 Mar 2020 at 18:42, Micha=C5=82 Ga=C5=82ka <michal.galka@collab=
ora.com>
> wrote:
>
>> Hi,
>>
>> The screenshots seem to confirm that backend and frontend are up and
>> running while curl says something different. Maybe you could pass
>> --verbose option to curl and have more insight in what's happening ther=
e?
>>
>> 5.
>>
>> You could possibly run a whole setup on a single PC, however you'll nee=
d
>> to make sure that frontend, backend, LAVA web and Jenkins run on
>> different ports. I have never tried it on Ubuntu 16.04.
>>
>> My usual setup is Debian Buster with frontend/backend and mongo running
>> there + separate Debian based VM running LAVA.
>>
>>
>> Cheers,
>>
>> Micha=C5=82
>>
>> On 03.03.2020 12:27, koti koti wrote:
>> > Hi Michal,
>> >
>> > sorry, I forgot to attach screenshots as mentioned in my previous ema=
il.
>> >
>> > Please find the same attachments.
>>
>> >
>> > Regards,
>> > Koti
>> >
>> > On Tue, 3 Mar 2020 at 16:36, koti koti <kotisoftwaretest@gmail.com
>> > <mailto:kotisoftwaretest@gmail.com>> wrote:
>> >
>> >     Hi Michal,
>> >
>> >     Thanks for your reply. Please find my responses and queries below=
.
>> >
>> >     1.  I have ran the start script (#sudo ./start.sh" ) by update th=
e
>> >     IP statically as docker bridge ip (172.18.0.1 ).   Now I am seein=
g
>> >     the response as "000" instead of "200"  and my ./start script
>> >     stuck at "echo "-> waiting for backend...""
>> >
>> >     "
>> >     # Get IP of Docker host from the DOCKER_HOST environment variable
>> >     #IP=3D$(echo $DOCKER_HOST | cut -d'/' -f3 | cut -d':' -f1)
>> >     IP=3D"172.18.0.1"
>> >     "
>> >
>> >     log:
>> >     ####
>> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
>> >     <http://172.18.0.1:8081>
>> >     + '[' 000 -ne 200 ']'
>> >     + sleep 1
>> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
>> >     <http://172.18.0.1:8081>
>> >     + '[' 000 -ne 200 ']'
>> >     + sleep 1
>> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
>> >     <http://172.18.0.1:8081>
>> >     + '[' 000 -ne 200 ']'
>> >     + sleep 1
>> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
>> >     <http://172.18.0.1:8081>
>> >     + '[' 000 -ne 200 ']'
>> >     + sleep 1
>> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
>> >     <http://172.18.0.1:8081>
>> >
>> >
>> >     2. As you suggested I have check the ports (8080 and 8181) and th=
e
>> >     ports are free before start my "./start.sh" script,
>> >     log:
>> >     ###
>> >     machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n |
>> >     grep  8080
>> >     machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n |
>> >     grep  8081
>> >     machine@machine:~/kernelci/kernelci-docker$
>> >
>> >     3. But these port are in LISTEN mode after run the ./start.sh
>> script.
>> >     log:
>> >     ####
>> >     machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n |
>> >     grep  8080
>> >     dockerd   4186   root   44u  IPv6  67713      0t0  TCP *:8080
>> (LISTEN)
>> >     machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n |
>> >     grep  8081
>> >     dockerd   4186   root   45u  IPv6  67722      0t0  TCP *:8081
>> (LISTEN)
>> >     machine@machine:~/kernelci/kernelci-docker$
>> >
>> >     4. I am able to open the below URL's in web page. but still we ar=
e
>> >     seeing the curl response as "000" instead of "200" . (Attached th=
e
>> >     screen shots)
>> >     http://172.18.0.1:8081
>> >     http://172.18.0.1:8080
>> >
>> >     5. After I run the "./start.sh", I am seeing so many networks in
>> >     "ifconfig -a" (in this en01 / loop/  wlp111s0 are  physical
>> >     port/loop/wifi port respectively) .  Do I need to assign any IP's
>> >     to them to use my KerneCI features?
>> >
>> >     "
>> >     docker0   Link encap:Ethernet  HWaddr
>> >               inet addr:172.17.0.1  Bcast:172.17.255.255
>>  Mask:255.255.0.0
>> >               UP BROADCAST MULTICAST  MTU:1500  Metric:1
>> >               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:0
>> >               RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>> >
>> >     docker_gwbridge Link encap:Ethernet  HWaddr
>> >               inet addr:172.18.0.1  Bcast:172.18.255.255
>>  Mask:255.255.0.0
>> >               inet6 addr:  Scope:Link
>> >               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>> >               RX packets:110 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:139 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:0
>> >               RX bytes:632971 (632.9 KB)  TX bytes:20143 (20.1 KB)
>> >
>> >     eno1      Link encap:Ethernet  HWaddr
>> >               UP BROADCAST MULTICAST  MTU:1500  Metric:1
>> >               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:1000
>> >               RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>> >               Interrupt:16 Memory:b5300000-b5320000
>> >
>> >     enx8c04ba689132 Link encap:Ethernet  HWaddr
>> >               UP BROADCAST MULTICAST  MTU:1500  Metric:1
>> >               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:1000
>> >               RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
>> >
>> >     lo        Link encap:Local Loopback
>> >               inet addr:127.0.0.1  Mask:255.0.0.0
>> >               inet6 addr: ::1/128 Scope:Host
>> >               UP LOOPBACK RUNNING  MTU:65536  Metric:1
>> >               RX packets:1361 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:1361 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:1000
>> >               RX bytes:108755 (108.7 KB)  TX bytes:108755 (108.7 KB)
>> >
>> >     veth0b28762 Link encap:Ethernet  HWaddr
>> >               inet6 addr:  Scope:Link
>> >               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>> >               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:34 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:0
>> >               RX bytes:0 (0.0 B)  TX bytes:4083 (4.0 KB)
>> >
>> >     veth11e0835 Link encap:Ethernet  HWaddr
>> >               inet6 addr: Scope:Link
>> >               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>> >               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:32 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:0
>> >               RX bytes:0 (0.0 B)  TX bytes:3906 (3.9 KB)
>> >
>> >     veth64e481a Link encap:Ethernet  HWaddr
>> >               inet6 addr: Scope:Link
>> >               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>> >               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:30 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:0
>> >               RX bytes:0 (0.0 B)  TX bytes:3729 (3.7 KB)
>> >
>> >     veth6ad0ac6 Link encap:Ethernet  HWaddr
>> >               inet6 addr:  Scope:Link
>> >               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>> >               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:31 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:0
>> >               RX bytes:0 (0.0 B)  TX bytes:3836 (3.8 KB)
>> >
>> >     vethc5582f5 Link encap:Ethernet  HWaddr
>> >               inet6 addr:  Scope:Link
>> >               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>> >               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:32 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:0
>> >               RX bytes:0 (0.0 B)  TX bytes:3906 (3.9 KB)
>> >
>> >     vethc8c5721 Link encap:Ethernet  HWaddr
>> >               inet6 addr:  Scope:Link
>> >               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>> >               RX packets:110 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:166 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:0
>> >               RX bytes:634511 (634.5 KB)  TX bytes:23307 (23.3 KB)
>> >
>> >     vethe5d7629 Link encap:Ethernet  HWaddr
>> >               inet6 addr:  Scope:Link
>> >               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>> >               RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:32 errors:0 dropped:0 overruns:0 carrier:0
>> >               collisions:0 txqueuelen:0
>> >               RX bytes:0 (0.0 B)  TX bytes:3906 (3.9 KB)
>> >
>> >     wlp111s0  Link encap:Ethernet  HWaddr
>> >               inet addr:  Bcast:10.118.213.255  Mask:255.255.254.0
>> >               inet6 addr:  Scope:Link
>> >               UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>> >               RX packets:32160 errors:0 dropped:0 overruns:0 frame:0
>> >               TX packets:15689 errors:0 dropped:0 overruns:0 carrier:=
0
>> >               collisions:0 txqueuelen:1000
>> >               RX bytes:23377024 (23.3 MB)  TX bytes:5250217 (5.2 MB)
>> >     "
>> >
>> >     5. can I run all below modules in my single Ubuntu 16.04 PC?  (I
>> >     just want to run "QEMU" test in Ubuntu PC for POC (Proof of
>> >     concept) of Kerneci framework . Is it possible to run these in my
>> >     Single PC?
>> >
>> >       * *frontend* (for kernelci frontend)
>> >       * *backend* with a second CNAME *storage* (for the kernelci
>> >         backend and for the storage of builds logs and files)
>> >       * *lava* (for LAVA)
>> >       * *ci* (for jenkins)
>> >
>> >
>> >     Regards,
>> >     Koti
>> >
>> >     On Tue, 3 Mar 2020 at 15:46, Micha=C5=82 Ga=C5=82ka
>> >     <michal.galka@collabora.com <mailto:michal.galka@collabora.com>>
>> >     wrote:
>> >
>> >         Hi Koti,
>> >
>> >         I tried to reproduce your issue, with no luck so far. I've
>> >         never needed
>> >         to set the DOCKER_HOST variable on my machine and everything
>> >         worked.
>> >         A bit suspicious is that during the start you're getting HTTP
>> >         403 from
>> >         the backend URL. Have you checked that nothing is listening o=
n
>> >         port 8081
>> >         before you call the ./start.sh script?
>> >         It may also be a good idea to check in a browser or with curl=
,
>> >         what's
>> >         the output you'll get when accessing localhost:8080 and
>> >         localhost8081.
>> >
>> >         I tried the stuff on my box with Ubuntu 18.04 LTS and docker
>> >         19.03.6
>> >
>> >         Regards,
>> >
>> >         Micha=C5=82
>> >
>> >
>> >         On 02.03.2020 14:13, koti koti wrote:
>> >
>> >         > Hi,
>> >         >
>> >         > I fell some thing wrong at this  line in .start.shi.e
>> >         >
>> >         > # Get IP of Docker host from the DOCKER_HOST environment
>> >         variable
>> >         > IP=3D$(echo $DOCKER_HOST | cut -d'/' -f3 | cut -d':' -f1)
>> >         > can some one let me know how can I get the "$DOCKER_HOST" i=
n
>> >         my ubuntu
>> >         > environment?
>> >         >
>> >         > Regards,
>> >         > Koti
>> >         >
>> >         > On Mon, 2 Mar 2020 at 18:37, koti koti
>> >         <kotisoftwaretest@gmail.com <mailto:kotisoftwaretest@gmail.co=
m>
>> >         > <mailto:kotisoftwaretest@gmail.com
>> >         <mailto:kotisoftwaretest@gmail.com>>> wrote:
>> >         >
>> >         >     Hi,
>> >         >
>> >         >     Today I have tried to install "kernelci" in my Ubuntu
>> >         machine (LTS
>> >         >     16.04) using this README file i.e
>> >         > https://github.com/lucj/kernelci-docker/blob/master/README.=
md
>> .
>> >         >     But, the "./start .sh"  script keep on waiting at the
>> >         message
>> >         >     "echo '-> waiting for backend...'".
>> >         >
>> >         >     I have tried to debug more by put "debug messages (set
>> >         -x) in that
>> >         >     start.sh script and noticed below messages keep on.
>> >         >
>> >         >     can some one help me as how can i resolve this issue?
>> >         >
>> >         >     1. Do I need to setup any network IP before start this
>> >         command?  (
>> >         >     I am new for this dockers)
>> >         >     2. Do I need to set  any Docker HostIP  in environment
>> >         before
>> >         >     start the ./start script?  . if yes, how can I know thi=
s
>> >         Docker
>> >         >     Host IP? ( I am new for this dockers)
>> >         >
>> >         >     log:
>> >         >     ###
>> >         >     |"|
>> >         >     |machine@machine:~/kernelci/kernelci-docker$ sudo
>> ./start.sh
>> >         >     + STACK_NAME=3Dkernelci
>> >         >     + getopts t: option
>> >         >     + export TAG=3Dlatest
>> >         >     + TAG=3Dlatest
>> >         >     ++ docker node ls
>> >         >     + NODES=3D'ID                            HOSTNAME  STAT=
US
>> >         >          AVAILABILITY        MANAGER STATUS  ENGINE VERSION
>> >         >     2l2zca1iuj5yyzujtrlv3m7xq *   7Y561X2 Ready
>> >         >         Active              Leader  18.09.7'
>> >         >     + '[' 0 =3D 1 ']'
>> >         >     ++ echo
>> >         >     ++ cut -d/ -f3
>> >         >     ++ cut -d: -f1
>> >         >     + IP=3D
>> >         >     + '[' '' =3D '' ']'
>> >         >     + IP=3D127.0.0.1
>> >         >     + echo '-> deploying the application...'
>> >         >     -> deploying the application...
>> >         >     + docker stack deploy -c docker-stack.yml kernelci
>> >         >     Creating network kernelci_default
>> >         >     Creating service kernelci_proxy
>> >         >     Creating service kernelci_frontend
>> >         >     Creating service kernelci_backend
>> >         >     Creating service kernelci_celery
>> >         >     Creating service kernelci_redis
>> >         >     Creating service kernelci_mongo
>> >         >     + echo '-> application deployed'
>> >         >     -> application deployed
>> >         >     + echo '-> waiting for backend...'
>> >         >     -> waiting for backend...
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1
>> >         >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}'
>> >         127.0.0.1:8081 <http://127.0.0.1:8081>
>> >         >     <http://127.0.0.1:8081>
>> >         >     + '[' 403 -ne 200 ']'
>> >         >     + sleep 1"
>> >         >     |
>> >         >     |
>> >         >     |
>> >         >     |
>> >         >     |
>> >         >     |"|
>> >         >     |My output for sudo docker ps -a" is"|
>> >         >     |
>> >         >     |
>> >         >     |machine@machine:~/kernelci/kernelci-docker$ sudo docke=
r
>> >         ps -a
>> >         >     CONTAINER ID        IMAGE COMMAND  CREATED
>> >         >          STATUS          PORTS               NAMES
>> >         >     422fd26822d2        redis:3.2 "docker-entrypoint.s=E2=
=80=A6"
>> >         About a
>> >         >     minute ago   Up About a minute   6379/tcp
>> >         >      kernelci_redis.1.y81ztnwmn38bbrnemxmon2ihd
>> >         >     4ed73ff801aa        mongo:3.4 "docker-entrypoint.s=E2=
=80=A6"
>> >         About a
>> >         >     minute ago   Up About a minute   27017/tcp
>> >         >     kernelci_mongo.1.qy065rijglhxyqpr9u84dngmu
>> >         >     7b43dc0aaf35        lucj/kernelci-celery:latest
>> >         >     "/srv/entrypoint.sh"     About a minute ago   Up About =
a
>> >         minute
>> >         >     kernelci_celery.1.zc7ba4wchal8xqi2j236lvcx7
>> >         >     75377d2684ce        lucj/kernelci-backend:latest
>> >         >      "/srv/entrypoint.sh"     About a minute ago   Up About
>> >         a minute
>> >         >     8888/tcp  kernelci_backend.1.o9fqdun7ff5djays1zhfzvtzh
>> >         >     c163b138f787        lucj/kernelci-frontend:latest
>> >         >     "/srv/entrypoint.sh"     About a minute ago   Up About =
a
>> >         minute
>> >         >     5000/tcp  kernelci_frontend.1.k71cutuyw805d384wzv9398ua
>> >         >     23a921a60479        lucj/kernelci-proxy:latest
>> >         >      "/usr/bin/entrypoint=E2=80=A6"   About a minute ago   =
Up About
>> >         a minute
>> >         >     80/tcp  kernelci_proxy.1.waurwpa2vftkpsw662aj84otu
>> >         >     machine@machine:~/kernelci/kernelci-docker$
>> >         >     |
>> >         >     |
>> >         >     |
>> >         >     |
>> >         >     |
>> >         >     |Regards,|
>> >         >     |Koti
>> >         >     |
>> >         >
>> >         >=20
>> >
>>
>

--00000000000008fd5e059ff60eb2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Michal,</div><div><br></div><div>I forgot to add o=
ne more info i.e=C2=A0=C2=A0 I am able to access below url in web also i.e<=
/div><div><br></div><div><a href=3D"http://172.18.0.1:8081/">http://172.18.=
0.1:8081/</a> or <a href=3D"http://localhost:8081/">http://localhost:8081/<=
/a></div><div><a href=3D"http://172.18.0.1:8082/">http://172.18.0.1:8082/</=
a> or  <a href=3D"http://localhost:8081/">http://localhost:8081/</a></div><=
div><a href=3D"http://172.18.0.1:8083/">http://172.18.0.1:8083/</a> or  <a =
href=3D"http://localhost:8081/">http://localhost:8081/</a></div><div><br></=
div><div><div>2.=C2=A0 Can you let me know next step to configure LAVA to m=
y kerneCI=20
and=C2=A0 run the test by load QEMU?=C2=A0 ( I have plan to see the QEMU s=
imple=20
boot test case results in webpage)</div><div><br></div><div>3.=C2=A0 I am =
not sure why my curl is working with sudo only and is this give any issues =
in feature while running test frame work?</div></div><div><br></div><div>Re=
gards,</div><div>Koti<br></div></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue, 3 Mar 2020 at 22:14, koti koti &lt;<=
a href=3D"mailto:kotisoftwaretest@gmail.com">kotisoftwaretest@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 dir=3D"ltr"><div>Hi Michal,</div><div><br></div><div>Really appreciated yo=
ur support.</div><div><br></div><div>1. I have debugged and it is working a=
s expected if we place &quot;sudo&quot; before &quot;curl&quot; in the star=
t.sh script.=C2=A0 Now my start script is executed successfully and attache=
d the log. <br></div><div><br></div><div>&quot;</div><div>echo &quot;-&gt; =
waiting for backend...&quot;<br>while [ $(sudo curl -s -m 3 -o /dev/null -w=
 &quot;%{http_code}&quot; $IP:8081 --verbose) -ne 200 ]; do<br>=C2=A0 =C2=
=A0sleep 1<br>done<br>echo &quot;-&gt; waiting for frontend...&quot;<br>wh=
ile [ $(sudo curl -s -m 3 -o /dev/null -w &quot;%{http_code}&quot; $IP:8080=
 --verbose) -ne 200 ]; do<br>=C2=A0 sleep 1<br>done&quot;<br></div><div><br=
></div><div>2.=C2=A0 Can you let me know next step to configure LAVA to my =
kerneCI and=C2=A0 run the test by load QEMU?=C2=A0 ( I have plan to see the=
 QEMU simple boot test case results in webpage)</div><div><br></div><div>3.=
=
=C2=A0 I am not sure why my curl is working with sudo only and is this giv=
e any issues in feature while running test frame work?</div><div><br></div>=
<div>Regards,</div><div>Koti<br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, 3 Mar 2020 at 18:42, Micha=C5=
=
=82 Ga=C5=82ka &lt;<a href=3D"mailto:michal.galka@collabora.com" target=3D=
"_blank">michal.galka@collabora.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
The screenshots seem to confirm that backend and frontend are up and <br>
running while curl says something different. Maybe you could pass <br>
--verbose option to curl and have more insight in what&#39;s happening the=
re?<br>
<br>
5.<br>
<br>
You could possibly run a whole setup on a single PC, however you&#39;ll ne=
ed <br>
to make sure that frontend, backend, LAVA web and Jenkins run on <br>
different ports. I have never tried it on Ubuntu 16.04.<br>
<br>
My usual setup is Debian Buster with frontend/backend and mongo running <b=
r>
there + separate Debian based VM running LAVA.<br>
<br>
<br>
Cheers,<br>
<br>
Micha=C5=82<br>
<br>
On 03.03.2020 12:27, koti koti wrote:<br>
&gt; Hi Michal,<br>
&gt;<br>
&gt; sorry, I forgot to attach screenshots as mentioned in my previous ema=
il.<br>
&gt;<br>
&gt; Please find the same attachments.<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Koti<br>
&gt;<br>
&gt; On Tue, 3 Mar 2020 at 16:36, koti koti &lt;<a href=3D"mailto:kotisoft=
waretest@gmail.com" target=3D"_blank">kotisoftwaretest@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:kotisoftwaretest@gmail.com" target=3D"_b=
lank">kotisoftwaretest@gmail.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi Michal,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks for your reply. Please find my responses an=
d queries below.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A01.=C2=A0 I have ran the start script (#sudo ./star=
t.sh&quot; ) by update the<br>
&gt;=C2=A0 =C2=A0 =C2=A0IP statically as docker bridge ip (172.18.0.1 ).=
=C2=A0=C2=A0 Now I am seeing<br>
&gt;=C2=A0 =C2=A0 =C2=A0the response as &quot;000&quot; instead of &quot;2=
00&quot;=C2=A0 and my ./start script<br>
&gt;=C2=A0 =C2=A0 =C2=A0stuck at &quot;echo &quot;-&gt; waiting for backen=
d...&quot;&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0# Get IP of Docker host from the DOCKER_HOST envir=
onment variable<br>
&gt;=C2=A0 =C2=A0 =C2=A0#IP=3D$(echo $DOCKER_HOST | cut -d&#39;/&#39; -f3 =
| cut -d&#39;:&#39; -f1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0IP=3D&quot;172.18.0.1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0log:<br>
&gt;=C2=A0 =C2=A0 =C2=A0####<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://172.18.0.1:8081" rel=3D"noreferrer" target=3D"_blank=
">172.18.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://172.18.0.1:8081" rel=3D"nore=
ferrer" target=3D"_blank">http://172.18.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 000 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://172.18.0.1:8081" rel=3D"noreferrer" target=3D"_blank=
">172.18.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://172.18.0.1:8081" rel=3D"nore=
ferrer" target=3D"_blank">http://172.18.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 000 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://172.18.0.1:8081" rel=3D"noreferrer" target=3D"_blank=
">172.18.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://172.18.0.1:8081" rel=3D"nore=
ferrer" target=3D"_blank">http://172.18.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 000 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://172.18.0.1:8081" rel=3D"noreferrer" target=3D"_blank=
">172.18.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://172.18.0.1:8081" rel=3D"nore=
ferrer" target=3D"_blank">http://172.18.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 000 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://172.18.0.1:8081" rel=3D"noreferrer" target=3D"_blank=
">172.18.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://172.18.0.1:8081" rel=3D"nore=
ferrer" target=3D"_blank">http://172.18.0.1:8081</a>&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A02. As you suggested I have check the ports (8080 a=
nd 8181) and the<br>
&gt;=C2=A0 =C2=A0 =C2=A0ports are free before start my &quot;./start.sh&qu=
ot; script,<br>
&gt;=C2=A0 =C2=A0 =C2=A0log:<br>
&gt;=C2=A0 =C2=A0 =C2=A0###<br>
&gt;=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$ sudo l=
sof -i -P -n |<br>
&gt;=C2=A0 =C2=A0 =C2=A0grep =C2=A08080<br>
&gt;=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$ sudo l=
sof -i -P -n |<br>
&gt;=C2=A0 =C2=A0 =C2=A0grep =C2=A08081<br>
&gt;=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A03. But these port are in LISTEN mode after run the=
 ./start.sh script.<br>
&gt;=C2=A0 =C2=A0 =C2=A0log:<br>
&gt;=C2=A0 =C2=A0 =C2=A0####<br>
&gt;=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$ sudo l=
sof -i -P -n |<br>
&gt;=C2=A0 =C2=A0 =C2=A0grep =C2=A08080<br>
&gt;=C2=A0 =C2=A0 =C2=A0dockerd =C2=A0 4186 =C2=A0 root =C2=A0 44u =C2=A0I=
Pv6 =C2=A067713 =C2=A0 =C2=A0 =C2=A00t0 =C2=A0TCP *:8080 (LISTEN)<br>
&gt;=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$ sudo l=
sof -i -P -n |<br>
&gt;=C2=A0 =C2=A0 =C2=A0grep =C2=A08081<br>
&gt;=C2=A0 =C2=A0 =C2=A0dockerd =C2=A0 4186 =C2=A0 root =C2=A0 45u =C2=A0I=
Pv6 =C2=A067722 =C2=A0 =C2=A0 =C2=A00t0 =C2=A0TCP *:8081 (LISTEN)<br>
&gt;=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A04. I am able to open the below URL&#39;s in web pa=
ge. but still we are<br>
&gt;=C2=A0 =C2=A0 =C2=A0seeing the curl response as &quot;000&quot; instea=
d of &quot;200&quot; . (Attached the<br>
&gt;=C2=A0 =C2=A0 =C2=A0screen shots)<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://172.18.0.1:8081" rel=3D"noreferr=
er" target=3D"_blank">http://172.18.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://172.18.0.1:8080" rel=3D"noreferr=
er" target=3D"_blank">http://172.18.0.1:8080</a><br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A05. After I run the &quot;./start.sh&quot;, I am se=
eing so many networks in<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;ifconfig -a&quot; (in this en01 / loop/=C2=
=A0 wlp111s0 are=C2=A0 physical<br>
&gt;=C2=A0 =C2=A0 =C2=A0port/loop/wifi port respectively) .=C2=A0 Do I nee=
d to assign any IP&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0to them to use my KerneCI features?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0docker0 =C2=A0 Link encap:Ethernet =C2=A0HWaddr<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:172.1=
7.0.1 =C2=A0Bcast:172.17.255.255 =C2=A0Mask:255.255.0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MU=
LTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 er=
rors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 er=
rors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0=
 B) =C2=A0TX bytes:0 (0.0 B)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0docker_gwbridge Link encap:Ethernet =C2=A0HWaddr<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:172.1=
8.0.1 =C2=A0Bcast:172.18.255.255 =C2=A0Mask:255.255.0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=
=
=A0Scope:Link<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RU=
NNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:110 =
errors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:139 =
errors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:632971=
 (632.9 KB) =C2=A0TX bytes:20143 (20.1 KB)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0eno1 =C2=A0 =C2=A0 =C2=A0Link encap:Ethernet =C2=
=A0HWaddr<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MU=
LTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 er=
rors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 er=
rors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:1000<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0=
 B) =C2=A0TX bytes:0 (0.0 B)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Interrupt:16 Me=
mory:b5300000-b5320000<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0enx8c04ba689132 Link encap:Ethernet =C2=A0HWaddr<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MU=
LTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 er=
rors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 er=
rors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:1000<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0=
 B) =C2=A0TX bytes:0 (0.0 B)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0lo =C2=A0 =C2=A0 =C2=A0 =C2=A0Link encap:Local Loo=
pback<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:127.0=
.0.1 =C2=A0Mask:255.0.0.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1=
/128 Scope:Host<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUN=
NING =C2=A0MTU:65536 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:1361=
 errors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:1361=
 errors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:1000<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:108755=
 (108.7 KB) =C2=A0TX bytes:108755 (108.7 KB)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0veth0b28762 Link encap:Ethernet =C2=A0HWaddr<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=
=
=A0Scope:Link<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RU=
NNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 er=
rors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:34 e=
rrors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0=
 B) =C2=A0TX bytes:4083 (4.0 KB)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0veth11e0835 Link encap:Ethernet =C2=A0HWaddr<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: Sco=
pe:Link<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RU=
NNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 er=
rors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:32 e=
rrors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0=
 B) =C2=A0TX bytes:3906 (3.9 KB)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0veth64e481a Link encap:Ethernet =C2=A0HWaddr<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: Sco=
pe:Link<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RU=
NNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 er=
rors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:30 e=
rrors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0=
 B) =C2=A0TX bytes:3729 (3.7 KB)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0veth6ad0ac6 Link encap:Ethernet =C2=A0HWaddr<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=
=
=A0Scope:Link<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RU=
NNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 er=
rors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:31 e=
rrors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0=
 B) =C2=A0TX bytes:3836 (3.8 KB)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0vethc5582f5 Link encap:Ethernet =C2=A0HWaddr<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=
=
=A0Scope:Link<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RU=
NNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 er=
rors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:32 e=
rrors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0=
 B) =C2=A0TX bytes:3906 (3.9 KB)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0vethc8c5721 Link encap:Ethernet =C2=A0HWaddr<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=
=
=A0Scope:Link<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RU=
NNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:110 =
errors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:166 =
errors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:634511=
 (634.5 KB) =C2=A0TX bytes:23307 (23.3 KB)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0vethe5d7629 Link encap:Ethernet =C2=A0HWaddr<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=
=
=A0Scope:Link<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RU=
NNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 er=
rors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:32 e=
rrors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0=
 B) =C2=A0TX bytes:3906 (3.9 KB)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wlp111s0 =C2=A0Link encap:Ethernet =C2=A0HWaddr<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr: =C2=
=A0Bcast:10.118.213.255 =C2=A0Mask:255.255.254.0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=
=
=A0Scope:Link<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RU=
NNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:3216=
0 errors:0 dropped:0 overruns:0 frame:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:1568=
9 errors:0 dropped:0 overruns:0 carrier:0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:1000<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:233770=
24 (23.3 MB) =C2=A0TX bytes:5250217 (5.2 MB)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A05. can I run all below modules in my single Ubuntu=
 16.04 PC?=C2=A0 (I<br>
&gt;=C2=A0 =C2=A0 =C2=A0just want to run &quot;QEMU&quot; test in Ubuntu P=
C for POC (Proof of<br>
&gt;=C2=A0 =C2=A0 =C2=A0concept) of Kerneci framework . Is it possible to =
run these in my<br>
&gt;=C2=A0 =C2=A0 =C2=A0Single PC?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* *frontend* (for kernelci frontend)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* *backend* with a second CNAME *storage* (=
for the kernelci<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backend and for the storage of build=
s logs and files)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* *lava* (for LAVA)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* *ci* (for jenkins)<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Koti<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Tue, 3 Mar 2020 at 15:46, Micha=C5=82 Ga=C5=82k=
a<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:michal.galka@collabora.com" =
target=3D"_blank">michal.galka@collabora.com</a> &lt;mailto:<a href=3D"mail=
to:michal.galka@collabora.com" target=3D"_blank">michal.galka@collabora.com=
</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Koti,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I tried to reproduce your issue, wit=
h no luck so far. I&#39;ve<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0never needed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to set the DOCKER_HOST variable on m=
y machine and everything<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0worked.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0A bit suspicious is that during the =
start you&#39;re getting HTTP<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0403 from<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the backend URL. Have you checked th=
at nothing is listening on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0port 8081<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0before you call the ./start.sh scrip=
t?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0It may also be a good idea to check =
in a browser or with curl,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0what&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the output you&#39;ll get when acces=
sing localhost:8080 and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0localhost8081.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I tried the stuff on my box with Ubu=
ntu 18.04 LTS and docker<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A019.03.6<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Micha=C5=82<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 02.03.2020 14:13, koti koti wrote=
:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; I fell some thing wrong at this=
=
=C2=A0 line in .start.shi.e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; # Get IP of Docker host from th=
e DOCKER_HOST environment<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0variable<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; IP=3D$(echo $DOCKER_HOST | cut =
-d&#39;/&#39; -f3 | cut -d&#39;:&#39; -f1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; can some one let me know how ca=
n I get the &quot;$DOCKER_HOST&quot; in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0my ubuntu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; environment?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; Koti<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; On Mon, 2 Mar 2020 at 18:37, ko=
ti koti<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:kotisoftwarete=
st@gmail.com" target=3D"_blank">kotisoftwaretest@gmail.com</a> &lt;mailto:<=
a href=3D"mailto:kotisoftwaretest@gmail.com" target=3D"_blank">kotisoftware=
test@gmail.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; &lt;mailto:<a href=3D"mailto:ko=
tisoftwaretest@gmail.com" target=3D"_blank">kotisoftwaretest@gmail.com</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:kotisof=
twaretest@gmail.com" target=3D"_blank">kotisoftwaretest@gmail.com</a>&gt;&g=
t;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Today I have=
 tried to install &quot;kernelci&quot; in my Ubuntu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machine (LTS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A016.04) using=
 this README file i.e<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; <a href=3D"https://github.com/l=
ucj/kernelci-docker/blob/master/README.md" rel=3D"noreferrer" target=3D"_bl=
ank">https://github.com/lucj/kernelci-docker/blob/master/README.md</a>.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0But, the &qu=
ot;./start .sh&quot;=C2=A0 script keep on waiting at the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0message<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&quot;echo &=
#39;-&gt; waiting for backend...&#39;&quot;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I have tried=
 to debug more by put &quot;debug messages (set<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-x) in that<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0start.sh scr=
ipt and noticed below messages keep on.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0can some one=
 help me as how can i resolve this issue?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A01. Do I need=
 to setup any network IP before start this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0command?=C2=A0 (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0I am new for=
 this dockers)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A02. Do I need=
 to set=C2=A0 any Docker HostIP=C2=A0 in environment<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0before<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0start the ./=
start script?=C2=A0 . if yes, how can I know this<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Docker<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Host IP? ( I=
 am new for this dockers)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0log:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0###<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|&quot;|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|machine@mac=
hine:~/kernelci/kernelci-docker$ sudo ./start.sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ STACK_NAME=
=
=3Dkernelci<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ getopts t:=
 option<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ export TAG=
=
=3Dlatest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ TAG=3Dlate=
st<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ docker no=
de ls<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ NODES=3D&#=
39;ID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTNAME =C2=A0STATUS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=
=A0 =C2=A0AVAILABILITY =C2=A0 =C2=A0 =C2=A0 =C2=A0MANAGER STATUS =C2=A0ENG=
INE VERSION<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A02l2zca1iuj5y=
yzujtrlv3m7xq * =C2=A0 7Y561X2 Ready<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=
=A0 Active =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Leader =C2=A018=
.09.7&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 0 =3D 1 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ echo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ cut -d/ -=
f3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ cut -d: -=
f1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ IP=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; &#39;&#39; =3D &#39;&#39; &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ IP=3D127.0=
.0.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ echo &#39;=
-&gt; deploying the application...&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0-&gt; deploy=
ing the application...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ docker sta=
ck deploy -c docker-stack.yml kernelci<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Creating net=
work kernelci_default<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Creating ser=
vice kernelci_proxy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Creating ser=
vice kernelci_frontend<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Creating ser=
vice kernelci_backend<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Creating ser=
vice kernelci_celery<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Creating ser=
vice kernelci_redis<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0Creating ser=
vice kernelci_mongo<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ echo &#39;=
-&gt; application deployed&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0-&gt; applic=
ation deployed<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ echo &#39;=
-&gt; waiting for backend...&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0-&gt; waitin=
g for backend...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -=
m 3 -o /dev/null -w &#39;%{http_code}&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://127.0.0.1:8081" re=
l=3D"noreferrer" target=3D"_blank">127.0.0.1:8081</a> &lt;<a href=3D"http:/=
/127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127.0.0.1:8081=
</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=
=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank">http://127=
.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39=
; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1&qu=
ot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|&quot;|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|My output f=
or sudo docker ps -a&quot; is&quot;|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|machine@mac=
hine:~/kernelci/kernelci-docker$ sudo docker<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ps -a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0CONTAINER ID=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE COMMAND =C2=A0CREATED<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=
=A0 =C2=A0STATUS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PORTS =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NAMES<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0422fd26822d2=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0redis:3.2 &quot;docker-entrypoint.s=E2=80=A6&qu=
ot; =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0About a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0minute ago =
=C2=A0 Up About a minute =C2=A0 6379/tcp<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0kernel=
ci_redis.1.y81ztnwmn38bbrnemxmon2ihd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A04ed73ff801aa=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0mongo:3.4 &quot;docker-entrypoint.s=E2=80=A6&qu=
ot; =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0About a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0minute ago =
=C2=A0 Up About a minute =C2=A0 27017/tcp<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0kernelci_mon=
go.1.qy065rijglhxyqpr9u84dngmu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A07b43dc0aaf35=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-celery:latest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&quot;/srv/e=
ntrypoint.sh&quot; =C2=A0 =C2=A0 About a minute ago =C2=A0 Up About a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minute<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0kernelci_cel=
ery.1.zc7ba4wchal8xqi2j236lvcx7<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A075377d2684ce=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-backend:latest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&quot;=
/srv/entrypoint.sh&quot; =C2=A0 =C2=A0 About a minute ago =C2=A0 Up About<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a minute<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A08888/tcp =C2=
=
=A0kernelci_backend.1.o9fqdun7ff5djays1zhfzvtzh<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0c163b138f787=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-frontend:latest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0&quot;/srv/e=
ntrypoint.sh&quot; =C2=A0 =C2=A0 About a minute ago =C2=A0 Up About a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0minute<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A05000/tcp =C2=
=
=A0kernelci_frontend.1.k71cutuyw805d384wzv9398ua<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A023a921a60479=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-proxy:latest<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&quot;=
/usr/bin/entrypoint=E2=80=A6&quot; =C2=A0 About a minute ago =C2=A0 Up Abou=
t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a minute<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A080/tcp =C2=
=A0kernelci_proxy.1.waurwpa2vftkpsw662aj84otu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0machine@mach=
ine:~/kernelci/kernelci-docker$<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|Regards,|<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|Koti<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt;
&gt;<br>
</blockquote></div>
</blockquote></div>

--00000000000008fd5e059ff60eb2--
