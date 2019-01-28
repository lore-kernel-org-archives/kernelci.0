MIME-Version: 1.0
References: <CAH+k93ESzNrC65JreCxH5NocED8xpu7aApGgFb7bwhqF_7prwA@mail.gmail.com>
 <CAH=dhFS6TtEu5nFHQm-BA+zLVvBm-vGKhTm18qGKtQCrYLqxfw@mail.gmail.com>
 <20190107174106.y72qe2zawayvdcna@xps.therub.org> <CABXOdTdrp=x5ihD=qXNGvPcgGEJy_jW9AQb5GzBAzEpqWrbHsw@mail.gmail.com>
 <CABXOdTcgEUBGCHznjKJ6Hb+LRCjodmYJsMC5Vs7Ex-wi15ATQw@mail.gmail.com>
In-Reply-To: <CABXOdTcgEUBGCHznjKJ6Hb+LRCjodmYJsMC5Vs7Ex-wi15ATQw@mail.gmail.com>
From: "Matt Hart" <matthew.hart@linaro.org>
Date: Mon, 28 Jan 2019 14:55:49 +0000
Message-ID: <CAH+k93HOOkX+2NUy6Ep8tjZH+jwenBj6GKJSs7EispgEw_w31w@mail.gmail.com>
Subject: Re: patches@kernelci.org email account
Content-Type: text/plain; charset="UTF-8"
List-ID: <kernelci.groups.io>
To: kernelci@groups.io
Cc: Tyler Baker <tyler@foundries.io>, Milo Casagrande <milo@foundries.io>, Guenter Roeck <groeck@google.com>

Hey Tyler,

patches@kernelci.org is still bouncing, so the kci backend cant
receive email there and doesn't reply to the stable reviews.
Did it get fully reenabled?

On Tue, 8 Jan 2019 at 05:09, Guenter Roeck <groeck@google.com> wrote:
>
> On Mon, Jan 7, 2019 at 9:07 PM Guenter Roeck <groeck@google.com> wrote:
> >
> > On Mon, Jan 7, 2019 at 9:41 AM Dan Rue <dan.rue@linaro.org> wrote:
> > >
> > > On Mon, Jan 07, 2019 at 08:09:23AM -0800, Tyler Baker wrote:
> > > > On Mon, Jan 7, 2019 at 7:28 AM Matt Hart <matthew.hart@linaro.org> wrote:
> > > > >
> > > > > So, I hear the email account "patches@kernelci.org" was deleted.
> > > >
> > > > It was, then it added back after Kevin told me it was a mistake.
> > >
> > > Daniel Diaz reports it's still bouncing as of this morning:
> > >
> > > 09:15 < mrc3> "Address not found / Your message wasn't delivered to
> > > patches@kernelci.org because the address couldn't be found or is unable
> > > to receive email."
> > >
> > Same here.
> >
>
> Oh, and "fellows@kernelci.org" bounces as well.
>
> Guenter
>
> > Guenter
> >
> > > >
> > > > > The problem is, that account is used by the kernelci-reports service
> > > > > which checks the stable review emails and sends the responses.
> > > > > I found it in the config file /etc/linaro/kernelci-reports.cfg, on the
> > > > > kernelci.org master server.
> > > > >
> > > > > It's also what we've previously told Greg to CC for his stable
> > > > > reports, and according to a recent meeting minutes someone is going to
> > > > > tell him to stop using it.
> > > > >
> > > > > Any chance we can get it turned back on? Or can we use
> > > > > bot@kernelci.org for the same thing? Tyler? Milo?
> > > >
> > > > Should be back on as of a few weeks ago. Is the backend throwing an
> > > > error? I reset the password to use the one we were using in
> > > > production.
> > > >
> > > >
> > > >
> > >
> > > 
> > >
