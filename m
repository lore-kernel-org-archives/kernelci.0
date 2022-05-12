MIME-Version: 1.0
References: <bc6e9ed7-d98b-c4da-2a59-ee0915c18f10@gmail.com> <5ca35c47-6145-4ec1-6c05-3c46f436cb4d@gmail.com>
In-Reply-To: <5ca35c47-6145-4ec1-6c05-3c46f436cb4d@gmail.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Thu, 12 May 2022 08:25:04 -0700
Message-ID: <CAGS_qxpE9qGsS1LqaobVGFKFgV6TwvwNLR4e9PG5zsfPACSf_Q@mail.gmail.com>
Subject: Re: [RFC] KTAP spec v2: prefix to KTAP data
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Frank Rowand <frowand.list@gmail.com>
Cc: David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, Tim.Bird@sony.com, Brendan Higgins <brendanhiggins@google.com>, Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com, guillaume.tucker@collabora.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 11, 2022 at 11:01 PM Frank Rowand <frowand.list@gmail.com> wrote:
> ================================================================================
> #### discussion notes:
>
> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> PRO: minimally invasive to specification.
>
> - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
> CON:
>
> KTAP does not include any mechanism to describe the value of <prefix string>
> to test harnesses and test output processing programs.  The test output
> processing programs must infer the value of <prefix string> by detecting
> the <prefix string> in the "Version lines".
>
> The detection of a "Version lines" might be a match of the regex:
>
>    "^.*KTAP version 2$"
>
> This risks falsely detecting a "Version lines", but the risk is small???

Agree this is a risk and also think it's probably small, but it's hard to say.
I think the $ anchoring the regex is probably safe enough.

As noted earlier, this tracks with what kunit.py already does.
That was necessitated by dynamic prefixes such as timestamps, etc.
So I think this is probably a fine risk to take.

I imagine we could add constraints of prefix string, e.g. must have []
around it, etc. if we want to try and minimize this risk.
But I don't know if it's necessarily worth it, given what we know right now.

Along those lines, I think I like this approach (Alternative 1) more
than Alternative 2/2b.
I'm not sure we need a structured way to specify metadata in KTAP yet?
The prefix seems like a reasonable candidate, but do others have ideas
of other bits of metadata we'd want to be able to declare?

Daniel
