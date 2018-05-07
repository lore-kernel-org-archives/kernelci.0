From: "Ana Guerrero Lopez" <ana.guerrero@collabora.com>
Subject: proposal to build Debian images for every test suite (pull #24/kernelci-build-staging)
Message-ID: <99070f63-f2df-ae30-7885-a6e4ceb8c21a@collabora.com>
Date: Mon, 7 May 2018 13:06:05 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------ECAA2108F36B92F3CD446854"
Content-Language: en-US
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

--------------ECAA2108F36B92F3CD446854
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable


Hi everybody,

I'll add the information from this email in the README.md of the pull
request but it's difficult to discuss over GitHub, so I thought a mail
could make things easier.

At https://github.com/kernelci/kernelci-build-staging/pull/24I have
sent a proposal to build easily Debian images for every test suite
in arm64, armhf, x86 and x86_64.

The code has two parts, on one side, jenkins shared libraries that
are not included in the pull request:=20
https://github.com/ana/kernelci-jenkins-libs
And on the other side, what's in the pull request: three small Jenkinsfil=
es
with the parameters for every job and the files to create the debian
image with debos.


While the shared libraries could be in the same repository that the
Jenkinsfile, I have created a separate repository for several reasons:

 =C2=A0=C2=A0=C2=A0 * shared libraries must follow this directory structu=
re
https://jenkins.io/doc/book/pipeline/shared-libraries/#directory-structur=
e

 =C2=A0=C2=A0=C2=A0 * if there are more shared libraries used in kernelci=
, it's good to
 =C2=A0=C2=A0=C2=A0 have all of them in a separate repository, so they ca=
n be used
 =C2=A0=C2=A0=C2=A0 from different git repositories or even from differen=
t branches
 =C2=A0=C2=A0=C2=A0 *=C2=A0 You can add the shared library directly to th=
e jenkins server
configuration=C2=A0 and use the in the pipeline syntax checker directly
 =C2=A0=C2=A0=C2=A0 when playing/testing with the pipelines.

However, if the plan is to have all the Jenkinsfile in the same git
repository, then having an external repository for the shared libraries
is probably a bad idea.

The pull requests includes three things: three jenkinsfiles, debos files
and two Dockerfiles.

The jenkinsfiles are the smallest possible since all the code creating
the pipeline is in the shared library. There are two parts: one with the
job name - that will be used by the resulting images, the destination arc=
hes
and the run-time dependencies that need to be added to the image.
There is also the debos file name but this should be removed if we always
use the same debos configuration.
The second part "build_test_suite" is for building the test suite code.
This is on purpose a shell script that must create a cpio.gz tarball
with the name rootfs-built-${NAME}-${ARCH}.cpio.gz
The idea is to be able to add and modify quickly test suites without
knowing too much about jenkins.

The debos files are under the debos directory. I'm not going to enter int=
o
details here, as said in the pull request: debos is a wrapper using
debootstrap and qemu that makes easier to create images and to tweak them
with a set of pre-defined actions [0] following the list of actions
specified listed in a YAML file (debos/stretch.yaml).
debos is the standard tool in collabora for creating images, it's still
young and we're adding new features and fixing bugs as they appear in
our projects.

[0] https://godoc.org/github.com/go-debos/debos/actions

About the two dockerfiles: Dockerfile_debos that's a debian
base image with debos installed and Dockerfile_debian that provides
a debian container with the build dependencies to build the test suites.
As mentioned in the pull request, this second dockerfile should be update=
d
to have the container installing the required build dependencies for ever=
y
test suite.

Combining all the elements above, every jenkinsfile creates a pipeline
with 3 stages for every one of the arches where it runs:
1) debos creates a stripped down debian image installing the runtime
dependencies for running the test suite (listed in extra_packages)
2) build the test suites (shell script build_test_suite)
3) merge the results of the two previous stages and create the final imag=
e.

In the case of Jenkinsfile_basic, given that build_test_suite is empty,
it only runs the stage 1. There is a missing stage 4 that would be=20
uploading
the final images to kerneci.org

