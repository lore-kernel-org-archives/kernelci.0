Return-Path: <pbonzini@redhat.com>
Message-ID: <eb4e24c6-41d0-4f3a-2af0-3008db408da6@redhat.com>
Date: Thu, 10 Feb 2022 19:56:55 +0100
MIME-Version: 1.0
Subject: Re: [PATCH V2] selftests: kvm: Remove absent target file
References: <20220210172352.1317554-1-usama.anjum@collabora.com>
 <f9893f6a-b68b-e759-54f5-eef73e8a9eef@linuxfoundation.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <f9893f6a-b68b-e759-54f5-eef73e8a9eef@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Shuah Khan <skhan@linuxfoundation.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>, Shuah Khan <shuah@kernel.org>, Peter Gonda <pgonda@google.com>
Cc: kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On 2/10/22 19:02, Shuah Khan wrote:
> 
> I am fine with the change itself. For this patch:
> 
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> 
> However, are we missing a vmx_pi_mmio_test and that test needs to be added.
> 
> Just in case the test didn't make it into the 6a58150859fd and the intent
> was to add it - hence the Makefile addition? This can be addressed in
> another patch. Just want to make sure we aren't missing a test.

This was probably a rebase resolution issue.  The vmx_pi_mmio_test fails 
in the mainline tree, and is lingering in my tree together with the fix 
because somebody promised a better fix for it.  I included the 
TEST_GEN_PROGS_x86_64 line by mistake when rebasing Peter Gonda's test 
below vmx_pi_mmio_test.

Thanks for the fix,

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo

