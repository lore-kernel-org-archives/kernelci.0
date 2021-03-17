Date: Wed, 17 Mar 2021 19:07:15 +0000
From: "Cristian Marussi" <cristian.marussi@arm.com>
Subject: Re: Contributing ARM tests results to KCIDB
Message-ID: <20210317190715.GB6875@e120937-lin>
References: <20200918152135.GA13088@e119603-lin.cambridge.arm.com>
 <3e86960e-9780-3e18-3d12-cb4ec3959d63@redhat.com>
 <be42f631-897d-0cdf-0225-5d01256f39e5@redhat.com>
 <20200918164228.GA16509@e119603-lin.cambridge.arm.com>
 <20201105184631.GD24640@e120937-lin>
 <4db924ab-2f38-ac63-1b71-51ead907ba1f@redhat.com>
 <20201202092340.GB8455@e120937-lin>
 <d0c2936f-fab5-3aea-fbd0-22b59df9bfd3@redhat.com>
 <20201202120105.GC8455@e120937-lin>
 <ff3d77ee-ab47-17d3-70e9-c21a682f76b5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ff3d77ee-ab47-17d3-70e9-c21a682f76b5@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, Nikolai.Kondrashov@redhat.com
Cc: broonie@kernel.org, basil.eljuse@arm.com

Hi Nick

sorry for the delay.

On Mon, Mar 15, 2021 at 11:00:24AM +0200, Nikolai Kondrashov via groups.io wrote:
> Hi Cristian,
> 
> On 12/2/20 2:01 PM, Cristian Marussi wrote:
> > On Wed, Dec 02, 2020 at 12:16:10PM +0200, Nikolai Kondrashov wrote:
> > > Finally, at this stage we really need a breadth of data coming from
> > > different CI system, rather than its depth or precision, so we can understand
> > > the problem at hand better and faster. It would do us no good to concentrate
> > > on just a few, and solidify the design around them. That would make it more
> > > difficult for others to join.
> > > 
> > > You can refine and add more data afterwards.
> > > 
> > 
> > Sure, in fact, as of now I still have to ask for some changes in our reporting
> > backend, (which generates the original data stored in our DB and then pushed
> > to you), so I have to admit the git commit hash are partially faked (since I
> > have only a git describe string to start from) and as a consequence they won't
> > really be so much useful for comparisons amongst different origins (given
> > they don't refer real kernel commits), BUT I thought this NOT to be a
> > blocking problem for now, so that I can start pushing data to KCIDB and
> > then later on (once I get real full hashes on my side) I'll start pushing the
> > real valid ones, does it sounds good ?
> 
> Is there any progress towards having the full commit hashes available?
> 

No sorry, I'll look into this next and see if I can speed up a bit.

Thanks

Cristian
> I'm working on aggregating testing data for notification e-mails and I could
> use a few samples of data which has both summarized LTP results from Red Hat's
> CKI and the detailed LTP results from ARM, under the same revision.
> 
> Plus, we're moving ever closer to reaching out to developers with our data,
> and it would be good to have the right hashes in your data :)
> 
> Nick
> 
> 
> 
> 
> 
> 
