Return-Path: <dan.rue@linaro.org>
Date: Mon, 7 Jan 2019 11:41:06 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: patches@kernelci.org email account
Message-ID: <20190107174106.y72qe2zawayvdcna@xps.therub.org>
References: <CAH+k93ESzNrC65JreCxH5NocED8xpu7aApGgFb7bwhqF_7prwA@mail.gmail.com>
 <CAH=dhFS6TtEu5nFHQm-BA+zLVvBm-vGKhTm18qGKtQCrYLqxfw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH=dhFS6TtEu5nFHQm-BA+zLVvBm-vGKhTm18qGKtQCrYLqxfw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, tyler@foundries.io
Cc: Matt Hart <matthew.hart@linaro.org>, fellows@kernelci.org, info@kernelci.org, Tyler Baker <tyler@opensourcefoundries.com>, Milo Casagrande <milo@opensourcefoundries.com>

On Mon, Jan 07, 2019 at 08:09:23AM -0800, Tyler Baker wrote:
> On Mon, Jan 7, 2019 at 7:28 AM Matt Hart <matthew.hart@linaro.org> wrote:
> >
> > So, I hear the email account "patches@kernelci.org" was deleted.
> 
> It was, then it added back after Kevin told me it was a mistake.

Daniel Diaz reports it's still bouncing as of this morning:

09:15 < mrc3> "Address not found / Your message wasn't delivered to
patches@kernelci.org because the address couldn't be found or is unable
to receive email."

> 
> > The problem is, that account is used by the kernelci-reports service
> > which checks the stable review emails and sends the responses.
> > I found it in the config file /etc/linaro/kernelci-reports.cfg, on the
> > kernelci.org master server.
> >
> > It's also what we've previously told Greg to CC for his stable
> > reports, and according to a recent meeting minutes someone is going to
> > tell him to stop using it.
> >
> > Any chance we can get it turned back on? Or can we use
> > bot@kernelci.org for the same thing? Tyler? Milo?
> 
> Should be back on as of a few weeks ago. Is the backend throwing an
> error? I reset the password to use the one we were using in
> production.
> 
> 
> 
