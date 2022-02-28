Return-Path: <david@redhat.com>
Message-ID: <3b7c068b-ac7e-62fc-f0cd-a8dbf8642876@redhat.com>
Date: Mon, 28 Feb 2022 10:37:46 +0100
MIME-Version: 1.0
Subject: Re: [PATCH V3] selftests: vm: Add test for Soft-Dirty PTE bit
References: <20220224212335.3045905-1-usama.anjum@collabora.com>
From: David Hildenbrand <david@redhat.com>
In-Reply-To: <20220224212335.3045905-1-usama.anjum@collabora.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-ID: <kernelci.groups.io>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: kernel@collabora.com, kernelci@groups.io, Will Deacon <will@kernel.org>, Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org

On 24.02.22 22:23, Muhammad Usama Anjum wrote:
> This introduces three tests:
> 1) Sanity check soft dirty basic semantics: allocate area, clean, dirty,
> check if the SD bit flipped.
> 2) Check VMA reuse: validate the VM_SOFTDIRTY usage
> 3) Check soft-dirty on huge pages
> 
> This was motivated by Will Deacon's fix commit 912efa17e512 ("mm: proc:
> Invalidate TLB after clearing soft-dirty page state"). I was tracking the
> same issue that he fixed, and this test would have caught it.
> 

A note that madv_populate.c already contains some SOFTDIRTY tests
regarding MADV_POPULATE. Eventually we want to factor out
softdirty/pagemap handling+checks for easier reuse.


-- 
Thanks,

David / dhildenb

