Return-Path: <linux-bluetooth+bounces-18366-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Bp6Leldc2l3vAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18366-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 12:39:21 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C3675309
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 12:39:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 105A53027359
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jan 2026 11:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC8B2EA168;
	Fri, 23 Jan 2026 11:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G95lRCzW"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53212BF3DB
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 11:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168133; cv=none; b=QIJUtbSabPFC+wuRlRUxU/g2y+SMmPbDJc+qF/oiAhYAAAcRLUoTgT3kMhHTTHAFEx3+r4EvXegdKlBKb4wi/9RDKaO3bKvAdAztNXFpKRpk5Gy/BnrwjPW0YoRor016mgLjXrtvTBaC8UeudkI3NQhxuSEp7WXUiui0tKTdvKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168133; c=relaxed/simple;
	bh=C3cqJnW9tBBQSA6T6tmyx1eePxiTOjT9BjsT6Ognl+0=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=scUP83SKkAJT/WykXatJQuq3rGAs94/xaO2A/GmWE/VAkAGNITGOqm6fKav/rqia0pKZ+fpnQDCjmLf3eXH+g2GUMY5Ed3Hwy58bWDAc9ACVqfJ3j/YZIfxitb9kJ6l+T68h+xHxWad2WDXJ7imKNj75uyGkA8DrDsO1HtTndAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G95lRCzW; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8c538d17816so321417785a.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 23 Jan 2026 03:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769168131; x=1769772931; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=X8gNdU+6zyBCsCqknDNsd8h82EjRJk7SbHjpdupJLuA=;
        b=G95lRCzWD9J+IorBH3BLBcmXdus7IWjoUGAeZf662nwFYhpJWdwAvi2J7EnD8CSxrh
         aORTFRwrD64TgEyHxMe22QSa34nvykwfP9XLhiA8ZtCfPb694yOjsja5fJWcHePtpIVq
         /BvWAG/4ekHZ7/pLu8qiKytpWlVMsycxoriPmdvSz/TjCbURpPYPz5VplEtt798sn+v/
         iq8RSaHhNLJHwjfCBLm9DlyMDv8NtJBMYsWeBUFQ44Amgb7r5nB5m0fBEg131zvtaT/c
         CnimEtZns/c4EJzsdOW7UxPze/kg5VHgsB7cPVuUVqPtG25RV/If0XSG4VCZOkPTnLNm
         r63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769168131; x=1769772931;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8gNdU+6zyBCsCqknDNsd8h82EjRJk7SbHjpdupJLuA=;
        b=NF1O56ad0yrMDnA1TYlvlz3ijaXJLwJGMQpsAVdOR1qKM0QgQteVY1RQSIX9TDAGqq
         yKOiiNZOGy+bvtVzZmTWygH3TEDLXVOrgzgb2596ieYnzmPuvc5xAeT0pyX9sioVEqes
         0ag9GjRXCWuVyhWO+DVUN+vkkBizYL484q7q/EXuok32QKt7aGwtYhkL1iEmUdaTe5aT
         SYqhpdaBkOKJQNIr3eKCOTIQmxFJw9X5cdrW2ULE2RjN+gLmw6+t90kpE2++B4GYSSXQ
         7L851J62lNskRXkNTMZuM1NNTCaKDFXdfbP9mficqvO/HZi6O3eBKQUGu7eeAebwZg1D
         J3Zg==
X-Gm-Message-State: AOJu0YzgFjcXrMh/QNR7xNVYWGCbh1Tygagf8HhGOOOFUYixKvc7I2wF
	81aPTH8jS5jjQjzb4ud2Sy85BM32fWNKaWcGnIVixqYrTXCbCVACSfCaVKOEYSbm
X-Gm-Gg: AZuq6aJ6QkQ2V1bgn3Ja2/SSay0aOCZe6ZbUv3PDTY1gC9iou307Un5Ir66fcP2Do8L
	H/Ar2e/oq/6/HpHyqIxY8SSToExbpuzWjxnGjnpAYgy9HHgZCluZXMojBLLlpOFiBXkfYDmnYq+
	Fa8nx+XBXEva5/7g7NmUp6vH738jpGOuCqIpNEYbM+Dqq4NEROH5o9ASi//Kl1bTG296atvnf0t
	0qa8+lVyv9KLklY3PZDdwSOpgIkizJclubBMqG3Z1LC6BRGshaEYf22P4NbbJRpxC691wd9G1ZW
	O4Zq6dgcoDHuVmpICNvKqk6+/ax5C/6fvPcz9wuxPe47Wmk70JnKK1Xi61j/AK28sBYrW3kVvFM
	pVPRFQX1MVGA72kyRXEnm+DFlpW5LtBYgoYyLXF/Sd7oNhb0xkbwtmIaH3e7I1pCyUwKPHzX+58
	6KQVHDgPPmE/JvsWIE
X-Received: by 2002:a05:620a:489b:b0:8c6:e07f:a050 with SMTP id af79cd13be357-8c6e2e3b30cmr288906485a.75.1769168131266;
        Fri, 23 Jan 2026 03:35:31 -0800 (PST)
Received: from [172.17.0.2] ([64.236.193.26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6e3854a87sm158849385a.42.2026.01.23.03.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 03:35:30 -0800 (PST)
Message-ID: <69735d02.050a0220.3a85e4.650f@mx.google.com>
Date: Fri, 23 Jan 2026 03:35:30 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============3787794000292842409=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, prathibha.madugonde@oss.qualcomm.com
Subject: RE: [BlueZ] lib/uuid: Add RAS service and characteristic UUIDs
In-Reply-To: <20260123104120.528321-1-prathibha.madugonde@oss.qualcomm.com>
References: <20260123104120.528321-1-prathibha.madugonde@oss.qualcomm.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-18366-lists,linux-bluetooth=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:replyto,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 16C3675309
X-Rspamd-Action: no action

--===============3787794000292842409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1046197

---Test result---

Test Summary:
CheckPatch                    PENDING   0.41 seconds
GitLint                       PENDING   0.27 seconds
BuildEll                      PASS      22.55 seconds
BluezMake                     PASS      649.68 seconds
MakeCheck                     PASS      18.67 seconds
MakeDistcheck                 PASS      241.96 seconds
CheckValgrind                 PASS      289.16 seconds
CheckSmatch                   PASS      347.18 seconds
bluezmakeextell               PASS      181.51 seconds
IncrementalBuild              PENDING   0.27 seconds
ScanBuild                     PASS      1005.19 seconds

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


--===============3787794000292842409==--

