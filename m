Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0B1168C7
	for <kernelci@lists.linux.dev>; Tue,  6 Jun 2023 07:12:40 +0000 (UTC)
Received: from [192.168.0.109] (unknown [103.15.57.186])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jenysadadia)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C44086602242;
	Tue,  6 Jun 2023 08:12:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686035553;
	bh=1AfrA1vWsF85Ry7DBeGojPAvvpAu1U0tAJ59esEOvvY=;
	h=Date:To:Cc:From:Subject:From;
	b=enolmCZwxQ3L7jrHknli4X3IbHT3UM+Ri8I1bId6ftUD/83UZIz01UggVLpBkioqu
	 dCwnuiZgCpwDrs/lywmEzIUSe12M4nPsmfJ5TuwMJJI5bhy59C1usJ317/sHQtqN1S
	 e3bD9nr91ZfGDmg4HtL1CXZ3Xtndurlzm+JraLdDSLGJZXKgPUXSj0IzOWOYlUVCtL
	 kh9MgI2Z4iFrCD4mMCOGwg35gVba2G9kj2y3xk2CfqaqxCpG0AheGTYnkVKIjaEPjH
	 JEWpQqG7r9SeJtsPK6G+omMaEL5iv9i8Kl7k4B34P7UgVOfHXE8wYJWZhJMbvTujkZ
	 gO8naFkovd6LA==
Message-ID: <0d91ed78-e648-d41e-1f29-2eb7dbb488ae@collabora.com>
Date: Tue, 6 Jun 2023 12:42:26 +0530
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: kernelci@lists.linux.dev
Cc: Guillaume Charles Tucker <guillaume.tucker@collabora.com>
From: Jeny Sheth <jeny.sadadia@collabora.com>
Subject: Enabling TOML support for user settings
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello everyone,

We have enabled TOML support for user settings in KernelCI-Core.
Python package `toml` has been integrated to parse the settings file. 
Please see the Github issue[1] for more details on this transition.

The sample config file `kernelci.toml.sample`[2] has been added to the 
repository.
As per the former convention with `.conf`, we will continue having a 
`DEFAULT` section and other sections for different command line tools in 
the `.toml` file.
For example:
```
[DEFAULT]

storage = "http://localhost:5002"
db_config = "localhost"
api_config = "docker-host"

[kci_build]

build_config = "next"
arch="x86"
j = 3
```

With TOML, we can use different data types for values (strings with 
double quotes, integers, float). Unlike `configparser` this removes the 
need for data type conversion for values.

Components such as database, labs, and storage will follow the 
convention of the form ["storage:docker-host"].
For the correct parsing from TOML decoder, we need to use double quotes 
around the name when it includes ":".
Below is the example for more detail:
```
["lab:my-lava-lab"]

user = "user-name"
lab_token = "1234-5678"

["db:staging.kernelci.org"]

db_token = "XXX-XXXX-XXXX-XXXX"
api = "https://api.staging.kernelci.org/"
```

Another suggestion is to use dotted keys instead of ":" for the above 
section names. That way we can remove double quotes around the section 
name. However, that can cause issues when we have dotted values e.g. 
"staging.kernelci.org".
If we go with the dotted name, it will look like 
[db.staging.kernelci.org] and the parser will assume that it is a nested 
dictionary.

For example:
```
[db.staging.kernelci.org]
api = "https://api.staging.kernelci.org/"

```
Above will be parsed as:
```
'db': {'staging': {'kernelci': {'org': {'api': 
'https://api.staging.kernelci.org/'}}}}
```


To overcome that,  we can use double quotes around the value for dotted 
notation.
Something like this:
```
[db."staging.kernelci.org"]
api = "https://api.staging.kernelci.org/"
```

That will be parsed as:
```
'db': {'staging.kernelci.org': {'api': 'https://api.staging.kernelci.org/'}}
```

We would like your comments/suggestions to select the best approach 
possible here for naming conventions. Please check out the discussion[3] 
here and feel free to provide your input.

The `kernelci-pipeline` has already started adapting to this new format. 
This is the work in progress[4] for reference.

Standard locations for the file are the same as `kernelci.conf` file i.e.
- kernelci.toml in the current working directory
- ~/.config/kernelci/kernelci.toml for per-user settings
- /etc/kernelci/kernelci.toml for system-wide settings

Along with this new format, we are still keeping support for the old 
`kernelci.conf` for now. However, It is recommended to switch from the 
`.conf` to `.toml` as the older format will eventually be deprecated.
We are planning to support the older format until we move from the old 
backend to the new API. As per the planning, the transition will take 
place by the end of 2023. Suggestions for deciding the deprecation 
timeline are welcome.


Thanks,
Jeny

[1] https://github.com/kernelci/kernelci-core/issues/1913
[2] https://github.com/kernelci/kernelci-core/blob/main/kernelci.toml.sample
[3] 
https://github.com/kernelci/kernelci-core/issues/1913#issuecomment-1572217965
[4] https://github.com/kernelci/kernelci-pipeline/pull/266/
