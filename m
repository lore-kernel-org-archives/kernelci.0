Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Adding a branch from linux-pm.git to the list of monitored branches
In-Reply-To: <CAJZ5v0gtMPx1perK+sz+vgaWA7f6wTrqpkf6e6tkT28EE615Ng@mail.gmail.com>
References: <CAJZ5v0gtMPx1perK+sz+vgaWA7f6wTrqpkf6e6tkT28EE615Ng@mail.gmail.com>
Date: Wed, 18 Dec 2019 10:58:40 -0800
Message-ID: <7hv9qd795r.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, rafael@kernel.org, info@kernelci.org

Hi Rafael,

"Rafael J. Wysocki" <rafael@kernel.org> writes:

> I think that it would make sense to test at least one branch from the
> linux-pm.git tree (for success) before the commits from there go into
> linux-next, so I'm wondering if the "testing" branch:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git testing
>
> can be added to the list of branches monitored by kernelci?

Yes.

There are few options when adding a new tree.  We have a set of
questions in the form of a github issue template.  If you don't mind
could you select "New kernel branch" from here:

   https://github.com/kernelci/kernelci-core/issues/new/choose

fill out that template answering the few questions.  From there, we can
add your tree.

Thanks,

Kevin
