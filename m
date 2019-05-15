Subject: Re: [Automated-testing] A common place for CI results?
References: <299272045.11819252.1554465036421.JavaMail.zimbra@redhat.com>
 <457016061.11846096.1554475313006.JavaMail.zimbra@redhat.com>
 <ECADFF3FD767C149AD96A924E7EA6EAF977191AE@USCULXMSG01.am.sony.com>
 <20190515203334.lbhpqpdyulqztr5c@xps.therub.org>
From: Carlos Hernandez <ceh@ti.com>
Message-ID: <516df501-82c2-67d5-890e-5a4274c7ce35@ti.com>
Date: Wed, 15 May 2019 18:58:04 -0400
MIME-Version: 1.0
In-Reply-To: <20190515203334.lbhpqpdyulqztr5c@xps.therub.org>
Content-Type: multipart/alternative;
	boundary="------------1EEB7E9B0C3E2E5EC7B91C51"
Content-Language: en-US
List-ID: <kernelci.groups.io>
To: Dan Rue <dan.rue@linaro.org>, kernelci@groups.io, Tim.Bird@sony.com
Cc: info@kernelci.org, automated-testing@yoctoproject.org

--------------1EEB7E9B0C3E2E5EC7B91C51
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 5/15/19 4:33 PM, Dan Rue wrote:
> OK here's my idea.
>
> I don't personally think kernelci (or LKFT) are set up to aggregate
> results currently. We have too many assumptions about where tests are
> coming from, how things are built, etc. In other words, dealing with
> noisy data is going to be non-trivial in any existing project.
>
> I would propose aggregating data into something like google's BigQuery.
> This has a few benefits:
> - Non-opinionated place to hold structured data
> - Allows many downstream use-cases
> - Managed hosting, and data is publicly available
> - Storage is sponsored by google as a part of
>    https://cloud.google.com/bigquery/public-data/
> - First 1TB of query per 'project' is free, and users pay for more
>    queries than that
>
> With storage taken care of, how do we get the data in?
>
> First, we'll need some canonical data structure defined. I would
> approach defining the canonical structure in conjunction with the first
> few projects that are interested in contributing their results. Each
> project will have an ETL pipeline which will extract the test results
> from a given project (such as kernelci, lkft, etc), translate it into
> the canonical data structure, and load it into the google bigquery
> dataset at a regular interval or in real-time. The translation layer is
> where things like test names are handled.

+1

I like the idea

>
> The things this leaves me wanting are:
> - raw data storage. It would be nice if raw data were stored somewhere
>    permanent in some intermediary place so that later implementations
>    could happen, and for data that doesn't fit into whatever structure we
>    end up with.

If required, we could setup a related table w/ raw data. I believe max 
cell size ~ 100MB per https://cloud.google.com/bigquery/quotas

However, another approach could be to define the structure version in 
the schema. New fields can be added and left blank for old data.

> - time, to actually try it and find the gaps. This is just an idea I've
>    been thinking about. Anyone with experience here that can help flesh
>    this out?
>
> Dan

-- 
Carlos


--------------1EEB7E9B0C3E2E5EC7B91C51
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/15/19 4:33 PM, Dan Rue wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190515203334.lbhpqpdyulqztr5c@xps.therub.org">
      <pre class="moz-quote-pre" wrap="">OK here's my idea.

I don't personally think kernelci (or LKFT) are set up to aggregate
results currently. We have too many assumptions about where tests are
coming from, how things are built, etc. In other words, dealing with
noisy data is going to be non-trivial in any existing project.

I would propose aggregating data into something like google's BigQuery.
This has a few benefits:
- Non-opinionated place to hold structured data
- Allows many downstream use-cases
- Managed hosting, and data is publicly available
- Storage is sponsored by google as a part of
  <a class="moz-txt-link-freetext" href="https://cloud.google.com/bigquery/public-data/" moz-do-not-send="true">https://cloud.google.com/bigquery/public-data/</a>
- First 1TB of query per 'project' is free, and users pay for more
  queries than that

With storage taken care of, how do we get the data in?

First, we'll need some canonical data structure defined. I would
approach defining the canonical structure in conjunction with the first
few projects that are interested in contributing their results. Each
project will have an ETL pipeline which will extract the test results
from a given project (such as kernelci, lkft, etc), translate it into
the canonical data structure, and load it into the google bigquery
dataset at a regular interval or in real-time. The translation layer is
where things like test names are handled.</pre>
    </blockquote>
    <p>+1 <br>
    </p>
    <p>I like the idea</p>
    <blockquote type="cite"
      cite="mid:20190515203334.lbhpqpdyulqztr5c@xps.therub.org">
      <pre class="moz-quote-pre" wrap="">

The things this leaves me wanting are:
- raw data storage. It would be nice if raw data were stored somewhere
  permanent in some intermediary place so that later implementations
  could happen, and for data that doesn't fit into whatever structure we
  end up with.</pre>
    </blockquote>
    <p>If required, we could setup a related table w/ raw data. I
      believe max cell size ~ 100MB per <a
        href="https://cloud.google.com/bigquery/quotas">https://cloud.google.com/bigquery/quotas</a></p>
    <p>However, another approach could be to define the structure
      version in the schema. New fields can be added and left blank for
      old data.<br>
    </p>
    <blockquote type="cite"
      cite="mid:20190515203334.lbhpqpdyulqztr5c@xps.therub.org">
      <pre class="moz-quote-pre" wrap="">
- time, to actually try it and find the gaps. This is just an idea I've
  been thinking about. Anyone with experience here that can help flesh
  this out?

Dan
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Carlos</pre>
  </body>
</html>

--------------1EEB7E9B0C3E2E5EC7B91C51--
