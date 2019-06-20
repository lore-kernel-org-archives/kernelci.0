MIME-Version: 1.0
References: <1204558561.21265703.1558449611621.JavaMail.zimbra@redhat.com> <1667759567.21267950.1558450452057.JavaMail.zimbra@redhat.com>
In-Reply-To: <1667759567.21267950.1558450452057.JavaMail.zimbra@redhat.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Thu, 20 Jun 2019 16:42:11 +0100
Message-ID: <CAH1_8nAx-1+uqOwAOCfGbqdWzgWD1-oikAfoVBqw4qPcu8v4fw@mail.gmail.com>
Subject: Re: CKI hackfest @Plumbers invite
Content-Type: multipart/alternative; boundary="000000000000203215058bc331e6"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, vkabatov@redhat.com
Cc: automated-testing@yoctoproject.org, info@kernelci.org, Tim Bird <Tim.Bird@sony.com>, khilamn@baylibre.org, syzkaller@googlegroups.com, lkp@lists.01.org, stable@vger.kernel.org, Laura Abbott <labbott@redhat.com>, Eliska Slobodova <eslobodo@redhat.com>, CKI Project <cki-project@redhat.com>

--000000000000203215058bc331e6
Content-Type: text/plain; charset="UTF-8"

Hi Veronika,

On Tue, May 21, 2019 at 3:55 PM Veronika Kabatova <vkabatov@redhat.com>
wrote:

> Hi,
>
> as some of you have heard, CKI Project is planning hackfest CI meetings
> after
> Plumbers conference this year (Sept. 12-13). We would like to invite
> everyone
> who has interest in CI for kernel to come and join us.
>
> The early agenda with summary is at the end of the email. If you think
> there's
> something important missing let us know! Also let us know in case you'd
> want to
> lead any of the sessions, we'd be happy to delegate out some work :)
>
>
> Please send us an email as soon as you decide to come and feel free to
> invite
> other people who should be present. We are not planning to cap the
> attendance
> right now but need to solve the logistics based on the interest. The event
> is
> free to attend, no additional registration except letting us know is
> needed.
>

Please do count me in as well!

One topic I would like to add to the agenda is:

- Open testing philosophy
  - Connecting components from different origins: builders, test
    labs, databases, dashboards...
  - Interoperability: documented remote APIs to let components
    talk to each other
  - kernelci.org already does this with distributed builds and
    test labs, it would be good to apply the same principles to
    to other existing systems doing upstream kernel testing for
    everyone's benefit
  - Optimal utilisation of available resources
  - Enable more high-level features by joining
    forces (bisections, cross-referencing of results, bug
    tracking...)

This does have some commonality with "Common hardware pools"
and "Avoiding effort duplication" but I think it makes sense to
keep it together as a general approach.

Thanks,
Guillaume

Feel free to contact us if you have any questions,
> Veronika
> CKI Project
>
>
> -----------------------------------------------------------
> Here is an early agenda we put together:
> - Introductions
> - Common place for upstream results, result publishing in general
>   - The discussion on the mailing list is going strong so we might be able
> to
>     substitute this session for a different one in case everything is
> solved by
>     September.
> - Test result interpretation and bug detection
>   - How to autodetect infrastructure failures, regressions/new bugs and
> test
>     bugs? How to handle continuous failures due to known bugs in both
> tests and
>     kernel? What's your solution? Can people always trust the results they
>     receive?
> - Getting results to developers/maintainers
>   - Aimed at kernel developers and maintainers, share your feedback and
>     expectations.
>   - How much data should be sent in the initial communication vs. a click
> away
>     in a dashboard? Do you want incremental emails with new results as
> they come
>     in?
>   - What about adding checks to tested patches in Patchwork when patch
> series
>     are being tested?
>   - Providing enough data/script to reproduce the failure. What if special
> HW
>     is needed?
> - Onboarding new kernel trees to test
>   - Aimed at kernel developers and maintainers.
>   - Which trees are most prone to bring in new problems? Which are the most
>     critical ones? Do you want them to be tested? Which tests do you feel
> are
>     most beneficial for specific trees or in general?
> - Security when testing untrusted patches
>   - How do we merge, compile, and test patches that have untrusted code in
> them
>     and have not yet been reviewed? How do we avoid abuse of systems,
>     information theft, or other damage?
>   - Check out the original patch that sparked the discussion at
>     https://patchwork.ozlabs.org/patch/862123/
> - Avoiding effort duplication
>   - Food for thought by GregKH
>   - X different CI systems running ${TEST} on latest stable kernel on
> x86_64
>     might look useless on the first look but is it? AMD/Intel CPUs,
> different
>     network cards, different graphic drivers, compilers, kernel
> configuration...
>     How do we distribute the workload to avoid doing the same thing all
> over
>     again while still running in enough different environments to get the
> most
>     coverage?
> - Common hardware pools
>   - Is this something people are interested in? Would be helpful
> especially for
>     HW that's hard to access, eg. ppc64le or s390x systems. Companies
> could also
>     sing up to share their HW for testing to ensure kernel works with their
>     products.
>
> 
>
>

--000000000000203215058bc331e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Veronika,</div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, May 21, 2019 at 3:55 PM Veronika =
Kabatova &lt;<a href=3D"mailto:vkabatov@redhat.com">vkabatov@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<=
br>
<br>
as some of you have heard, CKI Project is planning hackfest CI meetings af=
ter<br>
Plumbers conference this year (Sept. 12-13). We would like to invite every=
one<br>
who has interest in CI for kernel to come and join us.<br>
<br>
The early agenda with summary is at the end of the email. If you think the=
re&#39;s<br>
something important missing let us know! Also let us know in case you&#39;=
d want to<br>
lead any of the sessions, we&#39;d be happy to delegate out some work :)<b=
r>
<br>
<br>
Please send us an email as soon as you decide to come and feel free to inv=
ite<br>
other people who should be present. We are not planning to cap the attenda=
nce<br>
right now but need to solve the logistics based on the interest. The event=
 is<br>
