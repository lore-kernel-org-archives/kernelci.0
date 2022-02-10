Message-ID: <81619c13-41e6-3aab-4cf7-9b6d5a11e05c@collabora.com>
Date: Fri, 11 Feb 2022 03:41:54 +0500
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] selftests: x86: allow expansion of $(CC)
References: <20220210190642.1477814-1-usama.anjum@collabora.com>
 <20220210190642.1477814-2-usama.anjum@collabora.com>
 <a34f2fc8-f4aa-fef4-d1dd-f3fdb5114f72@linuxfoundation.org>
From: "Usama" <usama.anjum@collabora.com>
In-Reply-To: <a34f2fc8-f4aa-fef4-d1dd-f3fdb5114f72@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Shuah Khan <skhan@linuxfoundation.org>, Jarkko Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Shuah Khan <shuah@kernel.org>, Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@suse.de>, Jethro Beekman <jethro@fortanix.com>, "open list:INTEL SGX" <linux-sgx@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Cc: usama.anjum@collabora.com, kernel@collabora.com, kernelci@groups.io, "kernelci.org bot" <bot@kernelci.org>

On 2/11/22 1:51 AM, Shuah Khan wrote:
> On 2/10/22 12:06 PM, Muhammad Usama Anjum wrote:
>> CC can have multiple sub-strings like "ccache gcc". Erorr pops up if
>> it is treated as single string and double quote are used around it.
>> This can be fixed by removing the quotes and not treating CC a single
>> string.
>>
>> Fixes: e9886ace222e ("selftests, x86: Rework x86 target architecture
>> detection")
>> Reported-by: "kernelci.org bot" <bot@kernelci.org>
>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>> ---
>> =C2=A0 tools/testing/selftests/x86/check_cc.sh | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/selftests/x86/check_cc.sh
>> b/tools/testing/selftests/x86/check_cc.sh
>> index 3e2089c8cf549..aff2c15018b53 100755
>> --- a/tools/testing/selftests/x86/check_cc.sh
>> +++ b/tools/testing/selftests/x86/check_cc.sh
>> @@ -7,7 +7,7 @@ CC=3D"$1"
>> =C2=A0 TESTPROG=3D"$2"
>> =C2=A0 shift 2
>> =C2=A0 -if "$CC" -o /dev/null "$TESTPROG" -O0 "$@" 2>/dev/null; then
>> +if $CC -o /dev/null "$TESTPROG" -O0 "$@" 2>/dev/null; then
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo 1
>> =C2=A0 else
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo 0
>>
>=20
> The intent is testing if $CC is set. Does this change work when
> $CC is not set?
>=20
Yeah, it works. I've added a debug variable inside sgx/Makefile and it
is detecting empty argument correctly as well.


--- a/tools/testing/selftests/sgx/Makefile
+++ b/tools/testing/selftests/sgx/Makefile
@@ -6,7 +6,7 @@ include ../lib.mk

 CAN_BUILD_X86_64 :=3D $(shell ../x86/check_cc.sh "$(CC)" \
                            ../x86/trivial_64bit_program.c)
-
+$(info $$CAN_BUILD_X86_64 is [${CAN_BUILD_X86_64}])


Wrong examples:
=E2=9E=9C  sgx (next-20220210_) =E2=9C=97 make CC=3D""
$CAN_BUILD_X86_64 is [0]
=E2=9E=9C  sgx (next-20220210_) =E2=9C=97 make CC=3D"cache gcc"
$CAN_BUILD_X86_64 is [0]

Correct examples:
=E2=9E=9C  sgx (next-20220210_) =E2=9C=97 make CC=3Dgcc
$CAN_BUILD_X86_64 is [1]
=E2=9E=9C  sgx (next-20220210_) =E2=9C=97 make
$CAN_BUILD_X86_64 is [1]
=E2=9E=9C  sgx (next-20220210_) =E2=9C=97 make CC=3D"ccache gcc"
$CAN_BUILD_X86_64 is [1]
=E2=9E=9C  sgx (next-20220210_) =E2=9C=97 make CC=3D"gcc"
$CAN_BUILD_X86_64 is [1]
=E2=9E=9C  sgx (next-20220210_) =E2=9C=97 make CC=3D"clang"
$CAN_BUILD_X86_64 is [1]
=E2=9E=9C  sgx (next-20220210_) =E2=9C=97 make CC=3D"ccache clang"
$CAN_BUILD_X86_64 is [1]


