Subject: Re: next/master boot bisection: next-20181210 on meson-gxl-s905x-libretech-cc
References: <5c0ef32c.1c69fb81.72744.44d8@mx.google.com>
 <CAOi56cV9NL2bVnALDEs_XOv96Y=bFiVcsNJ3E0KPC+n1uXNcjw@mail.gmail.com>
 <f188394c-a8e5-0e90-a007-1b66766ee4bf@collabora.com>
 <7hefanu45i.fsf@baylibre.com>
From: "Guillaume Tucker" <guillaume.tucker@gmail.com>
Message-ID: <29f934c6-256a-4a5a-97d3-a7a57dadefa3@collabora.com>
Date: Wed, 12 Dec 2018 12:50:59 +0000
MIME-Version: 1.0
In-Reply-To: <7hefanu45i.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Kevin Hilman <khilman@baylibre.com>
Cc: kernelci@groups.io

On 11/12/2018 21:47, Kevin Hilman wrote:
> Guillaume Tucker <guillaume.tucker@collabora.com> writes:
> 
>> On 10/12/2018 23:38, Kevin Hilman wrote:
>>> [ removed developer lists ]
>>>
>>> Guillaume,
>>>
>>> A minor nit about the reporting that's a bit confusing... the "Good"
>>> tag shows  next-20181206, but the bisect log shows that it started at
>>> v4.20-rc6
>>
>> Sure, the v4.20-rc6 is the merge base between the 2 next tags.  I
>> can add a "merge base" line to the report below the good and bad
>> revisions to clarify this point.
>>
>>> Also, it might be helpful for folks not familiar with kCI to know what
>>> this "bisection report" is about.  It's not obvious that what's being
>>> bisected is a boot failure.  It might be useful to show the boot
>>> failure, and have a link to a full boot log for the original failure.
>>
>> There's already a link to the overall boot details for the good
>> and bad revisions like this one:
>>
>>   https://kernelci.org/boot/all/job/next/branch/master/kernel/next-20181206/
>>
>> and I have a task to work on this week to make it point to the
>> actual particular boot within that series.
>>
>> The subject says it's a boot bisection, and the links show boot
>> results.  How would you explain this further?
> 
> For someone not familiar with kernelCI, it might not be obvious what to
> do with those links.
> 
>> About showing boot failures, I don't think we can really do that
>> at the moment as we're relying solely on the LAVA job status.
>> With a better boot test plan that looks at the kernel log we can
>> extract the interesting part showing useful information and
>> include it in the report automatically.
> 
> Yes, but the email could sill have a link to the full boot log of the
> original failure, the original "bad" one that triggered the bisection.
> 
> I think that's what's missing.  When I first glanced at the email
> thinking of it with a newbie lens, I was wondering *why* the bisection
> was triggered in the first place.  IOW, it never says in the intro, that
> the patch in question caused a boot failure.

Here's a first round of what I hope to be improvements:

  https://github.com/kernelci/kernelci-backend/pull/99

I'd still like to clarify the part about "this is the bad
revision that triggered the bisection" with details about where
it came from, and "now this is the result of the bisection".  But
I thought I'd leave it rest for a day and see if anyone has some
thoughts about that modified report format.

Guillaume

