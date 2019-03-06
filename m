MIME-Version: 1.0
References: <1eb2fcf9-d08b-0d38-9aee-c0206089b5d7@collabora.com>
 <20190305121412.GA7513@sirena.org.uk> <20190305220439.bzmsdtpd5gvrr3t6@xps.therub.org>
In-Reply-To: <20190305220439.bzmsdtpd5gvrr3t6@xps.therub.org>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Date: Wed, 6 Mar 2019 09:16:18 +0000
Message-ID: <CAH1_8nAYcGBO61hsbe1-8tJpcBE5=QZ6XmLY81h7jhoVu9av4g@mail.gmail.com>
Subject: Re: Hourly, daily, weekly monitoring
Content-Type: multipart/alternative; boundary="000000000000e8bcf00583697151"
List-ID: <kernelci.groups.io>
To: Dan Rue <dan.rue@linaro.org>
Cc: kernelci@groups.io, broonie@kernel.org, Linus Walleij <linus.walleij@linaro.org>

--000000000000e8bcf00583697151
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 5, 2019 at 10:04 PM Dan Rue <dan.rue@linaro.org> wrote:

> On Tue, Mar 05, 2019 at 12:14:12PM +0000, Mark Brown wrote:
> > On Mon, Mar 04, 2019 at 01:20:25PM +0000, Guillaume Tucker wrote:
> >
> > > I'm not entirely sure how much flexibility Jenkins can offer in
> > > that respect, but at least having 3 versions of the monitor job
> > > that runs every hour, every day and every week should cover all
> > > the cases.  If possible, we may be able to implement something
> > > that dynamically schedules the next check for each branch.
> >
> > One big concern I have with this is latency.  One of the common cases
> > where people don't need builds all the time is when they're mainly
> > looking for checks before they submit pull requests.  For those if you
> > might have to wait almost a day before we even queue the build it might
> > be a bit of an issue.  If it was just a "skip this tree if we built it
> > in the past X time" check that wouldn't be such an issue, it's just if
> > the daily check runs at some fixed time each day or whatever that it
> > might add huge extra latency.
> >
> > Another idea I just thought of but I'm not sure is practical would be to
> > only check some trees if the Jenkins queue is less than some number of
> > builds - that way if we're busy we won't add extra load, but it feels
> > like it's more trouble than it's worth to implement fairly.
>

These are different use-cases, some people have said that they
wanted their branches checked every morning (linusw) or every
Monday (media).  For real-time feedback, we need to do something
quite different indeed.  With the ability to whitelist some
defconfigs and arches, we could have quick builds for some
maintainers' trees to optimise the turnaround time / test
coverage ratio.

And yes, a mechanism to skip builds on arbitrary criteria would
seem to be quite hard to design with fair rules.  And at the end
of the day, if we don't have enough build power to cope with the
load, even the best rules would just be moving the problem
somewhere else.

What I think we should have is some kind of OOM system, to track
that if the queue keeps increasing from one day to the next then
some builds need to be killed, because there really isn't any
choice in that situation.  We're still running at about 75% of
our capacity and builds can be cancelled manually if anything
goes very wrong, so it's not a practical concern right now.


> I wonder what happens when something doesn't fit in a
> hourly/daily/weekly box. It could also cause a daily/weekly bottleneck
> if they're all scheduled at the same time.
>

Everything kind of fits in an hourly box, because that's a small
enough interval to start building things shortly after a new
revision was pushed.  Having longer periods is useful for people
who don't want intermediate versions to go through the test
system, or don't want to set up a branch just for KernelCI.

Perhaps each tree gets a cooling off period defined in e.g. seconds, and
> it could be defaulted to current behavior of 1 hour. If a tree is
> triggered but its cooling off period hasn't passed, the trigger is
> either ignored or deferred. This would also let us increase the
> frequency of the build trigger to something like every 5 minutes.
>

If we want that kind of speed then we should be using git hooks
to trigger builds directly rather than polling continuously.


