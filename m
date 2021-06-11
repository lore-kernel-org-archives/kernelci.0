Return-Path: <Nikolai.Kondrashov@redhat.com>
Subject: Re: #KCIDB engagement report
References: <5a9bf050-0671-3273-cc4f-1b131445c1fe@redhat.com>
 <CAKwvOdmwRV6R6dcpcSL06SNVQ1_JwvOJMZPYiHKvjSx4sf_95g@mail.gmail.com>
 <d4c587c2-7eca-043f-06b3-7e1cfa125b38@gmail.com>
 <CAKwvOdkFqFoNUczEiTKY6o2E78bHLkMjeHjtQWKm=Qdg7-v26Q@mail.gmail.com>
 <0e70beb7-49fe-efba-ef41-a35fa996bdcf@redhat.com>
 <CAKwvOdkoCzf2+-Z2K8e22OF9odo21RxXJu3gkGxweSePoBRaVg@mail.gmail.com>
 <c64167f2-23e7-4efa-4945-6398bf99683c@redhat.com>
 <CAKwvOdmAjWnVaNdgXm3SWTTCRcsxedtaC3KiF4agsBgiYZ1quQ@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <de48e352-b2c3-71d1-cc05-2b62af725e70@redhat.com>
Date: Fri, 11 Jun 2021 13:50:51 +0300
MIME-Version: 1.0
In-Reply-To: <CAKwvOdmAjWnVaNdgXm3SWTTCRcsxedtaC3KiF4agsBgiYZ1quQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nikolai Kondrashov <spbnick@gmail.com>, kernelci@groups.io, "automated-testing@yoctoproject.org" <automated-testing@yoctoproject.org>, clang-built-linux <clang-built-linux@googlegroups.com>, Vishal Bhoj <vishal.bhoj@linaro.org>, Antonio Terceiro <antonio.terceiro@linaro.org>, Remi Duraffort <remi.duraffort@linaro.org>

Hi Nick,

On 6/11/21 2:38 AM, Nick Desaulniers wrote:
 > On Thu, Jun 10, 2021 at 2:15 AM Nikolai Kondrashov
 > <Nikolai.Kondrashov@redhat.com> wrote:
 >> Thanks for the feedback and the requests.
 >> Give me some more, if you have them :)
 >
 > Awesome!!!! I really like clearly seeing the number of builds that
 > succeeded vs failed.  The numbers for the "Top 10 architecture build
 > failures" add up to the total number of build failures which is great.

Eh, the sum would stop matching as soon as there are more than 10 failed 
architectures :D I can't really squeeze all of them in there, as it would 
become unreadable on at least some displays, that's worse for configurations, 
and would be much worse for compilers.

 >
 > We can clearly see which toolchain was used in the table.
 >
 > Oh, I clicked something and can't back the nice histograms.
 > 
https://kcidb.kernelci.org/d/revision/revision?orgId=1&var-dataset=kernelci04&var-id=c4681547bcce777daf576925a966ffa824edd09d
 > vs
 > 
https://kcidb.kernelci.org/d/branch/branch?orgId=1&var-dataset=kernelci04&var-git_repository_url=https:%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&var-git_repository_branch=master&var-origin=All&var-build_architecture=All&var-build_config_name=All
 >
 > The first URL was in my history, so I just went directly there; but I
 > can't figure out how to get back there from the existing UI elements.
 > I click "Home" (top left) > Branch > Repository URL >
 > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 >
 > (the "name" field defaults to "kunit" rather than "master"???)  Oh, is
 > it "Revision" rather than "Branch" that I should be using? No, that
 > doesn't seem to be it...hmm...

Those "histograms" are only added to the "Revision" dashboard. Watch the name 
of the dashboard in the top left corner. I guess I can add them to the "Repo" 
and "Branch" dashboards as well. Would the graphs make sense when they are 
across multiple revisions?

 > I really really like the histograms for build failures; I'm most
 > interested in seeing one by toolchain (we have bugs specific to just
 > newer vs older versions of clang all of the time); perhaps folks might
 > like to slice along any of the columns in the table?

Grafana doesn't seem to allow doing that dynamically, but maybe I can leave 
only one graph, and add another drop-down list on top for selecting which 
metric you want the graph for.

Meanwhile I'll just add another graph for "Top 5 compiler build failures".

 > The build status in the latter link with red vs green area was exactly
 > what I was imagining. Great work!

Cool :) Unfortunately, when the ratio is too big, the small bar can be really 
hard to see and hit with the mouse. Grafana doesn't have pie charts by 
default, that would've worked better, but I'd rather wait with adding an extra 
pie chart plugin before we upgrade to a newer version.

Nick