free to attend, no additional registration except letting us know is neede=
d.<br></blockquote><div>=C2=A0</div><div>Please do count me in as well!</di=
v><div><br></div><div>One topic I would like to add to the agenda is:<br><b=
r>- Open testing philosophy<br>=C2=A0 - Connecting components from differen=
t origins: builders, test<br>=C2=A0 =C2=A0 labs, databases, dashboards...<b=
r>=C2=A0 - Interoperability: documented remote APIs to let components<br>=
=C2=A0 =C2=A0 talk to each other<br>=C2=A0 - <a href=3D"http://kernelci.or=
g">kernelci.org</a> already does this with distributed builds and<br>=C2=A0=
 =C2=A0 test labs, it would be good to apply the same principles to<br>=C2=
=A0 =C2=A0 to other existing systems doing upstream kernel testing for<br>=
=
=C2=A0 =C2=A0 everyone&#39;s benefit</div><div>=C2=A0 - Optimal utilisatio=
n of available resources<br></div><div>=C2=A0 - Enable more high-level feat=
ures by joining<br>=C2=A0 =C2=A0 forces (bisections, cross-referencing of r=
esults, bug<br>=C2=A0 =C2=A0 tracking...)<br></div><div><br></div><div>This=
 does have some commonality with &quot;Common hardware pools&quot;<br>and &=
quot;Avoiding effort duplication&quot; but I think it makes sense to<br>kee=
p it together as a general approach.<br></div><div><br></div><div>Thanks,</=
div><div>Guillaume</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
Feel free to contact us if you have any questions,<br>
Veronika<br>
CKI Project<br>
<br>
<br>
-----------------------------------------------------------<br>
Here is an early agenda we put together:<br>
- Introductions<br>
- Common place for upstream results, result publishing in general<br>
=C2=A0 - The discussion on the mailing list is going strong so we might be=
 able to<br>
=C2=A0 =C2=A0 substitute this session for a different one in case everythi=
ng is solved by<br>
=C2=A0 =C2=A0 September.<br>
- Test result interpretation and bug detection<br>
=C2=A0 - How to autodetect infrastructure failures, regressions/new bugs a=
nd test<br>
=C2=A0 =C2=A0 bugs? How to handle continuous failures due to known bugs in=
 both tests and<br>
=C2=A0 =C2=A0 kernel? What&#39;s your solution? Can people always trust th=
e results they<br>
=C2=A0 =C2=A0 receive?<br>
- Getting results to developers/maintainers<br>
=C2=A0 - Aimed at kernel developers and maintainers, share your feedback a=
nd<br>
=C2=A0 =C2=A0 expectations.<br>
=C2=A0 - How much data should be sent in the initial communication vs. a c=
lick away<br>
=C2=A0 =C2=A0 in a dashboard? Do you want incremental emails with new resu=
lts as they come<br>
=C2=A0 =C2=A0 in?<br>
=C2=A0 - What about adding checks to tested patches in Patchwork when patc=
h series<br>
=C2=A0 =C2=A0 are being tested?<br>
=C2=A0 - Providing enough data/script to reproduce the failure. What if sp=
ecial HW<br>
=C2=A0 =C2=A0 is needed?<br>
- Onboarding new kernel trees to test<br>
=C2=A0 - Aimed at kernel developers and maintainers.<br>
=C2=A0 - Which trees are most prone to bring in new problems? Which are th=
e most<br>
=C2=A0 =C2=A0 critical ones? Do you want them to be tested? Which tests do=
 you feel are<br>
=C2=A0 =C2=A0 most beneficial for specific trees or in general?<br>
- Security when testing untrusted patches<br>
=C2=A0 - How do we merge, compile, and test patches that have untrusted co=
de in them<br>
=C2=A0 =C2=A0 and have not yet been reviewed? How do we avoid abuse of sys=
tems,<br>
=C2=A0 =C2=A0 information theft, or other damage?<br>
=C2=A0 - Check out the original patch that sparked the discussion at<br>
=C2=A0 =C2=A0 <a href=3D"https://patchwork.ozlabs.org/patch/862123/" rel=
=3D"noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/patch/86212=
3/</a><br>
- Avoiding effort duplication<br>
=C2=A0 - Food for thought by GregKH<br>
=C2=A0 - X different CI systems running ${TEST} on latest stable kernel on=
 x86_64<br>
=C2=A0 =C2=A0 might look useless on the first look but is it? AMD/Intel CP=
Us, different<br>
=C2=A0 =C2=A0 network cards, different graphic drivers, compilers, kernel =
configuration...<br>
=C2=A0 =C2=A0 How do we distribute the workload to avoid doing the same th=
ing all over<br>
=C2=A0 =C2=A0 again while still running in enough different environments t=
o get the most<br>
=C2=A0 =C2=A0 coverage?<br>
- Common hardware pools<br>
=C2=A0 - Is this something people are interested in? Would be helpful espe=
cially for<br>
=C2=A0 =C2=A0 HW that&#39;s hard to access, eg. ppc64le or s390x systems. =
Companies could also<br>
=C2=A0 =C2=A0 sing up to share their HW for testing to ensure kernel works=
 with their<br>
=C2=A0 =C2=A0 products.<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000203215058bc331e6--
