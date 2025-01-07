Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B071F37CF
	for <kernelci@lists.linux.dev>; Tue,  7 Jan 2025 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736274998; cv=none; b=cSGaCCQjVx+3GeedV0qYUM8Fv3rF5fd1jIeGf+c5R92qu2UBKHHYzZU8dO/R56PbJ/0Dh2yK12/c/O+o1st/PnarnMBSpaNbV+4vhicOE/5egNR5ZhEVJUUsChYc955Wqd7CyRt55hV05HXi+qGRmh/9a7/zufrpHfJ6I57RDic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736274998; c=relaxed/simple;
	bh=D4ZYiVlhNYk6m/EXyeq/3IyUJ4/ur5s+iP2N/L39/iQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=URUdd48IhEP6OsaHSqK7xCwSj2Atsaxj0ZJkT4TnwpIQUG9AMKdiaWDAMkeQAMyJQeNl2bo4eOj6mZ8KXm+CSdTKPTh4zkRO3Z49CjALx37DuC+ZmSDJqYFMdnGVpXKwGoj5tZA+GCCVt5y4o7KsQCoz2J10s16msqNamLGyOxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b+8OPnjO; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b+8OPnjO"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-85c15e283bfso2624411241.2
        for <kernelci@lists.linux.dev>; Tue, 07 Jan 2025 10:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736274995; x=1736879795; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D4ZYiVlhNYk6m/EXyeq/3IyUJ4/ur5s+iP2N/L39/iQ=;
        b=b+8OPnjOke/oMaU8XTD9HHA28c/lYxtWyXekBFuQVB8ahxY7L1JYnzk2EAf3lAJynK
         zo90243cG1sUWd9k5uLYYKC7h10FPr82MuqQdJnBEuCNnzsD8YX+jcRGdSaZc/5Btqfs
         G/R30lIRRXk2THnwUS6XYwF7lJoRlE6HZt2hJec/AxYmRV3tW35cUUdhil/Nh4upNnNr
         +IaPm6otS3X8zufw3oIo6SO1MuMOgQlBrZdNNyg6T3aF0UR/TKO5CzQ5HPvwHSg1DH0+
         Z4qZdEo6jhfHT+J1qDSKuCQaOWI5qWBCQzddk6yVBNVOKGHmSOavcc1Jiq2CY+KY3qmT
         /+Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736274995; x=1736879795;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4ZYiVlhNYk6m/EXyeq/3IyUJ4/ur5s+iP2N/L39/iQ=;
        b=fIO3vNX4Kec5bP9RpvXlCzQNzpqMyxlax+dXpSxVkN977012y50ResEytRUOQK8oU3
         UUM9vhoVmsAQDmLf5sB2tnBb3hOA8agp55+EKDOxPL7X+4NumVz5FWfO1wEjvmIMmsye
         Y8VWmfLVGBZ7G4fWZvge4SbONv2DCVy1WH4x3S2Xqs8qe6w3JQgpXl0RmH7rnilL/CYe
         oGQ/gnSHyYpwkLCMq81+L/aKKlZda+IsbN3MQgDQRgwoKsdEzualBPSHuE4TgwCkOCsQ
         /z3q+pdoN7hg9gXtjCvfIqMttkmVVShV8TWSySQG5VlI4JY701JwRWMfALOrdMb7SERP
         pZHg==
X-Gm-Message-State: AOJu0Yzjvr8nVIDXnl6Sq86EAR+lB8PD6dtsBgb8uYnv81tXq4FXUFAL
	2cuYwEz75/fpXqFnlmqYbHnwhUujGbliXPTonIHT31cdbSAPlpb+JbGabQk3cWortFI2zOpRGQv
	c6O1z3zRPJ16BJ4uK5H9D63CPOCZ8oBBKUuVgc7OplZ/m9EWLtg==
X-Gm-Gg: ASbGncuhAC6egHxGJ5DrOy79hLdl8LyYxrln5bE6/zxb8SF3fOwSFe8WQc0q0CZl//v
	DYmz3yMiNiW9B9oPFL5FNRLa2gtS140n6mCtCEfuWY+WIuOPz1hgrNNZGtiSxO1vsOEEniys=
X-Google-Smtp-Source: AGHT+IER9agRBdFcIUeGPab4hYR0bnHQHPE6sTy6B1DY37OTnOfYDZtf71AJaalOPPSkKvIcIrdYTUZw9zG0ulufjpc=
X-Received: by 2002:a05:6102:94c:b0:4af:ea3b:7b31 with SMTP id
 ada2fe7eead31-4b3d0f42025mr230170137.14.1736274995491; Tue, 07 Jan 2025
 10:36:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernelci@lists.linux.dev
List-Id: <kernelci.lists.linux.dev>
List-Subscribe: <mailto:kernelci+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:kernelci+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Todd Kjos <tkjos@google.com>
Date: Tue, 7 Jan 2025 10:36:23 -0800
X-Gm-Features: AbW1kvaSlvjClaxhlgCcRMVsT9FfJ8Da6s8iRckbA47m57_NDUAlm8Lu6jkaqiM
Message-ID: <CAHRSSEy3cDt13XcErp5qNLKhgZDoC212MSRpDgGOXRE1=_RN2Q@mail.gmail.com>
Subject: remove android-4.19-stable from kernelci testing
To: kernelci@lists.linux.dev, Gustavo Padovan <gus@collabora.com>
Content-Type: text/plain; charset="UTF-8"

The android-4.19-stable branch is now deprecated. Please remove it
from kernelci testing. Thanks.
