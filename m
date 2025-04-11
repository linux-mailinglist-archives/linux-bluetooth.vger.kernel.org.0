Return-Path: <linux-bluetooth+bounces-11638-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F1A86344
	for <lists+linux-bluetooth@lfdr.de>; Fri, 11 Apr 2025 18:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F5C744510E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 11 Apr 2025 16:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AC121C183;
	Fri, 11 Apr 2025 16:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EEVyyN2b"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAE221B9DB
	for <linux-bluetooth@vger.kernel.org>; Fri, 11 Apr 2025 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744388957; cv=none; b=gEWnQ/lu7n6VKWPQCSWsr1LOG+W+AXlmdq+QYkMXFV650/REEfjhuxqBa1Y6Vg/XwbDFwYdSQJEvunT5/++DnzWUJjun43aHMdAFDW3SGHnrajjwu0D47HN02MN7j4yhheAXM40Yux1SBSs+zhMeWm9kYRCMbQCD0oEclN+D/po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744388957; c=relaxed/simple;
	bh=MfwdEcpoO4gFwwY/mbFsoS/W5cFZF/N3okyG0c7wc6A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Type; b=hZvqOFbWX3UvEPCETVj24o/BIszcFnKq2m7O+SM3c/MVYnIfV6fFZGti9Id7bkCc/3dU+cE22Vyv/OSjkgJVBQDc6kZ200gBEfqiCd8rFJTM52xSZ2ZTYPiLMD2zVpxhTxw5uImrchCM0ruPPqIVlrYwxyieTk7x32bgsPtBkrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EEVyyN2b; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744388953;
	bh=MfwdEcpoO4gFwwY/mbFsoS/W5cFZF/N3okyG0c7wc6A=;
	h=From:To:Subject:Date:From;
	b=EEVyyN2bvQRtOs6hcqCqYGcDACAQBzxdHVLP5g+U0eVywJm8tQEjYICqZW4XA1nEP
	 Yj/7wKnBKtutB2HzTU2cwQEzaav99bDE3juqPJlqd7fYyp6Qgi5aPMiijcVAV9phNl
	 hXX1oXfqX4mtbEnugb95CY0qENAsS6OIPWZPVgodoeTxcF04g0cGJcOYa3U5d1IbsN
	 GzvlEf+Zy6MlMv77gCCG0eFn8JGLi9TmMenP37jmIpNT+BP4JNB5+aONGeP9K2LE58
	 XP2VokCd9yv1RndJhaRxICBWtwyvETcl+rYjfaXWP5oDX9JF6gJpHOmub6r5faNcHN
	 idSdWIuNvBv2g==
Received: from fdanis-XPS-13-9370.. (2a02-8428-Af44-1001-856f-D478-a78e-A409.rev.sfr.net [IPv6:2a02:8428:af44:1001:856f:d478:a78e:a409])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: fdanis)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4CD9717E0402
	for <linux-bluetooth@vger.kernel.org>; Fri, 11 Apr 2025 18:29:13 +0200 (CEST)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= <frederic.danis@collabora.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH] Bluetooth: l2cap: Process valid commands in too long frame
Date: Fri, 11 Apr 2025 18:29:08 +0200
Message-ID: <20250411162908.772132-1-frederic.danis@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

This is required for passing PTS test cases:
- L2CAP/COS/CED/BI-14-C
  Multiple Signaling Command in one PDU, Data Truncated, BR/EDR,
  Connection Request
- L2CAP/COS/CED/BI-15-C
  Multiple Signaling Command in one PDU, Data Truncated, BR/EDR,
  Disconnection Request

The test procedure defined in L2CAP.TS.p39 for both tests is:
1. The Lower Tester sends a C-frame to the IUT with PDU Length set
   to 8 and Channel ID set to the correct signaling channel for the
   logical link. The Information payload contains one L2CAP_ECHO_REQ
   packet with Data Length set to 0 with 0 octets of echo data and
   one command packet and Data Length set as specified in Table 4.6
   and the correct command data.
2. The IUT sends an L2CAP_ECHO_RSP PDU to the Lower Tester.
3. Perform alternative 3A, 3B, 3C, or 3D depending on the IUT’s
   response.
   Alternative 3A (IUT terminates the link):
     3A.1 The IUT terminates the link.
     3A.2 The test ends with a Pass verdict.
   Alternative 3B (IUT discards the frame):
     3B.1 The IUT does not send a reply to the Lower Tester.
   Alternative 3C (IUT rejects PDU):
     3C.1 The IUT sends an L2CAP_COMMAND_REJECT_RSP PDU to the
          Lower Tester.
   Alternative 3D (Any other IUT response):
     3D.1 The Upper Tester issues a warning and the test ends.
4. The Lower Tester sends a C-frame to the IUT with PDU Length set
   to 4 and Channel ID set to the correct signaling channel for the
   logical link. The Information payload contains Data Length set to
   0 with an L2CAP_ECHO_REQ packet with 0 octets of echo data.
5. The IUT sends an L2CAP_ECHO_RSP PDU to the Lower Tester.

With expected outcome:
  In Steps 2 and 5, the IUT responds with an L2CAP_ECHO_RSP.
  In Step 3A.1, the IUT terminates the link.
  In Step 3B.1, the IUT does not send a reply to the Lower Tester.
  In Step 3C.1, the IUT rejects the PDU.
  In Step 3D.1, the IUT sends any valid response.

Currently PTS fails with the following logs:
  Failed to receive ECHO RESPONSE.

And HCI logs:
> ACL Data RX: Handle 11 flags 0x02 dlen 20
      L2CAP: Information Response (0x0b) ident 2 len 12
        Type: Fixed channels supported (0x0003)
        Result: Success (0x0000)
        Channels: 0x000000000000002e
          L2CAP Signaling (BR/EDR)
          Connectionless reception
          AMP Manager Protocol
          L2CAP Signaling (LE)
> ACL Data RX: Handle 11 flags 0x02 dlen 13
        frame too long
        08 01 00 00 08 02 01 00 aa                       .........

Signed-off-by: Frédéric Danis <frederic.danis@collabora.com>
---
 net/bluetooth/l2cap_core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index f1c4b8bd7a8b..46b2884170fa 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -7539,6 +7539,11 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 		if (skb->len > len) {
 			BT_ERR("Frame is too long (len %u, expected len %d)",
 			       skb->len, len);
+			/* Process valid commands from the PDU before
+			 * setting the socket unreliable
+			 */
+			skb->len = len;
+			l2cap_recv_frame(conn, skb);
 			l2cap_conn_unreliable(conn, ECOMM);
 			goto drop;
 		}
-- 
2.43.0


