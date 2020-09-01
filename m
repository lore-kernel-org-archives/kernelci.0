Subject: Re: next/master baseline: 368 runs, 20 regressions (next-20200825)
References: <5f450985.1c69fb81.d0e74.7478@mx.google.com>
 <7ho8mysj4i.fsf@baylibre.com>
 <bf562f6d-41a6-aa7d-69e8-058576b1b0ce@collabora.com>
 <CABXOdTewKr17Gy5GjztpWaVPKs6LAOOVe9SHOrr79iPEf54E=g@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <9a5fa5ed-8c12-1bc9-aa56-fdca49384b9e@collabora.com>
Date: Tue, 1 Sep 2020 14:42:33 +0100
MIME-Version: 1.0
In-Reply-To: <CABXOdTewKr17Gy5GjztpWaVPKs6LAOOVe9SHOrr79iPEf54E=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Guenter Roeck <groeck@google.com>
Cc: kernelci@groups.io, Kevin Hilman <khilman@baylibre.com>, kernelci-results@groups.io

On 01/09/2020 14:22, Guenter Roeck wrote:
> On Tue, Sep 1, 2020 at 3:57 AM Guillaume Tucker
> <guillaume.tucker@collabora.com> wrote:
>>
>> On 25/08/2020 18:58, Kevin Hilman wrote:
>>> [ -linux-next, +kernelci dev ]
>>>
>>> "kernelci.org bot" <bot@kernelci.org> writes:
>>>
>>>> next/master baseline: 368 runs, 20 regressions (next-20200825)
>>
>> [...]
>>
>>>> platform              | arch  | lab           | compiler | defconfig                    | results
>>>> ----------------------+-------+---------------+----------+------------------------------+--------
>>>> bcm2837-rpi-3-b       | arm64 | lab-baylibre  | gcc-8    | defconfig                    | 3/4
>>>>
>>>>   Details:     https://kernelci.org/test/plan/id/5f44d354974cc7a9749fb42b
>>>>
>>>>   Results:     3 PASS, 1 FAIL, 0 SKIP
>>>>   Full config: defconfig
>>>>   Compiler:    gcc-8 (aarch64-linux-gnu-gcc (Debian 8.3.0-2) 8.3.0)
>>>>   Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.txt
>>>>   HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm64/defconfig/gcc-8/lab-baylibre/baseline-bcm2837-rpi-3-b.html
>>>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020.05/arm64/baseline/rootfs.cpio.gz
>>>>
>>>>   * baseline.dmesg.crit: https://kernelci.org/test/case/id/5f44d354974cc7a9749fb42f
>>>>       new failure (last pass: next-20200824)
>>>>       1 lines
>>>>
>>>>     2020-08-25 08:59:02.167000  Connected to bcm2837-rpi-3-b console [channel connected] (~$quit to exit)
>>>>     2020-08-25 08:59:02.167000  (user:khilman) is already connected
>>>>     2020-08-25 08:59:18.764000  .
>>>>     2020-08-25 08:59:18.765000
>>>>     2020-08-25 08:59:18.765000  U-Boot 2018.11 (Dec 04 2018 - 10:54:32 -0800)
>>>>     2020-08-25 08:59:18.765000
>>>>     2020-08-25 08:59:18.765000  DRAM:  948 MiB
>>>>     2020-08-25 08:59:18.780000  RPI 3 Model B (0xa02082)
>>>>     2020-08-25 08:59:18.866000  MMC:   mmc@7e202000: 0, sdhci@7e300000: 1
>>>>     2020-08-25 08:59:18.899000  Loading Environment from FAT... *** Warning - bad CRC, using default environment
>>>>     ... (379 line(s) more)
>>>
>>> Shouldn't we show the last few lines of the log instead of the first
>>> few lines?
>>
>> In this case, it's the span of log lines that was wrong.  The log
>> lines should have started after login, not at the bootloader
>> stage.  The "critical" error is:
>>
>> [   17.957677] hwmon hwmon1: Undervoltage detected!
>>
> That is just a log message, though, that triggers a sysfs_notify call
> to in0_lcrit_alarm. By itself it doesn't result in a crash/reboot.

That's right, the test case is "baseline.dmesg.crit" which looks
for "critical" kernel error messages.  Early boot crashes are
normally caught by the "baseline.login" test case.

New kernel errors at the "emerg", "crit" or "alert" levels are
detected as regressions and reported as such.  The hwmon issue in
this case is an intermittent one, so it regularly comes back as a
regression.

Best wishes,
Guillaume

