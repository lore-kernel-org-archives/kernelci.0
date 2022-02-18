Message-ID: <03ac8b04-15bb-d4a9-d09b-e5711bed1811@collabora.com>
Date: Fri, 18 Feb 2022 20:32:01 +0500
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] selftests/lkdtm: add config
References: <20220217205620.2512094-1-usama.anjum@collabora.com>
 <20220217205620.2512094-2-usama.anjum@collabora.com>
From: "Usama" <usama.anjum@collabora.com>
In-Reply-To: <20220217205620.2512094-2-usama.anjum@collabora.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: usama.anjum@collabora.com, kernel@collabora.com, kernelci@groups.io, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On 2/18/22 1:56 AM, Muhammad Usama Anjum wrote:
> Add config option which is needed for SLAB_LINEAR_OVERFLOW test. It
> needs KASAN enabled.
> 
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Fixes: 9c4f6ebc3665 ("lkdtm/heap: Add vmalloc linear overflow test")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Reported-by: "kernelci.org bot" <bot@kernelci.org>
