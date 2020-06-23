Subject: Re: kci_build proposal
From: "Mathieu Acher" <mathieu.acher@irisa.fr>
MIME-Version: 1.0
Date: Tue, 23 Jun 2020 00:28:04 -0700
References: <CAKwvOdnaoaZPLqcn6yiFEpEVx=HmpRe1ExhLZfzLhHs7e7Atww@mail.gmail.com>
In-Reply-To: <CAKwvOdnaoaZPLqcn6yiFEpEVx=HmpRe1ExhLZfzLhHs7e7Atww@mail.gmail.com>
Message-ID: <31688.1592897284383266895@groups.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>, kernelci@groups.io

Hi Nick,=20

Thanks for your interest.=20
We didn't target and gather data about Clang, but it was only a technical =
limitation at that time.=20
Right now, it seems possible to build kernel configurations with Clang (th=
anks to kernelci tool chain) and we are very interested to invest some reso=
urces/time here.=20

Indeed, we could differentiate GCC and Clang build and see what's going on=
.=20
We can also pinpoint combinations of options that lead to failures: it can=
 be useful to indicate the root cause of the issues and investigate whether=
 it's specific to Clang.=20

I'm available to have a chat

