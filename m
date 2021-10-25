Return-Path: <Nikolai.Kondrashov@redhat.com>
Subject: Re: Tuxsuite sending impossible commit names to KCIDB
References: <4fe6b129-4ce9-fcac-112c-42d9b8094999@redhat.com>
 <CAKdWgSzBC2=yXCqfFsgJSctG52=B=kk=XizcBh=XM38MjoXveg@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <255f2b92-30e9-35c7-7d6d-bce3651b98bd@redhat.com>
Date: Mon, 25 Oct 2021 19:40:04 +0300
MIME-Version: 1.0
In-Reply-To: <CAKdWgSzBC2=yXCqfFsgJSctG52=B=kk=XizcBh=XM38MjoXveg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Vishal Bhoj <vishal.bhoj@linaro.org>
Cc: kernelci@groups.io

On 10/25/21 6:37 PM, Vishal Bhoj wrote:
> On Mon, 25 Oct 2021 at 20:16, Nikolai Kondrashov 
> <Nikolai.Kondrashov@redhat.com <mailto:Nikolai.Kondrashov@redhat.com>> wrote:
>     The commit name output by "git describe" is supposed to contain the shortened
>     commit hash on the end, after "-g", and this commit name contains the
>     shortened hash of another commit, which doesn't seem to exist in the
>     referenced repository at all.
> 
>     Could you check what's going on there, and perhaps fix this?
> 
> Thanks for reporting this. I have fixed this in our backend. We have support 
> for users to apply patches on top of the kernel tree which was causing the 
> issue. I have now blocked such data from being sent to kcidb.

Thanks a lot!

You could still send that data too, if you're ready to publish those commits 
as patches linked via `patch_mboxes` (e.g. as links to commits in cgit), and 
calculate and submit a hash over them.

Nick

