Subject: Re: [kernelci-members] Working with the KernelCI project
References: <20200707222342.scrz75265etaqlmd@redhat.com>
 <42d15463-e4ee-4c0b-c63f-dce7acb05e35@collabora.com>
 <CACT4Y+ZLoBLFWRM+RcKZJyR2Hh5az9W8_329ShM9JuSg6V4uVw@mail.gmail.com>
 <bbeeb467-1571-5404-7408-9b112d64e928@redhat.com>
 <CACT4Y+a1t-9sT7xz7d=Wmesnn_QoUqfipmoZXBu40_B+GQy=nQ@mail.gmail.com>
 <031d1941-2842-fc79-2a21-66bccb17f91c@redhat.com>
 <adb7924d-b524-2f86-05fd-dc0233004652@redhat.com>
 <CACT4Y+beU9XoOt5XXLEarKyWvkhyRKC5aJRc6djmHsUqO+AbJA@mail.gmail.com>
 <8d422dcf-d4ef-8e74-be82-f52272d9a966@redhat.com>
 <CACT4Y+a5spdA8TZNeaXFYj4QEw_=howfhu9YGsNm3rC8XPAJnA@mail.gmail.com>
 <d9919812-9763-9c02-3e5d-978fac8fe1f7@redhat.com>
 <CACT4Y+a3L+_8kpXq-WdNZxJESCvnCvfakJ3CymVwmZZA6kv+0w@mail.gmail.com>
 <CACT4Y+aFc7DoUBF=DLh2oBHy=3pKLACnhb3v88Tt4bkjarGUTg@mail.gmail.com>
 <CACT4Y+YR-Gv5NnTbs+04gjA7LABRnCidAkbE9_tE=YrGDgYL2Q@mail.gmail.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <863511a8-090a-6ee1-ddce-f32d70458ee8@redhat.com>
Date: Mon, 28 Sep 2020 20:16:11 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+YR-Gv5NnTbs+04gjA7LABRnCidAkbE9_tE=YrGDgYL2Q@mail.gmail.com>
Content-Type: multipart/mixed; boundary="Groupsio=6i5xCrL5Fc3GcuHC03ka"
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>

--Groupsio=6i5xCrL5Fc3GcuHC03ka
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/20 7:24 PM, Dmitry Vyukov wrote:
 > I've submitted the following json to the pubsub endpoint, and it seems
 > to succeed as I got server message ID back: 1592574115213643

Weeeell, the message ID is only a confirmation that the message reached the
queue, we could still fail after taking it out of the queue :)

The PubSub protocol (or any message queue for that matter) simply doesn't
provide a way to report on how the message was used on the other end.

 > But I can't find this entry on the dashboard, among other places I've looked at:
 > https://staging.kernelci.org:3000/d/home/home?orgId=1&from=now-30m&to=now&var-origin=syzbot&var-git_repository_url=All&var-dataset=playground_kernelci04&refresh=30m
 > Wasn't it submitted? Or am I looking in  a wrong place? Or is there some log?

It was submitted, but it wasn't valid according to the schema.

As I said earlier, we haven't implemented sending server-side errors to
submitters yet, although I have some ideas how that could be done.

So, to minimize the errors on the server side, please make sure to validate
your JSON before submitting. You can take the schema produced by kcidb-schema
and use it with a Go module for JSON validation. Apparently there are at least
three of them: https://json-schema.org/implementations.html#validator-go

For the start, though, you can also use "kcidb-validate". Its output is
somewhat more verbose than it should be, and we're working on that, but if you
feed the JSON you sent to it like this:

     kcidb-validate < syzbot.json

somewhere closer to the end of the output you'll find:

     ValidationError: None is not of type 'array'

     Failed validating 'type' in schema['properties']['revisions']['items']['properties']['patch_mboxes']:

It basically says that it didn't expect to find "null" as the value for the
"patch_mboxes" property.

In general "null"s are not accepted by the schema, to minimize ambiguity and
the number of checks when interpreting the data. If you want to omit any data,
just don't add the corresponding property.

Other errors are:

* "message_id" is specified as an empty string, but it should be an e-mail
   address. Just omit the property if you have nothing to send.
* "publishing_time" is an empty string and not an RFC3339 timestamp. Again,
   just omit it, if you don't have it.
* "log_url" should be a URL, but is an empty string. Same approach.

After the above is fixed, the file will validate. However, there are still
issues of the same sort - empty properties, which would be good to just
remove: "command", "config_name", "description", "git_commit_name",
"tree_name". Perhaps we should make the schema check those as well.

