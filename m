Subject: Re: please drop deprecated android kernel branches
References: <CAHRSSExhrCJW0v6L+iZ9u2tBa9BQh0CgCe1aGW2i3hur4DjLjQ@mail.gmail.com>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <68cac88e-9b2a-6dc7-5a3e-a8b09e71fd9f@collabora.com>
Date: Thu, 4 Nov 2021 08:32:06 +0000
MIME-Version: 1.0
In-Reply-To: <CAHRSSExhrCJW0v6L+iZ9u2tBa9BQh0CgCe1aGW2i3hur4DjLjQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kernelci@groups.io, tkjos@google.com

Hi Todd,

On 01/11/2021 17:50, Todd Kjos via groups.io wrote:
> The following branches are now out of support. Please drop them from kernelci build/test (some might already have been dropped):
> 
> android-3.18
> android-3.18-o-mr1
> android-4.4-o
> android-4.4-o-mr1
> android-4.9-o
> android-4.9-o-mr1

They were all still in the config, I've made this PR accordingly:

  https://github.com/kernelci/kernelci-core/pull/859

It should get deployed in production on Monday.

Best wishes,
Guillaume
