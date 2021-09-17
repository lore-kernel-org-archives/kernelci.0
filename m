MIME-Version: 1.0
References: <73b0f3cd-a382-4f77-1d2e-e081e4e05cc2@redhat.com>
In-Reply-To: <73b0f3cd-a382-4f77-1d2e-e081e4e05cc2@redhat.com>
From: "Dmitry Vyukov" <dvyukov@google.com>
Date: Fri, 17 Sep 2021 17:49:21 +0200
Message-ID: <CACT4Y+YKgm63c8idp0o=3y1SZKOWzx4nqYduCcz78p1W5L8iew@mail.gmail.com>
Subject: Re: Syzbot sends URLs in config names to KCIDB
Content-Type: multipart/mixed; boundary="Groupsio=Fa3sYQxHBfcVYCiRIDPk"
List-ID: <kernelci.groups.io>
To: Nikolai Kondrashov <Nikolai.Kondrashov@redhat.com>
Cc: kernelci@groups.io, syzkaller <syzkaller@googlegroups.com>

--Groupsio=Fa3sYQxHBfcVYCiRIDPk
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Sept 2021 at 17:45, Nikolai Kondrashov
<Nikolai.Kondrashov@redhat.com> wrote:
>
> Hi Dmitry,
>
> I've just noticed, but Syzbot has been sending URLs in build "config_name"
> fields for a while (see attached example), whereas the field is intended for a
> descriptive, human-readable name instead.
>
> Do you think you could fix that?
>
> Thank you.
> Nick

Hi Nick,

The attached info does not look like info from syzbot. It does not use
tuxbuild. That's somebody else.

--Groupsio=Fa3sYQxHBfcVYCiRIDPk
Content-Type: application/json; name="365.data.json"
Content-Disposition: attachment; filename="365.data.json"
Content-Transfer-Encoding: base64
Content-ID: <17bf4722602c3bef3f02>
X-Attachment-Id: 17bf4722602c3bef3f02

ewogICJyZXZpc2lvbnMiOiBbCiAgICB7CiAgICAgICJpZCI6ICI1MmM3YjcyNzU4MWZlNzI1Zjhi
OGEyODNhZjIxZmUwNjUxYzczYzQ4IiwKICAgICAgIm9yaWdpbiI6ICJ0dXhzdWl0ZSIsCiAgICAg
ICJnaXRfcmVwb3NpdG9yeV91cmwiOiAiaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdCIsCiAgICAgICJnaXRfY29tbWl0X2hh
c2giOiAiNTJjN2I3Mjc1ODFmZTcyNWY4YjhhMjgzYWYyMWZlMDY1MWM3M2M0OCIsCiAgICAgICJn
aXRfY29tbWl0X25hbWUiOiAibmV4dC0yMDIxMDgzMSIsCiAgICAgICJkaXNjb3ZlcnlfdGltZSI6
ICIyMDIxLTA4LTMxVDEyOjA3OjM1KzAwOjAwIiwKICAgICAgInZhbGlkIjogdHJ1ZSwKICAgICAg
ImdpdF9yZXBvc2l0b3J5X2JyYW5jaCI6ICJtYXN0ZXIiCiAgICB9CiAgXSwKICAiYnVpbGRzIjog
WwogICAgewogICAgICAiaWQiOiAidHV4c3VpdGU6MXhVWlcyRVlJMUs4VmFTVjNXSUxVZGxVN2VX
IiwKICAgICAgInJldmlzaW9uX2lkIjogIjUyYzdiNzI3NTgxZmU3MjVmOGI4YTI4M2FmMjFmZTA2
NTFjNzNjNDgiLAogICAgICAib3JpZ2luIjogInR1eHN1aXRlIiwKICAgICAgImFyY2hpdGVjdHVy
ZSI6ICJhcm0iLAogICAgICAiY29tcGlsZXIiOiAiRGViaWFuIGNsYW5nIHZlcnNpb24gMTMuMC4w
LSsrMjAyMTA3MTUwOTM1MTErYWZjNzYwZWYzNTI3LTF+ZXhwMSIsCiAgICAgICJjb25maWdfbmFt
ZSI6ICJodHRwczovL3NyYy5mZWRvcmFwcm9qZWN0Lm9yZy9ycG1zL2tlcm5lbC9yYXcvcmF3aGlk
ZS9mL2tlcm5lbC1hcm12N2hsLWZlZG9yYS5jb25maWcrIiwKICAgICAgImNvbmZpZ191cmwiOiAi
aHR0cHM6Ly9idWlsZHMudHV4YnVpbGQuY29tLzF4VVpXMkVZSTFLOFZhU1YzV0lMVWRsVTdlVy9j
b25maWciLAogICAgICAibG9nX3VybCI6ICJodHRwczovL2J1aWxkcy50dXhidWlsZC5jb20vMXhV
WlcyRVlJMUs4VmFTVjNXSUxVZGxVN2VXL2J1aWxkLmxvZyIsCiAgICAgICJzdGFydF90aW1lIjog
IjIwMjEtMDgtMzFUMTI6MDc6MzUrMDA6MDAiLAogICAgICAidmFsaWQiOiBmYWxzZQogICAgfQog
IF0sCiAgInZlcnNpb24iOiB7CiAgICAibWFqb3IiOiAzLAogICAgIm1pbm9yIjogMAogIH0KfQo=

--Groupsio=Fa3sYQxHBfcVYCiRIDPk--
