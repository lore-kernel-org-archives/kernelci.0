Subject: Re: [kernelci-members] Working with the KernelCI project
References: <20200707222342.scrz75265etaqlmd@redhat.com>
 <863511a8-090a-6ee1-ddce-f32d70458ee8@redhat.com>
 <CACT4Y+biFKO-Bauixm_DtEGTAUzHXTf0iXuFx1A=WTLmBhvSDg@mail.gmail.com>
 <1ff4a09c-4529-017c-5b0b-43712575771b@redhat.com>
 <16397F50C12D08DD.21243@groups.io>
 <CACT4Y+aqdTZ7r-tvFcajqcX5n7gO1RJ+9_vsbsYJPsypeYH3vQ@mail.gmail.com>
 <521cc33e-62fc-55c1-aeb2-682007243d97@redhat.com>
 <ff5139e8-b8e5-93dc-9654-d53e4888c2bc@redhat.com>
 <CACT4Y+Y561P7oJYYNn7XuqieTS-dJmaFH+NTS7OzRi=X_STD3w@mail.gmail.com>
 <ac531987-4600-f48c-4fe6-8a1abd8ccf51@gmail.com>
 <8c580a6a-e24e-4c67-5202-ec35612094f3@redhat.com>
 <CACT4Y+bO_FZsDkrBh2LtxQ+QyxXP5S7e+szO-HYxuj=GyKjUMA@mail.gmail.com>
 <9123a571-721b-5c1b-367e-e028acec4096@redhat.com>
 <CACT4Y+Z=ipTEY1VHkwZcnoegU1VOTJN2G6rzZTpPqnPS_ze5CA@mail.gmail.com>
 <CACT4Y+ZaAJMAwQT=BStb936bDbe68V6mXQw29cHGzb_9712TbA@mail.gmail.com>
 <6aab4595-8b16-50a9-81ca-78bd08ff7a33@redhat.com>
 <CACT4Y+aok+-h_pBM4ga-rfo8647Sp2cVBT8k34t8jqNR-vjz8A@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <616ea4fc-e08a-cde5-88f4-8e2b71a752bf@redhat.com>
Date: Fri, 2 Oct 2020 13:39:56 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aok+-h_pBM4ga-rfo8647Sp2cVBT8k34t8jqNR-vjz8A@mail.gmail.com>
Content-Type: multipart/mixed; boundary="Groupsio=wVWWYALXZ2iwvG5yKCWS"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, dvyukov@google.com
Cc: Nikolai Kondrashov <spbnick@gmail.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>

--Groupsio=wVWWYALXZ2iwvG5yKCWS
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/20 12:02 PM, Dmitry Vyukov via groups.io wrote:
 > On Fri, Oct 2, 2020 at 10:12 AM Nikolai Kondrashov
 > <Nikolai.Kondrashov@redhat.com> wrote:
 >>
 >> On 10/2/20 10:52 AM, Dmitry Vyukov wrote:
 >>   > On Thu, Oct 1, 2020 at 7:02 PM Dmitry Vyukov <dvyukov@google.com> wrote:
 >>   >> The switch involves just changing the topic to "kernelci_new", right?
 >>   >
 >>   > I am preparing for the switch and will do it unless I hear from you soon.
 >>   > Since you already gave green light above, I assume we are good now.
 >>
 >> Yes, please go ahead :)!
 >
 > We are live!
 > https://staging.kernelci.org:3000/d/home/home?orgId=1&var-origin=syzbot&var-dataset=kernelci04&from=now-90d&to=now

We got a weird report (attached), could you take a look?
It doesn't validate, and the data doesn't make much sense.

Nick

--Groupsio=wVWWYALXZ2iwvG5yKCWS
Content-Type: application/json;
 name="165.data.json"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="165.data.json"

