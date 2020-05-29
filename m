Subject: Re: kci_build proposal
From: "Mathieu Acher" <mathieu.acher@irisa.fr>
MIME-Version: 1.0
Date: Fri, 29 May 2020 00:42:04 -0700
References: <7ho8q77i1t.fsf@baylibre.com>
In-Reply-To: <7ho8q77i1t.fsf@baylibre.com>
Message-ID: <18306.1590738124792037023@groups.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>, kernelci@groups.io

Dear all,=20

I'm glad to hear the ongoing effort about containerization (Docker + Pytho=
n 3) of KernelCI.=20
I didn't know the existence of tuxbuild and I'm as curious as Kevin for ha=
ving more details.=20

As an academic, we have some use cases that can further motivate the use o=
f a "cloud-based solution".
In 2017, we have developed TuxML (https://github.com/TuxML/ProjetIrma) whi=
ch a solution with Docker and Python 3 for massively compiling kernel confi=
gurations.=20
The "ml" part stands for statistical learning. So far, we have collected 2=
00K+ configurations with a distributed computing infrastructure (a kind of =
cloud).=20
Our focus is to explore the configuration space of the Linux kernel in the=
 large; we fed several config files (mainly with randconfig and some pre-se=
t options) and then perform some "tests" (in a broad sense).=20

We have two major use cases:
 * bug-finding related to configurations: we are able to locate faulty (co=
mbinations of) options and even prevent/fix some failures at the Kconfig le=
vel (more details here: https://hal.inria.fr/hal-02147012)
 * size prediction of a configuration (without compiling it) and identific=
aton of options that influence size (more details here: https://hal.inria.f=
r/hal-02314830)=20

In both cases, we need an infrastructure capable of compiling *any* config=
uration of the kernel.
For measuring the size, we need to control all factors, like gcc version a=
nd so forth. Docker was helpful here to have a canonical environment.=20
One issue we found is to build the right Docker image: some configurations=
 of the kernel require specific tools and anticipating all can be tricky, l=
eading to some false-positive failures.
Have you encountered this situation?=20

In general, my colleagues at University of Rennes 1/Inria and I are really=
 interested to be part of this new effort through discussions or technical =
contributions.=20
We plan to modernize TuxML with KernelCI toolchain, especially if it's pos=
sible to deploy it on several distributed machines.=20

Can I somehow participate in the next call? Mainly to learn and as a first=
 step to contribute in this very nice project.=20

Best,=20

Mathieu Acher=20


