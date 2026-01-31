Return-Path: <linux-bluetooth+bounces-18775-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAyHL05ifWkrRwIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18775-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Sat, 31 Jan 2026 03:00:46 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D994C02C0
	for <lists+linux-bluetooth@lfdr.de>; Sat, 31 Jan 2026 03:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDE43301386A
	for <lists+linux-bluetooth@lfdr.de>; Sat, 31 Jan 2026 02:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38C882DB79E;
	Sat, 31 Jan 2026 02:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuD2akMQ"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D3A3033D2
	for <linux-bluetooth@vger.kernel.org>; Sat, 31 Jan 2026 02:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769824836; cv=none; b=b0xcTI/kT13D0+hQ3aAwwrmewqChkouU9lAjPR8sa0sG4bnpwyR9fuSSkQ2WKZQfNctBCOzLhUQ+wUWQOM6Nlr6kz6NrfThoblb1YRJ9eZiuNLAiwcs9k3a5EzcuGb2pa+Nkv1w95ibA6JWDl9qjnK0pMYfj1XQINUBT/cuwY7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769824836; c=relaxed/simple;
	bh=TKRrBPn3nlTapkwaGRpaEdRqpULwuTuxic2CZdtQnUM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JEgmnlKDgxYvUdxmWprBSAR5xyBq37Tle7BE0YHZegLkN9iSLIq2382klwOQ2p4UlrbA4k+WWZXnNSQXE75q7hMJJC/FTkR5/hHvEFPxrFxe+2CsMovwpE7kIotOoOFnLsGCUsilk/TCnQJFjCaKxxUb5S1RpRZUDfaMYgpKTO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuD2akMQ; arc=none smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-2b720bb90d0so2849748eec.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 30 Jan 2026 18:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769824835; x=1770429635; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S8sSpYsZA6JHZwnyEHu8ba4tZ8CynYPbZUjMthqQkWg=;
        b=EuD2akMQqwhRuZS4mfYnPgEMSDDWTmjRiBVgQs2MIewHyUZQcnB3GPu8w4KQPRp0+t
         FD1SfkEVxRIKQUjNiRCx2H317GC5eG4jnmvPU2MfZ85kcKLOQU9H83J5RyNEtvAYx08E
         EEhonGKRhfwy1FRdc2cWAHEvDnttkmb2EwGLYTehxaV0sO5wZLCybH+lXi/VeEZzQve5
         KI/8CsFqZzSg55r9YSCheUjuvTWgP3Ipv6K62V71j+bz2N4Wi4w/XK0J3SzD9jI6keZN
         QZ9cDLLbgkQth3yz1kPHknEqHGrZiAe0hRCMwdA8izDIph1hfKenlYITNSDb8pacBHA5
         Na7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769824835; x=1770429635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8sSpYsZA6JHZwnyEHu8ba4tZ8CynYPbZUjMthqQkWg=;
        b=nrxqFlPR+W5BvGJsv8QA5spE8ZVhFaRQHAa4rA8JkUN7wUJGlsrv5C8rsgZeriXFYx
         c4EwVVkFOS7NZ6jSP89SO07DsbK6pC+2f4/nNC2lalY9TIGxmu182iZl19tnVaUw8JiR
         BdQHhCev+/hfuO3x68Zoub0E3NgrkkQODnhPDzR3fHrcCkyEeag7QAFkxGftDrgozLKC
         E+NWSzesllJoAdv+ZBARjcbaMxhR76BI6ynhKqnxM5JEPMF/KRr8dGF4e2GyhM/l+HCC
         q/f7DiVqM/+2fwdrNBGvqEer0GZFSaiRSJtar4gBcdUVLxWKzlFJmP/dR9H2ArBCjQ62
         zi2w==
X-Gm-Message-State: AOJu0YwY1C5Os8dqRKsO8pNd0UpCgsJfX6BLyDE6jtNSErC51Z26XbNY
	1+lzQD7CZNu65mteJ2Tam0xi43HWWLKslNYA7gKzcUVhNNEVrAfQeOhXjez7H+WF
X-Gm-Gg: AZuq6aLEmMMbwh7+n7DBUKIolujVP14Q989x20fn1+4aYIKjBFsIKwzk/LFKtYyv6Y5
	YTY/6cjssSoQ8QcMX3uhGnrdJTYllIDEo9Lh+O69Zvfx/3B9W86dn7SShd75T5nWfasAITVzWnP
	7SrZ2Xysv17tvC48AYzzIj7SPKKHFUoWR4MijqVOqUseyfOnuehqaINlh1COA9aQt7y3pjNXGCm
	5bz/i0oVVRHLD2rU7dZbcqmmgxEmR9xPxKUcc6f/ZtbyaHVKFh1aM4OuvW1ut9qR+8EPah2hFca
	Lj1gDUXIM4vgZmdsfQtfC32Hyljh6CNdv3Vd7nMxDk1H+2yzs5Tjk+Kzth4yfpKBEhA38GsP0Ei
	QINo2rizCuXCZyleC2wfXdoOWznGnYsz76WuJxZOW5ScQ8udfK1GsvWqutNiS3smH3jnxeMbbJd
	B/pf4qBzgAU42TQv6r2ZylityEMfo1sDTKOzJoQ4D5j0ynZ2i/OaB6w2TrQkEVnIpgabog+GaL9
	TNN+CApMHs/JRplM1do3tGPHd6o0prdf+ZmgzWDVtJ/cLrkOldZ9uZ+qoQnr1Yv7eJV6j4QqcMt
	Gicz
X-Received: by 2002:a05:693c:631b:b0:2b7:da62:a5f9 with SMTP id 5a478bee46e88-2b7da62b16cmr860627eec.18.1769824834778;
        Fri, 30 Jan 2026 18:00:34 -0800 (PST)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16ef40asm13228517eec.13.2026.01.30.18.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 18:00:34 -0800 (PST)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Subject: [PATCH] bluetooth: btrsi: remove unnecessary module_init/exit functions
Date: Fri, 30 Jan 2026 18:00:31 -0800
Message-ID: <20260131020032.45838-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,holtmann.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-18775-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,linux-bluetooth@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1D994C02C0
X-Rspamd-Action: no action

The btrsi driver has unnecessary empty module_init and
module_exit functions. Remove them. Note that if a module_init function
exists, a module_exit function must also exist; otherwise, the module
cannot be unloaded.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/bluetooth/btrsi.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/bluetooth/btrsi.c b/drivers/bluetooth/btrsi.c
index 6c1f584c8a33..527a95d943ad 100644
--- a/drivers/bluetooth/btrsi.c
+++ b/drivers/bluetooth/btrsi.c
@@ -178,18 +178,6 @@ const struct rsi_mod_ops rsi_bt_ops = {
 };
 EXPORT_SYMBOL(rsi_bt_ops);
 
-static int rsi_91x_bt_module_init(void)
-{
-	return 0;
-}
-
-static void rsi_91x_bt_module_exit(void)
-{
-	return;
-}
-
-module_init(rsi_91x_bt_module_init);
-module_exit(rsi_91x_bt_module_exit);
 MODULE_AUTHOR("Redpine Signals Inc");
 MODULE_DESCRIPTION("RSI BT driver");
 MODULE_LICENSE("Dual BSD/GPL");
-- 
2.43.0