ewogICJyZXZpc2lvbnMiOiBbCiAgICB7CiAgICAgICJkaXNjb3ZlcnlfdGltZSI6ICIyMDIwLTA5
LTIzVDA2OjM2OjM4WiIsCiAgICAgICJnaXRfcmVwb3NpdG9yeV9icmFuY2giOiAibWFzdGVyIiwK
ICAgICAgImdpdF9yZXBvc2l0b3J5X3VybCI6ICJodHRwczovL2dpdGh1Yi5jb20vZ29vZ2xlL3N5
emthbGxlci5naXQiLAogICAgICAiaWQiOiAiIiwKICAgICAgIm9yaWdpbiI6ICJzeXpib3QiLAog
ICAgICAicHVibGlzaGluZ190aW1lIjogIjAwMDEtMDEtMDFUMDA6MDA6MDBaIiwKICAgICAgInZh
bGlkIjogdHJ1ZQogICAgfQogIF0sCiAgImJ1aWxkcyI6IFsKICAgIHsKICAgICAgImFyY2hpdGVj
dHVyZSI6ICJ4ODZfNjQiLAogICAgICAiY29tcGlsZXIiOiAiZ28gdmVyc2lvbiBnbzEuMTQuMyBs
aW51eC9hbWQ2NCIsCiAgICAgICJpZCI6ICJzeXpib3Q6ZDk4M2YzMDU5ZTI4ZmQ1ZWI0NThlYmQ0
OTFlZGNlYjRmZGU4MjcyNyIsCiAgICAgICJvcmlnaW4iOiAic3l6Ym90IiwKICAgICAgInJldmlz
aW9uX2lkIjogIiIsCiAgICAgICJzdGFydF90aW1lIjogIjIwMjAtMDktMjNUMDY6MzY6MzhaIiwK
ICAgICAgInZhbGlkIjogdHJ1ZQogICAgfQogIF0sCiAgInRlc3RzIjogWwogICAgewogICAgICAi
YnVpbGRfaWQiOiAic3l6Ym90OmQ5ODNmMzA1OWUyOGZkNWViNDU4ZWJkNDkxZWRjZWI0ZmRlODI3
MjciLAogICAgICAiZGVzY3JpcHRpb24iOiAic3l6a2FsbGVyOiB0ZXN0aW5nIGZhaWxlZDogZmFp
bGVkIHRvIHJ1biBbXCJnb1wiIFwidGVzdFwiIFwiLXNob3J0XCIgXCIuLy4uLlwiXTogZXhpdCBz
dGF0dXMgMSAoMikiLAogICAgICAiaWQiOiAic3l6Ym90OmY5OTIyZDM3NWM0ZWVkY2E5NzdlIiwK
ICAgICAgIm1pc2MiOiB7CiAgICAgICAgIm9yaWdpbl91cmwiOiAiaHR0cHM6Ly9zeXprYWxsZXIu
YXBwc3BvdC5jb20vYnVnP2V4dGlkPWY5OTIyZDM3NWM0ZWVkY2E5NzdlIiwKICAgICAgICAicmVw
b3J0ZWRfYnkiOiAic3l6Ym90K2Y5OTIyZDM3NWM0ZWVkY2E5NzdlQHN5emthbGxlci5hcHBzcG90
bWFpbC5jb20iCiAgICAgIH0sCiAgICAgICJvcmlnaW4iOiAic3l6Ym90IiwKICAgICAgIm91dHB1
dF9maWxlcyI6IFsKICAgICAgICB7CiAgICAgICAgICAibmFtZSI6ICJsb2cudHh0IiwKICAgICAg
ICAgICJ1cmwiOiAiaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20veC9sb2cudHh0P3g9MTIz
MzYyYzM5MDAwMDAiCiAgICAgICAgfQogICAgICBdLAogICAgICAicGF0aCI6ICJzeXprYWxsZXIi
LAogICAgICAic3RhcnRfdGltZSI6ICIyMDIwLTA5LTIzVDA2OjM2OjM4WiIsCiAgICAgICJzdGF0
dXMiOiAiRkFJTCIsCiAgICAgICJ3YWl2ZWQiOiBmYWxzZQogICAgfQogIF0sCiAgInZlcnNpb24i
OiB7CiAgICAibWFqb3IiOiAzLAogICAgIm1pbm9yIjogMAogIH0KfQo=

--Groupsio=wVWWYALXZ2iwvG5yKCWS--
