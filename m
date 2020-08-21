Subject: Re: Working with the KernelCI project
References: <20200707222342.scrz75265etaqlmd@redhat.com>
 <20200709110029.GB27682@intel.com>
 <69138572-7241-1636-8018-34cd380ec540@redhat.com>
 <20200713001929.GA1812@intel.com>
 <4a5d8379-b96d-6777-0d98-4ef13e56e0b3@redhat.com>
 <20200809022529.GB26573@intel.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <ea1b08f4-d772-a7e7-8347-a268dc5fbbda@redhat.com>
Date: Fri, 21 Aug 2020 12:50:14 +0300
MIME-Version: 1.0
In-Reply-To: <20200809022529.GB26573@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, philip.li@intel.com
Cc: Don Zickus <dzickus@redhat.com>, dvyukov@google.com, kernelci-members@groups.io, nkondras@redhat.com, julie.du@intel.com, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>

Hi Philip,

On 8/9/20 5:25 AM, Philip Li wrote:
 > On Wed, Jul 22, 2020 at 03:42:41PM +0300, Nikolai Kondrashov wrote:
 >> The above describes the revision you're testing as a patch being applied to a
 >> particular commit in the stm32 repo's master branch. The revision has a build,
 >> which failed, the build has the config URL and the log linked, as well as the
 > Thanks, besides the final result like success or failed, does the db currently
 > support start but not completed build (or planned but not start)?

I've been thinking about this a bit and had a similar request from my
teammates at CKI Project for our internal implementation of the protocol.

What it seems we can do is to allow sending the same object multiple times,
with the condition that every new instance has the same amount of, or more
optional fields.

This would allow you to send your build or test with some basic information
first, and e.g. without output files and (importantly) with the status, and
when the build/test is done, send the same, but with previously missing fields
added.

The dashboard would be able to display the interim object as "in progress",
for example.

We don't have a working implementation yet, but it seems it should be
possible to do with minimal effort and performance hit.

 >> However, if you'd be interested, we could help you set up forwarding your
 >> reports to KernelCI. You can start very simple and small, as the schema only
 >> requires a handful of fields. This will help us see your needs: what data you
 >> want in reports and on the dashboard, how many reports you want to push (both
 >> positive and negative), etc.
 > Thanks for the offering, the aggregation is a nice feature, but we are fully
 > occupied by planned effort and it's hard to do actual implementation level thing
 > in short term. Meanwhile I'd like to know more about it, and look fwd to the
 > hacking session if i could attend it.

I've finally published the schema introduction article I promised earlier:

     https://foundation.kernelci.org/blog/2020/08/21/introducing-common-reporting/

LPC finalized the schedule. Our talk is on Wednesday:

     https://linuxplumbersconf.org/event/7/contributions/730/

Our BoF session is on Thursday:

     https://linuxplumbersconf.org/event/7/contributions/731/

Unfortunately, we were only given 45 minutes for the latter, so we won't be
able to fit much there. However, we've been allocated a separate chat room:

     https://chat.2020.linuxplumbersconf.org/channel/kcidb

We'll be hanging out there during the whole conference, and will be able to
commandeer one of the shared video call rooms, if necessary, or start a video
chat on a 3rd party service, and discuss anything related to common reporting,
walk you through the submission process, help you set up minimal reporting,
you name it.

Hope to see you there, but if you can't make it, we're always there on the
#kernelci channel on Freenode, reachable over email, and can organize a video
call, of course.

Nick

