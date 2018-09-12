Message-ID: <08bfc4b338de935228efd1fec342caef57d45f3f.camel@collabora.com>
Subject: Re: [kernelci] media subsystem test pilot
From: Ezequiel Garcia <ezequiel@collabora.com>
Date: Wed, 12 Sep 2018 12:55:04 -0300
In-Reply-To: <CAJrz+7KR0x51xK=4bHH2i_OzGgrK6BdyiJE5vhs0gOdNx1YcAw@mail.gmail.com>
References: <d0113fd0-801a-feff-af96-12a71ca27dc7@collabora.com>
	 <CAJrz+7KR0x51xK=4bHH2i_OzGgrK6BdyiJE5vhs0gOdNx1YcAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Milosz Wasilewski <milosz.wasilewski@linaro.org>, kernelci@groups.io
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>, Chase Qi <chase.qi@linaro.org>, Nicolas Dufresne <nicolas.dufresne@collabora.co.uk>, Mark Brown <broonie@kernel.org>, Guillaume Tucker <guillaume.tucker@collabora.com>, Ana Guerrero Lopez <ana.guerrero@collabora.co.uk>

On Wed, 2018-09-12 at 09:51 +0100, Milosz Wasilewski wrote:
> On 12 September 2018 at 09:13, Guillaume Tucker
> <guillaume.tucker@gmail.com> wrote:
> > 
> > * add config fragment (similar to the kselftest one) with virtual
> >   video drivers enabled to test v4l2 framework on QEMU and get
> >   reference test results
> 
> Last week I asked Chase (CCed) to try to create a 'test definition'
> for v4l for LAVA. I can see the v4l template in the repo now [1] but
> it looks like bound to LAVA environment. Do you possibly have some
> different implementation that allows for local execution?
> 
> 

(+Nicolas)

v4l2-compliance is a decent test for simple capture devices
(simple means, those that function thru the V4L API).

However, I am not so sure it's the right tool for codecs,
which go thru the stateful or stateless codec API.

Nicolas and I have been talking about using gstreamer for that,
via gst-validate, which allows very interesting tests.

Regards,
Ezequiel


