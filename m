Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563F823C6A
	for <kernelci@lists.linux.dev>; Tue, 13 Jun 2023 17:25:37 +0000 (UTC)
Received: from [192.168.0.109] (unknown [103.56.182.143])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jenysadadia)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9B7846602121;
	Tue, 13 Jun 2023 18:25:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686677135;
	bh=/0JuXBFhvuZZyjXgB4B9dY0IGz4nK0mU056Hpv1I2eE=;
	h=Date:From:To:Cc:Subject:From;
	b=YY4NWsFSeuMlor1BEh4ucjbu+Gkh3+VhaiV40JNuNowuCU8YCoNVYLqGeufJVYg9d
	 fVjUnNlCgXyQlZyhOYI1T2i6FSvJzDv8amC/Gc0n6UVujfhlOUaVgY7BLTIAJ0lLOk
	 lR01VaBiKxXU4lZOLLlwgYmednfcUN9dfxTKFOGEFOhKAgayukV9kW/mL7ir20Wx/s
	 he4rWXPovjZyT8AVztGPSNKvngJTZdm1pXEjXFTGSA8b7xyqEH6x5taOHFhbOWn6fe
	 2IJYc4JrpsW41NkE/SJdBHk7HbJD6kldjOUWbb/XNyceEBaI/tLfSjJ6//0PhlLtSX
	 gm9fmOsOF5gqA==
Message-ID: <96ca4b8a-ee61-5f57-3c01-5a36adbd47b2@collabora.com>
Date: Tue, 13 Jun 2023 22:55:23 +0530
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
From: Jeny Sheth <jeny.sadadia@collabora.com>
To: kernelci-sysadmin@groups.io
Cc: kernelci@lists.linux.dev
Subject: Request for Github App for Authenticated calls
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,


It is a known issue that we are frequently hitting Github API rate limit 
with staging jobs from kernelci-deploy scripts. We already have a Github 
issue for this: https://github.com/kernelci/kernelci-deploy/issues/62

Below are some error logs for reference:

```

Pushing kernel test branch for mainline
path: checkout/linux
repo: kernelci/linux
Traceback (most recent call last):
   File "/home/kernelci/kernelci-deploy/./kernel.py", line 87, in <module>
     ret = main(args)
   File "/home/kernelci/kernelci-deploy/./kernel.py", line 43, in main
     repo = kernelci.GITHUB.get_repo(repo_name)
   File "/usr/lib/python3/dist-packages/github/MainClass.py", line 294, 
in get_repo
     headers, data = self.__requester.requestJsonAndCheck(
   File "/usr/lib/python3/dist-packages/github/Requester.py", line 275, 
in requestJsonAndCheck
     return self.__check(*self.requestJson(verb, url, parameters, 
headers, input, self.__customConnection(url)))
   File "/usr/lib/python3/dist-packages/github/Requester.py", line 286, 
in __check
     raise self.__createException(status, responseHeaders, output)
github.GithubException.RateLimitExceededException: 403 {'message': "API 
rate limit exceeded for 52.250.7.52. (But here's the good news: 
Authenticated requests get a higher rate limit. Check out the 
documentation for more details.)", 'documentation_url': 
'https://docs.github.com/rest/overview/resources-in-the-rest-api#rate-limiting'}

```

I have been investigating the procedure to use authenticated Github API 
calls to fix the issue. Please see the issue comment here for the 
proposed solution: 
https://github.com/kernelci/kernelci-deploy/issues/62#issuecomment-1525661902

I have mentioned in the comment that we need to create a Github App for 
the KernelCI organization. As I am not an authorized person to do that, 
I would appreciate it if one of the admins can help me with this procedure.


Thanks in advance.


Thank you, Jeny

