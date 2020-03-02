MIME-Version: 1.0
References: <CAFW5HqQcEZEuFTpFjN3Cf7ESuZ9v7XrWGFMw8NTR0gBfghcY3g@mail.gmail.com>
In-Reply-To: <CAFW5HqQcEZEuFTpFjN3Cf7ESuZ9v7XrWGFMw8NTR0gBfghcY3g@mail.gmail.com>
From: koti koti <kotisoftwaretest@gmail.com>
Date: Mon, 2 Mar 2020 18:43:05 +0530
Message-ID: <CAFW5HqRQMTKeApPd=mhUX7ncpW0HCO764V6ZTfj3fcOzc+cr3Q@mail.gmail.com>
Subject: Re: "kernelci/kernelci-docker$ sudo ./start.sh" command keep on wait at "echo '-> waiting for backend...'"
Content-Type: multipart/alternative; boundary="0000000000002a5f44059fdef341"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--0000000000002a5f44059fdef341
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I fell some thing wrong at this  line in .start.shi.e

# Get IP of Docker host from the DOCKER_HOST environment variable
IP=3D$(echo $DOCKER_HOST | cut -d'/' -f3 | cut -d':' -f1)

can some one let me know how can I get the "$DOCKER_HOST"  in my ubuntu
environment?

Regards,
Koti

On Mon, 2 Mar 2020 at 18:37, koti koti <kotisoftwaretest@gmail.com> wrote:

> Hi,
>
> Today I have tried to install "kernelci" in my Ubuntu machine (LTS 16.04)
> using this README file i.e
> https://github.com/lucj/kernelci-docker/blob/master/README.md.
> But, the "./start .sh"  script keep on waiting at the message "echo '->
> waiting for backend...'".
>
> I have tried to debug more by put "debug messages (set -x) in that
> start.sh script and noticed below messages keep on.
>
> can some one help me as how can i resolve this issue?
>
> 1. Do I need to setup any network IP before start this command?  ( I am
> new for this dockers)
> 2. Do I need to set  any Docker HostIP  in environment before start the
> ./start script?  . if yes, how can I know this Docker Host IP? ( I am new
> for this dockers)
>
> log:
> ###
> "
> machine@machine:~/kernelci/kernelci-docker$ sudo ./start.sh
> + STACK_NAME=3Dkernelci
> + getopts t: option
> + export TAG=3Dlatest
> + TAG=3Dlatest
> ++ docker node ls
> + NODES=3D'ID                            HOSTNAME            STATUS
>      AVAILABILITY        MANAGER STATUS      ENGINE VERSION
> 2l2zca1iuj5yyzujtrlv3m7xq *   7Y561X2             Ready
> Active              Leader              18.09.7'
> + '[' 0 =3D 1 ']'
> ++ echo
> ++ cut -d/ -f3
> ++ cut -d: -f1
> + IP=3D
> + '[' '' =3D '' ']'
> + IP=3D127.0.0.1
> + echo '-> deploying the application...'
> -> deploying the application...
> + docker stack deploy -c docker-stack.yml kernelci
> Creating network kernelci_default
> Creating service kernelci_proxy
> Creating service kernelci_frontend
> Creating service kernelci_backend
> Creating service kernelci_celery
> Creating service kernelci_redis
> Creating service kernelci_mongo
> + echo '-> application deployed'
> -> application deployed
> + echo '-> waiting for backend...'
> -> waiting for backend...
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1
> ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
> + '[' 403 -ne 200 ']'
> + sleep 1"
>
>
> "
> My output for sudo docker ps -a" is"
>
> machine@machine:~/kernelci/kernelci-docker$ sudo docker ps -a
> CONTAINER ID        IMAGE                           COMMAND
>    CREATED              STATUS              PORTS               NAMES
> 422fd26822d2        redis:3.2                       "docker-entrypoint.s=
=E2=80=A6"
>   About a minute ago   Up About a minute   6379/tcp
>  kernelci_redis.1.y81ztnwmn38bbrnemxmon2ihd
> 4ed73ff801aa        mongo:3.4                       "docker-entrypoint.s=
=E2=80=A6"
>   About a minute ago   Up About a minute   27017/tcp
> kernelci_mongo.1.qy065rijglhxyqpr9u84dngmu
> 7b43dc0aaf35        lucj/kernelci-celery:latest     "/srv/entrypoint.sh"
>   About a minute ago   Up About a minute
> kernelci_celery.1.zc7ba4wchal8xqi2j236lvcx7
> 75377d2684ce        lucj/kernelci-backend:latest    "/srv/entrypoint.sh"
>   About a minute ago   Up About a minute   8888/tcp
>  kernelci_backend.1.o9fqdun7ff5djays1zhfzvtzh
> c163b138f787        lucj/kernelci-frontend:latest   "/srv/entrypoint.sh"
>   About a minute ago   Up About a minute   5000/tcp
>  kernelci_frontend.1.k71cutuyw805d384wzv9398ua
> 23a921a60479        lucj/kernelci-proxy:latest      "/usr/bin/entrypoint=
=E2=80=A6"
>   About a minute ago   Up About a minute   80/tcp
>  kernelci_proxy.1.waurwpa2vftkpsw662aj84otu
> machine@machine:~/kernelci/kernelci-docker$
>
>
> Regards,
> Koti
>

