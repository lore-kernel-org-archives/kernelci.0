MIME-Version: 1.0
From: koti koti <kotisoftwaretest@gmail.com>
Date: Mon, 2 Mar 2020 18:37:55 +0530
Message-ID: <CAFW5HqQcEZEuFTpFjN3Cf7ESuZ9v7XrWGFMw8NTR0gBfghcY3g@mail.gmail.com>
Subject: "kernelci/kernelci-docker$ sudo ./start.sh" command keep on wait at "echo '-> waiting for backend...'"
Content-Type: multipart/alternative; boundary="000000000000b13cc1059fdee023"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--000000000000b13cc1059fdee023
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Today I have tried to install "kernelci" in my Ubuntu machine (LTS 16.04)
using this README file i.e
https://github.com/lucj/kernelci-docker/blob/master/README.md.
But, the "./start .sh"  script keep on waiting at the message "echo '->
waiting for backend...'".

I have tried to debug more by put "debug messages (set -x) in that start.sh
script and noticed below messages keep on.

can some one help me as how can i resolve this issue?

1. Do I need to setup any network IP before start this command?  ( I am new
for this dockers)
2. Do I need to set  any Docker HostIP  in environment before start the
./start script?  . if yes, how can I know this Docker Host IP? ( I am new
for this dockers)

log:
###
"
machine@machine:~/kernelci/kernelci-docker$ sudo ./start.sh
+ STACK_NAME=3Dkernelci
+ getopts t: option
+ export TAG=3Dlatest
+ TAG=3Dlatest
++ docker node ls
+ NODES=3D'ID                            HOSTNAME            STATUS
   AVAILABILITY        MANAGER STATUS      ENGINE VERSION
2l2zca1iuj5yyzujtrlv3m7xq *   7Y561X2             Ready
Active              Leader              18.09.7'
+ '[' 0 =3D 1 ']'
++ echo
++ cut -d/ -f3
++ cut -d: -f1
+ IP=3D
+ '[' '' =3D '' ']'
+ IP=3D127.0.0.1
+ echo '-> deploying the application...'
-> deploying the application...
+ docker stack deploy -c docker-stack.yml kernelci
Creating network kernelci_default
Creating service kernelci_proxy
Creating service kernelci_frontend
Creating service kernelci_backend
Creating service kernelci_celery
Creating service kernelci_redis
Creating service kernelci_mongo
+ echo '-> application deployed'
-> application deployed
+ echo '-> waiting for backend...'
-> waiting for backend...
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1
++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
+ '[' 403 -ne 200 ']'
+ sleep 1"


"
My output for sudo docker ps -a" is"

machine@machine:~/kernelci/kernelci-docker$ sudo docker ps -a
CONTAINER ID        IMAGE                           COMMAND
 CREATED              STATUS              PORTS               NAMES
422fd26822d2        redis:3.2                       "docker-entrypoint.s=E2=
=80=A6"
  About a minute ago   Up About a minute   6379/tcp
 kernelci_redis.1.y81ztnwmn38bbrnemxmon2ihd
4ed73ff801aa        mongo:3.4                       "docker-entrypoint.s=E2=
=80=A6"
  About a minute ago   Up About a minute   27017/tcp
kernelci_mongo.1.qy065rijglhxyqpr9u84dngmu
7b43dc0aaf35        lucj/kernelci-celery:latest     "/srv/entrypoint.sh"
  About a minute ago   Up About a minute
kernelci_celery.1.zc7ba4wchal8xqi2j236lvcx7
75377d2684ce        lucj/kernelci-backend:latest    "/srv/entrypoint.sh"
  About a minute ago   Up About a minute   8888/tcp
 kernelci_backend.1.o9fqdun7ff5djays1zhfzvtzh
c163b138f787        lucj/kernelci-frontend:latest   "/srv/entrypoint.sh"
  About a minute ago   Up About a minute   5000/tcp
 kernelci_frontend.1.k71cutuyw805d384wzv9398ua
