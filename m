Message-ID: <52f17759-c7b9-c13b-2c58-f9f2656d26f6@collabora.com>
Date: Mon, 28 Feb 2022 11:55:58 +0500
MIME-Version: 1.0
Subject: Re: [PATCH V3] selftests: vm: Add test for Soft-Dirty PTE bit
References: <20220224212335.3045905-1-usama.anjum@collabora.com>
 <edf398a7-b1a1-c7c9-5128-f37cfc3a5c95@linuxfoundation.org>
From: "Usama" <usama.anjum@collabora.com>
In-Reply-To: <edf398a7-b1a1-c7c9-5128-f37cfc3a5c95@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: usama.anjum@collabora.com, kernel@collabora.com, kernelci@groups.io, Will Deacon <will@kernel.org>, Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org

Hi,

Andrew had already accepted the patch. I'll send an iteration.

On 2/26/22 5:35 AM, Shuah Khan wrote:
>> +#define PAGEMAP_PATH=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "/proc/s=
elf/pagemap"
>=20
> Why is this names PATH - it is the file name right?
I'll update the names of the macros.

>> +
>> +int clear_refs;
>> +int pagemap;
>> +
>=20
> Get rid of these globals and pass these in - please find name
> that clearly indicates them as fds
>=20
I'll update their names to indicate fds. This is a standalone test
application. Shouldn't the usage of global variables be fine?

>> +static int check_page(char *start, int page_num, int clear)
>> +{
>> +=C2=A0=C2=A0=C2=A0 unsigned long pfn =3D (unsigned long)start / pagesiz=
e;
>> +=C2=A0=C2=A0=C2=A0 uint64_t entry;
>> +=C2=A0=C2=A0=C2=A0 int ret;
>> +
>> +=C2=A0=C2=A0=C2=A0 ret =3D pread(pagemap, &entry, sizeof(entry), (pfn +=
 page_num) *
>> sizeof(entry));
>> +=C2=A0=C2=A0=C2=A0 if (ret !=3D sizeof(entry))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ksft_exit_fail_msg("reading =
pagemap failed\n");
>> +=C2=A0=C2=A0=C2=A0 if (clear)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clear_all_refs();
>> +
>> +=C2=A0=C2=A0=C2=A0 return ((entry >> 55) & 1);
>=20
> Add a define for 55 insead of hardcoding with a meaningful name
> that describes what this value is.
>=20
Sure.

>> +}
>> +
>> +static void test_simple(void)
>> +{
>> +=C2=A0=C2=A0=C2=A0 int i;
>> +=C2=A0=C2=A0=C2=A0 char *map;
>> +
>> +=C2=A0=C2=A0=C2=A0 map =3D aligned_alloc(pagesize, mmap_size);
>> +=C2=A0=C2=A0=C2=A0 if (!map)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ksft_exit_fail_msg("mmap fai=
led\n");
>> +
>> +=C2=A0=C2=A0=C2=A0 clear_all_refs();
>=20
> If clear_all_refs() fails and exits, when does map get freed?
I'll fix this.

>> +/*
>> + * read_pmd_pagesize(), check_for_pattern() and check_huge() adapted
>> + * from 'tools/testing/selftest/vm/split_huge_page_test.c'
>=20
> Don't use the full path here - just use the file name
I'll update the comment.

>> +
>> +int main(int argc, char **argv)
>> +{
>> +=C2=A0=C2=A0=C2=A0 ksft_print_header();
>> +=C2=A0=C2=A0=C2=A0 ksft_set_plan(5);
>> +
>> +=C2=A0=C2=A0=C2=A0 pagemap =3D open(PAGEMAP_PATH, O_RDONLY);
>> +=C2=A0=C2=A0=C2=A0 if (pagemap < 0)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ksft_exit_fail_msg("Failed t=
o open %s\n", PAGEMAP_PATH);
>=20
> Can non-root user open this file? If not, when non-root user fails to
> open, it is a skip not fail
Yes, non-root user can open this file. I'll check the usage of skip
macros as well.

>> +=C2=A0=C2=A0=C2=A0 test_simple();
>> +=C2=A0=C2=A0=C2=A0 test_vma_reuse();
>> +=C2=A0=C2=A0=C2=A0 test_hugepage();
>=20
> What happens when these tests fail?
They are independent. Each of them marks the test pass or fail on its
own. If one of them fails, others will keep on executing next.

>> +
>> +=C2=A0=C2=A0=C2=A0 return ksft_exit_pass();
>> +}
>>
>=20
> Where do CLEAR_REFS_PATH etc. get closed. Please take a look
> at the error paths carefully. I would like to see the output for
> this test. Please include it in the change log.
I'll update and include the output as well.

> thanks,
> -- Shuah
