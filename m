Message-ID: <519c813b-0bf1-636b-df90-890e07d2ea4d@collabora.com>
Date: Mon, 27 Jun 2022 12:06:36 +0500
MIME-Version: 1.0
Subject: Re: [Bug Report] - kselftest build fails if output directory is first level sub-directory
References: <c25d7ea7-4f72-4a2b-d8c3-d317e64fcbbb@collabora.com>
 <CAK7LNATL4nMmKgrjS8meavnpn=HisD30QxuPUKDqtWWgbGcSZw@mail.gmail.com>
 <a9470bfc-bddc-6aa6-0043-d49eb57611fe@linuxfoundation.org>
From: "Usama" <usama.anjum@collabora.com>
In-Reply-To: <a9470bfc-bddc-6aa6-0043-d49eb57611fe@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-ID: <kernelci.groups.io>
To: Shuah Khan <skhan@linuxfoundation.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: usama.anjum@collabora.com, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Shuah Khan <shuah@kernel.org>, KERNEL SELFTEST FRAMEWORK <linux-kselftest@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "kernelci@groups.io" <kernelci@groups.io>

>> This problem starts from the bad design of the kselftest framework.
>> I did some research before. I think I can fix the root cause but
>> currently I do not have enough time to do it.
>>
>>
>> KBUILD_ABS_SRCTREE is a user-interface to request
>> Kbuild to use the absolute path.
>> If it is forced in the top Makefile, users have no way to
>> negate it.
>> It is true that using the absolute path is a quick work-around
>> because you do not need to care about the current working directory.
>>
>> If you insist on it,=C2=A0 just go ahead.=C2=A0 It is just two line chan=
ges.
>> Once the issue is fixed in a better way, your patch can be reverted
>> easily.
>>
> Why don't we work on fixing it the wright way? I would rather go that
> route than using short rem fixes.
>=20
> Usama, would you be interested in working on a proper fix as recommended
> by Masahiro?
I've made another attempt:
https://lore.kernel.org/lkml/20220627070214.432390-1-usama.anjum@collabora.=
com/

>=20
> thanks,
> -- Shuah

--=20
Muhammad Usama Anjum
