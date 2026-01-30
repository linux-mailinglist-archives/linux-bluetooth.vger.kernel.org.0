Return-Path: <linux-bluetooth+bounces-18717-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI7YMmMJfWnhPwIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18717-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 20:41:23 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 798FEBE3A7
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 20:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B11363054D11
	for <lists+linux-bluetooth@lfdr.de>; Fri, 30 Jan 2026 19:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434262FDC5C;
	Fri, 30 Jan 2026 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzcbZ7Zi"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5CE2FE074
	for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 19:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769801992; cv=none; b=aWGwCP0djcwa3uqxlFfive4N1Kzl7cfDfSAlydVSauH3yTgn9kKvQvCIYR1KehjedhykXiEqU9DcVA6/QbP7qMT6DPcEwvbnrPV23V7OP89sS8mjR1IHGVe51+/KNzKmq4A6sn/QEa4P1R6ud5+2UsXfH2uDodUJfYmHJd5NcRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769801992; c=relaxed/simple;
	bh=Nra3HtrejCeHieUY2VbYQJYr5Bl92dLE/wWJJ7OvMnc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZNlQ9XyMrJdJtvwt9D5xv1pDlpXwdIgL56lODFLIRE5azxiVFvPYp9rAJGwJm24XhmdWM1SN5Bh72W0F7FjapomQmIfCYAt8W28qEksx4uEC7YVT0LOLwxyKFenafRflS7ch+HjgOnR1mCNFOtzjdBtufIKDRyYRj+6HcWzqts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzcbZ7Zi; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56636dc53a6so745480e0c.2
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 11:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769801990; x=1770406790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tFyLw+mdFO1VvYeqTHsxEw1Dg/W6Z6TiQ36kNjkgaYc=;
        b=gzcbZ7ZiBRD6s+mv9UZqJkaYj1tUo0be9sNUTPkpdLajsr5fyTAB6tuQ3O7U8TKy4A
         bQiF7I4AuaTi4H86CrdhJPblEWKQAetOz5v9e9AFxT66MB99qA4KoAPBFhGZcI/Av/4s
         DRDT7eOvoc254+wJfJSRypWovSgWf+S9qD3cY8a0pz23HzxDNO1MuN5fGPYiahdKpkPV
         LmUwO9tqlJPCv4nksTGsyF9m/FoefZMEHzpoKTLvSS2URwLcBIk2In6c1LZt8GiXA+w5
         MT3EImjWk2eUMphxb0QY6TwVCLCH/pA6hkP1cKlavQow29R5DOwhzCVitLpZAi8P5MgB
         u0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769801990; x=1770406790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tFyLw+mdFO1VvYeqTHsxEw1Dg/W6Z6TiQ36kNjkgaYc=;
        b=hRAgNcTDM9D7bsN07QLHVNgJvwaHoaL4aFsW+tb45uTf7F9yFTJCCPouIKr9hIOk1M
         0EPwhQ/XNucwe8M8x/ZE6msopmepjWescHNFITYODFUBmD4jhEKguPTJiDzbh/VHQo60
         +97enpnVa6CyCYpWGdbbWWvHfenTXOshkkdRZwH3SJXNMJWMT8OLz1isMh8zKeYuv6Wo
         ZgunFUBVJo5MPXwQiTMRBBag+j3Z1rTEM5D9erQ+dr37mwXnZS1G++z1+JLK30SDg6Qy
         UN0lQOmBlN76xNBeamMGTkbc1jMRpN2TCC8va82Yd5njm/zsKxr5YtKiQBLo4+EzGCdg
         7Ptw==
X-Gm-Message-State: AOJu0YzEb/j2Y91ztGO5m84h5nQAs7rnd9JL02O0E5TFsJbctUttNRQ7
	Qxdc0BWJ61PrPfn0SwnR+kzxpEsuecQFuj0DRSD3PZaf9I/+og/T2NLa+ysFAw==
X-Gm-Gg: AZuq6aJ4y7naJzw5hEWRJ0hqB02ssEA6Ja6b29GgeoSYRARItKgWYB6wXZj29d/1/0a
	sA+Y6kdhsh/QyIbq19sv0lwksHB16ZYtA0As8kN17/CFKGqc27CQW65f24q0AedTVFAN/6gD4t0
	T9RWiK5Ol6zvEqJLjfs7zCmFbA5PwtUW4+Odr26LRz0uJde+e3vNtMb/cOg646hM/mNMa/eAbBW
	BO9JN+VzrbYMpVGa09z3aN+TbG9VySmDLqxiUvJjb8f9Q2mX/Xe041u/2wZU5wNsouG7NBFrBQZ
	DADJ2/PcMOzfZohT42MSJoFWeJI7YIhYpx8GdYJXYaKU1/ltkGpRplyRU2CZFRtX/ME5VgJes5g
	j1OoGOtSn5Bx6ixZf6uR+aDPmLx5uaUfEES9/QMRO1pb3z/yqmm3pH5bQmlrdhZa+ThI7FH8mfR
	iiV5ko1Tutp5Xv8R9zWC83EuDquELN9/ITfWdeCgAI3DGA3YFrI09knn8GPvw2dXSZkuUhhwubq
	81lLg==
X-Received: by 2002:a05:6122:1795:b0:559:eef7:39f with SMTP id 71dfb90a1353d-566a00fd9b6mr1063111e0c.12.1769801990207;
        Fri, 30 Jan 2026 11:39:50 -0800 (PST)
Received: from lvondent-mobl5 ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56685b0360fsm2523603e0c.1.2026.01.30.11.39.49
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 11:39:49 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v2 20/35] doc/org.bluez.AdvertisementMonitorManager: Add Used by reference
Date: Fri, 30 Jan 2026 14:39:02 -0500
Message-ID: <20260130193921.1273263-21-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130193921.1273263-1-luiz.dentz@gmail.com>
References: <20260130193921.1273263-1-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-18717-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 798FEBE3A7
X-Rspamd-Action: no action

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Add :Used by: field linking to bluetoothctl-monitor for this interface
used to register advertisement monitors.
---
 doc/org.bluez.AdvertisementMonitorManager.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/doc/org.bluez.AdvertisementMonitorManager.rst b/doc/org.bluez.AdvertisementMonitorManager.rst
index 3860429b0cee..fb5addf2a007 100644
--- a/doc/org.bluez.AdvertisementMonitorManager.rst
+++ b/doc/org.bluez.AdvertisementMonitorManager.rst
@@ -17,6 +17,7 @@ Interface
 :Service:	org.bluez
 :Interface:	org.bluez.AdvertisementMonitorManager1 [experimental]
 :Object path:	/org/bluez/{hci0,hci1,...}
+:Used by:	**bluetoothctl-monitor(1)**
 
 Methods
 -------
-- 
2.52.0


