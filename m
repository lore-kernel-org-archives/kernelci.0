Subject: Re: "kernelci/kernelci-docker$ sudo ./start.sh" command keep on wait at "echo '-> waiting for backend...'"
References: <CAFW5HqQcEZEuFTpFjN3Cf7ESuZ9v7XrWGFMw8NTR0gBfghcY3g@mail.gmail.com>
 <CAFW5HqRQMTKeApPd=mhUX7ncpW0HCO764V6ZTfj3fcOzc+cr3Q@mail.gmail.com>
From: =?UTF-8?B?TWljaGHFgiBHYcWCa2E=?= <michal.galka@collabora.com>
Message-ID: <167dcd1a-7dc3-6bd1-efd2-2491da3ab46c@collabora.com>
Date: Tue, 3 Mar 2020 11:16:04 +0100
MIME-Version: 1.0
In-Reply-To: <CAFW5HqRQMTKeApPd=mhUX7ncpW0HCO764V6ZTfj3fcOzc+cr3Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, kotisoftwaretest@gmail.com

Hi Koti,

I tried to reproduce your issue, with no luck so far. I've never needed=20
to set the DOCKER_HOST variable on my machine and everything worked.
A bit suspicious is that during the start you're getting HTTP 403 from=20
the backend URL. Have you checked that nothing is listening on port 8081=
=20
before you call the ./start.sh script?
It may also be a good idea to check in a browser or with curl, what's=20
the output you'll get when accessing localhost:8080 and localhost8081.

I tried the stuff on my box with Ubuntu 18.04 LTS and docker 19.03.6

Regards,

Micha=C5=82


On 02.03.2020 14:13, koti koti wrote:

> Hi,
>
> I fell some thing wrong at this=C2=A0 line in .start.shi.e
>
> # Get IP of Docker host from the DOCKER_HOST environment variable
> IP=3D$(echo $DOCKER_HOST | cut -d'/' -f3 | cut -d':' -f1)
> can some one let me know how can I get the "$DOCKER_HOST" in my ubuntu=
=20
> environment?
>
> Regards,
> Koti
>
> On Mon, 2 Mar 2020 at 18:37, koti koti <kotisoftwaretest@gmail.com=20
> <mailto:kotisoftwaretest@gmail.com>> wrote:
>
>     Hi,
>
>     Today I have tried to install "kernelci" in my Ubuntu machine (LTS
>     16.04) using this README file i.e
>     https://github.com/lucj/kernelci-docker/blob/master/README.md.
>     But, the "./start .sh"=C2=A0 script keep on waiting at the message
>     "echo '-> waiting for backend...'".
>
>     I have tried to debug more by put "debug messages (set -x) in that
>     start.sh script and noticed below messages keep on.
>
>     can some one help me as how can i resolve this issue?
>
>     1. Do I need to setup any network IP before start this command?=C2=
=A0 (
>     I am new for this dockers)
>     2. Do I need to set=C2=A0 any Docker HostIP=C2=A0 in environment bef=
ore
>     start the ./start script?=C2=A0 . if yes, how can I know this Docker
>     Host IP? ( I am new for this dockers)
>
>     log:
>     ###
>     |"|
>     |machine@machine:~/kernelci/kernelci-docker$ sudo ./start.sh
>     + STACK_NAME=3Dkernelci
>     + getopts t: option
>     + export TAG=3Dlatest
>     + TAG=3Dlatest
>     ++ docker node ls
>     + NODES=3D'ID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTNAME =C2=A0 =C2=A0STATUS =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0
>     =C2=A0 =C2=A0 =C2=A0AVAILABILITY =C2=A0 =C2=A0 =C2=A0 =C2=A0MANAGER =
STATUS =C2=A0 =C2=A0 =C2=A0ENGINE VERSION
>     2l2zca1iuj5yyzujtrlv3m7xq * =C2=A0 7Y561X2 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 Ready =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
>     =C2=A0 =C2=A0 Active =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Leader =C2=A018.09.7'
>     + '[' 0 =3D 1 ']'
>     ++ echo
>     ++ cut -d/ -f3
>     ++ cut -d: -f1
>     + IP=3D
>     + '[' '' =3D '' ']'
>     + IP=3D127.0.0.1
>     + echo '-> deploying the application...'
>     -> deploying the application...
>     + docker stack deploy -c docker-stack.yml kernelci
>     Creating network kernelci_default
>     Creating service kernelci_proxy
>     Creating service kernelci_frontend
>     Creating service kernelci_backend
>     Creating service kernelci_celery
>     Creating service kernelci_redis
>     Creating service kernelci_mongo
>     + echo '-> application deployed'
>     -> application deployed
>     + echo '-> waiting for backend...'
>     -> waiting for backend...
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1
>     ++ curl -s -m 3 -o /dev/null -w '%{http_code}' 127.0.0.1:8081
>     <http://127.0.0.1:8081>
>     + '[' 403 -ne 200 ']'
>     + sleep 1"
>     |
>     |
>     |
>     |
>     |
>     |"|
>     |My output for sudo docker ps -a" is"|
>     |
>     |
>     |machine@machine:~/kernelci/kernelci-docker$ sudo docker ps -a
>     CONTAINER ID =C2=A0 =C2=A0 =C2=A0 =C2=A0IMAGE COMMAND =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CREATED =C2=A0 =C2=A0 =C2=
=A0 =C2=A0
>     =C2=A0 =C2=A0 =C2=A0STATUS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PORTS =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NAMES
>     422fd26822d2 =C2=A0 =C2=A0 =C2=A0 =C2=A0redis:3.2 "docker-entrypoint=
.s=E2=80=A6" =C2=A0 About a
>     minute ago =C2=A0 Up About a minute =C2=A0 6379/tcp
>     =C2=A0kernelci_redis.1.y81ztnwmn38bbrnemxmon2ihd
>     4ed73ff801aa =C2=A0 =C2=A0 =C2=A0 =C2=A0mongo:3.4 "docker-entrypoint=
.s=E2=80=A6" =C2=A0 About a
>     minute ago =C2=A0 Up About a minute =C2=A0 27017/tcp
>     kernelci_mongo.1.qy065rijglhxyqpr9u84dngmu
>     7b43dc0aaf35 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-celery:latest
>     "/srv/entrypoint.sh" =C2=A0 =C2=A0 About a minute ago =C2=A0 Up Abou=
t a minute
>     kernelci_celery.1.zc7ba4wchal8xqi2j236lvcx7
>     75377d2684ce =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-backend:latest
>     =C2=A0"/srv/entrypoint.sh" =C2=A0 =C2=A0 About a minute ago =C2=A0 U=
p About a minute =C2=A0
>     8888/tcp =C2=A0kernelci_backend.1.o9fqdun7ff5djays1zhfzvtzh
>     c163b138f787 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-frontend:lates=
t
>     "/srv/entrypoint.sh" =C2=A0 =C2=A0 About a minute ago =C2=A0 Up Abou=
t a minute =C2=A0
>     5000/tcp =C2=A0kernelci_frontend.1.k71cutuyw805d384wzv9398ua
>     23a921a60479 =C2=A0 =C2=A0 =C2=A0 =C2=A0lucj/kernelci-proxy:latest
>     =C2=A0"/usr/bin/entrypoint=E2=80=A6" =C2=A0 About a minute ago =C2=
=A0 Up About a minute =C2=A0
>     80/tcp =C2=A0kernelci_proxy.1.waurwpa2vftkpsw662aj84otu
>     machine@machine:~/kernelci/kernelci-docker$
>     |
>     |
>     |
>     |
>     |
>     |Regards,|
>     |Koti
>     |
>
>=20
