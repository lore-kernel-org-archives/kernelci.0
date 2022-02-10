Return-Path: <skhan@linuxfoundation.org>
Subject: Re: [PATCH V2] selftests: kvm: Remove absent target file
References: <20220210172352.1317554-1-usama.anjum@collabora.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f9893f6a-b68b-e759-54f5-eef73e8a9eef@linuxfoundation.org>
Date: Thu, 10 Feb 2022 11:02:00 -0700
MIME-Version: 1.0
In-Reply-To: <20220210172352.1317554-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Peter Gonda <pgonda@google.com>
Cc: kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>

On 2/10/22 10:23 AM, Muhammad Usama Anjum wrote:
> There is no vmx_pi_mmio_test file. Remove it to get rid of error while
> creation of selftest archive:
> 
> rsync: [sender] link_stat "/kselftest/kvm/x86_64/vmx_pi_mmio_test" failed: No such file or directory (2)
> rsync error: some files/attrs were not transferred (see previous errors) (code 23) at main.c(1333) [sender=3.2.3]
> 
> Fixes: 6a58150859fd ("selftest: KVM: Add intra host migration tests")
> Reported-by: "kernelci.org bot" <bot@kernelci.org>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes in V2:
> Edited the subject line
> ---
>   tools/testing/selftests/kvm/Makefile | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
> index d61286208e242..b970397f725c7 100644
> --- a/tools/testing/selftests/kvm/Makefile
> +++ b/tools/testing/selftests/kvm/Makefile
> @@ -82,7 +82,6 @@ TEST_GEN_PROGS_x86_64 += x86_64/tsc_msrs_test
>   TEST_GEN_PROGS_x86_64 += x86_64/vmx_pmu_msrs_test
>   TEST_GEN_PROGS_x86_64 += x86_64/xen_shinfo_test
>   TEST_GEN_PROGS_x86_64 += x86_64/xen_vmcall_test
> -TEST_GEN_PROGS_x86_64 += x86_64/vmx_pi_mmio_test
>   TEST_GEN_PROGS_x86_64 += x86_64/sev_migrate_tests
>   TEST_GEN_PROGS_x86_64 += x86_64/amx_test
>   TEST_GEN_PROGS_x86_64 += access_tracking_perf_test
> 

I am fine with the change itself. For this patch:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

However, are we missing a vmx_pi_mmio_test and that test needs to be added.

Just in case the test didn't make it into the 6a58150859fd and the intent
was to add it - hence the Makefile addition? This can be addressed in
another patch. Just want to make sure we aren't missing a test.

Peter Gonda can confirm perhaps?

thanks,
-- Shuah