I've fixed all of the issues in the JSON you provided and attached it as
"syzbot_fixed.json".

Hope that helps!
Nick

Note to self: mention the property-omission approach explicitly in the docs
               https://github.com/kernelci/kcidb/issues/123

On 9/28/20 7:24 PM, Dmitry Vyukov wrote:
 > On Mon, Sep 28, 2020 at 6:09 PM Dmitry Vyukov <dvyukov@google.com> wrote:
 >>
 >> On Mon, Sep 28, 2020 at 5:23 PM Dmitry Vyukov <dvyukov@google.com> wrote:
 >>>
 >>> On Mon, Sep 28, 2020 at 3:16 PM Nikolai Kondrashov
 >>> <Nikolai.Kondrashov@redhat.com> wrote:
 >>>>
 >>>> Hi Dmitry,
 >>>>
 >>>> On 9/28/20 3:48 PM, Dmitry Vyukov wrote:
 >>>>   > The examples are helpful. I think this should be doable. The ability
 >>>>   > to send everything in a single request is handy, and since we don't
 >>>>   > send bulky data (only links), should not cause any issues.
 >>>>
 >>>> Awesome!
 >>>>
 >>>>   > I need an API key, right? How are they distributed? Could you send me
 >>>>   > one to my email privately?
 >>>>
 >>>> Yep, just sent it.
 >>>>
 >>>>   > However, we don't use any Python and use of kcidb-submit will be
 >>>>   > problematic as the app is a Go App Engine app.
 >>>>
 >>>> Do you mean you can't run executables, or that having the Python stack in
 >>>> there as well is not possible/burdensome? Just curious.
 >>>
 >>> Appengine is what's called "serverless" today. There are no servers,
 >>> filesystem, custom binaries. I just upload a set of source Go files
 >>> and Appengine takes care of the rest. So there is no way to deploy a
 >>> custom binary written in a different language.
 >>>
 >>>
 >>>>   > I looked what's the actual protocol and got to here:
 >>>>   > https://github.com/kernelci/kcidb/blob/master/kcidb/mq/__init__.py#L69
 >>>>   > and this "client" seems to come from google.cloud.pubsub.
 >>>>   >
 >>>>   > Go has https://pkg.go.dev/cloud.google.com/go/pubsub package as well,
 >>>>   > it would be much more practical for syzbot to use that directly. But
 >>>>   > what exactly is the protocol? I assume it's that JSON, but is it
 >>>>   > wrapped into some other layers? What's the topic name to publish? Is
 >>>>   > there description/example on this level?
 >>>>
 >>>> There's no documentation available for this level, yet, just the code.
 >>>>
 >>>> However, yes, it's just JSON submitted to a PubSub topic, currently, and the
 >>>> schema is exactly as output by "kcidb-schema".
 >>>>
 >>>> Please validate JSON fully before submitting to the PubSub topic
 >>>> ("kcidb-validate" could help you start). We don't have error reporting to
 >>>> submitters from the server side yet, we'll have to read the logs to find out
 >>>> what happened, if it breaks :)
 >>>>
 >>>> I sent you the project/topic names in the message with the credentials.
 >>>>
 >>>> Oh, and we would definitely appreciate a contribution of the Go submission
 >>>> module, if you make one :)
 >>>>
 >>>>   > Also, how can I test things? Is there a test instance? Or if I push
 >>>>   > something, can I observe it on the KernelCI dashboard or something?
 >>>>
 >>>> Yes, there's a "playground" instance, details are in the message with the
 >>>> credentials. You can see the results on the "playground" dashboard, and query
 >>>> them from the "playground" database with "kcidb-query".
 >>>>
 >>>>   > What would be the procedure for deploying it on the syzbot side?
 >>>>
 >>>> Do you mean "deploying the dashboard"?
 >>>
 >>> I meant when/how do we deploy this uploading to production. I mean if
 >>> I do a prototype and it works with a playground, what's next?
 >>> ... answering my own question, I guess we can make production syzbot
 >>> upload to the playground kcidb first and then see how it works. If it
 >>> works well, then we can switch to production kcidb.
 >>>
 >>>
 >>>
 >>> I have a question re schema. You mentioned "incidents" above. But I
 >>> don't see them in the kcidb-schema output.
 >>
 >> There are no "issues" either...
 >> Here is what I've got from kcidb-schema (on latest checkout):
 >> https://gist.githubusercontent.com/dvyukov/a067b63e74399201df921d3846241c82/raw/3f3aa708bbb24f530d49f767a8006f7a51826a80/gistfile1.txt
 >
 > I've submitted the following json to the pubsub endpoint, and it seems
 > to succeed as I got server message ID back: 1592574115213643
 > But I can't find this entry on the dashboard, among other places I've looked at:
 > https://staging.kernelci.org:3000/d/home/home?orgId=1&from=now-30m&to=now&var-origin=syzbot&var-git_repository_url=All&var-dataset=playground_kernelci04&refresh=30m
 > Wasn't it submitted? Or am I looking in  a wrong place? Or is there some log?
 >
 > {
 >    "builds": [
 >      {
 >        "architecture": "x86_64",
 >        "command": "",
 >        "compiler": "gcc (GCC) 9.0.0 20181231 (experimental)",
 >        "config_name": "",
 >        "config_url":
 > "https://syzkaller.appspot.com/text?tag=KernelConfig\u0026x=d195fe572fb15312",
 >        "description": "",
 >        "duration": 0,
 >        "id": "syzkaller:d195fe572fb15355",
 >        "input_files": null,
 >        "log_url": "",
 >        "misc": null,
 >        "origin": "syzbot",
 >        "output_files": null,
 >        "revision_id": "7ae77150d94d3b535c7b85e6b3647113095e7900",
 >        "start_time": "2020-06-25T03:21:48+00:00",
 >        "valid": true
 >      }
 >    ],
 >    "revisions": [
 >      {
 >        "contacts": null,
 >        "description": "",
 >        "discovery_time": "2020-06-25T03:21:48+00:00",
 >        "git_commit_hash": "7ae77150d94d3b535c7b85e6b3647113095e7900",
 >        "git_commit_name": "",
 >        "git_repository_branch": "master",
 >        "git_repository_url":
 > "https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git",
 >        "id": "7ae77150d94d3b535c7b85e6b3647113095e7900",
 >        "log_url": "",
 >        "message_id": "",
 >        "misc": null,
 >        "origin": "syzbot",
 >        "patch_mboxes": null,
 >        "publishing_time": "",
 >        "tree_name": "",
 >        "valid": true
 >      }
 >    ],
 >    "tests": [
 >      {
 >        "build_id": "syzkaller:d195fe572fb15355",
 >        "description": "",
 >        "duration": 0,
 >        "environment": null,
 >        "id": "syzkaller:d195fe572fb15366",
 >        "misc": null,
 >        "origin": "syzbot",
 >        "output_files": [
 >          {
 >            "name": "log.txt",
 >            "url":
 > "https://syzkaller.appspot.com/text?tag=CrashLog\u0026x=137c5419100000"
 >          },
 >          {
 >            "name": "report.txt",
 >            "url":
 > "https://syzkaller.appspot.com/text?tag=CrashReport\u0026x=1543f44b100000"
 >          },
 >          {
 >            "name": "repro.syz.txt",
 >            "url":
 > "https://syzkaller.appspot.com/text?tag=ReproSyz\u0026x=12941c03100000"
 >          },
 >          {
 >            "name": "repro.c",
 >            "url":
 > "https://syzkaller.appspot.com/text?tag=ReproC\u0026x=12002cf9100000"
 >          }
 >        ],
 >        "path": "syzkaller",
 >        "start_time": "2020-06-25T03:21:48+00:00",
 >        "status": "FAIL",
 >        "waived": false
 >      }
 >    ],
 >    "version": {
 >      "major": 3,
 >      "minor": 0
 >    }
 > }
 >


