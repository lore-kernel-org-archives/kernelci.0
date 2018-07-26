Subject: Re: lab-ti failures
References: <CAOi56cUF=KmAgM9eRyHZ9+Cbd7urq6EoYEzGuqk3edD8k8A3Dg@mail.gmail.com>
From: Carlos Hernandez <ceh@ti.com>
Message-ID: <4d90bc77-838b-5afc-9956-a9039f4a492e@ti.com>
Date: Thu, 26 Jul 2018 18:13:42 -0400
MIME-Version: 1.0
In-Reply-To: <CAOi56cUF=KmAgM9eRyHZ9+Cbd7urq6EoYEzGuqk3edD8k8A3Dg@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary="------------8BF4B1BE891F1E2B0E7B7520"
Content-Language: en-US
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io

--------------8BF4B1BE891F1E2B0E7B7520
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/26/2018 05:33 PM, Kevin Hilman wrote:
> Hi Carlos,
>
> Looks like lab-ti is having lots of problems that look like lab
> infrastructure, and not actual kernel issues.  e.g.
> https://kernelci.org/boot/all/lab/lab-ti/

We have been having issues with an old beglebone white in the lab. I 
will remove it from the farm.

>
> This also reminds me that we need to migrate your jobs, (all of which
> are doing NFS boots with your own custometest rootfs) to using our
> /test API instead of our /boot API.
>
> We've standardized the /boot interface for the least-common
> denominator boot test we can run on all arches/boards, which means a
> tiny (kernelCI standard) buildroot ramdisk which boots to a shell.
>
> Anything that doesn't fit this defintion of "boot" we call a "test"
> and we've moved to using the /test API so the /boot API can remain a
> apples-to-apples comparison of running the exact same kernels and
> ramdisks across the widest possible variety of hardware.

OK, makes sense.

>
> For labs using LAVA, this is a trivial migration because the
> kernelci-backend knows how to parse LAVA JSON results sent via its
> 'notify' mechanism and put them into the database.  I'm not sure
> if/how you're currently using LAVA, so not sure how this migration
> will work for you, but we need these results to not use the /boot API.

I would rather switch to /boot API and use standard ramdisk image.
For now I would disable kernelci tests on ti-lab and create a story to 
convert to new API.

>
> Thanks,
>
> Kevin

-- 
Carlos


--------------8BF4B1BE891F1E2B0E7B7520
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 07/26/2018 05:33 PM, Kevin Hilman wrote:<br>
    <blockquote type="cite"
cite="mid:CAOi56cUF=KmAgM9eRyHZ9+Cbd7urq6EoYEzGuqk3edD8k8A3Dg@mail.gmail.com">
      <pre wrap="">Hi Carlos,

Looks like lab-ti is having lots of problems that look like lab
infrastructure, and not actual kernel issues.  e.g.
<a class="moz-txt-link-freetext" href="https://kernelci.org/boot/all/lab/lab-ti/">https://kernelci.org/boot/all/lab/lab-ti/</a></pre>
    </blockquote>
    <br>
    We have been having issues with an old beglebone white in the lab. I
    will remove it from the farm.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAOi56cUF=KmAgM9eRyHZ9+Cbd7urq6EoYEzGuqk3edD8k8A3Dg@mail.gmail.com">
      <pre wrap="">

This also reminds me that we need to migrate your jobs, (all of which
are doing NFS boots with your own custometest rootfs) to using our
/test API instead of our /boot API.

We've standardized the /boot interface for the least-common
denominator boot test we can run on all arches/boards, which means a
tiny (kernelCI standard) buildroot ramdisk which boots to a shell.

Anything that doesn't fit this defintion of "boot" we call a "test"
and we've moved to using the /test API so the /boot API can remain a
apples-to-apples comparison of running the exact same kernels and
ramdisks across the widest possible variety of hardware.</pre>
    </blockquote>
    <br>
    OK, makes sense.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAOi56cUF=KmAgM9eRyHZ9+Cbd7urq6EoYEzGuqk3edD8k8A3Dg@mail.gmail.com">
      <pre wrap="">

For labs using LAVA, this is a trivial migration because the
kernelci-backend knows how to parse LAVA JSON results sent via its
'notify' mechanism and put them into the database.  I'm not sure
if/how you're currently using LAVA, so not sure how this migration
will work for you, but we need these results to not use the /boot API.</pre>
    </blockquote>
    <br>
    I would rather switch to /boot API and use standard ramdisk image. <br>
    For now I would disable kernelci tests on ti-lab and create a story
    to convert to new API.<br>
    <br>
    <blockquote type="cite"
cite="mid:CAOi56cUF=KmAgM9eRyHZ9+Cbd7urq6EoYEzGuqk3edD8k8A3Dg@mail.gmail.com">
      <pre wrap="">

Thanks,

Kevin
</pre>
    </blockquote>
    <br>
    <pre class="moz-signature" cols="72">-- 
Carlos</pre>
  </body>
</html>

--------------8BF4B1BE891F1E2B0E7B7520--
