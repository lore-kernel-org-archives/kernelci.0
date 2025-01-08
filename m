Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F331FC7E0
	for <kernelci@lists.linux.dev>; Wed,  8 Jan 2025 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347888; cv=pass; b=AzuiGyUh2mhpKpKqFyk/yGJVraX2iYPjsnWEdpujdmkuOzlHvBtSZttV0tcOgrQn9PXXuOPhjXyh9m70KHD98ggFY2DjXUmPGSv/N/US0jL2falFTswdhvRUrKelklqe55jWElzGOg4/vV44eB5NJ/bLKfRqX3/48mFeQQO9p0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347888; c=relaxed/simple;
	bh=xEQY81qjHttUfn6aVl188GpaNGqyC/CvqcRmNf0za+s=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=M070kcfyIVYfkibhqMYsejczf+7EdN9EYnvyaUP0jglq0YphlgKqgupc0pmTxnZiIs7p4VyHXq1ruqtjY+xgj65CZNbNAEhxJuFqbuxImuHoSH7PaKnNQ+RWrD/veB0d8/NjsoDMPQLyuA96xMV82Cyzr9fG+GYQhDCNNJErnec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b=kZwk4YIr; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=denys.f@collabora.com header.b="kZwk4YIr"
ARC-Seal: i=1; a=rsa-sha256; t=1736347884; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YAhd7kzOc15QfUD4Wka+qGcQUm9IEuCzZ7Fw1nluwJ6Wn5TkKL/Z9uh7YK/yway5jl8a3jCPNenNB4/A1igXx4QSUfgBNUMZWxd1YRz9c5MWgCt/HmLfTjHpG29+w3Gi3rWSGzMECSxpxCFUBKbRDcDXGt8v8R1yAkXRyjGymCY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736347884; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=WAAyiJQFW2v0z0STp83H22TeImgARRdT7GliK3Qo9+g=; 
	b=F+Lq1EqldBtfh2tDYgtgt2FMEdoyzkA4C1D4c27ZNGW9QbGczDQ6ZTEz3BF5kJlStTF7uV7jDvQCv3SlOSozr5x1o7okWNlUKzu985AigqTA1BA4/jIIELmh3bXBn8m4pxZ8LiIOiovhOrZCD4k1NH7m8RR0EPYFXIfID/czK1c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736347884;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To:Cc;
	bh=WAAyiJQFW2v0z0STp83H22TeImgARRdT7GliK3Qo9+g=;
	b=kZwk4YIr8svj5l0WjshnkZogxTARvc5snBZr4EGcNE2lG5DHXTQgV9UZEuqI6HIC
	/OSbea7vbdBW9FI6ViJM9AKILxury2lOI0KCeeHJYT5wQHY1N/qU5kZVFMolF5uCGku
	YJZny2NdAd4CEUt0IEwCyABekjIBB84YKTxccti0=
Received: by mx.zohomail.com with SMTPS id 173634788048421.730844521668814;
	Wed, 8 Jan 2025 06:51:20 -0800 (PST)
Message-ID: <8a2c4f7da3df1d3cd0e52c3bcc49f7fee9475b0c.camel@collabora.com>
Subject: KernelCI Weekly Newsletter (Week 2)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci@lists.linux.dev
Date: Wed, 08 Jan 2025 16:51:17 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ZohoMailClient: External

**Summary** =20
This week, we have been working on the following: =20

- kci-dev pre-release v0.1.1dev1 (It is now possible to test the pre-
release with pip install kci-dev=3D=3D0.1.1.dev1)
- First production update of 2025 =20
- Improvements to the KernelCI API documentation =20
- Implementing automated basic cleanup of new KernelCI storage backend
to manage low disk space (currently based on data age) =20
- Removal of 4.19 kernel from testing due to its EOL, except for the
CIP project =20
- Preparation of an Ansible recipe for setting up a new production (and
storage) server =20

---

**Upcoming Discussions** =20

1. **Legacy KernelCI Storage Cleanup** =20
   As we deprecate legacy storage, we need to discuss the cleanup
process and how to handle the remaining data. =20
   While we aim to retain at least the latest rootfs images, decisions
are required on the rest of the data. =20
   If you have any important data stored in the legacy storage, please
let us know. =20

2. **KernelCI Development Roadmap** =20
   Through discussions with the community, we've identified a list of
features and improvements for KernelCI. =20
   Please share your ideas or indicate if you'd like to contribute to
any of these items.=20
   This is initial draft, and we will continue to refine the list.

   - **Legacy System Deprecation**
   - **Dashboard Improvements and continued development**
   - **KCI-DEV Tool Development**
   - **Reducing Sysadmin Overhead** =20
     - Increased automation and observability =20
     - Proper IaC, monitoring, and alerting =20
     - Self-service onboarding/offboarding processes =20
     - Improved documentation, capacity/log management, etc. =20
   - **Automated Staging and Production Deployment** =20
   - **Kernel Build Infrastructure Improvements** =20
     - Load-balancing =20
     - Faster artifact upload optimization =20
     - Caching, deterministic build scheduling =20
     - Support for bare-metal builders =20
   - **Storage Infrastructure Improvements** =20
     - Data scraping and egress usage protection =20
     - Data retention policies, optional tagging =20
     - Mini-CDN for traffic redirection to the closest storage =20
     - Minimalistic caching =20
   - **Maestro API Enhancements** =20
     - Unified API endpoints and improved documentation =20
     - Additional endpoints for new features =20
     - Unified token/user management =20
     - WebSocket interface for real-time notifications =20
   - **Maestro Data Structure Enhancements** =20
     - Timestamps for task queueing, start, and end times =20
     - Extended test information beyond pass/fail/miss =20
     - Graceful event handling (timeouts/exceptions) =20
   - **Generic Pipeline Schedulers** =20
     - Generic kbuild and test schedulers =20
     - Simple examples for generic test scheduling =20
   - **Self-Hosted KernelCI (On-Premises)** =20
   - **Cloud VM Testing** =20
   - **RISC-V Enablement** =20
   - **AOSP VTS Testing** =20
   - **KCI-GitLab Development** =20
   - **KernelCI Service Reliability for Uptime SLAs** =20
   - **Test Framework Modernization and Unification** =20
   - **Test Catalog and Integration** =20
   - **Test Results Metrics Support** =20
     - Discuss storing and visualizing test results metrics =20
   - **Tree Registration to Maestro** =20
     - Simplify the process for developers to register their trees =20
   - **Subsystems and Maintainers Enablement** =20
   - **Logspec Tool for KCIDB and Maintenance** =20
   - **Issue Editor and KCIDB Backend** =20
   - **Web Dashboard Customization for Users** =20
   - **AI for Results Analysis** =20
   - **Continuous Result Analysis** =20
     - Tools and dashboards for quickly identifying infrastructure
errors and bad reporting =20
     - Continuous data analysis and automated bug reporting to CI
systems, the Kernel community, or test suite maintainers =20
   - **KCIDB Maintenance and Support** =20
   - **KernelCI Labs API** =20
     - Enable other CI systems to dispatch tests to KernelCI hardware
labs =20
     - Define API for test definition submissions and authorization
processes =20

---

**Issues** =20

- **K8s Build System Congestion:** =20
  Due to congestion in the Kubernetes build system, kernel builds have
experienced delays of up to 2 hours. =20
  We are actively working to resolve the issue and improve build times.


