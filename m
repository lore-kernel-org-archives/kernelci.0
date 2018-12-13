Return-Path: <dan.rue@linaro.org>
Date: Thu, 13 Dec 2018 10:33:41 -0600
From: "Dan Rue" <dan.rue@linaro.org>
Subject: Re: Some suggestions and questions
Message-ID: <20181213163341.qf4u3sfazfeb2o7w@xps.therub.org>
References: <20181212213831.xnw3ugwvpw4o365o@xps.therub.org>
 <20181213114903.GB10669@sirena.org.uk>
 <CADz3at1pRKih+JD2FerjgjKrU+p2RrnTfYoUadNAmXSi_Gp3UQ@mail.gmail.com>
 <20181213123457.GF10669@sirena.org.uk>
 <20181213152909.lqqzkao72bvgrf7s@xps.therub.org>
 <20181213161950.GP10669@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <20181213161950.GP10669@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Mark Brown <broonie@kernel.org>
Cc: kernelci@groups.io

On Thu, Dec 13, 2018 at 04:19:50PM +0000, Mark Brown wrote:
> On Thu, Dec 13, 2018 at 09:29:09AM -0600, Dan Rue wrote:
> > On Thu, Dec 13, 2018 at 12:34:57PM +0000, Mark Brown wrote:
> > > On Thu, Dec 13, 2018 at 07:14:34AM -0500, Mike Holmes wrote:
> 
> > > It'll get passed through but clients don't know to do anything with it,
> > > you either get noise characters in the subject if people hashtag words
> > > that are already there (which is a common way of doing these things),
> > > it's less of an issue if they just get added to the end of the subject
> > > line but still looks weird.  It's like when people start randomly adding
> > > @ to people's names in e-mail.
> 
> > I think we should try the hashtag - I'll make next week's meeting
> > minutes thread with subject Meeting #Minutes for YYYY-MM-DD. Then, we'll
> > end up with a linkable archive of meeting minutes at
> > https://groups.io/g/kernelci/hashtags, which should obviate the need for
> > opening up the shared google doc.
> 
> If we're going to do it could we do it with a #minutes at the end of the
> subject instead so that it doesn't disrupt the actual subject?
> 
> Since people read more by pattern matching the shapes of text than by
> parsing out the individual letters (particularly when reading at speed)
> it's not great to have them in the middle of text, this works a lot
> better in systems that support hashtags since they tend to provide
> visual cues that this isn't a normal word and even there outside of
> Twitter with its severe length restrictions they normally get pushed to
> a separate bit after the real text (Instagram used to encourage people
> to put them in comments, not even in the actual post).

Yea, good point. How's this specifically:

Subject: Weekly Meeting 2018-12-10 #minutes

Dan