23a921a60479        lucj/kernelci-proxy:latest      "/usr/bin/entrypoint=E2=
=80=A6"
  About a minute ago   Up About a minute   80/tcp
 kernelci_proxy.1.waurwpa2vftkpsw662aj84otu
machine@machine:~/kernelci/kernelci-docker$


Regards,
Koti

--000000000000b13cc1059fdee023
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Today I have tried to in=
stall &quot;kernelci&quot; in my Ubuntu machine (LTS 16.04) using this READ=
ME file i.e <a href=3D"https://github.com/lucj/kernelci-docker/blob/master/=
README.md">https://github.com/lucj/kernelci-docker/blob/master/README.md</a=
>.</div><div>But, the &quot;./start .sh&quot;=C2=A0 script keep on waiting =
at the message &quot;echo &#39;-&gt; waiting for backend...&#39;&quot;.</di=
v><div><br></div><div>I have tried to debug more by put &quot;debug message=
s (set -x) in that start.sh script and noticed below messages keep on.</div=
><div><br></div><div>can some one help me as how can i resolve this issue?<=
/div><div><br></div><div>1. Do I need to setup any network IP before start =
this command?=C2=A0 ( I am new for this dockers)</div><div>2. Do I need to =
set=C2=A0 any Docker HostIP=C2=A0 in environment before start the ./start s=
cript?=C2=A0 . if yes, how can I know this Docker Host IP? ( I am new for t=
his dockers)</div><div><br></div><div>log:</div><div>###<br></div><div><cod=
e>&quot;</code></div><div><code>machine@machine:~/kernelci/kernelci-docker$=
 sudo ./start.sh <br>+ STACK_NAME=3Dkernelci<br>+ getopts t: option<br>+ ex=