I hope this helps to understand my pull request, especially for those
less familiar with jenkins pipelines.

Finally, a few comment for people who are more familiar with jenkins
pipelines. As you might know, there is a lot of ways to create jenkins
pipelines and my proposal isn't the most common used way for what
I have seen although it's based in an example from jenkinsci at:
https://github.com/jenkinsci/pipeline-examples/tree/master/global-library=
-examples/global-function

I chose this approach because I found it's the easiest for people for
adding new images for test suites without having to know a lot of about
jenkins.
In case, you're curious, I worked first in an approach using declarative
pipelines with small functions for every step. For example, the jenkinsfi=
le
for building the igt test suite:
https://gitlab.collabora.com/ana/kernelci-build-staging/blob/3557b105b048=
83800c6d6320a53f44e366ec43bd/Jenkinsfile
The shared functions are at=20
https://gitlab.collabora.com/ana/kernelci-jenkins-libs

Cheers,
Ana






--------------ECAA2108F36B92F3CD446854
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    <div id=3D"magicdomid286" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid287" class=3D"ace-line"><span class=3D"">Hi
        everybody,</span></div>
    <div id=3D"magicdomid288" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid289" class=3D"ace-line"><span class=3D"">I'll ad=
d the
        information from this email in the README.md of the pull=C2=A0</s=
pan></div>
    <div id=3D"magicdomid290" class=3D"ace-line"><span class=3D"">request=
 but
        it's difficult to discuss over GitHub, so I thought a mail=C2=A0<=
/span></div>
    <div id=3D"magicdomid401" class=3D"ace-line"><span class=3D"">could m=
ake
        things easier</span><span
        class=3D"author-a-z68zz68zz89zpz70zz72za26z86zbz84zz79zz81z8v">.<=
/span></div>
    <div id=3D"magicdomid292" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid293" class=3D"ace-line"><span class=3D"">At </sp=
an><span
        class=3D" url"><a
          href=3D"https://github.com/kernelci/kernelci-build-staging/pull=
/24">https://github.com/kernelci/kernelci-build-staging/pull/24</a></span=
><span
        class=3D""> I have</span></div>
    <div id=3D"magicdomid294" class=3D"ace-line"><span class=3D"">sent a
        proposal to build easily Debian images for every test suite</span=
></div>
    <div id=3D"magicdomid295" class=3D"ace-line"><span class=3D"">in arm6=
4,
        armhf, x86 and x86_64.</span></div>
    <div id=3D"magicdomid296" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid297" class=3D"ace-line"><span class=3D"">The cod=
e has
        two parts, on one side, jenkins shared libraries that</span></div=
>
    <div id=3D"magicdomid298" class=3D"ace-line"><span class=3D"">are not
        included in the pull request: </span><span class=3D" url"><a
          href=3D"https://github.com/ana/kernelci-jenkins-libs">https://g=
ithub.com/ana/kernelci-jenkins-libs</a></span></div>
    <div id=3D"magicdomid299" class=3D"ace-line"><span class=3D"">And on =
the
        other side, what's in the pull request: three small Jenkinsfiles<=
/span></div>
    <div id=3D"magicdomid300" class=3D"ace-line"><span class=3D"">with th=
e
        parameters for every job and the files to create the debian=C2=A0=
</span></div>
    <div id=3D"magicdomid301" class=3D"ace-line"><span class=3D"">image w=
ith
        debos.</span></div>
    <div id=3D"magicdomid302" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid303" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid304" class=3D"ace-line"><span class=3D"">While t=
he
        shared libraries could be in the same repository that the=C2=A0</=
span></div>
    <div id=3D"magicdomid305" class=3D"ace-line"><span class=3D"">Jenkins=
file,
        I have created a separate repository for several reasons:</span><=
/div>
    <div id=3D"magicdomid306" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid307" class=3D"ace-line"><span class=3D"">=C2=A0=C2=
=A0=C2=A0 *=C2=A0
        shared libraries must follow this directory structure=C2=A0</span=
></div>
    <div id=3D"magicdomid308" class=3D"ace-line"><span class=3D"">=C2=A0=C2=
