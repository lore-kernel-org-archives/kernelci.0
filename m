Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3405861FEB
	for <kernelci@lists.linux.dev>; Fri, 15 Nov 2024 10:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731666186; cv=none; b=HUWKREK7/iEHkJq3ILDGqLyFlaKQ8U39rYBkFqLeALoKejfo13uH/Ch60IabKvbkzEUpSunGH69Eb/waW5GUd71VjVc0Hcq3mmqFWBPqam6x5WAssF1FPcMV9HcYY1slSdJqWxxWSI9sWcUHR4lY5yWTxRlRVvX+N7FdN2qg0TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731666186; c=relaxed/simple;
	bh=AamLl3y2AKuGrQ+4lxOEAL3rt3hTqwFDZxOtI1jUwQ8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i44cI/ZOB+GKkPrh0NvW25JRPIqMBRjQHq7Uh6qz3QGLBfflnPYSgVyvdIB3i54PhLGAFRzvUSwG0KdCFLjNwijBPEiFD2dEYHHZPq2yLALApiJq++mTTGc+T7qCCDsOslFfy2JbVgPzLqS8fp2GlHz4LPkIoEbJgWyq7TL/1kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KoWZumYw; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KoWZumYw"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb5111747cso5340711fa.2
        for <kernelci@lists.linux.dev>; Fri, 15 Nov 2024 02:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731666183; x=1732270983; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/OHxKP4AVQX4dy3BwpZlHiOmMIRCDcIf5Yn8GzwRDFY=;
        b=KoWZumYw3/iwVJLWmBsQI7wZMY2+JtEmRNvYixK3rLZes/11gCAQVSFjK6TuTBk7Ih
         rNpfP82Tz5cScnKfKE1ae/woc8oVud5JsoWlpQhzta8eOUxyA28a+nvG/MZqwZunvTz2
         y6TtGAFlvD72GBwd83896Tm4x0RY4DWxMLgxCK4Y5n+MYg5YPcMgocZXNcHS8KgaXjlJ
         ddpUTqoyksXR+UN7LFkzERXqMv9gdWty9yUSPWDnjy3F/dOqVCl9kDJKgssKI9GtU1iG
         iBGFYQrbGwiUIza/s5J2YYngrYR6rj+U8tqdBtoK7UjgAsCs7sJHOGkiexXSqG+LeHbK
         QLXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731666183; x=1732270983;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/OHxKP4AVQX4dy3BwpZlHiOmMIRCDcIf5Yn8GzwRDFY=;
        b=UGWocXQlpqTUTidZPENCzZo5navge6MzbPxq0oOFwCXbJMVDr20eITcjDy1AW7AT+z
         /bYV2P+u/bsKbWeZQc1KbB8kqksMTuQYIlQkLbVK9N9+u9MM481esMMQiwkSJhq0yqJb
         mDbPIZxQoPmBBllXorbGJ7NcXGhIzoQQBVPMezwWLeof7R44NG1rXI7d9HqG+Xjt0GvW
         mDJTLKVAodWQxJNAiRS/kNRaullOi5thUj0PzcPWjtCFn6w5TYnZ/1Sfgsj9aIiPNhAV
         CAo5CiJfhg9pS9huZXboMWcSj4bWPrdSxcnWmi2xZhGtpNKRUogNa1NZ0gFXodu2Rsvc
         NF/w==
X-Gm-Message-State: AOJu0YyJiYKLc/HIPuxkmxjxWO+4qh/h7SzILW1sn/E2SwboC4ADGpWs
	CSA5dmTxQ1hUdoSF+5Zah10dOVX8v6fUhEUBt0W9pEbZp5hauBF+wWfKi2XDXWk=
X-Google-Smtp-Source: AGHT+IGtUFcg1mM1ifaQZkwsgYWw8RktYBbgm3P5QjPJxjjXqaJ2NO76aHOmKzgz5iISbmOkVix/SQ==
X-Received: by 2002:a2e:a902:0:b0:2fb:30d5:669a with SMTP id 38308e7fff4ca-2ff6055168cmr11397471fa.0.1731666183256;
        Fri, 15 Nov 2024 02:23:03 -0800 (PST)
Received: from [192.168.7.189] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da298c97sm52549155e9.40.2024.11.15.02.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2024 02:23:02 -0800 (PST)
Message-ID: <63f7cc2f-3f38-4d8e-82c4-86511af6f950@linaro.org>
Date: Fri, 15 Nov 2024 11:23:02 +0100
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: The integ branch disappeared
To: Muhammad Usama Anjum <Usama.Anjum@collabora.com>
Cc: kernelci@lists.linux.dev
References: <8a380b8c-3f09-4179-8cad-9aae51b098af@collabora.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <8a380b8c-3f09-4179-8cad-9aae51b098af@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/11/2024 11:16, Muhammad Usama Anjum wrote:
> Hi Neil,
> 
> We had enabled for-next and integ branches from your tree[1] in KernelCI.
> The integ branch has disappeared. I just wanted to check with you if we
> should enable some other branch in place of integ in KernelCI.

The integ branch was maintained by Kevin before I take the maintainership,
I have no plan to re-create one, so for-next should be the one to test.

Thanks,
Neil

> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git

