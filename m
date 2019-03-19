Return-Path: <khilman@baylibre.com>
From: "Kevin Hilman" <khilman@baylibre.com>
Subject: Re: staging projects in github
In-Reply-To: <CAH1_8nBRcPX5teqpM773KZGhiV3nrPwWToE3_RFZLZn2idN8yg@mail.gmail.com>
References: <7himwxvr6m.fsf@baylibre.com> <CAH+k93EBGwnAbwvCDF3PmaCvS+Fpk6FTVtgdB37h-twqZf4hvQ@mail.gmail.com> <20190305170426.4kuzc4fq7fmvoeud@xps.therub.org> <15891FEF165BAE41.4955@groups.io> <CAH1_8nC=aa9jOa1rTzb7=joDXqjTDty+qeGe4bqpE11fqOgN-A@mail.gmail.com> <7hr2bct26z.fsf@baylibre.com> <CAH1_8nBRcPX5teqpM773KZGhiV3nrPwWToE3_RFZLZn2idN8yg@mail.gmail.com>
Date: Tue, 19 Mar 2019 10:32:56 -0700
Message-ID: <7hmulqg46v.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <kernelci.groups.io>
To: Guillaume Tucker <guillaume.tucker@gmail.com>
Cc: kernelci@groups.io, Dan Rue <dan.rue@linaro.org>, Matt Hart <matthew.hart@linaro.org>

Guillaume Tucker <guillaume.tucker@gmail.com> writes:

[...]

> So staging-20190315 was merged and deployed on Friday.  I've now
> updated the kernelci.org Jenkins jobs in production to use a
> kernelci.org branch from kernelci-core.
>
> We can start using kernelci-core/master branch for pull requests
> instead of the kernelci-core-staging repository.  There are a few
> PRs left in kernelci-core-staging, I suggest we try to merge
> those that are almost ready by Thursday and cherry-pick the
> changes in kernelci-core, and any PR left open on Friday should
> be closed and probably opened again in kernelci-core.
>
> See the kernelci-core project in Github:
>
>   https://github.com/kernelci/kernelci-core
>
> Open PRs in kernelci-core-staging:
>
>   https://github.com/kernelci/kernelci-core-staging/pulls
>
> I've also created a staging.kernelci.org branch in kernelci-core,
> the idea being that we can use that to run some jobs on
> staging.kernelci.org.  This should be especially useful for
> occasional contributors who don't have an account on the staging
> Jennkins instance: someone can put the code from their PRs on
> that branch to have it tested for them.  It can also be used like
> the staging branch in kernelci-backend, to test that on-going PRs
> work when integrated together.
>
> Both the kernelci.org and staging.kernelci.org branches are not
> for merging pull requests, they are just a way to configure the
> Jenkins jobs on the corresponding instances.
>
> The next step is to update the README file in kernelci-core and
> the wiki accordingly.  Essentially, the workflow now becomes very
> simple from a contributor's point of view with regular PRs
> against the master branch.  For production updates, we should
> create a tag on the master branch and update the kernelci.org
> branch to match that rather than create a "staging" PR.  We
> should however sent notes to the mailing list with a summary like
> in past staging PRs with things going into production.  Please
> let me know if you have any suggestions to do things differently.

This is great, thank you for taking the time/effort to implement this
and roll it out.

Kevin
