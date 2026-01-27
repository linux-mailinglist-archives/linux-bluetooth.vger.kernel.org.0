Return-Path: <linux-bluetooth+bounces-18539-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI1yCFsBeWmOuQEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18539-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:18:03 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CAA98EAD
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 19:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D86F7303C022
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jan 2026 18:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C4F32573C;
	Tue, 27 Jan 2026 18:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUx1yImp"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597052FD695
	for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 18:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769537879; cv=none; b=Wnk3KP0T/oF9I4d6LjcrNf695RujWButRqjvpSxlMKb7lyP3uwvmVSykKcs3CD1gHPQWvFjdjWTLUMVi9vGb8C6SfDrmwpKTQPq9hu71bw68i7+KomCRml670Vbori28NOom5guJnlyl57aIhSTTWubfHkzCukQziyv3lHFKBl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769537879; c=relaxed/simple;
	bh=8Ot1LjSVt/n8he7xoXRM8jdoDNuHhXAc6WsjqB6dc5s=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=V+elDe5OiaAfaoh5Nfs/7NP8VYbJJMhEyDUCv3rFK64VmLTnAhqNYw+0Y0im6AxkT0rUVFpp+1H+y3/Ffo+Gq3Vhehp/IwSl/zB/J1HS68GkDlOeYrQJr/J/skZmN4cSzfyl5bqPLMRU+kZsRfKgRowta93aoij7Y06y5Sv4PGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUx1yImp; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8c70b5594f4so11018185a.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jan 2026 10:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769537877; x=1770142677; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=69s0SBwo+8iiiQigOMkL5ADqE6nJsSPeVRSHWaIxv6M=;
        b=MUx1yImp9tykFer+KVe57ugEX+JWsJqkk5hKRVCnGOuAc/YnocIMNLxFOolDAW8IQU
         bDp7rxM04ar4pKvXWtzyJOLOcqJCICXaM868qjF1uEe8Ptc4df2C1qvwl92OWyJEjVjw
         S4B4rtHkXsfCgcVB981offk3iHRtRYeyYh8qarEBpsXL3isjwp9yzKECC16f3bCJGaou
         W2JEEN4lS6MF6NV5yigZhIGXiG2iBINsptgss4hTM06tFaPVY2cmnNQJHkUTPJLlm7/e
         k0SI2P1CtNdhsmAxrSKGhIyNoPKBeh1V4UqxK2fVstw6jm7ttDkCO8xQkdipup9KesGv
         6W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769537877; x=1770142677;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69s0SBwo+8iiiQigOMkL5ADqE6nJsSPeVRSHWaIxv6M=;
        b=eN8zrIweIvenE3PTAkfZIZhkXozoe+sb6xvxQ3Ue3m23pEN9WGylXawYR7CS2osrpl
         jzYM22o7Uhc8L/l3RQOuJNtKitdzSug52zBs9ryJfi6Vtoq9q4lWDWtH7iu8neVoow/p
         T+MYCX+sFP3Wek0vZBh/YkawBHMdHzbE5hVk6t82BaQ4+JTKsx5VFx51nfTwxCftxGjR
         /I7UQDVCaxWiKlpGg/9A/5xSeVeEkIVXOa5j9OjSnifDHY3QcSN1y7nrkLXY8yEi/Wk5
         RhWWrTEk6cl1qcjm12RuJx5yLHqwQ/PBrN7uszL96rDq2+KkdDVAdKMRDE940K1J670M
         CFqA==
X-Gm-Message-State: AOJu0YxJaLOBi+8Lypm5xyypQSnC44oa9M/suqX1yMSwDeChjdMT9Dye
	iWYyZzJf5EjqPcRA9s48//QzEFG80Fu8CKwEpLSesCB5SpE1vWIg7GhFet+rk10l
X-Gm-Gg: AZuq6aJwZkjuKd0lYFjJQY9HDoks3XmHoGmXv+jYW5w492o9IrDlFDM/LbCbyUdgoUc
	+B9y9okd/CmvziGR5fHiTBvM+q9qGXaVb78bc+DalhvMTIdbMKbkhmsfi/l92NbgTfiM3Nby2Wg
	3qBdhXqGql3hkxSBF34bJcQW9S5ZcZF7eSsoOYAPSjK/kGYfYuiy6qrWTR/xp1RUtDGWXKdKMY4
	yu2hM4nuZ0vZb02pCUHgbQppgKXNpNJYjQemG9/snE5gQNoFO651tQYQFfwI8JXTSbt6+5lL3T0
	l6BwKK+J9PhKNJDCYehBE7NKfAjgfkpps1rT9mq/WlCFkbqyLXFrL8REnlGj7FUJBF4aNAzWM5h
	+cMOwn1beVFYn1yxI3fNQfnH2BpHDiIYIWJ9f8TAZDPNWbRq8gS78TePmVUXx6pGY9O7gnhCNJt
	P1poEtGhaUBvvFi3VL
X-Received: by 2002:a05:620a:298a:b0:8c3:5d5a:a7b3 with SMTP id af79cd13be357-8c70c1fd82emr335864585a.20.1769537876927;
        Tue, 27 Jan 2026 10:17:56 -0800 (PST)
Received: from [172.17.0.2] ([40.76.191.166])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c711d457e4sm21474885a.43.2026.01.27.10.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:17:56 -0800 (PST)
Message-ID: <69790154.050a0220.128a89.fba6@mx.google.com>
Date: Tue, 27 Jan 2026 10:17:56 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============2719200227586590273=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, frederic.danis@collabora.com
Subject: RE: [BlueZ] doc/qualification: Add PICS and howto for the IOPT qualification
In-Reply-To: <20260127171648.151717-1-frederic.danis@collabora.com>
References: <20260127171648.151717-1-frederic.danis@collabora.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTYPE_MIXED_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-18539-lists,linux-bluetooth=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,checkpatch.pl:url,mx.google.com:mid]
X-Rspamd-Queue-Id: 73CAA98EAD
X-Rspamd-Action: no action

--===============2719200227586590273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1047702

---Test result---

Test Summary:
CheckPatch                    PENDING   0.31 seconds
GitLint                       PENDING   0.35 seconds
BuildEll                      PASS      20.45 seconds
BluezMake                     PASS      667.10 seconds
MakeCheck                     PASS      19.06 seconds
MakeDistcheck                 PASS      247.79 seconds
CheckValgrind                 PASS      294.61 seconds
CheckSmatch                   PASS      354.04 seconds
bluezmakeextell               PASS      185.29 seconds
IncrementalBuild              PENDING   0.52 seconds
ScanBuild                     PASS      1062.74 seconds

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


--===============2719200227586590273==--

