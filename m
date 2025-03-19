Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0271E47AE
	for <kernelci@lists.linux.dev>; Wed, 19 Mar 2025 17:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742405363; cv=pass; b=NWExQ3ofMk9TS0xasMcr7F5abjMgpfRQr+r/73dNSssHTpXVPZoUGdb2WozEZS8rWFIrpbB2Oca7mq9hDyblnICve9UkiW+FPjOX/lOG8pBbbxQSZnIE9i6zFm+rHBlsBeRw6M39NesPPl83wKsjZaGswXO2JWrVhSze91F5xXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742405363; c=relaxed/simple;
	bh=qCo6lHeK/P4FqdCO/sAC60BIDYfnrsOMTqCcMscvWWQ=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=CmnFIcTmLyODhRcqmCilTqRRPOiphExx73bnj09PKYR20lgakZSZq0AC6OeRY0eIrxlIoGPsd2bvXcwYZf2EIEYdz5mEw6Awvi4SsqavdFBAXxvCuFCIrrnKUXo73WOUUNMo6bdjsNy3bZ/baTCVWCWkBx7lGXTin9ozyzn3/wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=hNEmiaQU; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="hNEmiaQU"
ARC-Seal: i=1; a=rsa-sha256; t=1742405359; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LVrwlj1J1zy9wh0ke96mgFanlKaZWsnNbPXqmGSXDPU13HbCaJVFemvT/wlL4Q193huUJNFbaxuf/E+Jso1Zh9fvmiSKNLO2FXGVyNgD1jQhtHcZhB0pMcnDdTSADlpA4TLC1c8/s7hOGuiF1WgP2yvYzI2b1PplmElE0gtI3F4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1742405359; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=qCo6lHeK/P4FqdCO/sAC60BIDYfnrsOMTqCcMscvWWQ=; 
	b=GTgUZ7zzYPToqfqCuOvPqW/isk9dN4p6DuH1er5gZ5sx4oQgBXIN05y8RDifaFXhrUtNbG6itiklU+j3fx9/hwCB2PLu2wKN3fixROHyweqI/xYvzu+nDQzI+isTGBmYIrpiTy386D6dt743LD0EXbYZZsF7jNcI91NzvoDDqKI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742405359;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=qCo6lHeK/P4FqdCO/sAC60BIDYfnrsOMTqCcMscvWWQ=;
	b=hNEmiaQUO2Oa0Tl56O7ioTnV3cXRNsZf4Ebvk4Q3W1UUonkoDsaYLFgw/qMcGLiq
	zTOItLbjVVJtCypt4FiCRutic8LLCraLA8DzJ8uTHxFCFl56YdfL+iTePEykO2WdKyi
	rCL402J8yBFlbMUhFtIyzvr8Kp6YNmZlXjroqC3w=
Received: by mx.zohomail.com with SMTPS id 1742405356444434.4062916620218;
	Wed, 19 Mar 2025 10:29:16 -0700 (PDT)
Message-ID: <7697aa6eb2069b0ba7ff8f221935dede43d97a3e.camel@collabora.com>
Subject: kernelci-storage update
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Date: Wed, 19 Mar 2025 19:29:13 +0200
Content-Type: text/markdown; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

# KernelCI-Storage Project Update

## Deployment Status =20
As mentioned in the last newsletter, we have migrated the production server=
 to a new distribution (Bookworm) and deployed kernelci-storage. The system=
 is also deployed on staging and is currently migrating to files-staging.ke=
rnelci.org.

## Implementation Details =20
As planned in the first newsletter, we implemented a minimal API sufficient=
 for the KernelCI project to work. Based on feedback, we updated endpoints =
to make them compatible with the kernelci-core storage backend implementati=
on.

Currently, kernelci-storage is written in Rust. The source code is availabl=
e at the [kernelci-storage]([https://github.com/nuclearcat/kernelci-storage=
](https://github.com/nuclearcat/kernelci-storage)) repository but will be m=
oved to the KernelCI organization namespace once pending issues are resolve=
d.

Available endpoints are documented in the [kernelci-storage README]([https:=
//github.com/nuclearcat/kernelci-storage/blob/main/README.md](https://githu=
b.com/nuclearcat/kernelci-storage/blob/main/README.md)): =20
- `GET|HEAD /path/to/file` - Download artifact (doesn't require authenticat=
ion) or retrieve file info =20
- `POST /upload` - Upload artifact (requires authentication), multipart/for=
m-data =20
- field: file0 - file to upload =20
- field: path - path to save file to, can be absolute or relative to upload=
 directory (default: upload directory root)

## Implemented Features =20
- Heuristics to set correct content-type for uploaded files, while also sup=
porting custom content-type settings =20
- Support for uploading large files (resolving issues that existed in the P=
ython backend) =20
- Operation as a caching forward proxy to reduce charges from the storage p=
rovider per request =20
- Support for downloading files with range requests

## Upcoming Features =20
- Support for restricting upload directory (by user) =20
- Lifecycle management for uploaded files (certain types of files might be =
deleted earlier)

## Challenges =20
We has planned file browsing feature, but during implementation we faced ch=
allenge: Azure Blob Storage object list retrieval is very slow, 5000 object=
s (one request limit) takes 2-5 seconds to complete, and due dtb files we h=
ave tens of millions of them. We have solution for this, but it is not impl=
emented yet.


## Future Plans =20
We need your feedback! Please share your thoughts and suggestions on the ma=
iling list or send message to our Discord server.

Thanks for reading!

