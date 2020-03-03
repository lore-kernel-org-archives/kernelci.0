MIME-Version: 1.0
References: <CAFW5HqQcEZEuFTpFjN3Cf7ESuZ9v7XrWGFMw8NTR0gBfghcY3g@mail.gmail.com>
 <CAFW5HqRQMTKeApPd=mhUX7ncpW0HCO764V6ZTfj3fcOzc+cr3Q@mail.gmail.com> <167dcd1a-7dc3-6bd1-efd2-2491da3ab46c@collabora.com>
In-Reply-To: <167dcd1a-7dc3-6bd1-efd2-2491da3ab46c@collabora.com>
From: kotisoftwaretest@gmail.com
Date: Tue, 3 Mar 2020 16:36:32 +0530
Message-ID: <CAFW5HqQiM8kjLFxXScSHOO-zg1h+Ch0X4r2wqe1Qw3X-WjBNFg@mail.gmail.com>
Subject: Re: "kernelci/kernelci-docker$ sudo ./start.sh" command keep on wait at "echo '-> waiting for backend...'"
Content-Type: multipart/alternative; boundary="0000000000008b6a96059ff14cd8"
List-ID: <kernelci.groups.io>
To: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>
Cc: kernelci@groups.io

--0000000000008b6a96059ff14cd8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michal,

Thanks for your reply. Please find my responses and queries below.

1.  I have ran the start script (#sudo ./start.sh" ) by update the IP
statically as docker bridge ip (172.18.0.1 ).   Now I am seeing the
response as "000" instead of "200"  and my ./start script stuck at "echo
"-> waiting for backend...""

"
# Get IP of Docker host from the DOCKER_HOST environment variable
#IP=3D$(echo $DOCKER_HOST | cut -d'/' -f3 | cut -d':' -f1)
IP=3D"172.18.0.1"
"

log:
####
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
+ '[' 000 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
+ '[' 000 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
+ '[' 000 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081
+ '[' 000 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 172.18.0.1:8081


2. As you suggested I have check the ports (8080 and 8181) and the ports
are free before start my "./start.sh" script,
log:
###
machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n | grep  808=
0
machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n | grep  808=
1
machine@machine:~/kernelci/kernelci-docker$

3. But these port are in LISTEN mode after run the ./start.sh script.
log:
####
machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n | grep  808=
0
dockerd   4186   root   44u  IPv6  67713      0t0  TCP *:8080 (LISTEN)
machine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n | grep  808=
1
dockerd   4186   root   45u  IPv6  67722      0t0  TCP *:8081 (LISTEN)
machine@machine:~/kernelci/kernelci-docker$

4. I am able to open the below URL's in web page. but still we are seeing
the curl response as "000" instead of "200" . (Attached the screen shots)
http://172.18.0.1:8081
http://172.18.0.1:8080

5. After I run the "./start.sh", I am seeing so many networks in "ifconfig
-a" (in this en01 / loop/  wlp111s0 are  physical port/loop/wifi port
respectively) .  Do I need to assign any IP's to them to use my KerneCI
features?

"
docker0   Link encap:Ethernet  HWaddr
          inet addr:172.17.0.1  Bcast:172.17.255.255  Mask:255.255.0.0
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

docker_gwbridge Link encap:Ethernet  HWaddr
          inet addr:172.18.0.1  Bcast:172.18.255.255  Mask:255.255.0.0
          inet6 addr:  Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:110 errors:0 dropped:0 overruns:0 frame:0
          TX packets:139 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:632971 (632.9 KB)  TX bytes:20143 (20.1 KB)

eno1      Link encap:Ethernet  HWaddr
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
          Interrupt:16 Memory:b5300000-b5320000

enx8c04ba689132 Link encap:Ethernet  HWaddr
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:1361 errors:0 dropped:0 overruns:0 frame:0
          TX packets:1361 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:108755 (108.7 KB)  TX bytes:108755 (108.7 KB)

