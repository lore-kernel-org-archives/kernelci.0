Date: Tue, 9 Feb 2021 15:06:01 +0000
From: "Cristian Marussi" <cristian.marussi@arm.com>
Subject: Re: #KCIDB: Adding support for log excerpts #KCIDB
Message-ID: <20210209150601.GH8355@e120937-lin>
References: <7b699a23-cf7d-be05-8d36-f8fd33af8416@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7b699a23-cf7d-be05-8d36-f8fd33af8416@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Nikolai.Kondrashov@redhat.com
Cc: Tim Bird <Tim.Bird@sony.com>, Dmitry Vyukov <dvyukov@google.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Alice Ferrazzi <alicef@gentoo.org>, =?iso-8859-1?Q?I=F1aki?= Malerba <imalerba@redhat.com>, Dan Rue <dan.rue@linaro.org>

Hi Nick,

On Tue, Feb 09, 2021 at 02:56:48PM +0200, Nikolai Kondrashov via groups.io wrote:
> Hi everyone,
> 
> To anyone involved/interested in contributing to KernelCI's KCIDB data and
> code, I'd like to announce a small, but noticeable change to the schema to let
> us develop result notifications further, and to move closer to reaching
> developers with our data.
> 
> We'd like to introduce support for optional "log_excerpt" field for "checkouts"
> ("revisions" previously) and "builds".
> 
> The field can contain an excerpt of the log of the checkout/build attempt,
> that is most relevant to the outcome. E.g. patch application failure messages,
> or particular errors which resulted in build failure.
> 
> This would help accommodate Intel's 0-Day with their log snippets, and in
> general allow providing a summary of what happened with the checkout/build,
> right in the notification message or the dashboard page.
> 
> Both fields are capped at an arbitrary 16KB, just to start with something.
> We can adjust that later based on experience.
> 
> Example:
> 
>     {
>         "version": {
>             "major": 3,
>             "minor": 0
>         },
>         "builds": [
>             {
>                 "id": "redhat:1098550",
>                 "revision_id": "d39bfd0686fd2b21f857c61bb2753db3a932cb24",
>                 "origin": "redhat",
>                 "start_time": "2021-02-09T03:54:04.513123+00:00",
>                 "architecture": "aarch64",
>                 "command": "make  -j30 INSTALL_MOD_STRIP=1 targz-pkg",
>                 "compiler": "aarch64-linux-gnu-gcc (GCC) 10.2.1 20200826 (Red Hat Cross 10.2.1-3)",
>                 "config_name": "fedora",
>                 "config_url": "https://s3.us-east-1.amazonaws.com/arr-cki-prod-datawarehouse-public/datawarehouse-public/2021/02/09/623372/build_aarch64_redhat:1098550/kernel-scsi-aarch64-d39bfd0686fd2b21f857c61bb2753db3a932cb24.config",
>                 "log_url": "https://s3.us-east-1.amazonaws.com/arr-cki-prod-datawarehouse-public/datawarehouse-public/2021/02/09/623372/build_aarch64_redhat:1098550/build.log",
>                 "log_excerpt": "00:20:49 ERROR: modpost: "irq_check_status_bit" [drivers/perf/arm_spe_pmu.ko] undefined!"
>                 "valid": false,
>             }
>         ]
>     }
> 
> The PR for the corresponding code change is up at:
> 
>     https://github.com/kernelci/kcidb-io/pull/23
> 
> Please don't hesitate to respond with any comments, objections, or
> suggestions.
> 
 Nice feature, is there any chance this could be optionally used also
 with single tests, so that you can provide a snippet (even capped smaller
 than 16kb in that case) of the failing testcase if available ?
 ( not that I have at the moment on my side the backend ready to produce
 such snippets ... so I'm not saying I'll just onto it immediately :D ..
 but it was a possibility)

 Thanks

 Cristian

> If there are no objections, I'll merge this change on Friday, Feb 12.
> 
> Nick
> 
> 
> 
> 
> 
> 
