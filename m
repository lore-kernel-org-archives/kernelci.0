MIME-Version: 1.0
References: <5a9bf050-0671-3273-cc4f-1b131445c1fe@redhat.com>
 <CAKwvOdmwRV6R6dcpcSL06SNVQ1_JwvOJMZPYiHKvjSx4sf_95g@mail.gmail.com>
 <d4c587c2-7eca-043f-06b3-7e1cfa125b38@gmail.com> <CAKwvOdkFqFoNUczEiTKY6o2E78bHLkMjeHjtQWKm=Qdg7-v26Q@mail.gmail.com>
 <0e70beb7-49fe-efba-ef41-a35fa996bdcf@redhat.com> <CAKwvOdkoCzf2+-Z2K8e22OF9odo21RxXJu3gkGxweSePoBRaVg@mail.gmail.com>
 <c64167f2-23e7-4efa-4945-6398bf99683c@redhat.com>
In-Reply-To: <c64167f2-23e7-4efa-4945-6398bf99683c@redhat.com>
From: "Nick Desaulniers" <ndesaulniers@google.com>
Date: Thu, 10 Jun 2021 16:38:09 -0700
Message-ID: <CAKwvOdmAjWnVaNdgXm3SWTTCRcsxedtaC3KiF4agsBgiYZ1quQ@mail.gmail.com>
Subject: Re: #KCIDB engagement report
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>, kernelci@groups.io, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Antonio Terceiro <antonio.terceiro@linaro.org>, Remi Duraffort <remi.duraffort@linaro.org>

On Thu, Jun 10, 2021 at 2:15 AM Nikolai Kondrashov
<Nikolai.Kondrashov@redhat.com> wrote:
> Thanks for the feedback and the requests.
> Give me some more, if you have them :)

Awesome!!!! I really like clearly seeing the number of builds that
succeeded vs failed.  The numbers for the "Top 10 architecture build
failures" add up to the total number of build failures which is great.

We can clearly see which toolchain was used in the table.

Oh, I clicked something and can't back the nice histograms.
https://kcidb.kernelci.org/d/revision/revision?orgId=3D1&var-dataset=3Dker=
nelci04&var-id=3Dc4681547bcce777daf576925a966ffa824edd09d
vs
https://kcidb.kernelci.org/d/branch/branch?orgId=3D1&var-dataset=3Dkernelc=
i04&var-git_repository_url=3Dhttps:%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux=
%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&var-git_repository_branch=3Dmaster&v=
ar-origin=3DAll&var-build_architecture=3DAll&var-build_config_name=3DAll

The first URL was in my history, so I just went directly there; but I
can't figure out how to get back there from the existing UI elements.
I click "Home" (top left) > Branch > Repository URL >
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

(the "name" field defaults to "kunit" rather than "master"???)  Oh, is
it "Revision" rather than "Branch" that I should be using? No, that
doesn't seem to be it...hmm...

I really really like the histograms for build failures; I'm most
interested in seeing one by toolchain (we have bugs specific to just
newer vs older versions of clang all of the time); perhaps folks might
like to slice along any of the columns in the table?

The build status in the latter link with red vs green area was exactly
what I was imagining. Great work!
--=20
Thanks,
~Nick Desaulniers
