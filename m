MIME-Version: 1.0
References: <CAHRSSExW6ig0=1Kx3jEM0mHEbh7W5G9yJGN0BxBfTiN9MBungA@mail.gmail.com>
 <CAH+k93HHKjOTCBjmDXDyAyW86KY66_bHjP6265sY1Fm3=TgVSg@mail.gmail.com>
 <CAH+k93EFwUw4KsKZirJKDOF=Xi8SCk80KyVYfJmFYxzLP69qJA@mail.gmail.com>
 <CAHRSSEw_3QEb6NS51LGN+FGjYeKma4=WO5kfjHrKM46+SofiEw@mail.gmail.com> <CAHRSSEz4n+=gAokMj4p5w++VDBPWic_rodvaUS-1eSp5rUpWNg@mail.gmail.com>
In-Reply-To: <CAHRSSEz4n+=gAokMj4p5w++VDBPWic_rodvaUS-1eSp5rUpWNg@mail.gmail.com>
From: Todd Kjos <tkjos@google.com>
Date: Wed, 21 Aug 2019 11:03:33 -0700
Message-ID: <CAHRSSExgOW4CWc_YfUQcx_sJYanBNTrLiNntt67zxcWUPudcjQ@mail.gmail.com>
Subject: Please add/remove android branches from kernelci + clang builds
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Matt Hart <matthew.hart@linaro.org>, Anmar Oueja <anmar.oueja@linaro.org>

4 requests related to android kernels (repo:
https://android.googlesource.com/kernel/common):

1) android-4.14 is being moved to android-4.14-r (currently mirrored
so testing can be moved to new branch)

delete: android-4.14
add: android-4.14-r

2) android-4.19 is being moved to android-4.19-r (currently mirrored
so testing can be moved to new branch)

delete: android-4.19
add: android-4.19-r

3) android-4.9 is obsolete

delete: android-4.19

4) Please add limited clang build testing of two branches

a) android-4.19-r arm64/x86_64 'allmodconfig'
b) android-mainline arm64/x86_64 'allmodconfig'

-Todd
