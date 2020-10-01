MIME-Version: 1.0
References: <20200707222342.scrz75265etaqlmd@redhat.com> <bbeeb467-1571-5404-7408-9b112d64e928@redhat.com>
 <CACT4Y+a1t-9sT7xz7d=Wmesnn_QoUqfipmoZXBu40_B+GQy=nQ@mail.gmail.com>
 <031d1941-2842-fc79-2a21-66bccb17f91c@redhat.com> <adb7924d-b524-2f86-05fd-dc0233004652@redhat.com>
 <CACT4Y+beU9XoOt5XXLEarKyWvkhyRKC5aJRc6djmHsUqO+AbJA@mail.gmail.com>
 <8d422dcf-d4ef-8e74-be82-f52272d9a966@redhat.com> <CACT4Y+a5spdA8TZNeaXFYj4QEw_=howfhu9YGsNm3rC8XPAJnA@mail.gmail.com>
 <d9919812-9763-9c02-3e5d-978fac8fe1f7@redhat.com> <CACT4Y+a3L+_8kpXq-WdNZxJESCvnCvfakJ3CymVwmZZA6kv+0w@mail.gmail.com>
 <CACT4Y+aFc7DoUBF=DLh2oBHy=3pKLACnhb3v88Tt4bkjarGUTg@mail.gmail.com>
 <CACT4Y+YR-Gv5NnTbs+04gjA7LABRnCidAkbE9_tE=YrGDgYL2Q@mail.gmail.com>
 <863511a8-090a-6ee1-ddce-f32d70458ee8@redhat.com> <CACT4Y+biFKO-Bauixm_DtEGTAUzHXTf0iXuFx1A=WTLmBhvSDg@mail.gmail.com>
 <1ff4a09c-4529-017c-5b0b-43712575771b@redhat.com> <16397F50C12D08DD.21243@groups.io>
 <CACT4Y+aqdTZ7r-tvFcajqcX5n7gO1RJ+9_vsbsYJPsypeYH3vQ@mail.gmail.com> <521cc33e-62fc-55c1-aeb2-682007243d97@redhat.com>
In-Reply-To: <521cc33e-62fc-55c1-aeb2-682007243d97@redhat.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Thu, 1 Oct 2020 17:01:35 +0200
Message-ID: <CACT4Y+Zet9NdAZ_bwAoKgpf-socRfwCf=-QQNFdXhKDMLzyZ-Q@mail.gmail.com>
Subject: Re: [kernelci-members] Working with the KernelCI project
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=C3=B1aki_Malerba?= <imalerba@redhat.com>

On Thu, Oct 1, 2020 at 12:48 PM Nikolai Kondrashov
<Nikolai.Kondrashov@redhat.com> wrote:
> * Could you move the "dashboard" link out of test's "output_files", and into
>    a "misc" field? It won't be presented as a link in Grafana unfortunately,
>    but "output_files" is for something which could be useful when downloaded
>    (and e.g. re-hosted by KCIDB), and the linked HTML doesn't seem to be.
>    Let's deal with the dashboard link issue in
>    https://github.com/kernelci/kcidb/issues/93

Any suggestions/precedents for the name?
dashboard_link? origin_link? master_link?
