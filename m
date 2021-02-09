Subject: Re: KCIDB: Requiring IDs for test environments #KCIDB
From: "Nikolai Kondrashov" <Nikolai.Kondrashov@redhat.com>
References: <e76ed580-0cd9-6b58-c812-cfafb03c6f08@redhat.com>
Message-ID: <91ad234d-4913-f375-9a3c-c3a33aab4d2d@redhat.com>
Date: Tue, 9 Feb 2021 14:35:18 +0200
MIME-Version: 1.0
In-Reply-To: <e76ed580-0cd9-6b58-c812-cfafb03c6f08@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Cristian Marussi <cristian.marussi@arm.com>, Tim Bird <Tim.Bird@sony.com>, Dmitry Vyukov <dvyukov@google.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, Alice Ferrazzi <alicef@gentoo.org>, =?UTF-8?Q?I=c3=b1aki_Malerba?= <imalerba@redhat.com>, kernelci@groups.io, Dan Rue <dan.rue@linaro.org>

On 1/14/21 6:47 PM, Nikolai Kondrashov wrote:
> Hi everyone,
> 
> To anyone involved/interested in contributing to KernelCI's KCIDB data and
> code, I'd like to announce a small, but noticeable change to the schema to let
> us develop result notifications further, and to move closer to reaching
> developers with our data.
> 
> We'd like to start requiring unique IDs for test environments.

After some discussion on our meetings, this seems to be of limited use to
developers, so we're suspending this change until we can verify whether
it's perhaps necessary for the implementation of the new notification system
we're working on. If not, we'll drop this feature.

Stay tuned.
Nick