=A0=C2=A0 </span><span
        class=3D" url"><a
href=3D"https://jenkins.io/doc/book/pipeline/shared-libraries/#directory-=
structure">https://jenkins.io/doc/book/pipeline/shared-libraries/#directo=
ry-structure</a></span></div>
    <div id=3D"magicdomid309" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid310" class=3D"ace-line"><span class=3D"">=C2=A0=C2=
=A0=C2=A0 * if
        there are more shared libraries used in kernelci, it's good to=C2=
=A0</span></div>
    <div id=3D"magicdomid311" class=3D"ace-line"><span class=3D"">=C2=A0=C2=
=A0=C2=A0 have all
        of them in a separate repository, so they can be used=C2=A0</span=
></div>
    <div id=3D"magicdomid312" class=3D"ace-line"><span class=3D"">=C2=A0=C2=
=A0=C2=A0 from
        different git repositories or even from different branches=C2=A0<=
/span></div>
    <div id=3D"magicdomid313" class=3D"ace-line"><span class=3D"">=C2=A0=C2=
=A0=C2=A0=C2=A0</span></div>
    <div id=3D"magicdomid314" class=3D"ace-line"><span class=3D"">=C2=A0=C2=
=A0=C2=A0 *=C2=A0 You
        can add the shared library directly to the jenkins server=C2=A0</=
span></div>
    <div id=3D"magicdomid315" class=3D"ace-line"><span class=3D"">=C2=A0=C2=
=A0=C2=A0
        configuration=C2=A0 and use the in the pipeline syntax checker
        directly=C2=A0</span></div>
    <div id=3D"magicdomid316" class=3D"ace-line"><span class=3D"">=C2=A0=C2=
=A0=C2=A0 when
        playing/testing with the pipelines.</span></div>
    <div id=3D"magicdomid317" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid318" class=3D"ace-line"><span class=3D"">However=
, if
        the plan is to have all the Jenkinsfile in the same git=C2=A0</sp=
an></div>
    <div id=3D"magicdomid319" class=3D"ace-line"><span class=3D"">reposit=
ory,
        then having an external repository for the shared libraries=C2=A0=
</span></div>
    <div id=3D"magicdomid320" class=3D"ace-line"><span class=3D"">is prob=
ably
        a bad idea.</span></div>
    <div id=3D"magicdomid321" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid322" class=3D"ace-line"><span class=3D"">The pul=
l
        requests includes three things: three jenkinsfiles, debos files</=
span></div>
    <div id=3D"magicdomid323" class=3D"ace-line"><span class=3D"">and two
        Dockerfiles.</span></div>
    <div id=3D"magicdomid324" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid325" class=3D"ace-line"><span class=3D"">The
        jenkinsfiles are the smallest possible since all the code
        creating</span></div>
    <div id=3D"magicdomid326" class=3D"ace-line"><span class=3D"">the pip=
eline
        is in the shared library. There are two parts: one with the</span=
></div>
    <div id=3D"magicdomid327" class=3D"ace-line"><span class=3D"">job nam=
e -
        that will be used by the resulting images, the destination
        arches</span></div>
    <div id=3D"magicdomid328" class=3D"ace-line"><span class=3D"">and the
        run-time dependencies that need to be added to the image.</span><=
/div>
    <div id=3D"magicdomid329" class=3D"ace-line"><span class=3D"">There i=
s
        also the debos file name but this should be removed if we always<=
/span></div>
    <div id=3D"magicdomid330" class=3D"ace-line"><span class=3D"">use the=
 same
        debos configuration.</span></div>
    <div id=3D"magicdomid331" class=3D"ace-line"><span class=3D"">The sec=
ond
        part "build_test_suite" is for building the test suite code.=C2=A0=
</span></div>
    <div id=3D"magicdomid332" class=3D"ace-line"><span class=3D"">This is=
 on
        purpose a shell script that must create a cpio.gz tarball</span><=
/div>
    <div id=3D"magicdomid333" class=3D"ace-line"><span class=3D"">with th=
