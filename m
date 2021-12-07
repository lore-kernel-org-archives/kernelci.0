Return-Path: <keescook@chromium.org>
Date: Tue, 7 Dec 2021 14:02:42 -0800
From: Kees Cook <keescook@chromium.org>
Subject: Re: [RFC PATCH v2] Documentation: dev-tools: Add KTAP specification
Message-ID: <202112071358.E8E6812D@keescook>
References: <20211207190251.18426-1-davidgow@google.com>
MIME-Version: 1.0
In-Reply-To: <20211207190251.18426-1-davidgow@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: David Gow <davidgow@google.com>
Cc: Brendan Higgins <brendanhiggins@google.com>, Tim.Bird@sony.com, shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 07, 2021 at 11:02:51AM -0800, David Gow wrote:
> From: Rae Moar <rmoar@google.com>
> 
> It does not make any significant additions or changes other than those
> already in use in the kernel: additional features can be added as they
> become necessary and used.
> 
> [1]: https://testanything.org/tap-version-13-specification.html
> 
> Signed-off-by: Rae Moar <rmoar@google.com>
> Co-developed-by: David Gow <davidgow@google.com>
> Signed-off-by: David Gow <davidgow@google.com>

I like it! Thank you so much for suffering through my earlier reviews.
:)

The only concern I have is wonder what'll be needed to kselftest to
deal with indentation changes. As long as this can be implemented
without a subtest knowing it is a subtest, we're good.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
