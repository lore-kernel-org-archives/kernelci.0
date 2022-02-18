Message-ID: <31d4c254-2769-db7c-2a28-3f21c2e8bc52@collabora.com>
Date: Fri, 18 Feb 2022 20:31:24 +0500
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] selftests/lkdtm: add config and turn off CFI_FORWARD_PROTO
References: <20220217205620.2512094-1-usama.anjum@collabora.com>
From: "Usama" <usama.anjum@collabora.com>
In-Reply-To: <20220217205620.2512094-1-usama.anjum@collabora.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>
Cc: usama.anjum@collabora.com, kernel@collabora.com, kernelci@groups.io, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On 2/18/22 1:56 AM, Muhammad Usama Anjum wrote:
> Add config options which are needed for LKDTM sub-tests.
> STACKLEAK_ERASING test needs GCC_PLUGIN_STACKLEAK config.
> READ_AFTER_FREE and READ_BUDDY_AFTER_FREE tests need
> INIT_ON_FREE_DEFAULT_ON config.
> 
> CFI_FORWARD_PROTO always fails as there is no active CFI system of some
> kind. Turn it off for now by default until proper support.
> 
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Fixes: 46d1a0f03d66 ("selftests/lkdtm: Add tests for LKDTM targets")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Reported-by: "kernelci.org bot" <bot@kernelci.org>