port TAG=3Dlatest<br>+ TAG=3Dlatest<br>++ docker node ls<br>+ NODES=3D&#39;=
ID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTNAME =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0STATUS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AVAILABILITY =C2=
=A0 =C2=A0 =C2=A0 =C2=A0MANAGER STATUS =C2=A0 =C2=A0 =C2=A0ENGINE VERSION<b=
r>2l2zca1iuj5yyzujtrlv3m7xq * =C2=A0 7Y561X2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Ready =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Active=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Leader =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A018.09.7&#39;<br>+ &#39;[&#39; 0 =3D 1 &#39;]=
&#39;<br>++ echo<br>++ cut -d/ -f3<br>++ cut -d: -f1<br>+ IP=3D<br>+ &#39;[=
&#39; &#39;&#39; =3D &#39;&#39; &#39;]&#39;<br>+ IP=3D127.0.0.1<br>+ echo &=
#39;-&gt; deploying the application...&#39;<br>-&gt; deploying the applicat=
ion...<br>+ docker stack deploy -c docker-stack.yml kernelci<br>Creating ne=
twork kernelci_default<br>Creating service kernelci_proxy<br>Creating servi=
ce kernelci_frontend<br>Creating service kernelci_backend<br>Creating servi=
ce kernelci_celery<br>Creating service kernelci_redis<br>Creating service k=
ernelci_mongo<br>+ echo &#39;-&gt; application deployed&#39;<br>-&gt; appli=
cation deployed<br>+ echo &#39;-&gt; waiting for backend...&#39;<br>-&gt; w=
aiting for backend...<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081">127.0.0.1:8081</a><br>+ &#39;[&#39; =
403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w &#3=
9;%{http_code}&#39; <a href=3D"http://127.0.0.1:8081">127.0.0.1:8081</a><br=
>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /=
dev/null -w &#39;%{http_code}&#39; <a href=3D"http://127.0.0.1:8081">127.0.=
0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ cu=
rl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D"http://127.0.0=
.1:8081">127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ s=
leep 1<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D=
"http://127.0.0.1:8081">127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#3=
9;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081">127.0.0.1:8081</a><br>+ &#39;[&#39; =
403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w &#3=
9;%{http_code}&#39; <a href=3D"http://127.0.0.1:8081">127.0.0.1:8081</a><br=
>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /=
dev/null -w &#39;%{http_code}&#39; <a href=3D"http://127.0.0.1:8081">127.0.=
0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ cu=
rl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D"http://127.0.0=
.1:8081">127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ s=
leep 1<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D=
"http://127.0.0.1:8081">127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#3=
9;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&=
#39; <a href=3D"http://127.0.0.1:8081">127.0.0.1:8081</a><br>+ &#39;[&#39; =
403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w &#3=
9;%{http_code}&#39; <a href=3D"http://127.0.0.1:8081">127.0.0.1:8081</a><br=
>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /=
dev/null -w &#39;%{http_code}&#39; <a href=3D"http://127.0.0.1:8081">127.0.=
0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ cu=
rl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D"http://127.0.0=
.1:8081">127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ s=
leep 1&quot;<br></code></div><div><code><br></code></div><div><code><br></c=
ode></div><div><code>&quot;</code></div><div><code>My output for sudo docke=
r ps -a&quot; is&quot;</code></div><div><code><br></code></div><div><code>m=
achine@machine:~/kernelci/kernelci-docker$ sudo docker ps -a<br>CONTAINER I=
D =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 COMMAND =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CREATED =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STATUS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0PORTS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NAMES<b=
r>422fd26822d2 =C2=A0 =C2=A0 =C2=A0 =C2=A0redis:3.2 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;docker-entryp=
oint.s=E2=80=A6&quot; =C2=A0 About a minute ago =C2=A0 Up About a minute =
=C2=A0 6379/tcp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernelci_redis.1.y=
81ztnwmn38bbrnemxmon2ihd<br>4ed73ff801aa =C2=A0 =C2=A0 =C2=A0 =C2=A0mongo:3=
.4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;docker-entrypoint.s=E2=80=A6&quot; =C2=A0 About a minute ago =
=C2=A0 Up About a minute =C2=A0 27017/tcp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernelci_mongo.1.qy065rijglhxyqpr9u84dngmu<br>7b43dc0aaf35 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0lucj/kernelci-celery:latest =C2=A0 =C2=A0 &quot;/srv/entry=
point.sh&quot; =C2=A0 =C2=A0 About a minute ago =C2=A0 Up About a minute =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 kernelci_celery.1.zc7ba4wchal8xqi2j236lvcx7<br>75377d2684ce =C2=A0 =C2=
=A0 =C2=A0 =C2=A0lucj/kernelci-backend:latest =C2=A0 =C2=A0&quot;/srv/entry=
point.sh&quot; =C2=A0 =C2=A0 About a minute ago =C2=A0 Up About a minute =
=C2=A0 8888/tcp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernelci_backend.1=
.o9fqdun7ff5djays1zhfzvtzh<br>c163b138f787 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/=
kernelci-frontend:latest =C2=A0 &quot;/srv/entrypoint.sh&quot; =C2=A0 =C2=
=A0 About a minute ago =C2=A0 Up About a minute =C2=A0 5000/tcp =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernelci_frontend.1.k71cutuyw805d384wzv9398u=
a<br>23a921a60479 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-proxy:latest =C2=
=A0 =C2=A0 =C2=A0&quot;/usr/bin/entrypoint=E2=80=A6&quot; =C2=A0 About a mi=
nute ago =C2=A0 Up About a minute =C2=A0 80/tcp =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0kernelci_proxy.1.waurwpa2vftkpsw662aj84otu<br>machine@=
machine:~/kernelci/kernelci-docker$ <br></code></div><div><code><br></code>=
</div><div><code><br></code></div><div><code>Regards,</code></div><div><cod=
e>Koti<br></code></div></div>

--000000000000b13cc1059fdee023--
