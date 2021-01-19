Subject: Re: KCIDB: Requiring IDs for test environments #KCIDB
References: <e76ed580-0cd9-6b58-c812-cfafb03c6f08@redhat.com>
 <223f8984-684e-9c89-02ed-2bf1cb5281ae@collabora.com>
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
Message-ID: <45c0f8ac-4580-5a9f-c592-c99202e3fc15@redhat.com>
Date: Tue, 19 Jan 2021 17:34:55 +0200
MIME-Version: 1.0
In-Reply-To: <223f8984-684e-9c89-02ed-2bf1cb5281ae@collabora.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, guillaume.tucker@collabora.com, Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>, Dmitry Vyukov <dvyukov@google.com>, Alice Ferrazzi <alicef@gentoo.org>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>, Dan Rue <dan.rue@linaro.org>

Hi Guillaume,

On 1/19/21 5:03 PM, Guillaume Tucker wrote:
 > On 14/01/2021 16:47, Nikolai Kondrashov wrote:
 >> We'd like to start requiring unique IDs for test environments.
 >
 > How do you intend to use this when reporting results?

Just grouping tests which ran on the same host together.
So you could see which tests shared an environment and possibly
affected each other.

 > Having an ID means we can group results with the exact same
 > environment, but I'm not sure how much value it would add.  Being
 > able to show all the results for say, a CPU architecture or a
 > category of hardware would be more useful.  If a CI system has 10
 > identical environments but just with a different hostname, how
 > could we still group the results if we only have unique IDs for
 > each of them?

Good question. I agree that these would be very good to have.

This proposal is just the start of implementing support for describing
environments. Once we can distinguish one environment from another,
we can start attaching more properties to them, like the CPU, peripherals,
etc.

Baby steps :) We have a lot of changes in the coming release already.

Nick

On 1/19/21 5:03 PM, Guillaume Tucker wrote:
> On 14/01/2021 16:47, Nikolai Kondrashov wrote:
>> Hi everyone,
>>
>> To anyone involved/interested in contributing to KernelCI's KCIDB data and
>> code, I'd like to announce a small, but noticeable change to the schema to let
>> us develop result notifications further, and to move closer to reaching
>> developers with our data.
>>
>> We'd like to start requiring unique IDs for test environments.
>>
>> Test "environment" is an optional object within the test object. So far it has
>> only contained a "description" and a "misc" field.
>>
>> We would like to start grouping tests by environments (hosts/VMs) they
>> executed in, on our dashboards and in e-mail notifications. To do that we need
>> a way to identify them, and that's where environment IDs come in.
>>
>> The environment IDs would need to be in the same format as "builds" and
>> "tests" use in v3 schema, as well as "checkouts" are going to use in v4:
>> the origin name (e.g. "syzbot"), followed by a colon, followed by an
>> origin-unique ID.
>>
>> The origin-unique ID can be whatever uniquely identifies the environment
>> inside the origin CI system. It could be just a straight hostname, or e.g. a
>> hashed hostname if you'd like to keep it secret.
>>
>> E.g. a Red Hat test report could look like this:
>>
>>      {
>>        "version": {
>>          "major": 4,
>>          "minor": 0
>>        },
>>        "tests": [
>>          {
>>            "build_id": "redhat:1071310",
>>            "id": "redhat:120299463",
>>            "origin": "redhat",
>>            "environment": {
>>              "id": "redhat:kernelci-1.s390.bos.redhat.com",
>>              "comment": "kernelci-1.s390.bos.redhat.com"
>>            },
>>            "path": "boot",
>>            "comment": "Boot test",
>>            "status": "PASS",
>>            "waived": false,
>>            "start_time": "2021-01-14T10:01:43+00:00",
>>            "duration": 161
>>          }
>>        ]
>>      }
>>
>> Reports in v3 and older formats will have environment IDs generated
>> automatically by sha256-hashing a stable JSON representation of "environment"
>> objects, if any are present and are not empty. Empty "environment" objects
>> will be discarded. E.g. this v3 environment:
>>
>>      "environment": {
>>        "description": "rk3288-veyron-jaq in lab-collabora",
>>        "misc": {
>>          "instance": "rk3288-veyron-jaq-cbg-1",
>>          "device": "rk3288-veyron-jaq",
>>          "mach": "rockchip",
>>          "lab": "lab-collabora"
>>        }
>>      }
>>
>> will be upgraded to this v4 environment:
>>
>>      "environment": {
>>          "id": "_:c04ecf73a79cf29bdd9140ad4f50172c8f9783ff51895c63afb6d8ad448a3f3e",
>>          "comment": "rk3288-veyron-jaq in lab-collabora"
>>          "misc": {
>>              "instance": "rk3288-veyron-jaq-cbg-1",
>>              "device": "rk3288-veyron-jaq",
>>              "mach": "rockchip",
>>              "lab": "lab-collabora",
>>          },
>>      }
> 
> How do you intend to use this when reporting results?
> 
> Having an ID means we can group results with the exact same
> environment, but I'm not sure how much value it would add.  Being
> able to show all the results for say, a CPU architecture or a
> category of hardware would be more useful.  If a CI system has 10
> identical environments but just with a different hostname, how
> could we still group the results if we only have unique IDs for
> each of them?
> 
> Best wishes,
> Guillaume
> 
> 
>> The PR for the corresponding code change is up at:
>>
>>      https://github.com/kernelci/kcidb-io/pull/20
>>
>> Please don't hesitate to respond with any comments, objections, or
>> suggestions.
>>
>> If there are no objections, I'll merge this change on Tuesday, Jan 19.
>>
>> Nick
>>
> 
> 
> 
> 
> 
> 

