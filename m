Date: Wed, 22 May 2019 06:14:40 -0400 (EDT)
From: Veronika Kabatova <vkabatov@redhat.com>
Message-ID: <1528423489.21391606.1558520080567.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190521164704.GB8787@kroah.com>
References: <1204558561.21265703.1558449611621.JavaMail.zimbra@redhat.com> <1667759567.21267950.1558450452057.JavaMail.zimbra@redhat.com> <20190521164704.GB8787@kroah.com>
Subject: Re: CKI hackfest @Plumbers invite
MIME-Version: 1.0
List-ID: <info.kernelci.org>
List-Help: <https://support.google.com/a/kernelci.org/bin/topic.py?topic=25838>,
 <mailto:info+help@kernelci.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: automated-testing@yoctoproject.org, info@kernelci.org, Tim Bird <Tim.Bird@sony.com>, khilamn@baylibre.org, syzkaller@googlegroups.com, lkp@lists.01.org, stable@vger.kernel.org, Laura Abbott <labbott@redhat.com>, Eliska Slobodova <eslobodo@redhat.com>, CKI Project <cki-project@redhat.com>



----- Original Message -----
> From: "Greg KH" <gregkh@linuxfoundation.org>
> To: "Veronika Kabatova" <vkabatov@redhat.com>
> Cc: automated-testing@yoctoproject.org, info@kernelci.org, "Tim Bird" <Tim.Bird@sony.com>, khilamn@baylibre.org,
> syzkaller@googlegroups.com, lkp@lists.01.org, stable@vger.kernel.org, "Laura Abbott" <labbott@redhat.com>, "Eliska
> Slobodova" <eslobodo@redhat.com>, "CKI Project" <cki-project@redhat.com>
> Sent: Tuesday, May 21, 2019 6:47:04 PM
> Subject: Re: CKI hackfest @Plumbers invite
> 
> On Tue, May 21, 2019 at 10:54:12AM -0400, Veronika Kabatova wrote:
> > Hi,
> > 
> > as some of you have heard, CKI Project is planning hackfest CI meetings
> > after
> > Plumbers conference this year (Sept. 12-13). We would like to invite
> > everyone
> > who has interest in CI for kernel to come and join us.
> > 
> > The early agenda with summary is at the end of the email. If you think
> > there's
> > something important missing let us know! Also let us know in case you'd
> > want to
> > lead any of the sessions, we'd be happy to delegate out some work :)
> > 
> > 
> > Please send us an email as soon as you decide to come and feel free to
> > invite
> > other people who should be present. We are not planning to cap the
> > attendance
> > right now but need to solve the logistics based on the interest. The event
> > is
> > free to attend, no additional registration except letting us know is
> > needed.
> > 
> > Feel free to contact us if you have any questions,
> > Veronika
> > CKI Project
> > 
> > 
> > -----------------------------------------------------------
> > Here is an early agenda we put together:
> > - Introductions
> > - Common place for upstream results, result publishing in general
> >   - The discussion on the mailing list is going strong so we might be able
> >   to
> >     substitute this session for a different one in case everything is
> >     solved by
> >     September.
> > - Test result interpretation and bug detection
> >   - How to autodetect infrastructure failures, regressions/new bugs and
> >   test
> >     bugs? How to handle continuous failures due to known bugs in both tests
> >     and
> >     kernel? What's your solution? Can people always trust the results they
> >     receive?
> > - Getting results to developers/maintainers
> >   - Aimed at kernel developers and maintainers, share your feedback and
> >     expectations.
> >   - How much data should be sent in the initial communication vs. a click
> >   away
> >     in a dashboard? Do you want incremental emails with new results as they
> >     come
> >     in?
> >   - What about adding checks to tested patches in Patchwork when patch
> >   series
> >     are being tested?
> >   - Providing enough data/script to reproduce the failure. What if special
> >   HW
> >     is needed?
> > - Onboarding new kernel trees to test
> >   - Aimed at kernel developers and maintainers.
> >   - Which trees are most prone to bring in new problems? Which are the most
> >     critical ones? Do you want them to be tested? Which tests do you feel
> >     are
> >     most beneficial for specific trees or in general?
> > - Security when testing untrusted patches
> >   - How do we merge, compile, and test patches that have untrusted code in
> >   them
> >     and have not yet been reviewed? How do we avoid abuse of systems,
> >     information theft, or other damage?
> >   - Check out the original patch that sparked the discussion at
> >     https://patchwork.ozlabs.org/patch/862123/
> > - Avoiding effort duplication
> >   - Food for thought by GregKH
> 
> So I guess I'm going to be there?
> 
> Ok, fair enough, I'll be present, looks good :)
> 

Glad to hear that!
You always have valuable feedback and ideas to offer so we are definitely
looking forward to having you there :)


Veronika

> thanks,
> 
> greg k-h
> 
