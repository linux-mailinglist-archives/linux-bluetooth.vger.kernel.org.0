Return-Path: <linux-bluetooth+bounces-19928-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNaRJ7VKrmmkBwIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19928-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 05:21:09 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1124D233A8C
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 05:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87CEA3018D69
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Mar 2026 04:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA902271A71;
	Mon,  9 Mar 2026 04:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIsFvZ8R"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD487FBAC
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 04:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773030066; cv=none; b=bywk2VI/q3LAkyjtOKx066lgPnySldTCYP8C7nJOsVLgZ/yGG7ofWYRfWbsl/9Fw3xcVPCbUfVz7ZC+wgKtpW/cjo5PNMimob4lJ8V0n1DmJGMifBIfm4TpvDcpWQliDBfUBmPRnpOeFYmICtTdcg4sR3mSGs8sl8Y85npXenCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773030066; c=relaxed/simple;
	bh=cg/O/fKjnHHlOcPwUraJVpbQ7eaGEFQMcoXM9MLPKBI=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=fcBHEU/qeRxDLNNUOzRemqf7ADxQ+N+RYub3w/xmKfUEQFwHNgSA61fRK5hw6IEjKirSGoDBxedrm25BbbWNP+6iZhuBpQZxP0YcXjp4KobOWuaRPt25WUw4H2Py3oAv/FAUfly76QxHCjpnuG4Knsl7SLEzIzZxkbM377daWTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIsFvZ8R; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-89a05955720so102202006d6.2
        for <linux-bluetooth@vger.kernel.org>; Sun, 08 Mar 2026 21:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773030064; x=1773634864; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cg/O/fKjnHHlOcPwUraJVpbQ7eaGEFQMcoXM9MLPKBI=;
        b=iIsFvZ8RBUIgFDfxKvO3NC81pLnG0l6mOpHuZEPkrhedmbor+9OIwf1hKCRK53lsDz
         qVm+xJf6MhcKXnqiPvLg9PTXTj/z+thxIarPfx2r0StBPrzg0gX8KTK2viZl7hItJhxx
         BydJZXGFbdI0PN9gmNAE7WaEYnEL+K4djsfcI5+uNFG2IaG+sPg/f/Ll4fHqOC2GEqlZ
         9pVAJ8SsublYn0W5kA5IQnTzVfavTJ0o0X0vMmBYMYFJZeoLsyXPJHOKy1Q3Ow5qllOA
         SM+juWPY1sDvmx5WSNFGjJdMW0zSVXJvXQ2poJGQ8+lo1tjGJ4BAUTtP0jQSd6ph7+GR
         mRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773030064; x=1773634864;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cg/O/fKjnHHlOcPwUraJVpbQ7eaGEFQMcoXM9MLPKBI=;
        b=cl6N1Upn/VTPnxX5Tz3QGHkzW15/pdx24PWh9vPmDGDBD2yi8WkHx0O+DAUBAmhUZS
         3OnJz5qV3fbPM2Fdxk6DCuFnTfmzvHx/Q9BxtJ3JTRY6zj78hMa3mGAK3a22AONQfZcq
         nPXITBTkJlAvYUWbMfKgFQInmHzI0xNAaHngKlpE6Dh/onFFhKYEZHmtxR3XK3FpJ5ZR
         2cGNJ80uyn9qrEa5GOtwBooBNdYo3LU2zOtuwpPp13m47zwH8u5uqtXfmbCQhRwn/tK4
         fvYyI/257YduzmdtVkWwPVaN7g/RpY4R6w18ZSA53T7br1GHPEEm4odtNE+kydRiIOtP
         0NAA==
X-Gm-Message-State: AOJu0Yy1tS14LHVJVUnKYt/N1+sr34aTXJpqp1VW5i+Pqv6j2R4FnaWP
	CPexuJnOpK9GC0vettr9HjdY9L337mZoGJXob6SJJ8bGmIeab4uq+cZTgcT7/g==
X-Gm-Gg: ATEYQzzvIuBlklVz9m0sUSsJLcGE+b/I9Dj/3CekwGpOmUJtuGoTkYd7giWGmbfWKRX
	88ue1iV+3+5ms4oSVgQbRPUPbi/6b3uTRNoBSdFcIIk1fNpIEzNlBjny9/J/ST/lkFOS/8KdYh/
	E7EOvrr4+71vd9wEDeJ9mr4MLr4lGufNpuRLhWjizhX5FpR/FWnJcLhFCUY9yvnpXylC50S0Iua
	MsUXWbQH6lbnZCvxEcVLUvc/HEFJ1c+x3AfkMIpSyx3zhdFizMJ8Rdd9ZiHJKjII/8hGOLCfi1Y
	Yv1kY46Mf76KALLeGz+ya8kxMQDdNVa10WoEgzTNTLG7yyjNSAluGky66tdrJtjxsrmRyFF8adq
	ZELWa2Elo9UaSOHijA6BE/DTKhAjZS8jF+BZtsPFeT6zaXmdfS4LCexZ9K0kaWgrj3mML1+pCEQ
	qwilw04UMr+xaRirk+K3j/h/XmDJF1Nmus1fwiXA==
X-Received: by 2002:a05:6214:21ca:b0:89a:149:bef6 with SMTP id 6a1803df08f44-89a30aa03e0mr142699516d6.40.1773030063813;
        Sun, 08 Mar 2026 21:21:03 -0700 (PDT)
Received: from [172.17.0.2] ([48.214.54.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a3140d9edsm66470416d6.7.2026.03.08.21.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 21:21:03 -0700 (PDT)
Message-ID: <69ae4aaf.050a0220.169afa.d3dc@mx.google.com>
Date: Sun, 08 Mar 2026 21:21:03 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============1602177178404608401=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, wolozgabriel@gmail.com
Subject: RE: Add missing string to list of commands in mgmt
In-Reply-To: <20260309015745.1720-2-wolozgabriel@gmail.com>
References: <20260309015745.1720-2-wolozgabriel@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Queue-Id: 1124D233A8C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-19928-lists,linux-bluetooth=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.925];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mx.google.com:mid,vger.kernel.org:replyto]
X-Rspamd-Action: no action

--===============1602177178404608401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is an automated email and please do not reply to this email.

Dear Submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While preparing the CI tests, the patches you submitted couldn't be applied to the current HEAD of the repository.

----- Output -----

error: patch failed: lib/bluetooth/mgmt.h:1199
error: lib/bluetooth/mgmt.h: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch

Please resolve the issue and submit the patches again.


---
Regards,
Linux Bluetooth


--===============1602177178404608401==--

