Subject: Re: [kernelci-members] Working with the KernelCI project
References: <20200707222342.scrz75265etaqlmd@redhat.com>
 <CACT4Y+beU9XoOt5XXLEarKyWvkhyRKC5aJRc6djmHsUqO+AbJA@mail.gmail.com>
 <8d422dcf-d4ef-8e74-be82-f52272d9a966@redhat.com>
 <CACT4Y+a5spdA8TZNeaXFYj4QEw_=howfhu9YGsNm3rC8XPAJnA@mail.gmail.com>
 <d9919812-9763-9c02-3e5d-978fac8fe1f7@redhat.com>
 <CACT4Y+a3L+_8kpXq-WdNZxJESCvnCvfakJ3CymVwmZZA6kv+0w@mail.gmail.com>
 <CACT4Y+aFc7DoUBF=DLh2oBHy=3pKLACnhb3v88Tt4bkjarGUTg@mail.gmail.com>
 <CACT4Y+YR-Gv5NnTbs+04gjA7LABRnCidAkbE9_tE=YrGDgYL2Q@mail.gmail.com>
 <863511a8-090a-6ee1-ddce-f32d70458ee8@redhat.com>
 <CACT4Y+biFKO-Bauixm_DtEGTAUzHXTf0iXuFx1A=WTLmBhvSDg@mail.gmail.com>
 <1ff4a09c-4529-017c-5b0b-43712575771b@redhat.com>
 <16397F50C12D08DD.21243@groups.io>
 <CACT4Y+aqdTZ7r-tvFcajqcX5n7gO1RJ+9_vsbsYJPsypeYH3vQ@mail.gmail.com>
 <521cc33e-62fc-55c1-aeb2-682007243d97@redhat.com>
 <ff5139e8-b8e5-93dc-9654-d53e4888c2bc@redhat.com>
 <CACT4Y+Y561P7oJYYNn7XuqieTS-dJmaFH+NTS7OzRi=X_STD3w@mail.gmail.com>
 <ac531987-4600-f48c-4fe6-8a1abd8ccf51@gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <8c580a6a-e24e-4c67-5202-ec35612094f3@redhat.com>
Date: Thu, 1 Oct 2020 18:51:58 +0300
MIME-Version: 1.0
In-Reply-To: <ac531987-4600-f48c-4fe6-8a1abd8ccf51@gmail.com>
Content-Type: multipart/mixed; boundary="Groupsio=lIA4W89g4seoDop5PaYM"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <spbnick@gmail.com>, kernelci@groups.io, dvyukov@google.com
Cc: Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>

--Groupsio=lIA4W89g4seoDop5PaYM
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On 10/1/20 6:49 PM, Nikolai Kondrashov wrote:
> On 10/1/20 5:48 PM, Dmitry Vyukov via groups.io wrote:
>  > On Thu, Oct 1, 2020 at 3:32 PM Nikolai Kondrashov
>  > <Nikolai.Kondrashov@redhat.com> wrote:
>  >>
>  >> On 10/1/20 1:48 PM, Nikolai Kondrashov wrote:
>  >>   > Here are the things which could be improved:
>  >>
>  >> Oh, and another thing: could you avoid re-sending the identical
>  >> revisions/builds you've already sent? I.e. send them only once, unless you
>  >> have fields to add? Each of those costs us a row in the database, which is not
>  >> a big deal, but would be good to avoid.
>  >
>  > Do you see that we send dups? I've added logic to not send dups and
>  > from what I see it's working.
> 
> Please find attached a zip archive with seven submissions from about six hours
> ago. Each has revisions with the same id and git_commit_hash. Some of those
> revisions have different discovery_time, and that alone shouldn't really be
> the reason to resend. Each of those submissions have a build object, but some
> of them are repeated.
> 
> Revision with that git_commit_hash was submitted at least 72 times.

And now the file is attached :D

--Groupsio=lIA4W89g4seoDop5PaYM
Content-Type: application/gzip;
 name="commit_hash_dups.tar.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="commit_hash_dups.tar.gz"

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

--Groupsio=lIA4W89g4seoDop5PaYM--
