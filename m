Return-Path: <dan.rue@linaro.org>
Date: Mon, 10 Dec 2018 08:52:29 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: [kernelci] Meeting Minutes for 2018-12-10
Message-ID: <20181210145229.mcolbd73pwmneael@xps.therub.org>
References: <156EFFCC270B2245.24455@groups.io>
MIME-Version: 1.0
In-Reply-To: <156EFFCC270B2245.24455@groups.io>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io

On Mon, Dec 10, 2018 at 08:42:51AM -0600, Dan Rue wrote:
> - Attendees: Ana Guerrero Lopez, Amro Hassaan, Anders Roxell, Dan Rue,
>   Daniel Díaz, Guillaume Tucker, Mark Brown, Matt Hart, Milosz
>   Wasilewski, Naresh Kamboju
> 
> - We’ve reached the maximum number of people allowed in a hangout

I think this is because it's hosted by Mark's personal gmail. If we use
a gsuite account it'll support 25, and 50 if we switch to 'meet'.

> 
> - [milosz] adding callbacks for ‘new backend’
>   - Charles prepared logstash input pipeline that stores LAVA callback
>     data in ES
>   - We’d like to collect some ‘real’ data to prepare presentation layer
>     and try to port existing UI to new backend
>   - Same applies to build data from build script (additional POST to new
>     URL).
>   - If there are no objections I’ll prepare a PR.
>   - Issues:
>     - [Matt] Multiple callbacks might not be supported by all LAVA labs
>       as this is a new feature.
> 
> - [gtucker]
>   - Fix for perf issues rolled out in production
>     - [milosz] I didn’t try to bring it down yet
>   - Boot bisection now enabled on linux-next
> 
> - [drue] lkft planning update
>   - Kv-160 LKFT board and lab re-evaluation (matt hart)
>     - In general, this will align us with kernelci, and reduce the
>       amount of time required to get test results.
>       - Allows us to add hikey, db410c, and x15 to kernelci
>       - Eliminates the need to do an OE build after a kernel build
>       - Eliminates the (expensive, time-wise) step of flashing boards
>         before running tests
>   - kernelCI + LKFT build plan making progress (dan rue and daniel diaz)
>     - Kv-155 Kernelci to build defconfig + kselftest frag + Lkft
>       fragment (dan working)
>     - OE filesystem will not need to be rebuilt every time. We can build
>       as-needed, and control which one we use at lava runtime.
>   - Kv-165 Kvm proposal (to be validated still) (unassigned)
>     - Run kvm-unit-tests on juno-r2 on all branches going back to 4.4
>     - https://git.kernel.org/pub/scm/virt/kvm/kvm-unit-tests.git/
>   - KV-158: LTP test plan (naresh kamboju)
>     - Reduce number of LAVA jobs run per build. Tests and reporting will
>       remain the same.
> 
> - [ana]
>   - PR storing test regressions in the backend and showing them in the
>     test reports mails
>     https://github.com/kernelci/kernelci-backend/pull/97
>   - Trying to get that merged/done before the xmas holidays
> 
> 
> 
