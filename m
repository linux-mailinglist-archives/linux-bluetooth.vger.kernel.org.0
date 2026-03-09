Return-Path: <linux-bluetooth+bounces-19943-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CO/EOXErmn2IgIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19943-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 14:02:29 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 252C22395A5
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 14:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 35F90302E7D7
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Mar 2026 13:02:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FB653B8BB2;
	Mon,  9 Mar 2026 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCA1aFad"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D3A3AE191
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 13:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773061323; cv=none; b=Tup8Mb6sVuEHDq6URvwxJsUdrTzHXvxhFHJdO0lzekL8URQD8w313ZDoPcl4qEJUlWw/kZmghRDBZ0O6psSuAKhwikZ/JKxM2JZbsyOnDPNM++hTXh8mI9yYvcU55YBJGAD1a1FZ69WclJQLo4p+TJTgzYAVq4K+91telEgg5DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773061323; c=relaxed/simple;
	bh=/ZbeMG1jlKZLn/06tv8czKUXQHiXXb6zElBE2VWST+4=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=qgDJlEHBrTDBUHFKDITOLHl+BpbfIjdmcqUG7bSXw41c+vdo7mteI9ydIaqSEyl/7tAzLPTvJBsf6g4luRukA6nHY4STFZtUVr808GCpXj6pEDrBc5IB8C9wS/RTbAQyjLrgc6MqZISxtM/O7ko/z2Sy7FgOZXVxof25JPtpWm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCA1aFad; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128d2e3082eso206698c88.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 09 Mar 2026 06:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773061320; x=1773666120; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZbeMG1jlKZLn/06tv8czKUXQHiXXb6zElBE2VWST+4=;
        b=WCA1aFadueimOkJM2j7114rpUWPuwBPMwA96lInsokcIjqaHSMgsJhsuR17794ZDuj
         xHpXUaUIxKvDa5CAzCbOO+URKAkjpHseynkMyVwjEFHHego7uAsFgdnL73INE4ZRMJXI
         GivpZbwWQVCpwJg3Fgl2FDMAecAcYsilfEas3ByGxcHhI8vBmorq7S0mHxumF/oF9zZA
         PewFvo+sOjYN8hqfPSqmx7OEOfgdanUASsB8h8TrxSydJq2I5yyPeYdesejPFTS/4r6k
         CJ8d1jGanDCsmxTC5zMaWlqMxQzxXz5asksR+LGZZqWaXrljMk9npPW2/X3m+uwmmhOm
         8ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773061320; x=1773666120;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZbeMG1jlKZLn/06tv8czKUXQHiXXb6zElBE2VWST+4=;
        b=qI1JovTb9rsf9zzF1bu697zOYGUxgcFEZwM2c4BKiNLbblJjTPYNUR+vbWdlXhP802
         Cs6mLXaQUdiSftdT1WdcutBBLq0DW0qOTNXWDvDiAut+gSRQ1ROw9ZGYHa0EtkWMBayT
         emCc033c3hzmbM0ewXfcvj6ed9LUkdEUR5L+n9NYwsIRXaEBVqgEcZllKXjbGqD81vR1
         EoWIOSRQSK/zk9y0PdkowrxhKmOa/uAp1L5Sg/KafRg8OOlbi43ylFRDQ1Yy8GWUS778
         jOzmvJ2DI2j4xSOk9vARArJO8Ea7hzmzroPTYdazXdCJY8XK1oHC+Sn4pMUc3ODcPh68
         QfEg==
X-Gm-Message-State: AOJu0Yx4tKcE8vg6CgG32eZU2hLlddBVe/1lR/f9kqj7PkQ9qqXpPX3T
	zcG9nkTyWRSm5zkTfVC8+BigFEH8mT9GC3nkt3jY/hugYNlf80TMEithu4gyBg==
X-Gm-Gg: ATEYQzwLsdvKLwIgXP2BLlfWc1AJtSFJXDarBkOAHccUJkLOrnlGqk+2O6MCYnLI74X
	Vo2QiEmjGmI4Q488XWaIVBNz//p6fki6LtlZnGYOqa7lxYGouZZ5gQtRiADlWsIZHpHtSC4Ytfk
	qcICAwxPETrNlRHuRHptNaO5CYj6no1vBs3WqnzpdZsOI+V4TIa0f7KqhcEf7bbO4ky1Z7VSP5n
	/AsF1HWmcKTvoWZkkEZ0W3wHSvNzA42Biw4bYEcnx4+RGNnoDj0SfqL6WLw/w7xlhAexmi6RbH0
	oaJiKvCj3s/jFlcOICUTllxrI0MBrSXUNcLLF1F9q0IrQzLmqFfnLjPSxuLqe6KA5y+Mx1SX3Q1
	MRzr8utjJQvAdmtNCsoWR2RFF0aI9Af0Dj0ZYA+9YgBbPHg9vBAdnT+zeGD+axW2A/MuQXUNgw4
	+NTHO1nX7bE2AmP3F+aaAqBSNByWpy
X-Received: by 2002:a05:7300:cd8a:b0:2be:142f:d499 with SMTP id 5a478bee46e88-2be4dfc61b1mr4444973eec.16.1773061319138;
        Mon, 09 Mar 2026 06:01:59 -0700 (PDT)
Received: from [172.17.0.2] ([52.161.45.229])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be6f83cd12sm2817701eec.10.2026.03.09.06.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:01:58 -0700 (PDT)
Message-ID: <69aec4c6.050a0220.2ad738.e85d@mx.google.com>
Date: Mon, 09 Mar 2026 06:01:58 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============3852768206251357247=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, ruohanlan@aliyun.com
Subject: RE: [5.15.y] Bluetooth: hci_core: Fix use-after-free in vhci_flush()
In-Reply-To: <20260309122921.628283-1-ruohanlan@aliyun.com>
References: <20260309122921.628283-1-ruohanlan@aliyun.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Queue-Id: 252C22395A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-19943-lists,linux-bluetooth=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,aliyun.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.916];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:replyto]
X-Rspamd-Action: no action

--===============3852768206251357247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is an automated email and please do not reply to this email.

Dear Submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While preparing the CI tests, the patches you submitted couldn't be applied to the current HEAD of the repository.

----- Output -----

error: patch failed: include/net/bluetooth/hci_core.h:28
error: include/net/bluetooth/hci_core.h: patch does not apply
error: patch failed: net/bluetooth/hci_core.c:1048
error: net/bluetooth/hci_core.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch

Please resolve the issue and submit the patches again.


---
Regards,
Linux Bluetooth


--===============3852768206251357247==--