>> This is a recurring error and I believe previous runs showed it
>> correctly, so it's worth investigating why the start line was not
>> set correctly in this case.
>>
>> By the way, it only seems to be happening in lab-baylibre and I
>> wonder if it could have anything to do with an unstable power
>> supply.
>>
>>>> platform              | arch  | lab           | compiler | defconfig                    | results
>>>> ----------------------+-------+---------------+----------+------------------------------+--------
>>>> omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defc...CONFIG_SMP=n | 4/5
>>>>
>>>>   Details:     https://kernelci.org/test/plan/id/5f44d4448493d6f73c9fb42b
>>>>
>>>>   Results:     4 PASS, 1 FAIL, 0 SKIP
>>>>   Full config: multi_v7_defconfig+CONFIG_SMP=n
>>>>   Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
>>>>   Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-collabora/baseline-omap4-panda.txt
>>>>   HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/multi_v7_defconfig+CONFIG_SMP=n/gcc-8/lab-collabora/baseline-omap4-panda.html
>>>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020.05/armel/baseline/rootfs.cpio.gz
>>>>
>>>>   * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f44d4448493d6f73c9fb431
>>>>       failing since 40 days (last pass: next-20200706, first fail: next-20200715)
>>>>       60 lines
>>>>
>>>>     2020-08-25 09:05:03.232000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c802
>>>>     2020-08-25 09:05:03.238000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c803
>>>>     2020-08-25 09:05:03.244000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c804
>>>>     2020-08-25 09:05:03.249000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c805
>>>>     2020-08-25 09:05:03.255000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c806
>>>>     2020-08-25 09:05:03.261000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c807
>>>>     2020-08-25 09:05:03.267000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c808
>>>>     2020-08-25 09:05:03.273000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c809
>>>>     2020-08-25 09:05:03.278000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c80a
>>>>     2020-08-25 09:05:03.284000  kern  :alert : BUG: Bad page state in process swapper  pfn:9c80b
>>>>     ... (49 line(s) more)
>>>
>>> ... similar here ...
>>
>> In this case, all the lines are actually the same.
>>
>>>> platform              | arch  | lab           | compiler | defconfig                    | results
>>>> ----------------------+-------+---------------+----------+------------------------------+--------
>>>> omap4-panda           | arm   | lab-collabora | gcc-8    | multi_v7_defconfig           | 4/5
>>>>
>>>>   Details:     https://kernelci.org/test/plan/id/5f44d6605371b404fc9fb42b
>>>>
>>>>   Results:     4 PASS, 1 FAIL, 0 SKIP
>>>>   Full config: multi_v7_defconfig
>>>>   Compiler:    gcc-8 (arm-linux-gnueabihf-gcc (Debian 8.3.0-2) 8.3.0)
>>>>   Plain log:   https://storage.kernelci.org//next/master/next-20200825/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.txt
>>>>   HTML log:    https://storage.kernelci.org//next/master/next-20200825/arm/multi_v7_defconfig/gcc-8/lab-collabora/baseline-omap4-panda.html
>>>>   Rootfs:      http://storage.kernelci.org/images/rootfs/buildroot/kci-2020.05/armel/baseline/rootfs.cpio.gz
>>>>
>>>>   * baseline.dmesg.alert: https://kernelci.org/test/case/id/5f44d6605371b404fc9fb431
>>>>       failing since 40 days (last pass: next-20200706, first fail: next-20200715)
>>>>       60 lines
>>>>
>>>>     2020-08-25 09:14:02.674000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c802
>>>>     2020-08-25 09:14:02.680000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c803
>>>>     2020-08-25 09:14:02.686000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c804
>>>>     2020-08-25 09:14:02.692000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c805
>>>>     2020-08-25 09:14:02.698000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c806
>>>>     2020-08-25 09:14:02.704000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c807
>>>>     2020-08-25 09:14:02.710000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c808
>>>>     2020-08-25 09:14:02.716000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c809
>>>>     2020-08-25 09:14:02.722000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c80a
>>>>     2020-08-25 09:14:02.728000  kern  :alert : BUG: Bad page state in process swapper/0  pfn:9c80b
>>>>     ... (49 line(s) more)
>>>>
>>> ... and here.
>>>
>>> It's not always true, but I think typically the last part of the log
>>> will be more interesting to spotting an issue.
>>
>> In the examples above, the top part of the log lines was
>> completely relevant.  For things like Oops and other kernel
>> errors, the issue is often shown first and then there's a stack
>> dump.  Ultimately, each test suite will be doing things
>> differently.  So it's really hard to tell whether the last lines
>> are more likely to be useful than the first ones.  There's also a
>> link to the details on the frontend where all the lines are
>> visible:
>>
>>   https://kernelci.org/test/case/id/5f44d6605371b404fc9fb431
>>
>> Maybe we could increase the limit and show up to say, 16 lines
>> instead of 10 but then when there are 17 or more show the first
>> and last 3 lines?  It's all kind of heuristics at this point.  It
>> might also be something to tune on a per-test-suite basis when we
>> have kci_email and some YAML configuration.
>>
>> Guillaume
>>
>> 
>>