e
        name rootfs-built-${NAME}-${ARCH}.cpio.gz=C2=A0</span></div>
    <div id=3D"magicdomid334" class=3D"ace-line"><span class=3D"">The ide=
a is
        to be able to add and modify quickly test suites without=C2=A0</s=
pan></div>
    <div id=3D"magicdomid335" class=3D"ace-line"><span class=3D"">knowing=
 too
        much about jenkins.</span></div>
    <div id=3D"magicdomid336" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid337" class=3D"ace-line"><span class=3D"">The deb=
os
        files are under the debos directory. I'm not going to enter into<=
/span></div>
    <div id=3D"magicdomid338" class=3D"ace-line"><span class=3D"">details
        here, as said in the pull request: debos is a wrapper using=C2=A0=
</span></div>
    <div id=3D"magicdomid339" class=3D"ace-line"><span class=3D"">deboots=
trap
        and qemu that makes easier to create images and to tweak them=C2=A0=
</span></div>
    <div id=3D"magicdomid340" class=3D"ace-line"><span class=3D"">with a =
set
        of pre-defined actions [0] following the list of actions=C2=A0</s=
pan></div>
    <div id=3D"magicdomid341" class=3D"ace-line"><span class=3D"">specifi=
ed
        listed in a YAML file (debos/stretch.yaml).</span></div>
    <div id=3D"magicdomid342" class=3D"ace-line"><span class=3D"">debos i=
s the
        standard tool in collabora for creating images, it's still</span>=
</div>
    <div id=3D"magicdomid343" class=3D"ace-line"><span class=3D"">young a=
nd
        we're adding new features and fixing bugs as they appear in</span=
></div>
    <div id=3D"magicdomid344" class=3D"ace-line"><span class=3D"">our
        projects.</span></div>
    <div id=3D"magicdomid345" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid346" class=3D"ace-line"><span class=3D"">[0] </s=
pan><span
        class=3D" url"><a
          href=3D"https://godoc.org/github.com/go-debos/debos/actions">ht=
tps://godoc.org/github.com/go-debos/debos/actions</a></span></div>
    <div id=3D"magicdomid347" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid348" class=3D"ace-line"><span class=3D"">About t=
he
        two dockerfiles: Dockerfile_debos that's a debian</span></div>
    <div id=3D"magicdomid349" class=3D"ace-line"><span class=3D"">base im=
age
        with debos installed and Dockerfile_debian that provides</span></=
div>
    <div id=3D"magicdomid350" class=3D"ace-line"><span class=3D"">a debia=
n
        container with the build dependencies to build the test suites.</=
span></div>
    <div id=3D"magicdomid351" class=3D"ace-line"><span class=3D"">As ment=
ioned
        in the pull request, this second dockerfile should be updated=C2=A0=
</span></div>
    <div id=3D"magicdomid352" class=3D"ace-line"><span class=3D"">to have=
 the
        container installing the required build dependencies for every</s=
pan></div>
    <div id=3D"magicdomid523" class=3D"ace-line"><span class=3D"">test su=
ite.</span></div>
    <div id=3D"magicdomid355" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid356" class=3D"ace-line"><span class=3D"">Combini=
ng
        all the elements above, every jenkinsfile creates a pipeline</spa=
n></div>
    <div id=3D"magicdomid357" class=3D"ace-line"><span class=3D"">with 3
        stages for every one of the arches where it runs:</span></div>
    <div id=3D"magicdomid358" class=3D"ace-line"><span class=3D"">1) debo=
s
        creates a stripped down debian image installing the runtime=C2=A0=
</span></div>
    <div id=3D"magicdomid359" class=3D"ace-line"><span class=3D"">depende=
ncies
        for running the test suite (listed in extra_packages)</span></div=
>
    <div id=3D"magicdomid360" class=3D"ace-line"><span class=3D"">2) buil=
d the
        test suites (shell script build_test_suite)</span></div>
    <div id=3D"magicdomid361" class=3D"ace-line"><span class=3D"">3) merg=
e the
        results of the two previous stages and create the final image.</s=
