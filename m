Return-Path: <linux-bluetooth+bounces-19828-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAstCYa5qGniwgAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19828-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Thu, 05 Mar 2026 00:00:22 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F062208D0F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 05 Mar 2026 00:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 157BF3049708
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Mar 2026 23:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A353976A9;
	Wed,  4 Mar 2026 23:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G6TXvwVJ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682EB366DBE
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Mar 2026 22:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665200; cv=none; b=DZEx4Gn6KcrKcDrx31VyRfGhD7g5N9PRX90Ws5PLCfdSc2XxOq9jNLr/9/TWUghmoCpHy2esDa0Aiz/zbsM6Yw8C04W6JDu5VQTAIzVOoAImZJ90Jy0qFP/rNlB7vp5qq05dkqP83PtLQhh8dHjWaeLzGlGrxbs2ojC9uJe20A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665200; c=relaxed/simple;
	bh=m+9gNyjzEytTBDmd8shNbzhc3VdngWaYP+aYk9FGTl0=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=dj3XbYP8SWbcxcvC3lfl2rU2OGSuU17iQC4lwbxoUXt7k5wgdzdlpYo7pgF8S4KIU4b7u4Mvb41f8hZQV6R4PImSsnSH2Huk2OqtAm/AH1YbGnw66Cw5YnDblTvyIPMZ/JqkRqUIq7NH+OGCcQeLtD8Ksb/2my1t7HhYo2ij/1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G6TXvwVJ; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899fc265126so51204756d6.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Mar 2026 14:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772665198; x=1773269998; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m+9gNyjzEytTBDmd8shNbzhc3VdngWaYP+aYk9FGTl0=;
        b=G6TXvwVJBoM0ddwrxxageMll5oSqm7gUbvVC3wpLP90ayw5LzmWeHcgVIBzlqcZ1oV
         Yv7cze+CuDCoycUGkfASKTXdSxkmSQSjutsu96s/ZmnWxkO+bxrNIHoV2ae8ux905zgN
         uK/kpetvbUYZPnCdvBE3Qw0JL//tnDDB4s0C3Ky9882Hy+In9hnuGzq/DHvh9o/0/x2k
         /pHRjxnjZYBr7HcBRbMUNalQ+9PavD1HcVedKW9Y9gWRbncUFqHTOiH9QU1irg1NUxGv
         HNNMzI/7rzqp/yVvRbyvhIPxXUMV68eEcYVjIPX5++2O/GPl07+Ic4Qzv1sKY4XV0ABR
         U42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772665198; x=1773269998;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+9gNyjzEytTBDmd8shNbzhc3VdngWaYP+aYk9FGTl0=;
        b=LrvAo48ez1GuusGoRqKPl8nw9XteKOKMtxAti8gAObaJeuZL33BhsEgs7HSPoAeMx0
         9aT9IjgixoqkuzukSMJSj+lOCPS4GG0s3jVt4gm3AW+fsLBUaPHrntSErMr6a9sGfXUO
         T675v3ILoffpC7/LjRS29IkGa6WwGvD9zNTcL+Yn7Qt2mMT5HhgM9FNnTVZn93IiWT+T
         lY3ggDr+O+i+WgRnnECF3/B7KO7Ys8AKxyDkNl/7czxTy11R7WuQn3K5vTwO07PI8mMp
         xzvsALNZzFFkOTzBmW0gBwCchaSvOdB7pOOwIHEKAX0Rd2GX+r6T6oLORAiRguaCug+x
         gyeA==
X-Gm-Message-State: AOJu0Yxcpaha/FQKMfgeK0TfdCC8k+CeLPPcpC0P5Sqj/M8XMS6O+JOI
	MWPn/gT7xsVd5oIxzY7NclxH1/awQyUcL+TSXsX9d62UR/N/Igfft2PfSe/JwQ==
X-Gm-Gg: ATEYQzyyhkzHAPh9CCxywWfIQ545n5nwo+P2KD2bxNRAW1PfSIOzDpxm0Jo43Ldvnys
	Ay8cO3adplBfUwvQPSqPazoOka/DRNgxYF3ui1klgBosoDrTHwq6XSFMIYQfMeeJ32q/0j/GtV8
	B5NC/V0kH59dPDwJEbGZnAAV2gOW3I7+LBJ3MtSxCaptPrunizqKjIBoXNOUt1ikiLo6E0cMpcI
	kbcd9rM1z073Thq29DpbkU9K5mQtfLiVJ6I9lxU8TI8Rz4v1qZAbRukK3f8jK2AzJ+dbMOR+eiK
	tYnv1I3y54uyR2+T5soQts5Emtfco/RZcEllIVjccJB34CzjEqStx3+T3lxKnFShABuX+QvyST9
	a5bODeemWpwBl3jg7tT4dcx8hH08MVFgX2noCSlpIT4UyIfbTWuswXBqmiKJ0em846LrKrkZOKz
	NaXE1gO0wkmjlDeCw/SxYAzerCb0z6JRaEYvSKFEU=
X-Received: by 2002:a05:6214:c22:b0:89a:149:bee7 with SMTP id 6a1803df08f44-89a19cf6d16mr48998096d6.48.1772665198068;
        Wed, 04 Mar 2026 14:59:58 -0800 (PST)
Received: from [172.17.0.2] ([172.183.89.40])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a0c1fd01bsm45267626d6.49.2026.03.04.14.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 14:59:57 -0800 (PST)
Message-ID: <69a8b96d.050a0220.13541b.6a5d@mx.google.com>
Date: Wed, 04 Mar 2026 14:59:57 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============5927511138158912953=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, kai.aizen.dev@gmail.com
Subject: RE: [v2] Bluetooth: hci_conn: Fix UAF in create_big_sync and create_big_complete
In-Reply-To: <CALynFi4pamOn3CrB+3b0PxhE2+Br_Ftep=VKceyeYSV65N7Y6g@mail.gmail.com>
References: <CALynFi4pamOn3CrB+3b0PxhE2+Br_Ftep=VKceyeYSV65N7Y6g@mail.gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Queue-Id: 6F062208D0F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-19828-lists,linux-bluetooth=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.979];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:replyto,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mx.google.com:mid]
X-Rspamd-Action: no action

--===============5927511138158912953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is an automated email and please do not reply to this email.

Dear Submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While preparing the CI tests, the patches you submitted couldn't be applied to the current HEAD of the repository.

----- Output -----


Please resolve the issue and submit the patches again.


---
Regards,
Linux Bluetooth


--===============5927511138158912953==--

