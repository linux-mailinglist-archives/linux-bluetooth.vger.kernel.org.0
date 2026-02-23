Return-Path: <linux-bluetooth+bounces-19300-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAbiNFfKnGlHKQQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19300-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 22:44:55 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FADF17DB28
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 22:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7C6230AF05D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 21:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46DC378D9D;
	Mon, 23 Feb 2026 21:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0xsnpxV"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0CE33A9CB
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 21:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771882934; cv=none; b=RmYpd7rQ82wOlKRNJ7qY7U22zvDrKYyvVSiMsvjLofPW2sbAo30O04Lots5bcwKCwc9bxfqCFzywSnWjvVuDlnyMQNzpSEowjxXjLkXDpj2X/6lqONoflTGrQVohRThRWqpf87/vRr/sKe0soBYpx8YPGtB23DHXV4xgr5hEGBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771882934; c=relaxed/simple;
	bh=w1zkXmWlts4n7Hi2B2fNfgw4DM7x2HFk0++8GCGfMbM=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=p2pJgNfC9mvsMmgPzjXNBvXhJIv40EzlPcW1NDAygJervv3mC2u3Sea2cq7NGeh7Km4oaRXyb/bxBrysH9eL6vR/S6k091AQAI9NiMtgbasxSul7QtpiXRnlxmnaxISaiYH7MIfvXLLg3Q6kB+xBnr4fq5VxnCD+H29WglOMaiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0xsnpxV; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8cb3b3e643dso306792885a.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 13:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771882932; x=1772487732; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/yrBtNeQ0qhYu9rpfSLODXbbjuoECO3t83Dc41o33is=;
        b=U0xsnpxVEzGBoLmMdwne/UCKfvMgXGerC/+Cj7+K5SAaBHbHM/6gdTKDTO3pU1zwY+
         L7fI+mTqui2axfryf1eO6o+eDZ+PhLWqdL2uquUUqroOYr6F1XJdMfdRiWp2plX5g+kH
         9Beeu50bv4KseWgGOpPIgY6oiT034RaKKUB8o+1BshzmiBWFJqQpOgQZdFKQ+vP7VMAf
         tAFQnpNfqbJsm6nydkQkLzXZasgFUssL2+/m2dcy9uuzdK5YgyBVuweKXBBFHY5LwZMJ
         mNbkFEvcpJZtL7l6QEO3qYZX0g6GFxd6hF1MWr89xnfhM6BzA5mWrT49r2S8+J35yyM4
         yDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771882932; x=1772487732;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yrBtNeQ0qhYu9rpfSLODXbbjuoECO3t83Dc41o33is=;
        b=YiLQEe3ODwBSsUuPh7H0FdUkMTATS9updf36Nt+Qhl5N379mGgfhjsO/zqPdlyfHLE
         5iQGUn3U0JUlbs+oUVcCyVEH7LziHw3nOMOyUlXK04+PYEGNDBaTtDejhuCK1YBmZfXu
         l9a0+GPeKsSgVMmOqqTjG+u+M6GfzY5YJ9SR+4le52mOxI7UaDl9/7Us4f9q7cHHQxDE
         9FG/XXiURJ0VpAx/mDZV6buaAdsvndsQgAVKBXBzGGQtILf4Bz/QsWvGuCU8Gohl+jvE
         RSdRGenlLLkIgkdAapiTwQIfkUVmX9UT0T/Ix79wN3X+lItx/5jyBIyuUriFzxM1g8Zs
         3EGQ==
X-Gm-Message-State: AOJu0Yx+jCiPMJh8vzC8lg7J9O5OtiMhUy4VqxJshcFdqZz9KbpUaUZh
	jRQwjP33kT30P3UtuCHqw6AZdyprZf6ss7F9brjy+4pw1N6YFaFoiAaoMZTFtZFr
X-Gm-Gg: AZuq6aKxlyA2ml9BjZfO0jNtlbXGXQgvXEM+Aed4T5A8WjronFgox7iYSK9QnsWW6b9
	s13cSDc089D0PceJ/QMSyy1CTxhgaJV5VkRWIEoJlTZ2GeFQ8irl4x48rXm3pd/8MDpwu3QDjBl
	SHsDPe7AQi2k80pzbKOSbXzbPLduhYdyY+23IFVPclgbqDyb4PdvN6YuU7/GKjxgGn8szNCI+CN
	n2RPxJnv7lbPM523PI4/2mtMn+0RQS1tjGXdPZeoQF5SXTwKe1XuFCT4YeT+fxtdTWz87SLdTzO
	L4mJt2tQntao/xwJDV+YFQJKP6sbRXaFI5r+sAVZFEf3j3pNlk1rq0Tu8loSKCJKsoFeopV1Nls
	d0pq01SuUK7OGMbUGrwOaZjC9W9rQeDTeeFZy3GGI97MKvbr9RpvR9OdZe0Pcrcnj41Z7b4oAtp
	0YvdJsxbltwZY//aMfzBVhhfpxNtFiR+k=
X-Received: by 2002:a05:620a:28cf:b0:8a3:90c:55fb with SMTP id af79cd13be357-8cb8c9fd142mr1187952485a.20.1771882932267;
        Mon, 23 Feb 2026 13:42:12 -0800 (PST)
Received: from [172.17.0.2] ([145.132.102.224])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997e242ffasm76913586d6.25.2026.02.23.13.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:42:11 -0800 (PST)
Message-ID: <699cc9b3.050a0220.31d297.3afe@mx.google.com>
Date: Mon, 23 Feb 2026 13:42:11 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============8980749134085328176=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, frederic.danis@collabora.com
Subject: RE: [BlueZ,v2] client/btpclient: Move BTP definitions per service
In-Reply-To: <20260223202758.260251-1-frederic.danis@collabora.com>
References: <20260223202758.260251-1-frederic.danis@collabora.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-19300-lists,linux-bluetooth=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid,vger.kernel.org:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url]
X-Rspamd-Queue-Id: 3FADF17DB28
X-Rspamd-Action: no action

--===============8980749134085328176==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1056772

---Test result---

Test Summary:
CheckPatch                    PENDING   0.30 seconds
GitLint                       PENDING   0.35 seconds
BuildEll                      PASS      19.96 seconds
BluezMake                     PASS      643.22 seconds
MakeCheck                     PASS      18.91 seconds
MakeDistcheck                 PASS      240.44 seconds
CheckValgrind                 PASS      296.24 seconds
CheckSmatch                   PASS      349.56 seconds
bluezmakeextell               PASS      182.94 seconds
IncrementalBuild              PENDING   0.33 seconds
ScanBuild                     PASS      1035.06 seconds

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


--===============8980749134085328176==--