--Groupsio=6i5xCrL5Fc3GcuHC03ka
Content-Type: application/json;
 name="syzbot_fixed.json"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="syzbot_fixed.json"

ewogICJidWlsZHMiOiBbCiAgICB7CiAgICAgICJhcmNoaXRlY3R1cmUiOiAieDg2XzY0IiwKICAg
ICAgImNvbXBpbGVyIjogImdjYyAoR0NDKSA5LjAuMCAyMDE4MTIzMSAoZXhwZXJpbWVudGFsKSIs
CiAgICAgICJjb25maWdfdXJsIjoKImh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3RleHQ/
dGFnPUtlcm5lbENvbmZpZ1x1MDAyNng9ZDE5NWZlNTcyZmIxNTMxMiIsCiAgICAgICJkdXJhdGlv
biI6IDAsCiAgICAgICJpZCI6ICJzeXprYWxsZXI6ZDE5NWZlNTcyZmIxNTM1NSIsCiAgICAgICJv
cmlnaW4iOiAic3l6Ym90IiwKICAgICAgInJldmlzaW9uX2lkIjogIjdhZTc3MTUwZDk0ZDNiNTM1
YzdiODVlNmIzNjQ3MTEzMDk1ZTc5MDAiLAogICAgICAic3RhcnRfdGltZSI6ICIyMDIwLTA2LTI1
VDAzOjIxOjQ4KzAwOjAwIiwKICAgICAgInZhbGlkIjogdHJ1ZQogICAgfQogIF0sCiAgInJldmlz
aW9ucyI6IFsKICAgIHsKICAgICAgImRpc2NvdmVyeV90aW1lIjogIjIwMjAtMDYtMjVUMDM6MjE6
NDgrMDA6MDAiLAogICAgICAiZ2l0X2NvbW1pdF9oYXNoIjogIjdhZTc3MTUwZDk0ZDNiNTM1Yzdi
ODVlNmIzNjQ3MTEzMDk1ZTc5MDAiLAogICAgICAiZ2l0X3JlcG9zaXRvcnlfYnJhbmNoIjogIm1h
c3RlciIsCiAgICAgICJnaXRfcmVwb3NpdG9yeV91cmwiOgoiaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0IiwKICAgICAgImlk
IjogIjdhZTc3MTUwZDk0ZDNiNTM1YzdiODVlNmIzNjQ3MTEzMDk1ZTc5MDAiLAogICAgICAib3Jp
Z2luIjogInN5emJvdCIsCiAgICAgICJ2YWxpZCI6IHRydWUKICAgIH0KICBdLAogICJ0ZXN0cyI6
IFsKICAgIHsKICAgICAgImJ1aWxkX2lkIjogInN5emthbGxlcjpkMTk1ZmU1NzJmYjE1MzU1IiwK
ICAgICAgImR1cmF0aW9uIjogMCwKICAgICAgImlkIjogInN5emthbGxlcjpkMTk1ZmU1NzJmYjE1
MzY2IiwKICAgICAgIm9yaWdpbiI6ICJzeXpib3QiLAogICAgICAib3V0cHV0X2ZpbGVzIjogWwog
ICAgICAgIHsKICAgICAgICAgICJuYW1lIjogImxvZy50eHQiLAogICAgICAgICAgInVybCI6CiJo
dHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS90ZXh0P3RhZz1DcmFzaExvZ1x1MDAyNng9MTM3
YzU0MTkxMDAwMDAiCiAgICAgICAgfSwKICAgICAgICB7CiAgICAgICAgICAibmFtZSI6ICJyZXBv
cnQudHh0IiwKICAgICAgICAgICJ1cmwiOgoiaHR0cHM6Ly9zeXprYWxsZXIuYXBwc3BvdC5jb20v
dGV4dD90YWc9Q3Jhc2hSZXBvcnRcdTAwMjZ4PTE1NDNmNDRiMTAwMDAwIgogICAgICAgIH0sCiAg
ICAgICAgewogICAgICAgICAgIm5hbWUiOiAicmVwcm8uc3l6LnR4dCIsCiAgICAgICAgICAidXJs
IjoKImh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL3RleHQ/dGFnPVJlcHJvU3l6XHUwMDI2
eD0xMjk0MWMwMzEwMDAwMCIKICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICJuYW1lIjog
InJlcHJvLmMiLAogICAgICAgICAgInVybCI6CiJodHRwczovL3N5emthbGxlci5hcHBzcG90LmNv
bS90ZXh0P3RhZz1SZXByb0NcdTAwMjZ4PTEyMDAyY2Y5MTAwMDAwIgogICAgICAgIH0KICAgICAg
XSwKICAgICAgInBhdGgiOiAic3l6a2FsbGVyIiwKICAgICAgInN0YXJ0X3RpbWUiOiAiMjAyMC0w
Ni0yNVQwMzoyMTo0OCswMDowMCIsCiAgICAgICJzdGF0dXMiOiAiRkFJTCIsCiAgICAgICJ3YWl2
ZWQiOiBmYWxzZQogICAgfQogIF0sCiAgInZlcnNpb24iOiB7CiAgICAibWFqb3IiOiAzLAogICAg
Im1pbm9yIjogMAogIH0KfQo=

--Groupsio=6i5xCrL5Fc3GcuHC03ka--