veth0b28762 Link encap:Ethernet  HWaddr
          inet6 addr:  Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:34 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:4083 (4.0 KB)

veth11e0835 Link encap:Ethernet  HWaddr
          inet6 addr: Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:32 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:3906 (3.9 KB)

veth64e481a Link encap:Ethernet  HWaddr
          inet6 addr: Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:30 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:3729 (3.7 KB)

veth6ad0ac6 Link encap:Ethernet  HWaddr
          inet6 addr:  Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:31 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:3836 (3.8 KB)

vethc5582f5 Link encap:Ethernet  HWaddr
          inet6 addr:  Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:32 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:3906 (3.9 KB)

vethc8c5721 Link encap:Ethernet  HWaddr
          inet6 addr:  Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:110 errors:0 dropped:0 overruns:0 frame:0
          TX packets:166 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:634511 (634.5 KB)  TX bytes:23307 (23.3 KB)

vethe5d7629 Link encap:Ethernet  HWaddr
          inet6 addr:  Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:32 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:3906 (3.9 KB)

wlp111s0  Link encap:Ethernet  HWaddr
          inet addr:  Bcast:10.118.213.255  Mask:255.255.254.0
          inet6 addr:  Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:32160 errors:0 dropped:0 overruns:0 frame:0
          TX packets:15689 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:23377024 (23.3 MB)  TX bytes:5250217 (5.2 MB)
"

