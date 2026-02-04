Return-Path: <linux-bluetooth+bounces-18823-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T1p+LpGWg2kPpwMAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18823-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 19:57:21 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 242F8EBCC4
	for <lists+linux-bluetooth@lfdr.de>; Wed, 04 Feb 2026 19:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82FA9300CFE7
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Feb 2026 18:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5DB83D7D6B;
	Wed,  4 Feb 2026 18:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hz3UJWqj"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45219156F20
	for <linux-bluetooth@vger.kernel.org>; Wed,  4 Feb 2026 18:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770231435; cv=none; b=fP8izrBkWTZFKxiYULHnxln1DkOD/srqV+MwBe4IG4JCYGgsYLhxhKoTKlDXatG9oAlBYJ/yVGZIe28poWeBn9WvtmYieWCayv+5C3TOGHyrZNho4ILPl+kCOvlBwzWrg9LHYWU9PLrhnLn05bswZuePdQ/R5A+razoIjyIKs9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770231435; c=relaxed/simple;
	bh=hX6r52JQiQpoR1P3Smgu3ZEOearJFn5jpH8OzrV2Hq0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=jb2FDKWUmHeyueSNXMnEzfBKxlvC/wM5KwEq4K5bxlLPd+6cRFryt2he/VYQ4Kv2GL7pEljXLJ2LMMJ17YBhz0cDn3rAaToEREi1svypSDfUvTb4VqaapQg0FxIOq8JKBZpHRqe14g7fwGWOwCiKijHCQoPyQcTacI0+vOmK4JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hz3UJWqj; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-566474a6e10so137444e0c.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 04 Feb 2026 10:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770231434; x=1770836234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jA9jK5l1IGzLN1H+jyiCWiWPt3mJZzaz4RxWYD10ymg=;
        b=hz3UJWqjY0PrEOESNondrWcvvaxmr6CYci9h8Conu3wxeuUsqqf61LQO5pR3R3Gsys
         CTTzAG4u+ux4y8Cyl1qey0I6lAYWLumKwwiDZzdk21P6ZGYljPRzonNuo3Cr+iTCJQZq
         6uyr4beGP3s+SKyKyf8ubcAvCZntpMJk6Mtn0yZI3/hGu+bb2GrQUimtaHZSTHvs+cc5
         v4ghuxS8+ovORoCpAF/lvxBY9g5APi0aRiBLypvzaqaoVUHggdiUi99riXiqNpcRidIr
         7jZlzNXt3x1Fs8BsoogPLIv51Fdvb4IFh68H7kvOBTWMjcsAfAJgcFNtFaNmrmBL1NNa
         FQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770231434; x=1770836234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jA9jK5l1IGzLN1H+jyiCWiWPt3mJZzaz4RxWYD10ymg=;
        b=pIBNNH34bu6nEQXuQ47KdzLinD1+8kDVp0musAs62lGKom5Sv+j+rPcnvzMuDZou4n
         lqzg0rNqoczRq5WISshAJX4gt7zypZ/Wuko5YD7u14dLTRyRbQwb3rNQ6Y/jhtEl7sCF
         mNbdAV5TqD4YDKAd5z0V4+CzSCd7y91UNh1vOz5TffBeBs8MAXQJsEMZTugKiqc6H+8S
         E2Xkyza+kA+7djnaCjdFiWJp0s+UgyEx5fKSZ3vR8w6qFtUZqXuAeeilT3YdfS0Nrg6G
         04kgpuSohboRNyRIUHauuOnXalc3bwwa8T/6ZBdLtiy8ptZ1N/3bDe1QqNJWewmbb5M3
         Ihsw==
X-Gm-Message-State: AOJu0YwfETGJjCea+D2GBjDeAnDM7T6I5nSieRj0MS3zEQ3eC/pov/o5
	UeWmsTJ52RvHhN7LaG/M5LqgZxmRZ1vno/9Du4hrkeY5NwrzpdMLjrZ8aQg0LQ==
X-Gm-Gg: AZuq6aKSWmEspYV2jFsF625fw/U/qSfleKtlAwusST0g1T7X7HPD/5JhDrumn7km0yi
	RaGxep4jDnDUE/fV3vfFyG7qow9NDa5Mghx2wpASa3HRuH1cKwLk1Dd62CYxq/WO4/9IKbw8lxY
	QnfUhank6HUjQ/08Z6Aj9qlC8JDuYtzijvi6SNz8rjsDrwVdXfk69LI8Lb7mn/N7ZIpKkB5zR8Y
	wZNTcMdQ57vxQdS5Md1Kk/NyOSH9klUvZasVm/EYbg81BwDGLtxcHas1ze562HABP7/pNSyRoUM
	UVqxNsdhUEVGIVIny1PMs4F1hiLyBQjI5ixq7Oyup0qUxI6sGYzX3ZbGF4clB/1CQFDwSyFy2da
	WH6VALfq19Jls5iT5q9bz36x6U+BUBdprEm2wAv1DnGW2RPDCzgUTUV9n8njmLPKp44ptlhGOWK
	6vsoDocDLieGIpEzqBbE/M9b4bxC2XGoah/KvTsfIq7fV6UfTdj14wYdJA65COruYeyRyMuvxc5
	kW93Q==
X-Received: by 2002:a05:6122:130b:b0:55f:c4a6:c584 with SMTP id 71dfb90a1353d-566e7f99b1dmr1615115e0c.1.1770231433946;
        Wed, 04 Feb 2026 10:57:13 -0800 (PST)
Received: from lvondent-mobl5 ([72.188.211.115])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-566e80cd031sm1525433e0c.3.2026.02.04.10.57.12
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:57:13 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v1] monitor/l2cap: Add missing result for BT_L2CAP_PDU_ECRED_RECONF_RSP
Date: Wed,  4 Feb 2026 13:57:07 -0500
Message-ID: <20260204185707.2327200-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.52.0
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-18823-lists,linux-bluetooth=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	HAS_WP_URI(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,bluetooth.com:url]
X-Rspamd-Queue-Id: 242F8EBCC4
X-Rspamd-Action: no action

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

Last 2 BT_L2CAP_PDU_ECRED_RECONF_RSP result opcodes were missing
accourding to Bluetooth Core 6.2 spec:

https://www.bluetooth.com/wp-content/uploads/Files/Specification/HTML/Core-62/out/en/host/logical-link-control-and-adaptation-protocol-specification.html#UUID-02ef4c03-7278-7ad6-bbf2-ee2f0e921fed
---
 monitor/l2cap.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/monitor/l2cap.c b/monitor/l2cap.c
index be041a8e16a0..e9a1df824e57 100644
--- a/monitor/l2cap.c
+++ b/monitor/l2cap.c
@@ -1471,6 +1471,13 @@ static void print_ecred_reconf_result(uint16_t result)
 		str = "Reconfiguration failed - reduction in size of MPS not "
 			"allowed for more than one channel at a time";
 		break;
+	case 0x0003:
+		str = "Reconfiguration failed - one or more Destination CIDs "
+			"invalid ";
+		break;
+	case 0x0004:
+		str = "Reconfiguration failed - other unacceptable parameters";
+		break;
 	default:
 		str = "Reserved";
 	}
-- 
2.52.0


