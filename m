Message-ID: <aaeaefb7-3655-2863-46ae-162bf5ab761c@collabora.com>
Date: Tue, 15 Mar 2022 16:55:05 +0500
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] selftests/lkdtm: add config
References: <20220217205620.2512094-1-usama.anjum@collabora.com>
 <20220217205620.2512094-2-usama.anjum@collabora.com>
 <202203091123.33E89F5@keescook>
 <76529762-1a36-142d-0aa9-beb5fa2bb27b@collabora.com>
From: "Usama" <usama.anjum@collabora.com>
In-Reply-To: <76529762-1a36-142d-0aa9-beb5fa2bb27b@collabora.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Kees Cook <keescook@chromium.org>
Cc: usama.anjum@collabora.com, Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On 3/10/22 10:22 PM, Muhammad Usama Anjum wrote:
> On 3/10/22 12:23 AM, Kees Cook wrote:
>> On Fri, Feb 18, 2022 at 01:56:20AM +0500, Muhammad Usama Anjum wrote:
>>> Add config option which is needed for SLAB_LINEAR_OVERFLOW test. It
>>> needs KASAN enabled.
>>
>> I'd prefer this use the SLAB_DEBUG options -- KASAN is very heavy.
> I'll test it out and update in the next patch version.
> I've tested by removing KASAN and adding the following config:
CONFIG_SLAB=y
CONFIG_DEBUG_SLAB=y

The result of SLAB_LINEAR_OVERFLOW test doesn't remain deterministic in
this config. The task never crashes and hence stack trace never appears.
When executed several times we get "Slab corruption" logs and after some
more tries whole kernel crashes. I've not used DEBUG_SLAB before and not
sure if this is the expected behavior. If we aren't sure, we can keep
KASAN turned on instead.

-- 
Muhammad Usama Anjum