5. can I run all below modules in my single Ubuntu 16.04 PC?  (I just want
to run "QEMU" test in Ubuntu PC for POC (Proof of concept) of Kerneci
framework . Is it possible to run these in my Single PC?

   - *frontend* (for kernelci frontend)
   - *backend* with a second CNAME *storage* (for the kernelci backend and
   for the storage of builds logs and files)
   - *lava* (for LAVA)
   - *ci* (for jenkins)


Regards,
Koti

On Tue, 3 Mar 2020 at 15:46, Micha=C5=82 Ga=C5=82ka <michal.galka@collabor=
a.com>
wrote:

> Hi Koti,
>
> I tried to reproduce your issue, with no luck so far. I've never needed
> to set the DOCKER_HOST variable on my machine and everything worked.
> A bit suspicious is that during the start you're getting HTTP 403 from
> the backend URL. Have you checked that nothing is listening on port 8081
> before you call the ./start.sh script?
> It may also be a good idea to check in a browser or with curl, what's
> the output you'll get when accessing localhost:8080 and localhost8081.
>
> I tried the stuff on my box with Ubuntu 18.04 LTS and docker 19.03.6
>
> Regards,
>
> Micha=C5=82
>
>
> On 02.03.2020 14:13, koti koti wrote:
>
> > Hi,
> >
> > I fell some thing wrong at this  line in .start.shi.e
> >
> > # Get IP of Docker host from the DOCKER_HOST environment variable
> > IP=3D$(echo $DOCKER_HOST | cut -d'/' -f3 | cut -d':' -f1)
> > can some one let me know how can I get the "$DOCKER_HOST" in my ubuntu
> > environment?
> >
> > Regards,
> > Koti
> >
> > On Mon, 2 Mar 2020 at 18:37, koti koti <kotisoftwaretest@gmail.com
> > <mailto:kotisoftwaretest@gmail.com>> wrote:
> >
> >     Hi,
> >
> >     Today I have tried to install "kernelci" in my Ubuntu machine (LTS
> >     16.04) using this README file i.e
> >     https://github.com/lucj/kernelci-docker/blob/master/README.md.
> >     But, the "./start .sh"  script keep on waiting at the message
> >     "echo '-> waiting for backend...'".
> >
> >     I have tried to debug more by put "debug messages (set -x) in that
> >     start.sh script and noticed below messages keep on.
> >
> >     can some one help me as how can i resolve this issue?
> >
> >     1. Do I need to setup any network IP before start this command?  (
> >     I am new for this dockers)
> >     2. Do I need to set  any Docker HostIP  in environment before
> >     start the ./start script?  . if yes, how can I know this Docker
> >     Host IP? ( I am new for this dockers)
> >
> >     log:
> >     ###
> >     |"|
> >     |machine@machine:~/kernelci/kernelci-docker$ sudo ./start.sh
> >     + STACK_NAME=3Dkernelci
> >     + getopts t: option
> >     + export TAG=3Dlatest
> >     + TAG=3Dlatest
> >     ++ docker node ls
> >     + NODES=3D'ID                            HOSTNAME    STATUS
> >          AVAILABILITY        MANAGER STATUS      ENGINE VERSION
> >     2l2zca1iuj5yyzujtrlv3m7xq *   7Y561X2             Ready
> >         Active              Leader  18.09.7'
> >     + '[' 0 =3D 1 ']'
> >     ++ echo
> >     ++ cut -d/ -f3
> >     ++ cut -d: -f1
> >     + IP=3D
> >     + '[' '' =3D '' ']'
> >     + IP=3D127.0.0.1
> >     + echo '-> deploying the application...'
> >     -> deploying the application...
> >     + docker stack deploy -c docker-stack.yml kernelci
> >     Creating network kernelci_default
> >     Creating service kernelci_proxy
> >     Creating service kernelci_frontend
> >     Creating service kernelci_backend
> >     Creating service kernelci_celery
> >     Creating service kernelci_redis
> >     Creating service kernelci_mongo
> >     + echo '-> application deployed'
> >     -> application deployed
> >     + echo '-> waiting for backend...'
> >     -> waiting for backend...
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1
> >     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> >     <http://127.0.0.1:8081>
> >     + '[' 403 -ne 200 ']'
> >     + sleep 1"
> >     |
> >     |
> >     |
> >     |
> >     |
> >     |"|
> >     |My output for sudo docker ps -a" is"|
> >     |
> >     |
> >     |machine@machine:~/kernelci/kernelci-docker$ sudo docker ps -a
> >     CONTAINER ID        IMAGE COMMAND                  CREATED
> >          STATUS          PORTS               NAMES
> >     422fd26822d2        redis:3.2 "docker-entrypoint.s=E2=80=A6"   Abo=
ut a
> >     minute ago   Up About a minute   6379/tcp
> >      kernelci_redis.1.y81ztnwmn38bbrnemxmon2ihd
> >     4ed73ff801aa        mongo:3.4 "docker-entrypoint.s=E2=80=A6"   Abo=
ut a
> >     minute ago   Up About a minute   27017/tcp
> >     kernelci_mongo.1.qy065rijglhxyqpr9u84dngmu
> >     7b43dc0aaf35        lucj/kernelci-celery:latest
> >     "/srv/entrypoint.sh"     About a minute ago   Up About a minute
> >     kernelci_celery.1.zc7ba4wchal8xqi2j236lvcx7
> >     75377d2684ce        lucj/kernelci-backend:latest
> >      "/srv/entrypoint.sh"     About a minute ago   Up About a minute
> >     8888/tcp  kernelci_backend.1.o9fqdun7ff5djays1zhfzvtzh
> >     c163b138f787        lucj/kernelci-frontend:latest
> >     "/srv/entrypoint.sh"     About a minute ago   Up About a minute
> >     5000/tcp  kernelci_frontend.1.k71cutuyw805d384wzv9398ua
> >     23a921a60479        lucj/kernelci-proxy:latest
> >      "/usr/bin/entrypoint=E2=80=A6"   About a minute ago   Up About a =
minute
> >     80/tcp  kernelci_proxy.1.waurwpa2vftkpsw662aj84otu
> >     machine@machine:~/kernelci/kernelci-docker$
> >     |
> >     |
> >     |
> >     |
> >     |
> >     |Regards,|
> >     |Koti
> >     |
> >
> >=20
>

--0000000000008b6a96059ff14cd8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Michal,</div><div><br></div><div>Thanks for your r=
eply. Please find my responses and queries below.<br></div><div><br></div><=
div>1.=C2=A0 I have ran the start script (#sudo ./start.sh&quot; ) by updat=
e the IP statically as docker bridge ip (172.18.0.1 ).=C2=A0=C2=A0 Now I am=
 seeing the response as &quot;000&quot; instead of &quot;200&quot;=C2=A0 an=
d my ./start script stuck at &quot;echo &quot;-&gt; waiting for backend...&=
quot;&quot;</div><div><br></div><div>&quot;</div><div># Get IP of Docker ho=
st from the DOCKER_HOST environment variable<br>#IP=3D$(echo $DOCKER_HOST |=
 cut -d&#39;/&#39; -f3 | cut -d&#39;:&#39; -f1)<br>IP=3D&quot;172.18.0.1&qu=
ot;</div><div>&quot;</div><div><br></div><div>log:</div><div>####</div><div=
>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D"http://1=
72.18.0.1:8081">172.18.0.1:8081</a><br>+ &#39;[&#39; 000 -ne 200 &#39;]&#39=
;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a=
 href=3D"http://172.18.0.1:8081">172.18.0.1:8081</a><br>+ &#39;[&#39; 000 -=
ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w &#39;%{h=
ttp_code}&#39; <a href=3D"http://172.18.0.1:8081">172.18.0.1:8081</a><br>+ =
&#39;[&#39; 000 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev=
/null -w &#39;%{http_code}&#39; <a href=3D"http://172.18.0.1:8081">172.18.0=
.1:8081</a><br>+ &#39;[&#39; 000 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ cur=
l -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D"http://172.18.0=
.1:8081">172.18.0.1:8081</a></div><div><br></div><div><br></div><div>2. As =
you suggested I have check the ports (8080 and 8181) and the ports are free=
 before start my &quot;./start.sh&quot; script,<br></div><div>log:</div><di=
v>###<br></div><div>machine@machine:~/kernelci/kernelci-docker$ sudo lsof -=
i -P -n | grep =C2=A08080<br>machine@machine:~/kernelci/kernelci-docker$ su=
do lsof -i -P -n | grep =C2=A08081<br>machine@machine:~/kernelci/kernelci-d=
ocker$<br></div><div><br></div><div>3. But these port are in LISTEN mode af=
ter run the ./start.sh script.</div><div>log:</div><div>####</div><div>mach=
ine@machine:~/kernelci/kernelci-docker$ sudo lsof -i -P -n | grep =C2=A0808=
0<br>dockerd =C2=A0 4186 =C2=A0 root =C2=A0 44u =C2=A0IPv6 =C2=A067713 =C2=
=A0 =C2=A0 =C2=A00t0 =C2=A0TCP *:8080 (LISTEN)<br>machine@machine:~/kernel=
ci/kernelci-docker$ sudo lsof -i -P -n | grep =C2=A08081<br>dockerd =C2=A0 =
4186 =C2=A0 root =C2=A0 45u =C2=A0IPv6 =C2=A067722 =C2=A0 =C2=A0 =C2=A00t0 =
=
=C2=A0TCP *:8081 (LISTEN)<br>machine@machine:~/kernelci/kernelci-docker$</=
div><div><br></div><div>4. I am able to open the below URL&#39;s in web pag=
e. but still we are seeing the curl response as &quot;000&quot; instead of =
&quot;200&quot; . (Attached the screen shots)<br></div><div><a href=3D"http=
://172.18.0.1:8081">http://172.18.0.1:8081</a></div><div><a href=3D"http://=
172.18.0.1:8080">http://172.18.0.1:8080</a></div><div><br></div><div>5. Aft=
er I run the &quot;./start.sh&quot;, I am seeing so many networks in &quot;=
ifconfig -a&quot; (in this en01 / loop/=C2=A0 wlp111s0 are=C2=A0 physical p=
ort/loop/wifi port respectively) .=C2=A0 Do I need to assign any IP&#39;s t=
o them to use my KerneCI features?</div><div><br></div><div>&quot;</div><di=
v>docker0 =C2=A0 Link encap:Ethernet =C2=A0HWaddr =C2=A0<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 inet addr:172.17.0.1 =C2=A0Bcast:172.17.255.255 =C2=
=A0Mask:255.255.0.0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MUL=
TICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
RX packets:0 errors:0 dropped:0 overruns:0 frame:0<br>=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 overruns:0 carrier:0<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0 <br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes:0 (0.0 B)<br><b=
r>docker_gwbridge Link encap:Ethernet =C2=A0HWaddr <br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 inet addr:172.18.0.1 =C2=A0Bcast:172.18.255.255 =C2=A0Mask:2=
55.255.0.0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=A0Scope:Li=
nk<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =C2=
=
=A0MTU:1500 =C2=A0Metric:1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packet=
s:110 errors:0 dropped:0 overruns:0 frame:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 TX packets:139 errors:0 dropped:0 overruns:0 carrier:0<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0 <br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 RX bytes:632971 (632.9 KB) =C2=A0TX bytes:20143 (20.1=
 KB)<br><br>eno1 =C2=A0 =C2=A0 =C2=A0Link encap:Ethernet =C2=A0HWaddr =C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST MULTICAST =C2=A0MTU=
:1500 =C2=A0Metric:1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 err=
ors:0 dropped:0 overruns:0 frame:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX=
 packets:0 errors:0 dropped:0 overruns:0 carrier:0<br>=C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 collisions:0 txqueuelen:1000 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes:0 (0.0 B)<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Interrupt:16 Memory:b5300000-b5320000 <br><br>enx8c04ba68913=
2 Link encap:Ethernet =C2=A0HWaddr =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 UP BROADCAST MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overruns:0 frame:=
0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:0 errors:0 dropped:0 ove=
rruns:0 carrier:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueu=
elen:1000 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0T=
X bytes:0 (0.0 B)<br><br>lo =C2=A0 =C2=A0 =C2=A0 =C2=A0Link encap:Local Loo=
pback =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr:127.0.0.1 =C2=
=A0Mask:255.0.0.0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: ::1/12=
8 Scope:Host<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP LOOPBACK RUNNING =C2=
=A0MTU:65536 =C2=A0Metric:1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packe=
ts:1361 errors:0 dropped:0 overruns:0 frame:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 TX packets:1361 errors:0 dropped:0 overruns:0 carrier:0<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:1000 <br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:108755 (108.7 KB) =C2=A0TX bytes:1087=
55 (108.7 KB)<br><br>veth0b28762 Link encap:Ethernet =C2=A0HWaddr <br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=A0Scope:Link<br>=C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=
=
=A0Metric:1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dr=
opped:0 overruns:0 frame:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets=
:34 errors:0 dropped:0 overruns:0 carrier:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 collisions:0 txqueuelen:0 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX=
 bytes:0 (0.0 B) =C2=A0TX bytes:4083 (4.0 KB)<br><br>veth11e0835 Link encap=
:Ethernet =C2=A0HWaddr <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: S=
cope:Link<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTIC=
AST =C2=A0MTU:1500 =C2=A0Metric:1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX =
packets:0 errors:0 dropped:0 overruns:0 frame:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 TX packets:32 errors:0 dropped:0 overruns:0 carrier:0<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0 <br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes:3906 (3.9 KB)<br><b=
r>veth64e481a Link encap:Ethernet =C2=A0HWaddr <br>=C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 inet6 addr: Scope:Link<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP=
 BROADCAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overruns:0 frame:0<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:30 errors:0 dropped:0 overru=
ns:0 carrier:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuele=
n:0 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX byte=
s:3729 (3.7 KB)<br><br>veth6ad0ac6 Link encap:Ethernet =C2=A0HWaddr =C2=A0<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=A0Scope:Link<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =C2=A0MTU:1=
500 =C2=A0Metric:1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 error=
s:0 dropped:0 overruns:0 frame:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX p=
ackets:31 errors:0 dropped:0 overruns:0 carrier:0<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 collisions:0 txqueuelen:0 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes:3836 (3.8 KB)<br><br>vethc5582f5 =
Link encap:Ethernet =C2=A0HWaddr <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ine=
t6 addr: =C2=A0Scope:Link<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAS=
T RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overruns:0 frame:0<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:32 errors:0 dropped:0 overruns:0 ca=
rrier:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueuelen:0 <br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0TX bytes:3906 =
(3.9 KB)<br><br>vethc8c5721 Link encap:Ethernet =C2=A0HWaddr =C2=A0<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet6 addr: =C2=A0Scope:Link<br>=C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADCAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=
=
=A0Metric:1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:110 errors:0 =
dropped:0 overruns:0 frame:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packe=
ts:166 errors:0 dropped:0 overruns:0 carrier:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 collisions:0 txqueuelen:0 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 RX bytes:634511 (634.5 KB) =C2=A0TX bytes:23307 (23.3 KB)<br><br>vethe=
5d7629 Link encap:Ethernet =C2=A0HWaddr =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 inet6 addr: =C2=A0Scope:Link<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 UP BROADCAST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX packets:0 errors:0 dropped:0 overruns:0 fra=
me:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:32 errors:0 dropped:0=
 overruns:0 carrier:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 tx=
queuelen:0 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:0 (0.0 B) =C2=A0=
TX bytes:3906 (3.9 KB)<br><br>wlp111s0 =C2=A0Link encap:Ethernet =C2=A0HWad=
dr =C2=A0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inet addr: =C2=A0Bcast:10.1=
18.213.255 =C2=A0Mask:255.255.254.0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
net6 addr: =C2=A0Scope:Link<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 UP BROADC=
AST RUNNING MULTICAST =C2=A0MTU:1500 =C2=A0Metric:1<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 RX packets:32160 errors:0 dropped:0 overruns:0 frame:0<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TX packets:15689 errors:0 dropped:0 ove=
rruns:0 carrier:0<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 collisions:0 txqueu=
elen:1000 <br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RX bytes:23377024 (23.3 MB=
) =C2=A0TX bytes:5250217 (5.2 MB)</div><div>&quot;<br></div><div><br></div>=
<div>5. can I run all below modules in my single Ubuntu 16.04 PC?=C2=A0 (I =
just want to run &quot;QEMU&quot; test in Ubuntu PC for POC (Proof of conce=
pt) of Kerneci framework . Is it possible to run these in my Single PC?<br>=
<ul><li>
<strong>frontend</strong> (for kernelci frontend)</li><li>
<strong>backend</strong> with a second CNAME <strong>storage</strong> (for=
 the kernelci backend and for the storage of builds logs and files)</li><li=
><strong>lava</strong> (for LAVA)</li><li>
<strong>ci</strong> (for jenkins)</li></ul></div><div><br></div><div>Regar=
ds,</div><div>Koti<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 3 Mar 2020 at 15:46, Micha=C5=82 Ga=
=C5=82ka &lt;<a href=3D"mailto:michal.galka@collabora.com">michal.galka@co=
llabora.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">Hi Koti,<br>
<br>
I tried to reproduce your issue, with no luck so far. I&#39;ve never neede=
d <br>
to set the DOCKER_HOST variable on my machine and everything worked.<br>
A bit suspicious is that during the start you&#39;re getting HTTP 403 from=
 <br>
the backend URL. Have you checked that nothing is listening on port 8081 <=
br>
before you call the ./start.sh script?<br>
It may also be a good idea to check in a browser or with curl, what&#39;s =
<br>
the output you&#39;ll get when accessing localhost:8080 and localhost8081.=
<br>
<br>
I tried the stuff on my box with Ubuntu 18.04 LTS and docker 19.03.6<br>
<br>
Regards,<br>
<br>
Micha=C5=82<br>
<br>
<br>
On 02.03.2020 14:13, koti koti wrote:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; I fell some thing wrong at this=C2=A0 line in .start.shi.e<br>
&gt;<br>
&gt; # Get IP of Docker host from the DOCKER_HOST environment variable<br>
&gt; IP=3D$(echo $DOCKER_HOST | cut -d&#39;/&#39; -f3 | cut -d&#39;:&#39; =
-f1)<br>
&gt; can some one let me know how can I get the &quot;$DOCKER_HOST&quot; i=
n my ubuntu <br>
&gt; environment?<br>
&gt;<br>
&gt; Regards,<br>
&gt; Koti<br>
&gt;<br>
&gt; On Mon, 2 Mar 2020 at 18:37, koti koti &lt;<a href=3D"mailto:kotisoft=
waretest@gmail.com" target=3D"_blank">kotisoftwaretest@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:kotisoftwaretest@gmail.com" target=3D"_b=
lank">kotisoftwaretest@gmail.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Hi,<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Today I have tried to install &quot;kernelci&quot;=
 in my Ubuntu machine (LTS<br>
&gt;=C2=A0 =C2=A0 =C2=A016.04) using this README file i.e<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/lucj/kernelci-docker=
/blob/master/README.md" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/lucj/kernelci-docker/blob/master/README.md</a>.<br>
&gt;=C2=A0 =C2=A0 =C2=A0But, the &quot;./start .sh&quot;=C2=A0 script keep=
 on waiting at the message<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;echo &#39;-&gt; waiting for backend...&#39;&=
quot;.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I have tried to debug more by put &quot;debug mess=
ages (set -x) in that<br>
&gt;=C2=A0 =C2=A0 =C2=A0start.sh script and noticed below messages keep on=
.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0can some one help me as how can i resolve this iss=
ue?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A01. Do I need to setup any network IP before start =
this command?=C2=A0 (<br>
&gt;=C2=A0 =C2=A0 =C2=A0I am new for this dockers)<br>
&gt;=C2=A0 =C2=A0 =C2=A02. Do I need to set=C2=A0 any Docker HostIP=C2=A0 =
in environment before<br>
&gt;=C2=A0 =C2=A0 =C2=A0start the ./start script?=C2=A0 . if yes, how can =
I know this Docker<br>
&gt;=C2=A0 =C2=A0 =C2=A0Host IP? ( I am new for this dockers)<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0log:<br>
&gt;=C2=A0 =C2=A0 =C2=A0###<br>
&gt;=C2=A0 =C2=A0 =C2=A0|&quot;|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|machine@machine:~/kernelci/kernelci-docker$ sudo =
./start.sh<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ STACK_NAME=3Dkernelci<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ getopts t: option<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ export TAG=3Dlatest<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ TAG=3Dlatest<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ docker node ls<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ NODES=3D&#39;ID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTNAME=
 =C2=A0 =C2=A0STATUS =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0AVAILABILITY =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0MANAGER STATUS =C2=A0 =C2=A0 =C2=A0ENGINE VERSION<br>
&gt;=C2=A0 =C2=A0 =C2=A02l2zca1iuj5yyzujtrlv3m7xq * =C2=A0 7Y561X2 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ready =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 Active =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0Leader =C2=A018.09.7&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 0 =3D 1 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ echo<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ cut -d/ -f3<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ cut -d: -f1<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ IP=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; &#39;&#39; =3D &#39;&#39; &#39;]&#39=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ IP=3D127.0.0.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ echo &#39;-&gt; deploying the application...&#39=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-&gt; deploying the application...<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ docker stack deploy -c docker-stack.yml kernelci=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0Creating network kernelci_default<br>
&gt;=C2=A0 =C2=A0 =C2=A0Creating service kernelci_proxy<br>
&gt;=C2=A0 =C2=A0 =C2=A0Creating service kernelci_frontend<br>
&gt;=C2=A0 =C2=A0 =C2=A0Creating service kernelci_backend<br>
&gt;=C2=A0 =C2=A0 =C2=A0Creating service kernelci_celery<br>
&gt;=C2=A0 =C2=A0 =C2=A0Creating service kernelci_redis<br>
&gt;=C2=A0 =C2=A0 =C2=A0Creating service kernelci_mongo<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ echo &#39;-&gt; application deployed&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-&gt; application deployed<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ echo &#39;-&gt; waiting for backend...&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-&gt; waiting for backend...<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081" rel=3D"noreferrer" target=3D"_blank"=
>127.0.0.1:8081</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://127.0.0.1:8081" rel=3D"noref=
errer" target=3D"_blank">http://127.0.0.1:8081</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ sleep 1&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|&quot;|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|My output for sudo docker ps -a&quot; is&quot;|<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|machine@machine:~/kernelci/kernelci-docker$ sudo =
docker ps -a<br>
&gt;=C2=A0 =C2=A0 =C2=A0CONTAINER ID =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE COMM=
AND =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CREATED =
=C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0STATUS =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0PORTS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NAMES<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0422fd26822d2 =C2=A0 =C2=A0 =C2=A0 =C2=A0redis:3.2 =
&quot;docker-entrypoint.s=E2=80=A6&quot; =C2=A0 About a<br>
&gt;=C2=A0 =C2=A0 =C2=A0minute ago =C2=A0 Up About a minute =C2=A0 6379/tc=
p<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0kernelci_redis.1.y81ztnwmn38bbrnemxmon2ihd<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A04ed73ff801aa =C2=A0 =C2=A0 =C2=A0 =C2=A0mongo:3.4 =
&quot;docker-entrypoint.s=E2=80=A6&quot; =C2=A0 About a<br>
&gt;=C2=A0 =C2=A0 =C2=A0minute ago =C2=A0 Up About a minute =C2=A0 27017/t=
cp<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernelci_mongo.1.qy065rijglhxyqpr9u84dngmu<br>
&gt;=C2=A0 =C2=A0 =C2=A07b43dc0aaf35 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kerne=
lci-celery:latest<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/srv/entrypoint.sh&quot; =C2=A0 =C2=A0 About=
 a minute ago =C2=A0 Up About a minute<br>
&gt;=C2=A0 =C2=A0 =C2=A0kernelci_celery.1.zc7ba4wchal8xqi2j236lvcx7<br>
&gt;=C2=A0 =C2=A0 =C2=A075377d2684ce =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kerne=
lci-backend:latest<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&quot;/srv/entrypoint.sh&quot; =C2=A0 =C2=A0=
 About a minute ago =C2=A0 Up About a minute =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A08888/tcp =C2=A0kernelci_backend.1.o9fqdun7ff5djays=
1zhfzvtzh<br>
&gt;=C2=A0 =C2=A0 =C2=A0c163b138f787 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kerne=
lci-frontend:latest<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/srv/entrypoint.sh&quot; =C2=A0 =C2=A0 About=
 a minute ago =C2=A0 Up About a minute =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A05000/tcp =C2=A0kernelci_frontend.1.k71cutuyw805d38=
4wzv9398ua<br>
&gt;=C2=A0 =C2=A0 =C2=A023a921a60479 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kerne=
lci-proxy:latest<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0&quot;/usr/bin/entrypoint=E2=80=A6&quot; =C2=
=
=A0 About a minute ago =C2=A0 Up About a minute =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A080/tcp =C2=A0kernelci_proxy.1.waurwpa2vftkpsw662aj=
84otu<br>
&gt;=C2=A0 =C2=A0 =C2=A0machine@machine:~/kernelci/kernelci-docker$<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|Regards,|<br>
&gt;=C2=A0 =C2=A0 =C2=A0|Koti<br>
&gt;=C2=A0 =C2=A0 =C2=A0|<br>
&gt;
</blockquote></div>

--0000000000008b6a96059ff14cd8--
