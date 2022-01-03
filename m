Return-Path: <Nikolai.Kondrashov@redhat.com>
Message-ID: <5e7e52fd-8318-7ac0-b4d1-fd65acab6cb8@redhat.com>
Date: Mon, 3 Jan 2022 13:49:42 +0200
MIME-Version: 1.0
Subject: Re: #KCIDB v9 release
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Reply-To: kernelci@groups.io, Nikolai.Kondrashov@redhat.com
References: <16BCB376A7748BB3.24346@groups.io>
In-Reply-To: <16BCB376A7748BB3.24346@groups.io>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>, Dmitry Vyukov <dvyukov@google.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Alice Ferrazzi <alicef@gentoo.org>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>, kernelci@groups.io, Vishal Bhoj <vishal.bhoj@linaro.org>, automated-testing@lists.yoctoproject.org

Hi everyone,

On 12/1/21 20:01, Nikolai Kondrashov wrote:
> I'm proud to announce the release and deployment of KCIDB v9.
> 
> Please see the detailed list of changes at
> https://github.com/kernelci/kcidb/releases/tag/v9
> 
> Most important changes are listed below.
...
> * Rename the submission queue topic for production from "kernelci_new" to
>    "kcidb_new", and for playground from "playground_kernelci_new" to
>    "playground_kcidb_new". This is done to unify KCIDB namespace inside Google
>    Cloud and to help automate deployments. The old names will keep working
>    until Dec 31.
...
> * Remember to switch to the new submission topics (above) by Dec 31!

I see that there's still some data being sent to the old topics "kernelci_new" 
and "playground_kernelci_new". Please switch to using "kcidb_new" and 
"playground_kcidb_new" instead, respectively.

I will remove the old ones on Wednesday at 12:00 EET. After that, submissions 
to the old topics will be failing and no data sent there will reach KCIDB.

Nick