>>> On Mon, Dec 10, 2018 at 3:13 PM kernelci.org bot <bot@kernelci.org> wrote:
>>>>
>>>> This automated bisection report was sent to you on the basis that you may be involved with the breaking commit it has found. No manual investigation has been done to verify it, and the root cause of the problem may be somewhere else.
>>>>
>>>> Hope this helps!
>>>>
>>>> Bisection result for next/master (next-20181210) on meson-gxl-s905x-libretech-cc
>>>>
>>>> Good
>>>>
>>>> 4c92b7b3080d Add linux-next specific files for 20181206
>>>>
>>>> Bad
>>>>
>>>> 14cf8c1d5b90 Add linux-next specific files for 20181210
>>>>
>>>> Found
>>>>
>>>> 396244692232 arm64: preempt: Provide our own implementation of asm/preempt.h
>>>>
>>>> Details:
>>>>
>>>> Goodnext-20181206
>>>> Badnext-20181210
>>>>
>>>> Checks:
>>>>
>>>> revertPASS
>>>> verifyPASS
>>>>
>>>> Parameters:
>>>>
>>>> Treenext
>>>> URLhttp://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>>>> Branchmaster
>>>> Targetmeson-gxl-s905x-libretech-cc
>>>> Lablab-baylibre
>>>> Configdefconfig+CONFIG_CPU_BIG_ENDIAN=y
>>>> Planboot
>>>>
>>>> Breaking commit found:
>>>>
>>>> commit 396244692232fcf0881cb6ba2404be2906f47681
>>>> Author: Will Deacon
>>>> Date:   Thu Sep 20 10:26:40 2018 +0100
>>>>
>>>>     arm64: preempt: Provide our own implementation of asm/preempt.h
>>>>
>>>>     The asm-generic/preempt.h implementation doesn't make use of the
>>>>     PREEMPT_NEED_RESCHED flag, since this can interact badly with load/store
>>>>     architectures which rely on the preempt_count word being unchanged across
>>>>     an interrupt.
>>>>
>>>>     However, since we're a 64-bit architecture and the preempt count is
>>>>     only 32 bits wide, we can simply pack it next to the resched flag and
>>>>     load the whole thing in one go, so that a dec-and-test operation doesn't
>>>>     need to load twice.
>>>>
>>>>     Acked-by: Peter Zijlstra (Intel)
>>>>     Reviewed-by: Ard Biesheuvel
>>>>     Signed-off-by: Will Deacon
>>>>
>>>> diff --git a/arch/arm64/include/asm/Kbuild b/arch/arm64/include/asm/Kbuild
>>>> index 1877f29f6d97..1e17ea5c372b 100644
>>>> --- a/arch/arm64/include/asm/Kbuild
>>>> +++ b/arch/arm64/include/asm/Kbuild
>>>> @@ -14,7 +14,6 @@ generic-y += local64.h
>>>>  generic-y += mcs_spinlock.h
>>>>  generic-y += mm-arch-hooks.h
>>>>  generic-y += msi.h
>>>> -generic-y += preempt.h
>>>>  generic-y += qrwlock.h
>>>>  generic-y += qspinlock.h
>>>>  generic-y += rwsem.h
>>>> diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
>>>> new file mode 100644
>>>> index 000000000000..d49951647014
>>>> --- /dev/null
>>>> +++ b/arch/arm64/include/asm/preempt.h
>>>> @@ -0,0 +1,89 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +#ifndef __ASM_PREEMPT_H
>>>> +#define __ASM_PREEMPT_H
>>>> +
>>>> +#include
>>>> +
>>>> +#define PREEMPT_NEED_RESCHED BIT(32)
>>>> +#define PREEMPT_ENABLED (PREEMPT_NEED_RESCHED)
>>>> +
>>>> +static inline int preempt_count(void)
>>>> +{
>>>> + return READ_ONCE(current_thread_info()->preempt.count);
>>>> +}
>>>> +
>>>> +static inline void preempt_count_set(u64 pc)
>>>> +{
>>>> + /* Preserve existing value of PREEMPT_NEED_RESCHED */
>>>> + WRITE_ONCE(current_thread_info()->preempt.count, pc);
>>>> +}
>>>> +
>>>> +#define init_task_preempt_count(p) do { \
>>>> + task_thread_info(p)->preempt_count = FORK_PREEMPT_COUNT; \
>>>> +} while (0)
>>>> +
>>>> +#define init_idle_preempt_count(p, cpu) do { \
>>>> + task_thread_info(p)->preempt_count = PREEMPT_ENABLED; \
>>>> +} while (0)
>>>> +
>>>> +static inline void set_preempt_need_resched(void)
>>>> +{
>>>> + current_thread_info()->preempt.need_resched = 0;
>>>> +}
>>>> +
>>>> +static inline void clear_preempt_need_resched(void)
>>>> +{
>>>> + current_thread_info()->preempt.need_resched = 1;
>>>> +}
>>>> +
>>>> +static inline bool test_preempt_need_resched(void)
>>>> +{
>>>> + return !current_thread_info()->preempt.need_resched;
>>>> +}
>>>> +
>>>> +static inline void __preempt_count_add(int val)
>>>> +{
>>>> + u32 pc = READ_ONCE(current_thread_info()->preempt.count);
>>>> + pc += val;
>>>> + WRITE_ONCE(current_thread_info()->preempt.count, pc);
>>>> +}
>>>> +
>>>> +static inline void __preempt_count_sub(int val)
>>>> +{
>>>> + u32 pc = READ_ONCE(current_thread_info()->preempt.count);
>>>> + pc -= val;
>>>> + WRITE_ONCE(current_thread_info()->preempt.count, pc);
>>>> +}
>>>> +
>>>> +static inline bool __preempt_count_dec_and_test(void)
>>>> +{
>>>> + struct thread_info *ti = current_thread_info();
>>>> + u64 pc = READ_ONCE(ti->preempt_count);
>>>> +
>>>> + /* Update only the count field, leaving need_resched unchanged */
>>>> + WRITE_ONCE(ti->preempt.count, --pc);
>>>> +
>>>> + /*
>>>> + * If we wrote back all zeroes, then we're preemptible and in
>>>> + * need of a reschedule. Otherwise, we need to reload the
>>>> + * preempt_count in case the need_resched flag was cleared by an
>>>> + * interrupt occurring between the non-atomic READ_ONCE/WRITE_ONCE
>>>> + * pair.
>>>> + */
>>>> + return !pc || !READ_ONCE(ti->preempt_count);
>>>> +}
>>>> +
>>>> +static inline bool should_resched(int preempt_offset)
>>>> +{
>>>> + u64 pc = READ_ONCE(current_thread_info()->preempt_count);
>>>> + return pc == preempt_offset;
>>>> +}
>>>> +
>>>> +#ifdef CONFIG_PREEMPT
>>>> +void preempt_schedule(void);
>>>> +#define __preempt_schedule() preempt_schedule()
>>>> +void preempt_schedule_notrace(void);
>>>> +#define __preempt_schedule_notrace() preempt_schedule_notrace()
>>>> +#endif /* CONFIG_PREEMPT */
>>>> +
>>>> +#endif /* __ASM_PREEMPT_H */
>>>> diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
>>>> index cb2c10a8f0a8..bbca68b54732 100644
>>>> --- a/arch/arm64/include/asm/thread_info.h
>>>> +++ b/arch/arm64/include/asm/thread_info.h
>>>> @@ -42,7 +42,18 @@ struct thread_info {
>>>>  #ifdef CONFIG_ARM64_SW_TTBR0_PAN
>>>>   u64 ttbr0; /* saved TTBR0_EL1 */
>>>>  #endif
>>>> - int preempt_count; /* 0 => preemptable, <0 => bug */
>>>> + union {
>>>> + u64 preempt_count; /* 0 => preemptible, <0 => bug */
>>>> + struct {
>>>> +#ifdef CONFIG_CPU_BIG_ENDIAN
>>>> + u32 need_resched;
>>>> + u32 count;
>>>> +#else
>>>> + u32 count;
>>>> + u32 need_resched;
>>>> +#endif
>>>> + } preempt;
>>>> + };
>>>>  };
>>>>
>>>>  #define thread_saved_pc(tsk) \
>>>>
>>>> Git bisection log:
>>>>
>>>> git bisect start
>>>> # good: [40e020c129cfc991e8ab4736d2665351ffd1468d] Linux 4.20-rc6
>>>> git bisect good 40e020c129cfc991e8ab4736d2665351ffd1468d
>>>> # bad: [14cf8c1d5b90a0cf6a8ba51ef59db8da8c7a2622] Add linux-next specific files for 20181210
>>>> git bisect bad 14cf8c1d5b90a0cf6a8ba51ef59db8da8c7a2622
>>>> # bad: [6930775c0c29503062fc599dc9034e1dfa19152e] Merge remote-tracking branch 'spi-nor/spi-nor/next'
>>>> git bisect bad 6930775c0c29503062fc599dc9034e1dfa19152e
>>>> # bad: [02a9283641cffcfa9478945f5c50f454a98c38ff] Merge remote-tracking branch 'pci/next'
>>>> git bisect bad 02a9283641cffcfa9478945f5c50f454a98c38ff
>>>> # good: [56efa381ba5b6329c92cf8b8c44c87ac2a8e7c58] Merge remote-tracking branch 'samsung-krzk/for-next'
>>>> git bisect good 56efa381ba5b6329c92cf8b8c44c87ac2a8e7c58
>>>> # bad: [86d9212f9434a74dd9281eca70f210f39ed45d77] Merge remote-tracking branch 'nds32/next'
>>>> git bisect bad 86d9212f9434a74dd9281eca70f210f39ed45d77
>>>> # bad: [52e22b685b0e4269814f241d5ee1125e98b9e532] Merge remote-tracking branch 'arm64/for-next/core'
>>>> git bisect bad 52e22b685b0e4269814f241d5ee1125e98b9e532
>>>> # good: [9858c7196f505b5c50f381ac27f34a3abad46490] Merge branch 'sunxi/clk-for-4.21' into sunxi/for-next
>>>> git bisect good 9858c7196f505b5c50f381ac27f34a3abad46490
>>>> # good: [2731820ce27bfd6e6d26f99f558c40f8ff617c9f] Merge branch for-4.21/clk into for-next
>>>> git bisect good 2731820ce27bfd6e6d26f99f558c40f8ff617c9f
>>>> # good: [230df6835adcbc4eedf1475263d51e0ed40c6227] Merge branches 'sunxi/dt-for-4.21' and 'sunxi/dt64-for-4.21' into sunxi/for-next
>>>> git bisect good 230df6835adcbc4eedf1475263d51e0ed40c6227
>>>> # good: [3bbd3db86470c701091fb1d67f1fab6621debf50] arm64: relocatable: fix inconsistencies in linker script and options
>>>> git bisect good 3bbd3db86470c701091fb1d67f1fab6621debf50
>>>> # good: [8cb3451b1f240ec4d36a9bfcd39cb6d59769a5b3] arm64: entry: Remove confusing comment
>>>> git bisect good 8cb3451b1f240ec4d36a9bfcd39cb6d59769a5b3
>>>> # bad: [396244692232fcf0881cb6ba2404be2906f47681] arm64: preempt: Provide our own implementation of asm/preempt.h
>>>> git bisect bad 396244692232fcf0881cb6ba2404be2906f47681
>>>> # good: [cc9f8349cb33965120a96c12e05d00676162eb7f] arm64: crypto: add NEON accelerated XOR implementation
>>>> git bisect good cc9f8349cb33965120a96c12e05d00676162eb7f
>>>> # good: [08861d33d680838753f1f9d3ba9480d3651b764d] preempt: Move PREEMPT_NEED_RESCHED definition into arch code
>>>> git bisect good 08861d33d680838753f1f9d3ba9480d3651b764d
>>>> # first bad commit: [396244692232fcf0881cb6ba2404be2906f47681] arm64: preempt: Provide our own implementation of asm/preempt.h

