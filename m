From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v5 1/1] Documentation: dev-tools: clarify KTAP specification wording
In-Reply-To: <20220210233630.3304495-1-frowand.list@gmail.com>
References: <20220210233630.3304495-1-frowand.list@gmail.com>
Date: Tue, 15 Feb 2022 16:14:55 -0700
Message-ID: <87sfsj7mds.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: frowand.list@gmail.com, David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Rae Moar <rmoar@google.com>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>
Cc: rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

frowand.list@gmail.com writes:

> From: Frank Rowand <frank.rowand@sony.com>
>
> Add the spec version to the title line.
>
> Explain likely source of "Unknown lines".
>
> "Unknown lines" in nested tests are optionally indented.
>
> Add "Unknown lines" items to differences between TAP & KTAP list
>
> Convert "Major differences between TAP and KTAP" from a bullet list
> to a table.  The bullet list was being formatted as a single
> paragraph.
>
> Reviewed-by: Tim Bird <Tim.Bird@sony.com>
> Reviewed-by: David Gow <davidgow@google.com>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Frank Rowand <frank.rowand@sony.com>

I've applied this, thanks.

jon
