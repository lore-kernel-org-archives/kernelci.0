Message-ID: <45835904-3e0f-59fd-3d3b-52d68be11a17@infradead.org>
Date: Fri, 17 Dec 2021 22:15:15 -0800
MIME-Version: 1.0
Subject: Re: [RFC PATCH v2] Documentation: dev-tools: Add KTAP specification
References: <20211207190251.18426-1-davidgow@google.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20211207190251.18426-1-davidgow@google.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: David Gow <davidgow@google.com>, Brendan Higgins <brendanhiggins@google.com>, Tim.Bird@sony.com, shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>, Kees Cook <keescook@chromium.org>
Cc: rmr167@gmail.com, guillaume.tucker@collabora.com, dlatypov@google.com, kernelci@groups.io, kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,


On 12/7/21 11:02, David Gow wrote:
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
> ---
> 
> Changes since RFC v1:
> https://lore.kernel.org/linux-kselftest/20211203064840.2871751-1-davidgow@google.com/
> - Add a "see also" section with some useful links.
> - Remove the XPASS directive, which isn't used anywhere.
> - Clear up / reorganise the discussion around differences between KTAP
>   and TAP14.
> - Improve the wording around some directives.
> - Fix a bunch of typos.
> 
> See prior discussion in the following RFC:
> https://lore.kernel.org/linux-kselftest/CA+GJov6tdjvY9x12JsJT14qn6c7NViJxqaJk+r-K1YJzPggFDQ@mail.gmail.com/.
> 
> ---
> 
>  Documentation/dev-tools/index.rst |   1 +
>  Documentation/dev-tools/ktap.rst  | 298 ++++++++++++++++++++++++++++++
>  2 files changed, 299 insertions(+)
>  create mode 100644 Documentation/dev-tools/ktap.rst

I suppose that someone tested this. Maybe my version of Sphinx tools
is older than other people's -- I dunno.  Anyway, I get this:



/work/lnx/next/linux-next-20211217/Documentation/dev-tools/ktap.rst:71: WARNING: Error in "code-block" directive:
1 argument(s) required, 0 supplied.

.. code-block::

        <result> <number> [<description>][ # [<directive>] [<diagnostic data>]]
/work/lnx/next/linux-next-20211217/Documentation/dev-tools/ktap.rst:120: WARNING: Error in "code-block" directive:
1 argument(s) required, 0 supplied.

.. code-block::

        ok 1 test_case_name
/work/lnx/next/linux-next-20211217/Documentation/dev-tools/ktap.rst:126: WARNING: Error in "code-block" directive:
1 argument(s) required, 0 supplied.

.. code-block::

        not ok 1 test_case_name
/work/lnx/next/linux-next-20211217/Documentation/dev-tools/ktap.rst:132: WARNING: Error in "code-block" directive:
1 argument(s) required, 0 supplied.

.. code-block::

        ok 1 test # SKIP necessary dependency unavailable
/work/lnx/next/linux-next-20211217/Documentation/dev-tools/ktap.rst:139: WARNING: Error in "code-block" directive:
1 argument(s) required, 0 supplied.

.. code-block::

        not ok 1 test # TIMEOUT 30 seconds
/work/lnx/next/linux-next-20211217/Documentation/dev-tools/ktap.rst:145: WARNING: Error in "code-block" directive:
1 argument(s) required, 0 supplied.

.. code-block::

        ok 5 check return code # rcode=0
/work/lnx/next/linux-next-20211217/Documentation/dev-tools/ktap.rst:195: WARNING: Error in "code-block" directive:
1 argument(s) required, 0 supplied.

.. code-block::

        KTAP version 1
        1..1
          KTAP version 1
          1..2
          ok 1 test_1
          not ok 2 test_2
        # example failed
        not ok 1 example
/work/lnx/next/linux-next-20211217/Documentation/dev-tools/ktap.rst:208: WARNING: Error in "code-block" directive:
1 argument(s) required, 0 supplied.

.. code-block::

        KTAP version 1
        1..2
          KTAP version 1
          1..2
            KTAP version 1
            1..2
            not ok 1 test_1
            ok 2 test_2
          not ok 1 test_3
          ok 2 test_4 # SKIP
        not ok 1 example_test_1
        ok 2 example_test_2
/work/lnx/next/linux-next-20211217/Documentation/dev-tools/ktap.rst:238: WARNING: Error in "code-block" directive:
1 argument(s) required, 0 supplied.

.. code-block::

        KTAP version 1
        1..1
          KTAP version 1
          1..3
            KTAP version 1
            1..1
            # test_1: initializing test_1
            ok 1 test_1
          ok 1 example_test_1
            KTAP version 1
            1..2
            ok 1 test_1 # SKIP test_1 skipped
            ok 2 test_2
          ok 2 example_test_2
            KTAP version 1
            1..3
            ok 1 test_1
            # test_2: FAIL
            not ok 2 test_2
            ok 3 test_3 # SKIP test_3 skipped
          not ok 3 example_test_3
        not ok 1 main_test


thanks.
-- 
~Randy
