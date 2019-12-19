MIME-Version: 1.0
References: <CAJZ5v0gtMPx1perK+sz+vgaWA7f6wTrqpkf6e6tkT28EE615Ng@mail.gmail.com>
 <7hv9qd795r.fsf@baylibre.com>
In-Reply-To: <7hv9qd795r.fsf@baylibre.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 19 Dec 2019 10:06:56 +0100
Message-ID: <CAJZ5v0joDseQeuEUXd12ui19MP-v1Szh2G5hjMT1BmjYecEG3g@mail.gmail.com>
Subject: Re: Adding a branch from linux-pm.git to the list of monitored branches
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io, "Rafael J. Wysocki" <rafael@kernel.org>, info@kernelci.org

Hi Kevin,

On Wed, Dec 18, 2019 at 7:58 PM Kevin Hilman <khilman@baylibre.com> wrote:
>
> Hi Rafael,
>
> "Rafael J. Wysocki" <rafael@kernel.org> writes:
>
> > I think that it would make sense to test at least one branch from the
> > linux-pm.git tree (for success) before the commits from there go into
> > linux-next, so I'm wondering if the "testing" branch:
> >
> > git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git testing
> >
> > can be added to the list of branches monitored by kernelci?
>
> Yes.
>
> There are few options when adding a new tree.  We have a set of
> questions in the form of a github issue template.  If you don't mind
> could you select "New kernel branch" from here:
>
>    https://github.com/kernelci/kernelci-core/issues/new/choose
>
> fill out that template answering the few questions.

Well, I needed to create an account on GitHub for that. :-)

> From there, we can add your tree.

Thanks!
