Return-Path: <bagasdotme@gmail.com>
Message-ID: <eaf6c56b-c329-2d02-7599-ca83dbe20b0b@gmail.com>
Date: Tue, 30 Aug 2022 08:48:32 +0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] ktap_v2: change version to 2-rc in KTAP specification
References: <20220829233150.3564612-1-frowand.list@gmail.com>
 <20220829233150.3564612-2-frowand.list@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220829233150.3564612-2-frowand.list@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: frowand.list@gmail.com, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On 8/30/22 06:31, frowand.list@gmail.com wrote:
> From: Frank Rowand <frank.rowand@sony.com>
> 
> Prepare KTAP Specification for the process of creating version 2.
> 
> The version will remain "2-rc" until the final commit to complete
> Version 2.  Adding the "-rc" ensures that none of the development
> versions will be mistaken for the completed version 2.
> 
> After this commit, Sphinx complains that we now need more '=' signs:
> 
>   Documentation/dev-tools/ktap.rst:3: WARNING: Title overline too short.
>   ===================================================
>   The Kernel Test Anything Protocol (KTAP), version 2-rc
>   ===================================================
> 
> This warning will disappear in the final commit for the release of
> version 2, when the "-rc" is removed.
> 

I don't see that -rc stripping in patch [2/2], so please fix the Sphinx
warning above in this patch.

-- 
An old man doll... just what I always wanted! - Clara