pan></div>
    <div id=3D"magicdomid362" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid363" class=3D"ace-line"><span class=3D"">In the =
case
        of Jenkinsfile_basic, given that build_test_suite is empty,</span=
></div>
    <div id=3D"magicdomid364" class=3D"ace-line"><span class=3D"">it only=
 runs
        the stage 1. There is a missing stage 4 that would be uploading=C2=
=A0</span></div>
    <div id=3D"magicdomid365" class=3D"ace-line"><span class=3D"">the fin=
al
        images to kerneci.org</span></div>
    <div id=3D"magicdomid366" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid367" class=3D"ace-line"><span class=3D"">I hope =
this
        helps to understand my pull request, especially for those</span><=
/div>
    <div id=3D"magicdomid368" class=3D"ace-line"><span class=3D"">less
        familiar with jenkins pipelines.</span></div>
    <div id=3D"magicdomid369" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid370" class=3D"ace-line"><span class=3D"">Finally=
, a
        few comment for people who are more familiar with jenkins</span><=
/div>
    <div id=3D"magicdomid371" class=3D"ace-line"><span class=3D"">pipelin=
es.
        As you might know, there is a lot of ways to create jenkins=C2=A0=
</span></div>
    <div id=3D"magicdomid372" class=3D"ace-line"><span class=3D"">pipelin=
es
        and my proposal isn't the most common used way for what=C2=A0</sp=
an></div>
    <div id=3D"magicdomid373" class=3D"ace-line"><span class=3D"">I have =
seen
        although it's based in an example from jenkinsci at:</span></div>
    <div id=3D"magicdomid374" class=3D"ace-line"><span class=3D" url"><a
href=3D"https://github.com/jenkinsci/pipeline-examples/tree/master/global=
-library-examples/global-function">https://github.com/jenkinsci/pipeline-=
examples/tree/master/global-library-examples/global-function</a></span></=
div>
    <div id=3D"magicdomid375" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid376" class=3D"ace-line"><span class=3D"">I chose=
 this
        approach because I found it's the easiest for people for</span></=
div>
    <div id=3D"magicdomid377" class=3D"ace-line"><span class=3D"">adding =
new
        images for test suites without having to know a lot of about</spa=
n></div>
    <div id=3D"magicdomid378" class=3D"ace-line"><span class=3D"">jenkins=
.</span></div>
    <div id=3D"magicdomid379" class=3D"ace-line"><span class=3D"">In case=
,
        you're curious, I worked first in an approach using declarative</=
span></div>
    <div id=3D"magicdomid380" class=3D"ace-line"><span class=3D"">pipelin=
es
        with small functions for every step. For example, the
        jenkinsfile</span></div>
    <div id=3D"magicdomid381" class=3D"ace-line"><span class=3D"">for bui=
lding
        the igt test suite:</span></div>
    <div id=3D"magicdomid382" class=3D"ace-line"><span class=3D" url"><a
href=3D"https://gitlab.collabora.com/ana/kernelci-build-staging/blob/3557=
b105b04883800c6d6320a53f44e366ec43bd/Jenkinsfile">https://gitlab.collabor=
a.com/ana/kernelci-build-staging/blob/3557b105b04883800c6d6320a53f44e366e=
c43bd/Jenkinsfile</a></span></div>
    <div id=3D"magicdomid383" class=3D"ace-line"><span class=3D"">The sha=
red
        functions are at </span><span class=3D" url"><a
          href=3D"https://gitlab.collabora.com/ana/kernelci-jenkins-libs"=
>https://gitlab.collabora.com/ana/kernelci-jenkins-libs</a></span></div>
    <div id=3D"magicdomid384" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid385" class=3D"ace-line"><span class=3D"">Cheers,=
</span></div>
    <div id=3D"magicdomid386" class=3D"ace-line"><span class=3D"">Ana</sp=
an></div>
    <div id=3D"magicdomid388" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid389" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid390" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid391" class=3D"ace-line"><br>
    </div>
    <div id=3D"magicdomid113" class=3D"ace-line"><br>
    </div>
  </body>
</html>

--------------ECAA2108F36B92F3CD446854--

