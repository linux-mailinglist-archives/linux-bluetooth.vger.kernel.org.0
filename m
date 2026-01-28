Return-Path: <linux-bluetooth+bounces-18578-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM2oBlP3eWkE1QEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18578-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 12:47:31 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DE1A0C81
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 12:47:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6F5293041338
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 11:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6403382C4;
	Wed, 28 Jan 2026 11:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuf1V2Dt"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7928CF6F
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 11:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600099; cv=none; b=jeDfUaXgPLARXKQ7fq4RAUj4SR3xXvEAq/EQe5O+1sNK+NO/B/8njpyU4q3e4/45FOwMMb7jgpG1MyXvkMeKf6J47x2PMtlgTHz+4E1YicaTwbNOBkvjB7JzehWNJZYpWoGzVF8jKzvU2THH9LZ4JJJlcaTAATaEfh8ZzdJf7Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600099; c=relaxed/simple;
	bh=HtBR8NMEltNomHnjrO9g2bJP9SJ1pVmn7CoJ1Iryso8=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=NdxvZ7xMpa5QYjMz5f0TbUN6O/9YZbHb1ZMvKM70JFoUaYUX+ilcfNM4yfD6GBaP1G3aDQS/UzjpdDXmsMTKxKaMzqoaakiPxJUc7BqSf82U8tWDR/c+62NmSBDXAOcGQTv8wkIjO6gJ+iw2P59tUjnBS+7MSvT+7lzYLC/Wpp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuf1V2Dt; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1233c155a42so9735517c88.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 03:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769600097; x=1770204897; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h7LT5vhqb++8w10zJXirctA8Qwd638+iAOkpaZKs0p0=;
        b=cuf1V2DtxrnhIQzRKjXuKth6cUCQwjOVqlZgJDtUtzOK1WgCJri7wkZdn0zHY39p8j
         ZRocA3hVw7rNfS0D6/XRLkf8gThAQzYoKOBJKsdaZVZmuk3wiC5Ts57CMKL9Ms2USwBu
         3hywPyeabTWmIaqTZZu8uzFxsbw95QV3dmmKZ9wT383c/vjQt87GVJqBUaBg2TOYv0Xt
         dtV7pGOxXUVPKIHGyNllexiR2ADWN/MWufD9+fCPW42Xs375nyMS80PYd1AY4IhZj4gZ
         MQcYmIez7zaO0n57Dpa7H7qctURZWAXNGPfrpshSN+XkZe2anyGjoDmGZxRS6KymEb1E
         lt8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600097; x=1770204897;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h7LT5vhqb++8w10zJXirctA8Qwd638+iAOkpaZKs0p0=;
        b=TMzJogxTqIs+k1fl6gyVfu5sECZCnRWPy0k2pzDLAiZWrnrZP0OepUIsProAZNC26u
         5ggnQX4Uvw87uxyZ8egE8O6IoLSZr5On8u/b4z0/oz+E4ArPgvIDGr7m9vhJUCePRym2
         NY3QzEYEnCUQIf0RNnUm7fKLJxQ0qRtXMlpTSKenks0i4Y50iHrh2Uz9kpaHkxdS1rS9
         54vxm7vppHAs4You4KW2S/b9uY26wQ2h8xYOA8n+k0qHEv39VAG62LstLZr8aoH9I9O1
         frfnwerbNKNVBVV36pQtXBndOSc4Os5OGnOZpqeQso99C50rK2y67nvjgtikQK4bXSww
         zH9Q==
X-Gm-Message-State: AOJu0YzUlJVJjf1oaF6GoW03NohhLWVibbTJqfG4jg51TdoxOSvKqkPN
	GuLyYtfs4K0h9zKjZpim6xx4Ho5eHlLLo47ZCuaf+5Kb6pSBNA1SAJGQnPuVDyWC
X-Gm-Gg: AZuq6aKxQPK/M8nT60aWNpdMrsTlsTmH4u2T78dSyOs2mqETYX/T1piu3y/Swi+9gPH
	OVPooADclBgcNMNTHT9Wbw1rrChWDmjlzj1p7ttqMNHRejxEm1ezjM5EiAHNKRnsV5St/HjaYZ2
	zeieOwxLE6ZhIRtbZFY4iTs9htrtDLYiwVmTY5F5IhAqqKqCh8Nr0uiUdun/duc9F0fqGm/OtXC
	+xUt0jsTGQZ3kMFCYTiaR7ZApn3Zjl6nD3LE51Y2bCem9uBs8Znk4NKd8j1hOIjotv4pYGTyy9l
	slJrpYRdDkquaisUpRkrjLSgxL1mQoSs/MqOluAtZuFcgXbZmRuXZ7jTW4ey6cW35b0qXgVvEwp
	7VgNTEhS6LbkbhreRhOJau3HtlxJvjB6n8nzsL3adKF1wlOkV3wK7rVEUNUZOZNh8nphNeY6PFP
	BJi/JGKHrExWlgu0Ldc/M=
X-Received: by 2002:a05:7022:1288:b0:11d:f44d:401d with SMTP id a92af1059eb24-124a007b8c8mr2927218c88.22.1769600097192;
        Wed, 28 Jan 2026 03:34:57 -0800 (PST)
Received: from [172.17.0.2] ([172.215.210.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfa25sm2177550eec.5.2026.01.28.03.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:34:56 -0800 (PST)
Message-ID: <6979f460.050a0220.2fc056.340a@mx.google.com>
Date: Wed, 28 Jan 2026 03:34:56 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============0781372397271753978=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, arkadiusz.bokowy@gmail.com
Subject: RE: media: Fix G.722 @ 16 kHz codec ID value reported by transport
In-Reply-To: <20260128103809.2679085-1-arkadiusz.bokowy@gmail.com>
References: <20260128103809.2679085-1-arkadiusz.bokowy@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-18578-lists,linux-bluetooth=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:replyto,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mx.google.com:mid,checkpatch.pl:url]
X-Rspamd-Queue-Id: 18DE1A0C81
X-Rspamd-Action: no action

--===============0781372397271753978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1047987

---Test result---

Test Summary:
CheckPatch                    PENDING   0.46 seconds
GitLint                       PENDING   0.43 seconds
BuildEll                      PASS      17.85 seconds
BluezMake                     PASS      614.95 seconds
MakeCheck                     PASS      18.22 seconds
MakeDistcheck                 PASS      221.51 seconds
CheckValgrind                 PASS      280.21 seconds
CheckSmatch                   PASS      315.20 seconds
bluezmakeextell               PASS      169.43 seconds
IncrementalBuild              PENDING   0.40 seconds
ScanBuild                     PASS      940.29 seconds

Details
##############################
Test: CheckPatch - PENDING
Desc: Run checkpatch.pl script
Output:

##############################
Test: GitLint - PENDING
Desc: Run gitlint
Output:

##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============0781372397271753978==--

