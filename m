Received: from sv2220.xserver.jp (sv2220.xserver.jp [183.90.240.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16741548C
	for <kernelci@lists.linux.dev>; Sun, 15 Feb 2026 17:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.90.240.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771176774; cv=none; b=RLfZw3g1L56HJXz5f/CmLu26Q1BtB8/rSKm3v2VBkMiNbu0N4qJ3BQ68Ph6aIb4V4VWF0tZ6TJKjJ4gc+8VVdkKeweblEb/y4Qk2oi4LdcbjomzaxnikkS5spV3DKD9OG0pG+04iS2ynPNcnw8IfZZBCcyH3J/+YUC1159UH8kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771176774; c=relaxed/simple;
	bh=5oDVRWN5zkM9XzZez/ePafBb/iQpeTPWGVoLezc3crU=;
	h=Date:To:Subject:From:MIME-Version:Content-Type:Message-Id; b=ddqPLGVHoJs8zlg6BjkmhzUXF3EBwpb6h+/3VEoTW6eKWWEjK+wkxEiFypdRAG0sL4aEbnwGj9iYL6y03dYs6/OaGYVkk9Ocleid1vImSjS6J6hlWRutSEG+fjwN2jAaX/JFh6+Bl/unaUI0DYlYMQXL/J2axqvoWsi670SXKh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitstrong.co.jp; spf=pass smtp.mailfrom=bitstrong.co.jp; dkim=pass (2048-bit key) header.d=bitstrong.co.jp header.i=@bitstrong.co.jp header.b=YOqHpHUG; arc=none smtp.client-ip=183.90.240.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitstrong.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitstrong.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitstrong.co.jp header.i=@bitstrong.co.jp header.b="YOqHpHUG"
X-Virus-Status: scanned (With Secure/Atlant/virusgw2212.xserver.jp/)
Received: from DESKTOP-QQ8VIH0 (117.102.199.170.static.zoot.jp [117.102.199.170])
	by sv2220.xserver.jp (Postfix) with ESMTPSA id 59ECF9819E4D30
	for <kernelci@lists.linux.dev>; Mon, 16 Feb 2026 02:25:59 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bitstrong.co.jp;
	s=default; t=1771176359;
	bh=Mlraj0EGkBTmDvkM7F8vH1P3CFR1u7Wv2wHBkfZTUWk=;
	h=Date:To:Subject:From:From;
	b=YOqHpHUGckvEBmIn6cDzydgQV0BTJodbzQQyi6CTn0jhxnPRJm61Pvzptlr9srprk
	 DfK08priAf5ywOuU/y5/3BztmPhSeltKp+UaSzm+y0te8CJS/058QC9KPeM2gXwYBg
	 ggcNBd0wpoUrO24geg3347+Fhs1ysc2hr8RLsYGAAWXW5lTjHSyzt5+gptR059YAQK
	 0kDlzajvLlJKZYqXjgAfTRM9iOwsvH0GmysHu9+IcqdbIH01GGurPr8OS+YoauCMFI
	 Lvv1KYA9s1ZjUCJA8tkjkKdB4m9T1qFR/yNUOYl30hyPjZzfx7nxZQNrC9CTBA8F3Y
	 43ZmdbuLYCAjg==
Date: Mon, 16 Feb 2026 02:26:00 +0900
To: kernelci@lists.linux.dev
Subject: =?ISO-2022-JP?B?GyRCM3Q8MDJxPFIlUyVDJUglOSVI?=
 =?ISO-2022-JP?B?JW0lcyUwISElYSE8JWslXiUsJTglc0F3SVUkSyREJCQkRiROOGYwRkZi?=
 =?ISO-2022-JP?B?GyhC?=
From:=?ISO-2022-JP?B?GyRCM3Q8MDJxPFIlUyVDJUglOSVIJW0lcyUwGyhCIBskQjJoQXwbKEI=?=
 =?ISO-2022-JP?B?GyRCO3Y2SEl0GyhC?=<admin_m@bitstrong.co.jp>
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="__PHPRECIPE__"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215172559.59ECF9819E4D30@sv2220.xserver.jp>

--__PHPRECIPE__
Content-Type: text/plain; charset="ISO-2022-JP"

お客様各位
このメールはホームページに掲載されている方、過去に当社の従業員と名刺交換させていただいた方、ホームページ等にお問合せいただいた方、セミナーや展示会、内覧会等にご参加いただいた方などにお届けしています。

いつもお世話になっております。ビットストロング画像事業部です。

このたび、当社では、当社の情報を幅広くみなさまにお伝えしていくためにメールマガジンを開始することになりました。
最新のニュースリリースや新製品情報や公式SNSチャンネルのご紹介等ビットストロングが発信する各種情報の最新版をご紹介して参ります。

定期配信は3か月前後1回、その他臨時便なども配信していく予定です。どうぞ楽しみにお待ちください。

このメールアドレスに心当たりがない場合、若しくは、このメールマガジンが不要の場合は、大変お手数ですが、以下の手順にて配信停止のご連絡をお願いいたします。

◆メール配信停止
メール配信停止をご希望の場合は、下記URLをクリックしてお手続きをお願いします。
https://bitstrong.co.jp/admin/contact.html

（ほかの手作業によるご対応で処理漏れが発生する場合があるため、できるだけ上記URLから配信解除をお願いします。）

◆個人情報保護について
お客様の個人情報は、必要な保護措置を行った上で、弊社の個人情報保護方針に従って適切にお取り扱いをしております。
※個人情報保護について下記URLに記載しております。
https://www.bitstrong.com/jp/privacy/

今後とも株式会社ビットストロングを宜しくお願いいたします。


◆お問い合せについて
製品や本メールに関するお問合せ・ご意見は以下URLよりお願いいたします。
https://www.bitstrong.com/jp/support-info/support/ 

==============================================
送信元：
株式会社ビットストロング　
画像事業部広報担当
TEL：03-3868-5605
mail：admin_m@bitstrong.co.jp
〒112-0002東京都文京区小石川2-25-16　パーソナルハウス 2F
https://www.bitstrong.co.jp
===============================================

──────────────────────
■ メール配信停止をご希望の方は以下のリンクをクリックしてください。
https://bitstrong.co.jp/admin/contact.html?email=kernelci%40lists.linux.dev
──────────────────────

--__PHPRECIPE__