> This way, load is evened out a bit (no spikes when 'weekly' or even
> 'hourly' runs), kernelci is more realtime (to Mark's point), and
> configuration is granular and per-tree (we can still offer standard
> cool-off periods, of course).
>

The issue here is that it would be doing the opposite of what
some people want.  For example, when a branch gets updated
several times during a day, some developers don't want the first
ones to be tested but rather let the system wait until the
evening before doing a build so they get the results the next
morning (see Linus' comment on the GPIO thread).

Also, periodic checks don't have to all be at the same time, they
could be evened out within their polling period.

The only state that has to be tracked is the time of the last build per
> tree, though I have no idea about the ease of implementation.
>

The implementation will depend on a lot of things, i.e. the build
automation tool (Jenkins or other) and the backend / storage
server where previous builds are stored.  At the moment we're
keeping a file containing the commit sha from last time a branch
was sampled, it wouldn't be hard to add date and time information
to that for example (or get the last modified date of that file).

The first thing to do imo is to have the ability to specify how
often a tree should be checked in the YAML config file.  We could
reuse cron's syntax for that, or have simple but rough values
like "daily" to let the implentation decide at what to actually
do the checks.

As mentioned before, in some cases we could be using a hook to
trigger a build directly from the git server every time a commit
is pushed (like a real CI system).  We should also have a way to
define that in the YAML config, probably by not setting any
polling interval.

Guillaume

--000000000000e8bcf00583697151
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Mar 5, 2019 at 10:04 PM Dan Rue &lt;<a href=3D"mai=
lto:dan.rue@linaro.org">dan.rue@linaro.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Tue, Mar 05, 2019 at 12:14:12P=
M +0000, Mark Brown wrote:<br>
&gt; On Mon, Mar 04, 2019 at 01:20:25PM +0000, Guillaume Tucker wrote:<br>
&gt; <br>
&gt; &gt; I&#39;m not entirely sure how much flexibility Jenkins can offer =
in<br>
&gt; &gt; that respect, but at least having 3 versions of the monitor job<b=
r>
&gt; &gt; that runs every hour, every day and every week should cover all<b=
r>
&gt; &gt; the cases.=C2=A0 If possible, we may be able to implement somethi=
ng<br>
&gt; &gt; that dynamically schedules the next check for each branch.<br>
&gt; <br>
&gt; One big concern I have with this is latency.=C2=A0 One of the common c=
ases<br>
&gt; where people don&#39;t need builds all the time is when they&#39;re ma=
inly<br>
&gt; looking for checks before they submit pull requests.=C2=A0 For those i=
f you<br>
&gt; might have to wait almost a day before we even queue the build it migh=
t<br>
&gt; be a bit of an issue.=C2=A0 If it was just a &quot;skip this tree if w=
e built it<br>
&gt; in the past X time&quot; check that wouldn&#39;t be such an issue, it&=
#39;s just if<br>
&gt; the daily check runs at some fixed time each day or whatever that it<b=
r>
&gt; might add huge extra latency.<br>
&gt; <br>
&gt; Another idea I just thought of but I&#39;m not sure is practical would=
 be to<br>
&gt; only check some trees if the Jenkins queue is less than some number of=
<br>
&gt; builds - that way if we&#39;re busy we won&#39;t add extra load, but i=
t feels<br>
&gt; like it&#39;s more trouble than it&#39;s worth to implement fairly.<br=
></blockquote><div><br></div><div><div>These are different use-cases, some =
people have said that they</div><div>wanted their branches checked every mo=
rning (linusw) or every</div><div>Monday (media).=C2=A0 For real-time feedb=
ack, we need to do something</div><div>quite different indeed.=C2=A0 With t=
he ability to whitelist some</div><div>defconfigs and arches, we could have=
 quick builds for some</div><div>maintainers&#39; trees to optimise the tur=
naround time / test</div><div>coverage ratio.</div><div><br></div><div>And =
yes, a mechanism to skip builds on arbitrary criteria would</div><div>seem =
to be quite hard to design with fair rules.=C2=A0 And at the end</div><div>=
of the day, if we don&#39;t have enough build power to cope with the</div><=
div>load, even the best rules would just be moving the problem</div><div>so=
mewhere else.</div></div><div><br></div><div><div>What I think we should ha=
ve is some kind of OOM system, to track</div><div>that if the queue keeps i=
ncreasing from one day to the next then</div><div>some builds need to be ki=
lled, because there really isn&#39;t any</div><div>choice in that situation=
.=C2=A0 We&#39;re still running at about 75% of</div><div>our capacity and =
builds can be cancelled manually if anything</div><div>goes very wrong, so =
it&#39;s not a practical concern right now.</div></div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
I wonder what happens when something doesn&#39;t fit in a<br>
hourly/daily/weekly box. It could also cause a daily/weekly bottleneck<br>
if they&#39;re all scheduled at the same time.<br></blockquote><div><br></d=
iv><div><div><div>Everything kind of fits in an hourly box, because that&#3=
9;s a small</div><div>enough interval to start building things shortly afte=
r a new</div><div>revision was pushed.=C2=A0 Having longer periods is usefu=
l for people</div><div>who don&#39;t want intermediate versions to go throu=
gh the test</div><div>system, or don&#39;t want to set up a branch just for=
 KernelCI.</div></div></div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
Perhaps each tree gets a cooling off period defined in e.g. seconds, and<br=
>
it could be defaulted to current behavior of 1 hour. If a tree is<br>
triggered but its cooling off period hasn&#39;t passed, the trigger is<br>
either ignored or deferred. This would also let us increase the<br>
frequency of the build trigger to something like every 5 minutes.<br></bloc=
kquote><div><br></div><div><div>If we want that kind of speed then we shoul=
d be using git hooks</div><div>to trigger builds directly rather than polli=
ng continuously.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
This way, load is evened out a bit (no spikes when &#39;weekly&#39; or even=
<br>
&#39;hourly&#39; runs), kernelci is more realtime (to Mark&#39;s point), an=
d<br>
configuration is granular and per-tree (we can still offer standard<br>
cool-off periods, of course).<br></blockquote><div><br></div><div><div>The =
issue here is that it would be doing the opposite of what</div><div>some pe=
ople want.=C2=A0 For example, when a branch gets updated</div><div>several =
times during a day, some developers don&#39;t want the first</div><div>ones=
 to be tested but rather let the system wait until the</div><div>evening be=
fore doing a build so they get the results the next</div><div>morning (see =
Linus&#39; comment on the GPIO thread).</div></div><div><br></div><div><div=
>Also, periodic checks don&#39;t have to all be at the same time, they</div=
><div>could be evened out within their polling period.</div></div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
The only state that has to be tracked is the time of the last build per<br>
tree, though I have no idea about the ease of implementation.<br></blockquo=
te><div><br></div><div>The implementation will depend on a lot of things, i=
.e. the build</div><div>automation tool (Jenkins or other) and the backend =
/ storage</div><div>server where previous builds are stored.=C2=A0 At the m=
oment we&#39;re</div><div>keeping a file containing the commit sha from las=
t time a branch</div><div>was sampled, it wouldn&#39;t be hard to add date =
and time information</div><div>to that for example (or get the last modifie=
d date of that file).</div><div><br></div><div><div>The first thing to do i=
mo is to have the ability to specify how</div><div>often a tree should be c=
hecked in the YAML config file.=C2=A0 We could</div><div>reuse cron&#39;s s=
yntax for that, or have simple but rough values</div><div>like &quot;daily&=
quot; to let the implentation decide at what to actually</div><div>do the c=
hecks.</div></div><div><br></div><div><div><div>As mentioned before, in som=
e cases we could be using a hook to</div><div>trigger a build directly from=
 the git server every time a commit</div><div>is pushed (like a real CI sys=
tem).=C2=A0 We should also have a way to</div><div>define that in the YAML =
config, probably by not setting any</div><div>polling interval.</div></div>=
</div><div><br></div><div>Guillaume</div></div></div></div></div></div></di=
v></div></div></div></div></div></div></div></div>

--000000000000e8bcf00583697151--
