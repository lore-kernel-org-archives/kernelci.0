Return-Path: <Nikolai.Kondrashov@redhat.com>
Message-ID: <b547cc78-aa58-fd43-a34e-cd088364a2c2@redhat.com>
Date: Fri, 3 Dec 2021 09:13:37 +0200
MIME-Version: 1.0
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Subject: Re: Greetings!
References: <BYAPR11MB2760DB15BA7501ED5A4568C7F0699@BYAPR11MB2760.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB2760DB15BA7501ED5A4568C7F0699@BYAPR11MB2760.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, greg.galloway@intel.com

Hello Greg,

On 12/3/21 00:39, Galloway, Greg wrote:
> Hello, I’d like to know a bit more about your system.  How much effort does it take to add datapoints from our CI?  What does the process generally entail?
> 
> We’re specifically looking into adding some of our Sound Open Firmware repos to your dashboard.

Basically, you need to format some JSON and pipe it to a command-line tool.

Submitting an empty dataset (report) looks something like this:

     $ echo '{"version":{"major":4,"minor":0}}' |
             kcidb-submit -p kernelci-production -t playground_kcidb_new

Or, if you'd prefer using Python, it would look like this:

     import kcidb

     client = kcidb.Client(project_id="kernelci-production",
                           topic_name="playground_kcidb_new")
     client.submit(report)

Our requirements towards the actual data you submit are very minimal right 
now, pretty much just the structural fields linking your checkouts, builds, 
and tests together.

We also provide you with a "playground" setup where you can experiment with 
submissions freely and see how they end up in our dashboard, without worrying 
of breaking anything. If you'd be interested in that, I can give you your 
credentials right away, so you could start.

See details in our Submitter Guide:

     https://kernelci.org/docs/kcidb/submitter_guide/

and don't hesitate to ask any questions here, or on libera.chat's #kernelci 
channel!

Nick

