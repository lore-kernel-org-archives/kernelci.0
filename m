Subject: Re: http://kernelci.org/ gets "Welcome to nginx!" page.
References: <77eb4eeb-d14d-d5d1-65a3-7f8f7b241df1@amd.com>
 <20200826181313.GO4965@sirena.org.uk>
From: "Guillaume Tucker" <guillaume.tucker@collabora.com>
Message-ID: <841f8796-b4f2-bbb5-8d2c-11a2eb0a4b52@collabora.com>
Date: Wed, 26 Aug 2020 19:27:46 +0100
MIME-Version: 1.0
In-Reply-To: <20200826181313.GO4965@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: kim.phillips@amd.com
Cc: kernelci@groups.io, broonie@kernel.org

On 26/08/2020 19:13, Mark Brown wrote:
> On Wed, Aug 26, 2020 at 12:54:37PM -0500, Kim Phillips wrote:
>> Hi, I typed kernelci.org in my browser which went to:
> 
>> http://kernelci.org/
> 
>> which showed a "Welcome to nginx!" page.
> 
>> I luckily went to "www.kernelci.org" to see the desired content.
> 
>> Please correct the non-redirection issue?
> 
> FWIW I've just tested this and it does happen but only for plain HTTP -
> browsers that do https by default work fine (some of them will
> automatically try to rewrite any http URIs they see).

Fixed, sorry it's the 2nd time this happens.  It's a side effect
of updating the Let's Encrypt certificates, I need to roll out a
better fix for it in the nginx config.

See this GitHub issue for more details:

  https://github.com/kernelci/kernelci-frontend-config/issues/21

Thanks,
Guillaume
