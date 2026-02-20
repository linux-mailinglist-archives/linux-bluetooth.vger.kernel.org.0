Return-Path: <linux-bluetooth+bounces-19251-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMU4EBCnmGl5KgMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19251-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 19:25:20 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D178216A0B1
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 19:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1980930089B8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 Feb 2026 18:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E7236657B;
	Fri, 20 Feb 2026 18:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVhFdWkd"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC22331A5F
	for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 18:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771611914; cv=none; b=KNzRGV0BS1EIOagp2wp4pjDDRW9s6wYVYTMh51dac6WI9SEQwDEEqJV8eb9CSB6x8aczdVdwZ+PRCPA8+wBVZvKPbRqgt2GP0BUVV8Z5xlf1zI67CpWLTEqm+V2ttUj7HWC6EdViDYYu9aUwckDoc7HtJS748Yd1UYDpclZa8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771611914; c=relaxed/simple;
	bh=2xJBBiSbVJFFd2pn78JePr72Hq3dQUD39LVy2Bm8yFs=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=ll4vKKbZ0etutSYfkS5I/S9XOW0XcSAat0peEuISiMkal730odbDcQnbAQy1mbgYRKfftpp1bDNzVwN2uvxItoOfkwuERfB0sx+WVWLgeepcR1OGTK6b672/UX/d4waLDoHfNUb+T+L5D8IkE0fXcaIUxCkbaiDDetxSISQG4KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVhFdWkd; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-506c00df428so21184001cf.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 Feb 2026 10:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771611912; x=1772216712; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AP82ukyS0ZdSeERVxAwHV8FoaI7SuCm9t3ElzZQGMsI=;
        b=CVhFdWkdeO0M7FC+DwsVnD5CXhq2KxLxQKpGvWRKEqvfBrO9eXMRDwrMIKLDHnSBK9
         XWvliDCxPOkSN/hmD/5piZMkgo0JhWXHhuZzGakvuth4rDiguYXmoXkD4IDFhe4AbXTz
         kJVSJ8bB2tTXEhGVS4Obq1dXAXxuV+BJ2ESa5N1UjdbFxDZlQc06bSf/ieB+K08Q19fW
         9RUVQDAsWdXE1lano/l5kAAwsQayXm5WUBThf46GS6Fl9bvs2IaEPAH5bDNgq64kQ8Lr
         h7eWn16Hd/WyVO2XZP6KdHfAbXT8H5FdR2b9GEQRzaVbw259B591ip28GTGQR8sFnS0G
         5+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771611912; x=1772216712;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP82ukyS0ZdSeERVxAwHV8FoaI7SuCm9t3ElzZQGMsI=;
        b=MBq8k7fMdEYz9amY3vRT8nj/F4W05UjJulwBT7n5d/rdhobc5hVfDX3VRIIHR0pAP5
         X9HcebaRGrFFxiAl9ZjZJ5Ny5aj1oJA3tR/DLLCN6CdLK7jkpPiiPWeuvHOhBtH+7qlv
         FMybmvWd+iW3p+K6SVL56HaBsXHQzScFkrEQujAaS7v9VwUryh+Z0j2g97zv47M8ok6b
         LaqSGFDMrdmlbz+uJh2m/gymAH/8WjsLpyaXjfTTZIMzZvv66mQvVM8w9Sl4jLID4XZ4
         DIcY9IAt9z/AB1i1kcacx76BK3ZLjvenSK//Jabfbt9Up5j32MB65vUDkKRLQKDI48Id
         6hKA==
X-Gm-Message-State: AOJu0YwGGowTIIURME+JFUXZU6ab0l+Ukt2A9gD3GsPdt7NfvZzzE4ux
	gu3WItMikIqdJDLSB50IAnKAQtGZHgDu0NmlEHNcQhbzutNUc7ik1ufbC6S3q5s5
X-Gm-Gg: AZuq6aI39c+NmCvl1fmdpnCMcZwYIrLOwZt4HhORnY841LG4gQ3mWnxRv0SzsThD0ee
	Z8vHt2wewxQJHXOjr7/ACCHJH3sHRnSAISQBbQMFph43z3yVeq9AMgRoWhUT0mpL1hAz1/Vgrz7
	479zjzBiIhPnyFDe8QEwzJegS6f5c/nc7J1qK9zj4slha9LjKv0gTCNksmxJmlhy6Nqop5kbBXV
	vEt4MFC8eBi5Jolf/brkxjKD2pd/P1McecCTqGQP/MLhDGAHzxfxlMWouIRne7CMEL9VKhgWX5G
	OaklQlmcI06C6pVWpWMMdRq6Ze4TzMJ0hr4trhpezsyVyUy/Z8ftwSwqMkAP5sjMLlgIrNvZcGU
	zE15MsVvnr8OXZuEng6uTuMgVUiWydPqJMnnt6RoTCpH1Mupn+h59J1fuNJDgJT2umRk9QK6cCP
	ZioTksik3z0g2bBx2u9XuAq1+zQ+1/
X-Received: by 2002:ac8:7c4e:0:b0:4f1:ea5b:860e with SMTP id d75a77b69052e-5070bcdd6d4mr11095971cf.65.1771611911784;
        Fri, 20 Feb 2026 10:25:11 -0800 (PST)
Received: from [172.17.0.2] ([64.236.201.59])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5070d510ab5sm193551cf.4.2026.02.20.10.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 10:25:11 -0800 (PST)
Message-ID: <6998a707.050a0220.3b773e.454c@mx.google.com>
Date: Fri, 20 Feb 2026 10:25:11 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============7960315981242997549=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v2,01/12] doc/btmon: Add missing documentation
In-Reply-To: <20260220173120.3418666-1-luiz.dentz@gmail.com>
References: <20260220173120.3418666-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-19251-lists,linux-bluetooth=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:replyto,mx.google.com:mid]
X-Rspamd-Queue-Id: D178216A0B1
X-Rspamd-Action: no action

--===============7960315981242997549==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1055976

---Test result---

Test Summary:
CheckPatch                    PENDING   0.39 seconds
GitLint                       PENDING   0.34 seconds
BuildEll                      PASS      20.66 seconds
BluezMake                     PASS      652.64 seconds
MakeCheck                     PASS      18.11 seconds
MakeDistcheck                 PASS      242.90 seconds
CheckValgrind                 PASS      301.09 seconds
CheckSmatch                   WARNING   352.89 seconds
bluezmakeextell               PASS      181.43 seconds
IncrementalBuild              PENDING   0.34 seconds
ScanBuild                     PASS      1012.95 seconds

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
Test: CheckSmatch - WARNING
Desc: Run smatch tool with source
Output:
monitor/packet.c:1993:26: warning: Variable length array is used.monitor/packet.c: note: in included file:monitor/bt.h:3866:52: warning: array of flexible structuresmonitor/bt.h:3854:40: warning: array of flexible structuresmonitor/packet.c:1993:26: warning: Variable length array is used.monitor/packet.c: note: in included file:monitor/bt.h:3866:52: warning: array of flexible structuresmonitor/bt.h:3854:40: warning: array of flexible structuresmonitor/packet.c:1993:26: warning: Variable length array is used.monitor/packet.c: note: in included file:monitor/bt.h:3866:52: warning: array of flexible structuresmonitor/bt.h:3854:40: warning: array of flexible structures
##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============7960315981242997549==--