--0000000000002a5f44059fdef341
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I fell some thing wrong =
at this=C2=A0 line in .start.shi.e</div><div><br></div><div># Get IP of Doc=
ker host from the DOCKER_HOST environment variable<br>IP=3D$(echo $DOCKER_H=
OST | cut -d&#39;/&#39; -f3 | cut -d&#39;:&#39; -f1)</div><div><br></div><d=
iv>can some one let me know how can I get the &quot;$DOCKER_HOST&quot;=C2=
=A0 in my ubuntu environment?</div><div><br></div><div>Regards,</div><div>K=
oti<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Mon, 2 Mar 2020 at 18:37, koti koti &lt;<a href=3D"mailto:k=
otisoftwaretest@gmail.com">kotisoftwaretest@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>=
Hi,</div><div><br></div><div>Today I have tried to install &quot;kernelci&q=
uot; in my Ubuntu machine (LTS 16.04) using this README file i.e <a href=3D=
"https://github.com/lucj/kernelci-docker/blob/master/README.md" target=3D"_=
blank">https://github.com/lucj/kernelci-docker/blob/master/README.md</a>.</=
div><div>But, the &quot;./start .sh&quot;=C2=A0 script keep on waiting at t=
he message &quot;echo &#39;-&gt; waiting for backend...&#39;&quot;.</div><d=
iv><br></div><div>I have tried to debug more by put &quot;debug messages (s=
et -x) in that start.sh script and noticed below messages keep on.</div><di=
v><br></div><div>can some one help me as how can i resolve this issue?</div=
><div><br></div><div>1. Do I need to setup any network IP before start this=
 command?=C2=A0 ( I am new for this dockers)</div><div>2. Do I need to set=
=C2=A0 any Docker HostIP=C2=A0 in environment before start the ./start scri=
pt?=C2=A0 . if yes, how can I know this Docker Host IP? ( I am new for this=
 dockers)</div><div><br></div><div>log:</div><div>###<br></div><div><code>&=
quot;</code></div><div><code>machine@machine:~/kernelci/kernelci-docker$ su=
do ./start.sh <br>+ STACK_NAME=3Dkernelci<br>+ getopts t: option<br>+ expor=
t TAG=3Dlatest<br>+ TAG=3Dlatest<br>++ docker node ls<br>+ NODES=3D&#39;ID =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0HOSTNAME =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0S=
TATUS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AVAILABILITY =C2=A0 =
=C2=A0 =C2=A0 =C2=A0MANAGER STATUS =C2=A0 =C2=A0 =C2=A0ENGINE VERSION<br>2l=
2zca1iuj5yyzujtrlv3m7xq * =C2=A0 7Y561X2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 Ready =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Active =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Leader =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A018.09.7&#39;<br>+ &#39;[&#39; 0 =3D 1 &#39;]&#39=
;<br>++ echo<br>++ cut -d/ -f3<br>++ cut -d: -f1<br>+ IP=3D<br>+ &#39;[&#39=
; &#39;&#39; =3D &#39;&#39; &#39;]&#39;<br>+ IP=3D127.0.0.1<br>+ echo &#39;=
-&gt; deploying the application...&#39;<br>-&gt; deploying the application.=
..<br>+ docker stack deploy -c docker-stack.yml kernelci<br>Creating networ=
k kernelci_default<br>Creating service kernelci_proxy<br>Creating service k=
ernelci_frontend<br>Creating service kernelci_backend<br>Creating service k=
ernelci_celery<br>Creating service kernelci_redis<br>Creating service kerne=
lci_mongo<br>+ echo &#39;-&gt; application deployed&#39;<br>-&gt; applicati=
on deployed<br>+ echo &#39;-&gt; waiting for backend...&#39;<br>-&gt; waiti=
ng for backend...<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39;=
 <a href=3D"http://127.0.0.1:8081" target=3D"_blank">127.0.0.1:8081</a><br>=
+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /d=
ev/null -w &#39;%{http_code}&#39; <a href=3D"http://127.0.0.1:8081" target=
=3D"_blank">127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>=
+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=
=3D"http://127.0.0.1:8081" target=3D"_blank">127.0.0.1:8081</a><br>+ &#39;[=
&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null =
-w &#39;%{http_code}&#39; <a href=3D"http://127.0.0.1:8081" target=3D"_blan=
k">127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1=
<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D"http:=
//127.0.0.1:8081" target=3D"_blank">127.0.0.1:8081</a><br>+ &#39;[&#39; 403=
 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w &#39;%=
{http_code}&#39; <a href=3D"http://127.0.0.1:8081" target=3D"_blank">127.0.=
0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ cu=
rl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D"http://127.0.0=
.1:8081" target=3D"_blank">127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 =
&#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_cod=
e}&#39; <a href=3D"http://127.0.0.1:8081" target=3D"_blank">127.0.0.1:8081<=
/a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m =
3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D"http://127.0.0.1:8081" =
target=3D"_blank">127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#3=
9;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <=
a href=3D"http://127.0.0.1:8081" target=3D"_blank">127.0.0.1:8081</a><br>+ =
&#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev=
/null -w &#39;%{http_code}&#39; <a href=3D"http://127.0.0.1:8081" target=3D=
"_blank">127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ s=
leep 1<br>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D=
"http://127.0.0.1:8081" target=3D"_blank">127.0.0.1:8081</a><br>+ &#39;[&#3=
9; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br>++ curl -s -m 3 -o /dev/null -w =
&#39;%{http_code}&#39; <a href=3D"http://127.0.0.1:8081" target=3D"_blank">=
127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -ne 200 &#39;]&#39;<br>+ sleep 1<br=
>++ curl -s -m 3 -o /dev/null -w &#39;%{http_code}&#39; <a href=3D"http://1=
27.0.0.1:8081" target=3D"_blank">127.0.0.1:8081</a><br>+ &#39;[&#39; 403 -n=
e 200 &#39;]&#39;<br>+ sleep 1&quot;<br></code></div><div><code><br></code>=
</div><div><code><br></code></div><div><code>&quot;</code></div><div><code>=
My output for sudo docker ps -a&quot; is&quot;</code></div><div><code><br><=
/code></div><div><code>machine@machine:~/kernelci/kernelci-docker$ sudo doc=
ker ps -a<br>CONTAINER ID =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 COMMAND =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0C=
REATED =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STATUS =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PORTS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 NAMES<br>422fd26822d2 =C2=A0 =C2=A0 =C2=A0 =C2=A0redis:3.2 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;docker-entrypoint.s=E2=80=A6&quot; =C2=A0 About a minute ago =C2=
=A0 Up About a minute =C2=A0 6379/tcp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0kernelci_redis.1.y81ztnwmn38bbrnemxmon2ihd<br>4ed73ff801aa =C2=A0 =C2=
=A0 =C2=A0 =C2=A0mongo:3.4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;docker-entrypoint.s=E2=80=A6&quot; =C2=
=A0 About a minute ago =C2=A0 Up About a minute =C2=A0 27017/tcp =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 kernelci_mongo.1.qy065rijglhxyqpr9u84dngmu<br>7b43=
dc0aaf35 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-celery:latest =C2=A0 =C2=
=A0 &quot;/srv/entrypoint.sh&quot; =C2=A0 =C2=A0 About a minute ago =C2=A0 =
Up About a minute =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 kernelci_celery.1.zc7ba4wchal8xqi2j236lvcx7<br>75377d2=
684ce =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-backend:latest =C2=A0 =C2=A0=
&quot;/srv/entrypoint.sh&quot; =C2=A0 =C2=A0 About a minute ago =C2=A0 Up A=
bout a minute =C2=A0 8888/tcp =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kern=
elci_backend.1.o9fqdun7ff5djays1zhfzvtzh<br>c163b138f787 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0lucj/kernelci-frontend:latest =C2=A0 &quot;/srv/entrypoint.sh&quo=
t; =C2=A0 =C2=A0 About a minute ago =C2=A0 Up About a minute =C2=A0 5000/tc=
p =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernelci_frontend.1.k71cutuyw805=
d384wzv9398ua<br>23a921a60479 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-prox=
y:latest =C2=A0 =C2=A0 =C2=A0&quot;/usr/bin/entrypoint=E2=80=A6&quot; =C2=
=A0 About a minute ago =C2=A0 Up About a minute =C2=A0 80/tcp =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernelci_proxy.1.waurwpa2vftkpsw662aj84o=
tu<br>machine@machine:~/kernelci/kernelci-docker$ <br></code></div><div><co=
de><br></code></div><div><code><br></code></div><div><code>Regards,</code><=
/div><div><code>Koti<br></code></div></div>
</blockquote></div>

--0000000000002a5f44059fdef341--
