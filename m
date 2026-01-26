Return-Path: <linux-bluetooth+bounces-18407-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGhGOzGpd2nrjwEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18407-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 18:49:37 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC38BAB0
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 18:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0506E30265A9
	for <lists+linux-bluetooth@lfdr.de>; Mon, 26 Jan 2026 17:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABF333C51B;
	Mon, 26 Jan 2026 17:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTqax8Wi"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABE93009D4
	for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769449773; cv=none; b=pXfx0yX11tc+eUKN7RJizk6AqLmR9mQptnj4BpskVW1r7nUGbdK+rfUz5oUM/wwSaUxsbPNCAKGh7JyZPsMZEbdujZ+MANiu1ZRYyg0miGDPTcfPtAS22kovbO2AknTA7hNexZzrKpuSvHSDCQl1bT1hizQIEG6nLPpnaCMEUao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769449773; c=relaxed/simple;
	bh=ppiZZeb25TNVAc99V9B0sritApS6uBW/UPOb3XMGLsI=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=UFgk7CfF35L6wvgK1JPDP5X/XMEFL4mrgyEyHjn2p8VRCBdNJQza1fq+SFS+q1z2e8A/VmNDQOFLfs+xkYnF5r9++KriQpEShnInfFS19KJluTANwn56cZYpLPlfNh+K1V5OuPHBXAQFxdG9OPSCnB0jbsIxvG5DZkFQiGPAzjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTqax8Wi; arc=none smtp.client-ip=209.85.219.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f66.google.com with SMTP id 6a1803df08f44-8946a794e4fso59118896d6.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 26 Jan 2026 09:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769449770; x=1770054570; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BrKruUgkiWRv///YEfjh9HZojPV/KvCRxeDrSnXS/7Y=;
        b=eTqax8WiEtqwtY4AjY/+ulNrlKi6CgjCLGz6yuf+lVhXmwLkqakef1Tj5ojvcBAU0Y
         GvNb6etIoNV2mM55DM3CeqY6P7UCvhZoWMyJYTb48wehqMNg9b+zs3BcxdopMfDWTgTM
         EeUFCUY7bY0xYOb/rh02egDYZqk8w3ui6kVvfsLtMcZwIZx6l435MVVQe1lrF2DqwZEX
         6GTCm0dKHFKPn9JJd9qlgCCZWRBLS8XfggiRmfWmwosvTLUPdQU5A0LzsQrAxT/Uusil
         4V5o/PBFSGy71L1oYELaTFv6ls8UaaOaojwD3Vyf2zcnX2+oY7aZDGZoM3TSOKoBWCfB
         2tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769449770; x=1770054570;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BrKruUgkiWRv///YEfjh9HZojPV/KvCRxeDrSnXS/7Y=;
        b=dIxM9UBNYQe+5GqxR3gzMq1/bb5CB2yWAuf8R4X6OEZvph+yjDPj4iQxIOTeOACwlA
         jn8pMAMOZkcKpzzRc53lM45ZPVtrNdP5B3AN+qDEQqSfiIbba+i7XTD87dOx9yhlGa1t
         c/muwjkcpjFhV/sD8Wt5mHsbFtJkO8mPqSxRFVt0O1gNQU5V7SkFeH9Mto/50qGmXtjK
         zfFsHtE4G7uaDJP3xE7zVqPSDXQTKufl9odtdV7L/Qj2ZmXQ4GXlnFXSHLaxI4Txx9VA
         PW08qTHJdicrwQxhiGqDa+kKJa7GhoBRpSiXCj3Uz930bcC5pxttnUj+cIDEhYjPyEhF
         ylgA==
X-Gm-Message-State: AOJu0YyhYp2N47qpnBWsUdYv4aLGeYgzBGy+qDgh7UXMvfb/CXNJIdJ7
	TeO3cIZRhHDJUcpFo6PdWwB0k18Z5m7W1o+xuToMoR7qCPElVlakplPYABTuPyMS
X-Gm-Gg: AZuq6aJbrnE/adPTLr2ulhgDrc46gfgPQ8PfknJGVHimacOgrTrzuE3JY9YZz/l8dCm
	L+Rfv8/XgPSdUMaM0L2+feK9r/yMOqHjuejhG6UM4mY56Vrw3S4LIAGpE+9JFkG4wr3Xcy1AWhC
	lvXofw78EAWGqwB9n8OIPlyMv8M4+CQ3CCnxB8mDIbQ30nYG6YaZhJ6eKGnW0EfUt8auBSdE90a
	O0YpUwAuT9OlxCB8A4L07TdV5pfvOLyQhEV2hjp1dc/D8QR7WkeEo+Zndl9ORp/Ig+/VfxfsrjD
	rm/WzHR+ZRLEQfZEI60SYK+/Fb45ft1SV0v9B/EHDmRNzd0Pf5hDnphpItDDBMdqn0zc48Hs4v7
	mGQlAXUviVXcGdewQgIzmnlogAma8xliKlUxzr3cvz/MjV6cNNBTKnx6tCq6CrqN0X5ipnkYFdj
	YsrZVT6gewp99C1zkqx0yA2qUVEw==
X-Received: by 2002:ad4:5f8c:0:b0:88a:3b1d:2f70 with SMTP id 6a1803df08f44-894b06bce06mr60194466d6.10.1769449770510;
        Mon, 26 Jan 2026 09:49:30 -0800 (PST)
Received: from [172.17.0.2] ([68.154.37.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894991b796dsm88078696d6.27.2026.01.26.09.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:49:30 -0800 (PST)
Message-ID: <6977a92a.d40a0220.22b42a.9d0a@mx.google.com>
Date: Mon, 26 Jan 2026 09:49:30 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============2059881163063087629=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v2] shared/tmap: Fix TMAP/SR/SGGIT/CHA/BV-01-C on big endian
In-Reply-To: <20260126165754.3567649-1-luiz.dentz@gmail.com>
References: <20260126165754.3567649-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
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
	TAGGED_FROM(0.00)[bounces-18407-lists,linux-bluetooth=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:replyto,mx.google.com:mid]
X-Rspamd-Queue-Id: 4ABC38BAB0
X-Rspamd-Action: no action

--===============2059881163063087629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1047202

---Test result---

Test Summary:
CheckPatch                    PENDING   0.34 seconds
GitLint                       PENDING   0.41 seconds
BuildEll                      PASS      19.96 seconds
BluezMake                     PASS      640.73 seconds
MakeCheck                     PASS      18.57 seconds
MakeDistcheck                 PASS      240.61 seconds
CheckValgrind                 PASS      292.11 seconds
CheckSmatch                   PASS      348.09 seconds
bluezmakeextell               PASS      181.60 seconds
IncrementalBuild              PENDING   0.28 seconds
ScanBuild                     PASS      1017.07 seconds

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


--===============2059881163063087629==--

