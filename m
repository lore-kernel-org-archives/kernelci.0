Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456BF1426B
	for <kernelci@lists.linux.dev>; Mon, 31 Jul 2023 10:01:54 +0000 (UTC)
Received: from [192.168.0.109] (unknown [103.56.182.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jenysadadia)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0DC176607176;
	Mon, 31 Jul 2023 11:01:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690797713;
	bh=OLrNP0LwG7atgZ6SBZKO2E+ff2F9zvPGXFw8eD3lqnE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=aJ0azd+bx5vvZo9bnzKxu+ghSTmzNqE8oJsqp6uasdIfuJ8jTEIyFt/E1sr7+9HMG
	 0njd38nXxzuoSqEAWNUkfU1cbFA+bhki2kkACS4iycriWP9xL04VIw3hbyIMcZmam2
	 K7n7OPrysPy8y/KkYFThrSv+wMvOOqMI1Grn4Lu6DgchBbTWvZ/b0KiF0gmlY/QdnA
	 ZTaIT2it68hWTcKGusNiuCeTN1xY6aVRR/Kg8FdFGKe5zSkz6iGJq8tmL6DV8Gq1DH
	 pssQGwM8ZTxRvDXSZYk/gFZQhsD2EHGKDAh3DNs1/7r+a4KEnhZSK7y4xc61We3hVW
	 h3IFAH9bnBj4A==
Message-ID: <a7efc8a3-e63f-6a88-88be-d436d8273fe2@collabora.com>
Date: Mon, 31 Jul 2023 15:31:48 +0530
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Enabling TOML support for user settings
Content-Language: en-US
To: Guillaume Tucker <guillaume.tucker@collabora.com>,
 kernelci@lists.linux.dev
References: <0d91ed78-e648-d41e-1f29-2eb7dbb488ae@collabora.com>
 <3f0eb69d-1edd-5ec1-8c73-583473fa3afa@collabora.com>
From: Jeny Sheth <jeny.sadadia@collabora.com>
In-Reply-To: <3f0eb69d-1edd-5ec1-8c73-583473fa3afa@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

Thank you Guillaume for your suggestions and comments.


Followed by our discussions with other community members in the KernelCI
community meeting, we decided to use TOML dotted keys as it is a standard way
of defining sub-tables in TOML.

The syntax will look like "section-name.section-config".


For example,
```
[db.docker-host]
     api ="http://localhost:8001"
```


In case the section config name includes "." (dot) in the name,
it must be surrounded by "" (double-quotes) to parse it properly with
TOML decoder.

For example,
```
[db."staging.kernelci.org"]

api ="https://api.staging.kernelci.org/"
```


Please look at these pull requests for further clarification:
1.https://github.com/kernelci/kernelci-core/pull/2033
2.https://github.com/kernelci/kernelci-pipeline/pull/288
3.https://github.com/kernelci/kernelci-pipeline/pull/289

Please note that the old `.conf` setting file will continue to support ":" separator for
section names during the deprecation period.


Thank you,
Jeny

On 16/06/23 5:06 pm, Guillaume Tucker wrote:
> Hi Jeny,
>
> On 06/06/2023 09:12, Jeny Sheth wrote:
>> Hello everyone,
>>
>> We have enabled TOML support for user settings in KernelCI-Core.
>> Python package `toml` has been integrated to parse the settings file. Please see the Github issue[1] for more details on this transition.
>>
>> The sample config file `kernelci.toml.sample`[2] has been added to the repository.
>> As per the former convention with `.conf`, we will continue having a `DEFAULT` section and other sections for different command line tools in the `.toml` file.
>> For example:
>> ```
>> [DEFAULT]
>>
>> storage = "http://localhost:5002"
>> db_config = "localhost"
>> api_config = "docker-host"
>>
>> [kci_build]
>>
>> build_config = "next"
>> arch="x86"
>> j = 3
>> ```
>>
>> With TOML, we can use different data types for values (strings with double quotes, integers, float). Unlike `configparser` this removes the need for data type conversion for values.
>>
>> Components such as database, labs, and storage will follow the convention of the form ["storage:docker-host"].
>> For the correct parsing from TOML decoder, we need to use double quotes around the name when it includes ":".
>> Below is the example for more detail:
>> ```
>> ["lab:my-lava-lab"]
> It's worth noting that "lab" configs have been renamed
> to "runtime" now.  But this is not related to the move to TOML,
> just to keep examples consistent with the YAML config.
>
>> user = "user-name"
>> lab_token = "1234-5678"
>>
>> ["db:staging.kernelci.org"]
>>
>> db_token = "XXX-XXXX-XXXX-XXXX"
>> api = "https://api.staging.kernelci.org/"
>> ```
>>
>> Another suggestion is to use dotted keys instead of ":" for the above section names. That way we can remove double quotes around the section name. However, that can cause issues when we have dotted values e.g. "staging.kernelci.org".
>> If we go with the dotted name, it will look like [db.staging.kernelci.org] and the parser will assume that it is a nested dictionary.
>>
>> For example:
>> ```
>> [db.staging.kernelci.org]
>> api = "https://api.staging.kernelci.org/"
>>
>> ```
>> Above will be parsed as:
>> ```
>> 'db': {'staging': {'kernelci': {'org': {'api': 'https://api.staging.kernelci.org/'}}}}
>> ```
>>
>>
>> To overcome that,  we can use double quotes around the value for dotted notation.
>> Something like this:
>> ```
>> [db."staging.kernelci.org"]
>> api = "https://api.staging.kernelci.org/"
>> ```
>>
>> That will be parsed as:
>> ```
>> 'db': {'staging.kernelci.org': {'api': 'https://api.staging.kernelci.org/'}}
>> ```
>>
>> We would like your comments/suggestions to select the best approach possible here for naming conventions. Please check out the discussion[3] here and feel free to provide your input.
> Thanks for detailing the changes.  I would personally be in
> favour of relying on the built-in namespacing feature of TOML
> with dotted keys as that would simplify our code base and remove
> scope for bugs or corner cases.  The likelihood of users hitting
> the issue of creating a key such as api.staging.kernelci.org
> rather than api."staging.kernelci.org" can be easily avoided with
> a sample settings file and documentation examples.  Also this is
> a standard thing in TOML, and it's a widespread config language
> standard now so I would expect many users to already be aware of
> this.
>
>> The `kernelci-pipeline` has already started adapting to this new format. This is the work in progress[4] for reference.
>>
>> Standard locations for the file are the same as `kernelci.conf` file i.e.
>> - kernelci.toml in the current working directory
>> - ~/.config/kernelci/kernelci.toml for per-user settings
>> - /etc/kernelci/kernelci.toml for system-wide settings
>>
>> Along with this new format, we are still keeping support for the old `kernelci.conf` for now. However, It is recommended to switch from the `.conf` to `.toml` as the older format will eventually be deprecated.
> In particular, the new LAVA callback handler service now
> exclusively relies on a TOML settings file to be present in order
> to find credentials for uploading files to storage (job logs...).
>
> All the regular command line tools and new pipeline services
> support both the legacy .conf settings and the new TOML format.
>
>> We are planning to support the older format until we move from the old backend to the new API. As per the planning, the transition will take place by the end of 2023. Suggestions for deciding the deprecation timeline are welcome.
> Please note that the official timeline for deprecating the legacy
> system hasn't been confirmed yet, but yes in principle it
> shouldn't happen earlier than the end of 2023.  So roughly
> speaking, users should move to TOML settings by the end of the
> year.  A formal timeline with more details will be shared later
> when things are more certain.
>
> Thanks,
> Guillaume
>
>> [1] https://github.com/kernelci/kernelci-core/issues/1913
>> [2] https://github.com/kernelci/kernelci-core/blob/main/kernelci.toml.sample
>> [3] https://github.com/kernelci/kernelci-core/issues/1913#issuecomment-1572217965
>> [4] https://github.com/kernelci/kernelci-pipeline/pull/266/
