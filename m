From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Subject: kernelci.org automated boot bisection reports
Message-ID: <49681fa7-cd31-89e5-5986-ebe8691ead9a@collabora.com>
Date: Fri, 23 Nov 2018 10:22:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: stable@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: kernelci@groups.io, kernel@collabora.com, Mark Brown <broonie@kernel.org>

tl;dr automatic bisection reports are enabled for mainline and stable

In case you're not already familiar with it, the kernelci.org project
is a community effort to build and test upstream kernel trees on a
variety of hardware platforms.  Reports are mostly sent to the
kernel-build-reports mailing list[1] and all the results can be seen
on https://kernelci.org.

When a boot test regression is detected on mainline or stable
branches, a bisection is automatically run.  Starting from today, an
email report will be automatically sent to a list of recipients based
on the commit the bisection has found (author, trailers, maintainers
and lists associated with the code changed by the commit).  Until
now, the results were manually curated and only reported more widely
when they seemed valid.  Some automated checks are now used, they
have been showing good results for a while with no false positives.

There shouldn't be many bisection reports yet, typically one or two
every month.  As we'll start bisecting other trees such as linux-next
and other test results than just plain boots, the volume may start
increasing gradually over the coming months.

Please let us know if you would like the report format to be changed
when you get one, or if you have any suggestions at all.

Hope this helps!

Guillaume

[1] https://lists.linaro.org/mailman/listinfo/kernel-build-reports
