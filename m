Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: Email reports from staging and automated staging tests
In-Reply-To: <9ac7fc41-379d-24d0-b316-61fbb0f381ef@collabora.com>
References: <5c9a7406.1c69fb81.4db25.ff2d@mx.google.com> <9ac7fc41-379d-24d0-b316-61fbb0f381ef@collabora.com>
Date: Fri, 29 Mar 2019 10:23:56 -0700
Message-ID: <7hr2apwq4z.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, guillaume.tucker@gmail.com, kernelci@groups.io

"Guillaume Tucker" <guillaume.tucker@gmail.com> writes:

> Hello,
>
> I've revived the main jobs on staging.kernelci.org to build and
> test the kernelci-core/staging.kernelci.org branch with the
> intent to automatically update it every day with all the open
> PRs.  It has a series of extra patches to make it appropriate on
> staging, with a separate tree and bisection reports disabled to
> avoid spamming people.  The history can be found here:
>
>   https://github.com/kernelci/kernelci-core/commits/staging.kernelci.org
>
> I've initially put only mgalka and myself on the list of
> recipients for these jobs, but I think it would make sense to
> have all the contributors whose code gets tested on staging.  So
> please let me know if you wish to be added or not added to the
> list.

Yes please.

> I've started a tool to gather all the PRs for a particular Github
> project into a "staging" branch with an extra series of patches
> to apply on top of it:
>
>   https://gitlab.collabora.com/gtucker/kernelci-staging-tools
>
> I'll add a README and if this looks fine then it should be moved
> to Github.  Also we should probably have a Linux kernel tree for
> KernelCI to have a branch to test on staging,

Agreed.

> as at the moment it's using my own tree.
>
> The next bit that needs to be automated is to push the staging
> branches to the Github repos.  For this I think we'll need to
> create a Github user with some dedicated SSH keys.  The script
> can be used for any project (kernelci-core, kernelci-backend,
> kernelci-frontend...).  We would also need an extra user to
> deploy the backend and frontend branches over SSH on the staging
> server.  After that, it could add a change to a test kernel
> branch and trigger a kernel-tree-monitor job to get the whole
> thing running.  That could be run as a daily Jenkins job.

CI for kernelCI.  Nice!

Kevin
