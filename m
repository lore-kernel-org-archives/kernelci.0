Date: Mon, 15 Nov 2021 09:59:50 -0800
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH net-next v6] page_pool: disable dma mapping support for 32-bit arch with 64-bit DMA
Message-ID: <YZKgFqwJOIEObMg7@infradead.org>
References: <20211013091920.1106-1-linyunsheng@huawei.com>
 <b9c0e7ef-a7a2-66ad-3a19-94cc545bd557@collabora.com>
 <1090744a-3de6-1dc2-5efe-b7caae45223a@huawei.com>
 <644e10ca-87b8-b553-db96-984c0b2c6da1@collabora.com>
 <93173400-1d37-09ed-57ef-931550b5a582@huawei.com>
 <YZJKNLEm6YTkygHM@apalos.home>
MIME-Version: 1.0
In-Reply-To: <YZJKNLEm6YTkygHM@apalos.home>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-ID: <kernelci.groups.io>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, Guillaume Tucker <guillaume.tucker@collabora.com>, davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linuxarm@openeuler.org, hawk@kernel.org, akpm@linux-foundation.org, peterz@infradead.org, will@kernel.org, jhubbard@nvidia.com, yuzhao@google.com, mcroce@microsoft.com, fenghua.yu@intel.com, feng.tang@intel.com, jgg@ziepe.ca, aarcange@redhat.com, guro@fb.com, "kernelci@groups.io" <kernelci@groups.io>

This is just popping out of nowhere on lkml, but yes ARM LPAE
uses a 64-bit dma_addr_t, as a 64-bit phys_addr_t implies that.
Same for x86-32 PAE and similar cases on MIPS and probably a few
other architectures.

But what is the actual problem with a 32-bit virtual and 64-bit
pysical/dma address?  That is a pretty common setup and absolutely
needs to be deal with in drivers and inrastructure.
