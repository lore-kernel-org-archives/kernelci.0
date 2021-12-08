MIME-Version: 1.0
References: <20211207190251.18426-1-davidgow@google.com> <202112071358.E8E6812D@keescook>
In-Reply-To: <202112071358.E8E6812D@keescook>
From: David Gow <davidgow@google.com>
Date: Thu, 9 Dec 2021 00:17:44 +0800
Message-ID: <CABVgOSm68xfwCrnobKJkt_Qhh95JCP6kTXrUXoDwe_pBxWWt-w@mail.gmail.com>
Subject: Re: [RFC PATCH v2] Documentation: dev-tools: Add KTAP specification
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Kees Cook <keescook@chromium.org>
Cc: Brendan Higgins <brendanhiggins@google.com>, Tim.Bird@sony.com, shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>, rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Dec 8, 2021 at 6:02 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Dec 07, 2021 at 11:02:51AM -0800, David Gow wrote:
> > From: Rae Moar <rmoar@google.com>
> >
> > It does not make any significant additions or changes other than those
> > already in use in the kernel: additional features can be added as they
> > become necessary and used.
> >
> > [1]: https://testanything.org/tap-version-13-specification.html
> >
> > Signed-off-by: Rae Moar <rmoar@google.com>
> > Co-developed-by: David Gow <davidgow@google.com>
> > Signed-off-by: David Gow <davidgow@google.com>
>
> I like it! Thank you so much for suffering through my earlier reviews.
> :)
>
> The only concern I have is wonder what'll be needed to kselftest to
> deal with indentation changes. As long as this can be implemented
> without a subtest knowing it is a subtest, we're good.

I'd think a minor tweak to the prefix.pl script should handle it for most tests:
https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/tree/tools/testing/selftests/kselftest/prefix.pl

Certainly the indent should be the only difference between a top-level
test result and a subtest now.

And, if the results do use test plans (i.e., state how many tests are
expected beforehand) it's possible to parse the results even without
indentation. It it looks like it would be a problem, we could
explicitly state that indentation is optional if a test plan is
present (or provide some other mechanism for detecting the end of the
subtests: just checking the test number has some corner cases which'd
fail, but doing something akin to the "Subtest:" header TAP14 used
makes this pretty robust). Things like that would overcomplicate it a
bit, though, and might end up verging back on "tests need to know
they're subtests" territory, depending on the exact implementation, so
I think things are probably better as-is.

Cheers,
-- David
