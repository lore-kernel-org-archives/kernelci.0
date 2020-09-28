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
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <b8fb521b-de27-bf1b-0b8a-a5c4ae214f2f@redhat.com>
Date: Mon, 28 Sep 2020 19:50:37 +0300
MIME-Version: 1.0
In-Reply-To: <CACT4Y+aFc7DoUBF=DLh2oBHy=3pKLACnhb3v88Tt4bkjarGUTg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: kernelci@groups.io, Guillaume Tucker <guillaume.tucker@collabora.com>, Philip Li <philip.li@intel.com>, kernelci-members@groups.io, nkondras@redhat.com, Don Zickus <dzickus@redhat.com>, syzkaller <syzkaller@googlegroups.com>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>

On 9/28/20 7:09 PM, Dmitry Vyukov wrote:
 > There are no "issues" either...
 > Here is what I've got from kcidb-schema (on latest checkout):
 > https://gist.githubusercontent.com/dvyukov/a067b63e74399201df921d3846241c82/raw/3f3aa708bbb24f530d49f767a8006f7a51826a80/gistfile1.txt

Yes, sorry about that, when I get to them, I'll implement support for both
"issues" and "incidents".

Nick

On 9/28/20 7:09 PM, Dmitry Vyukov wrote:
 > On Mon, Sep 28, 2020 at 5:23 PM Dmitry Vyukov <dvyukov@google.com> wrote:
 >>
 >> On Mon, Sep 28, 2020 at 3:16 PM Nikolai Kondrashov
 >> <Nikolai.Kondrashov@redhat.com> wrote:
 >>>
 >>> Hi Dmitry,
 >>>
 >>> On 9/28/20 3:48 PM, Dmitry Vyukov wrote:
 >>>   > The examples are helpful. I think this should be doable. The ability
 >>>   > to send everything in a single request is handy, and since we don't
 >>>   > send bulky data (only links), should not cause any issues.
 >>>
 >>> Awesome!
 >>>
 >>>   > I need an API key, right? How are they distributed? Could you send me
 >>>   > one to my email privately?
 >>>
 >>> Yep, just sent it.
 >>>
 >>>   > However, we don't use any Python and use of kcidb-submit will be
 >>>   > problematic as the app is a Go App Engine app.
 >>>
 >>> Do you mean you can't run executables, or that having the Python stack in
 >>> there as well is not possible/burdensome? Just curious.
 >>
 >> Appengine is what's called "serverless" today. There are no servers,
 >> filesystem, custom binaries. I just upload a set of source Go files
 >> and Appengine takes care of the rest. So there is no way to deploy a
 >> custom binary written in a different language.
 >>
 >>
 >>>   > I looked what's the actual protocol and got to here:
 >>>   > https://github.com/kernelci/kcidb/blob/master/kcidb/mq/__init__.py#L69
 >>>   > and this "client" seems to come from google.cloud.pubsub.
 >>>   >
 >>>   > Go has https://pkg.go.dev/cloud.google.com/go/pubsub package as well,
 >>>   > it would be much more practical for syzbot to use that directly. But
 >>>   > what exactly is the protocol? I assume it's that JSON, but is it
 >>>   > wrapped into some other layers? What's the topic name to publish? Is
 >>>   > there description/example on this level?
 >>>
 >>> There's no documentation available for this level, yet, just the code.
 >>>
 >>> However, yes, it's just JSON submitted to a PubSub topic, currently, and the
 >>> schema is exactly as output by "kcidb-schema".
 >>>
 >>> Please validate JSON fully before submitting to the PubSub topic
 >>> ("kcidb-validate" could help you start). We don't have error reporting to
 >>> submitters from the server side yet, we'll have to read the logs to find out
 >>> what happened, if it breaks :)
 >>>
 >>> I sent you the project/topic names in the message with the credentials.
 >>>
 >>> Oh, and we would definitely appreciate a contribution of the Go submission
 >>> module, if you make one :)
 >>>
 >>>   > Also, how can I test things? Is there a test instance? Or if I push
 >>>   > something, can I observe it on the KernelCI dashboard or something?
 >>>
 >>> Yes, there's a "playground" instance, details are in the message with the
 >>> credentials. You can see the results on the "playground" dashboard, and query
 >>> them from the "playground" database with "kcidb-query".
 >>>
 >>>   > What would be the procedure for deploying it on the syzbot side?
 >>>
 >>> Do you mean "deploying the dashboard"?
 >>
 >> I meant when/how do we deploy this uploading to production. I mean if
 >> I do a prototype and it works with a playground, what's next?
 >> ... answering my own question, I guess we can make production syzbot
 >> upload to the playground kcidb first and then see how it works. If it
 >> works well, then we can switch to production kcidb.
 >>
 >>
 >>
 >> I have a question re schema. You mentioned "incidents" above. But I
 >> don't see them in the kcidb-schema output.
 >
 > There are no "issues" either...
 > Here is what I've got from kcidb-schema (on latest checkout):
 > https://gist.githubusercontent.com/dvyukov/a067b63e74399201df921d3846241c82/raw/3f3aa708bbb24f530d49f767a8006f7a51826a80/gistfile1.txt
 >

