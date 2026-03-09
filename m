Return-Path: <linux-bluetooth+bounces-19935-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJYyCFKXrmnRGQIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19935-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 10:48:02 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6CC23678B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 09 Mar 2026 10:48:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91495301F166
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Mar 2026 09:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD4F36BCE6;
	Mon,  9 Mar 2026 09:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iS5TEgYh"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BC622127B
	for <linux-bluetooth@vger.kernel.org>; Mon,  9 Mar 2026 09:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049521; cv=none; b=SAS8i6bu+NimjXSux+lOCSguOzxjFO7ZVoZmkI2H6osCZGtEqBla2UNCkjyoPBfef5u5/4zXpf3p3klhHnnroMPxzKE3Jbu9P1ehcpqzR13swMQq/vTaX2PLOPLi54Xf6Rqpys09+8zmLCqfnfWtZaKkZlZzfWW1PfpQ5rsEEAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049521; c=relaxed/simple;
	bh=4DwyFc2lxJASoCqblicHegQ6IDkp3KVM6cLdQfgS4rs=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=Gp9RdbuO9fQiymLduCw3DyqmCNb3hfNgiR/hcc38KYYncxmFLRjPbpZ1mniXjT28BUoWTzVFhnLmqt0V9WVrzAV542yfeXLmfekFjMAzdjPKYXGiUEfP6XN6Jkre/3DPRQD7bKPlVIrPvktRyuocBOiZCF2349aLWUTdCMRJI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iS5TEgYh; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1279eced0b9so10431125c88.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 09 Mar 2026 02:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773049519; x=1773654319; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4DwyFc2lxJASoCqblicHegQ6IDkp3KVM6cLdQfgS4rs=;
        b=iS5TEgYh6JH5YQwf4iggGPCE509cN3cq/nuHiV672sKn+PRffzhCXnfMtPfY37zrqR
         sCGLAD8mAugbngPOpoAMcmvWaLUfU9mCRBCJX7c798kT+NTzQv3UUEHtOifqoMJzWmh2
         TFwn6f+aHFfd7NwAGyFhIf+i0n0qfUjUdfcSQvF5LvdZXZLm+HCqVduTHFZK82/a7TqG
         FHdIwF0BivEcx1FDFWXYV1dW5i5geFKvCw6f4GJOUVfeM9BDoflcy039w2e+mll+ga+x
         N9bazzGHIyrOKRwsxFOu7sKqK1UvMYeRA2wQS2cELx9Djju/GA6NdfkzNfBr6je2unoG
         tIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049519; x=1773654319;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DwyFc2lxJASoCqblicHegQ6IDkp3KVM6cLdQfgS4rs=;
        b=r/Tb/UXqiqWke9PqK1AumOkRYgQ5Q5ZDyeSqfFhH0alZk+V/RQcFLf00z06JVrPwNy
         QD+SvxGXGdcxHfuwhuSORtaiKWj5BxwsNMMhb8ph7AZRSOJ9Gk9qviCzsXhP6xUwr573
         BAEkw4KHDyEC5BiJNqrXJgvUDcXjcXGpNaJ4rMr3JfqQQgHmrCJSdXyxlRZeXXWwQ1OP
         H5USTFWvvzTN0Iy7uoo0iWG12UPOLELxPUVMLDz95akoZSvPaTTMn9lGisZPwqUuSlSj
         DIJWJTYK/vEc1ksjLqswhF5/ZpA2xIOSDmd5UZhkHd8yFwaj3uDrMJwwe3tV0coWc92w
         9U7w==
X-Gm-Message-State: AOJu0YzeUgFEhX7sO57ESw/sPfFpWHq/TAzNx1AMAWDyID2HRkkoPosT
	UR8GVOsSkWsTTXV5CXLemN3ahWI/UW3EUdPHzOe6lZ608D4XIgRRUlx/UxadXQ==
X-Gm-Gg: ATEYQzxBotYMJMudfRJXK6IqOHIpYUH+UeJF7sTdqhtG0vrRGd6tngor4l/NOrM+cma
	tU15wliLl+EvdOCsqNRtHtcvjT6yzHxMLpHwATqT75mTTIBB4WVht02jy+bg07yz1p1mDbXgCV7
	Hck6SqezhSMoX/vflmVj72kyvj2InwzZ5X+/Mg4XZp17p7MWMMiafv1pWQOLB9bx+SXwBSnjmpX
	FZjKSkDUShdHwteE3hJsuO9z5EdlRdFWwvXinsHQBXjEabFertrNwU4GVCQXN5ujCzDKjWluUf3
	CvusCSrcOsOCIfEiJvwv/9Y3G0wNzb4DuKqB/ZgLNQUcB1mDQZTZRfNL1eetee+osgLXylrHl8z
	PCWDw0/CNuCr2H4ZcD6QrsGgsls20we3dwajE/DVZX9QZxZBA6BxTg+1+Mm0vxHBcWPtUKXM/gz
	wXeCjx3ClyKSIzJFrKK1ZLiegvQHSbDbk=
X-Received: by 2002:a05:7022:906:b0:11a:fb3c:568b with SMTP id a92af1059eb24-128c2e07516mr3583757c88.17.1773049518841;
        Mon, 09 Mar 2026 02:45:18 -0700 (PDT)
Received: from [172.17.0.2] ([172.182.200.147])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128db3d79fbsm792755c88.4.2026.03.09.02.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:45:17 -0700 (PDT)
Message-ID: <69ae96ad.050a0220.520df.df60@mx.google.com>
Date: Mon, 09 Mar 2026 02:45:17 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============5566388906706622647=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, ruohanlan@aliyun.com
Subject: RE: [6.1.y] Bluetooth: hci_core: Fix use-after-free in vhci_flush()
In-Reply-To: <20260309084114.3722155-1-ruohanlan@aliyun.com>
References: <20260309084114.3722155-1-ruohanlan@aliyun.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Queue-Id: AB6CC23678B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-19935-lists,linux-bluetooth=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.918];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:replyto]
X-Rspamd-Action: no action

--===============5566388906706622647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is an automated email and please do not reply to this email.

Dear Submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While preparing the CI tests, the patches you submitted couldn't be applied to the current HEAD of the repository.

----- Output -----

error: patch failed: include/net/bluetooth/hci_core.h:29
error: include/net/bluetooth/hci_core.h: patch does not apply
error: patch failed: net/bluetooth/hci_core.c:65
error: net/bluetooth/hci_core.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch

Please resolve the issue and submit the patches again.


---
Regards,
Linux Bluetooth


--===============5566388906706622647==--

