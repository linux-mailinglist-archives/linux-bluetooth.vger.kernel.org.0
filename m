Return-Path: <linux-bluetooth+bounces-18285-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNfqBwNScGlvXQAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18285-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 05:11:47 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9349750DD2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 05:11:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 495654FE252
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 04:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA753B8BA8;
	Wed, 21 Jan 2026 04:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwITpEMu"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DF3563D6
	for <linux-bluetooth@vger.kernel.org>; Wed, 21 Jan 2026 04:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768968671; cv=none; b=N2kBS11uo4h7rz7cSUrAvH++7pKCLTMG9e3DOvvPv6yzgcdHZZOq8yISDSyt4ep7XkiS9n1X0Wu+vl065a6mHS1JmU7st8bOZXntW8jNbXXmWpHQTiA6yDgCaCThmEIUYc9KURkNFSmLcgx0PkK2Ckb0fXhenmxV4gsRWcGlDkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768968671; c=relaxed/simple;
	bh=eDVpUORuvljUeCt76Qghf1jdWlYViVOHm2odNyXhJTU=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=mQab3t1sY9ND2wwVjTnKi/SuepI4AKp4fhftl1JWUQJVhlATkMT3y2djdOk3lkj5TVrkqhiw47L90Ykx8GBx7DUI0jhLYbcvDTC7k2UoQTEbeGZ1+Tb5cveZ+sT+skPLeFhqqwROXWRKMaJEmcV+v9HdbI+Y/uucCQv237mu494=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwITpEMu; arc=none smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-501502318b1so49490931cf.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 20:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768968661; x=1769573461; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r2dv2RXVJdAbxuGiS/ZvDQX73kkQVfSnNQnGXOcXxHY=;
        b=JwITpEMue/DuYz33VE6F1kFrjjdUP5CxXsn0TBQ/XhGMZg+MdgOjgvQyW4UI74CV0/
         nooxEaMrJFFPRKwjS6ZC+gsLqWogITjiaX8rveVhxWtb1WmnNnWDWFX659LPsDAtls3P
         OQM/stUiwsEYalGF8Qmp/cJT9Qd+WV1I6WOtMDMK5LfX+k57AGeVl78SCAPV0eRYRrzq
         ChnEYx+Myl/m4CP+J+jmE/CzEkgYOqtvzTzxQmZfzcFY0BqknWeYUtXNmdygqRApI3D6
         7V45I2WXUuCByrqI3btL8Y5NVF0wU6e3GG296L5vG5mNRqZXgjpjFZsg+OoECpT7tL0J
         mlfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768968661; x=1769573461;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2dv2RXVJdAbxuGiS/ZvDQX73kkQVfSnNQnGXOcXxHY=;
        b=G7QlIJKugeR9qJBGv5FD4G88/ULZkWKc8jsNyH22qGnHxXmWl467B3J4G0rw4xAn57
         dQU2yC+uwl+MFEdLhtvR1/hAD5qN4stHqmGTuWHypsqCI9otY1k0a0gp1Ewvxqjh6dMQ
         i3yIG07gTmP+OvTQxODxxmglcP7h32UgZkKq0DK77DukqZvKKb67Im+QoIx8/lIYjQGc
         JoBxBtBRHvRztN2XvpAlLgzIy4KTTG9NEr/IVURWRFcUX0TqHI0kMzd9nSKbEztcS1Ms
         uSidkvDVNBazBPMyTBCm3al76UEcCfn5E510j6k3xd8F++VusOqqA3fDNzQRaBG/2BHB
         fo7g==
X-Gm-Message-State: AOJu0YzmCfllxvp+o31PHgAIxp6XfDv0Cx1yWvm9omiNtEozukO3r30X
	yQVQATmy6BDN3juIvBkzp1GrNOZ4O2l3j2mwtBNlDle9E4N3bUlDk65y1XBFaMxK
X-Gm-Gg: AZuq6aITMXXImZBVm+FWdDgnl+AGD08rhk01kwL2w/Lp1ojSyzGyMmDdB/4cF51r1Eq
	R8xFgAE7KSssyg8vXeRekSagyGBNOeWAJ5s2bj44qHmu93mxI7kQ93JDTp46xybScTXvKj8ir+g
	KG25nhZvcLtGo6Bij5QQ4DCX3RX4rczRsQ2MUevXgl+ZTaUpIUy9wL24xdkXcs+vMp0tKc2Mpxc
	/8+nzLzqZuyUHyopo8s13ZS448wrPfZG91dlmb1PTE3otq6TPm1MvuzrtoyRpf/D7WYTi1enwFL
	5hFFmBBk8gpu+0Rc6vI+CvzVmWNmLL9cpfxbSvhnh5BASwDOwb5jAHQl4mQRVk+KBuYjuwIIOqu
	WsdFeNftyMQmMQEUT+0DUMWf0IjrJIHMtyCW7p/aiLWPzmNHvtnMlZethzTSNC6bh1D5UJteQ3h
	/ftDmg70Qec4s+34k=
X-Received: by 2002:ac8:7dc8:0:b0:4ff:c303:6bf6 with SMTP id d75a77b69052e-502d8561268mr49180201cf.49.1768968660740;
        Tue, 20 Jan 2026 20:11:00 -0800 (PST)
Received: from [172.17.0.2] ([48.214.53.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a3757390sm101190671cf.4.2026.01.20.20.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 20:11:00 -0800 (PST)
Message-ID: <697051d4.c80a0220.166795.6c91@mx.google.com>
Date: Tue, 20 Jan 2026 20:11:00 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============7740714667375702384=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, yang.li@amlogic.com
Subject: RE: [BlueZ,bluez,v2] bap: reduce ISO sync timeout to 3.6 secs
In-Reply-To: <20260121-iso_sync_timeout-v2-1-efa52fdba244@amlogic.com>
References: <20260121-iso_sync_timeout-v2-1-efa52fdba244@amlogic.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Spamd-Result: default: False [-0.96 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-18285-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,vger.kernel.org:replyto,mx.google.com:mid]
X-Rspamd-Queue-Id: 9349750DD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--===============7740714667375702384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1044931

---Test result---

Test Summary:
CheckPatch                    PENDING   0.30 seconds
GitLint                       PENDING   0.28 seconds
BuildEll                      PASS      20.08 seconds
BluezMake                     PASS      666.26 seconds
MakeCheck                     PASS      18.18 seconds
MakeDistcheck                 PASS      243.26 seconds
CheckValgrind                 PASS      293.93 seconds
CheckSmatch                   PASS      351.37 seconds
bluezmakeextell               PASS      183.83 seconds
IncrementalBuild              PENDING   0.27 seconds
ScanBuild                     PASS      1020.22 seconds

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


--===============7740714667375702384==--

