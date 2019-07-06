Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E386120F
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Jul 2019 18:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfGFQBB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Jul 2019 12:01:01 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:29062 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbfGFQBA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Jul 2019 12:01:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1562428858;
        s=strato-dkim-0002; d=jm0.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=+ZOF8lRzJ6J9sDMNJ1bqv7dD5hAw23ET+GbOXNcBqNE=;
        b=Ctu/Inf2SqR5ph29tZ5kTknU48a4K29QYGU7gPMzjiruZMT4cZHmpAGjrRiijV6oxX
        Htg4Xxo81wWR7QfAqxTI0HyMeKZ3bnvg6bbkt/CK56UNQbM4sC2sg3uunf0/GoXixkSm
        T5FfreCTF+6VLNkYXRxY5QuXGEaCCcYVljvPWtdlbC6wm0ZrFF+ld5xtTwQjSXjuOqv5
        ak1E0Tdys1vGRnJyiBggCxIBKmAZsoU6VVt6jHEYHz0gAzzNC0rk8y5oZD/9WSVa/u7Z
        dxwJK3BPUSSqogdyM1TeJByLAUnRG8nMjG4QQxjm2s72bYJDwfaAqe3e37MfCXj10MQL
        /dmg==
X-RZG-AUTH: ":JmMXYEHmdv4HaV2cbPh7iS0wbr/uKIfGM0EPWe8EZQbw/dDJ/fVPBaXaSiaF5/mu26zWKwNU"
X-RZG-CLASS-ID: mo00
Received: from linux-1tvp.lan
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id h0a328v66Fsw6Oy
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 6 Jul 2019 17:54:58 +0200 (CEST)
From:   josua.mayer@jm0.eu
To:     linux-bluetooth@vger.kernel.org
Cc:     Josua Mayer <josua.mayer@jm0.eu>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        "David S. Miller" <davem@davemloft.net>
Subject: [PATCH v3 1/3] bluetooth: 6lowpan: search for destination address in all peers
Date:   Sat,  6 Jul 2019 17:54:46 +0200
Message-Id: <20190706155448.13382-2-josua.mayer@jm0.eu>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190706155448.13382-1-josua.mayer@jm0.eu>
References: <20190706155448.13382-1-josua.mayer@jm0.eu>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Josua Mayer <josua.mayer@jm0.eu>

Handle overlooked case where the target address is assigned to a peer
and neither route nor gateway exist.

For one peer, no checks are performed to see if it is meant to receive
packets for a given address.

As soon as there is a second peer however, checks are performed
to deal with routes and gateways for handling complex setups with
multiple hops to a target address.
This logic assumed that no route and no gateway imply that the
destination address can not be reached, which is false in case of a
direct peer.

Acked-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
Tested-by: Michael Scott <mike@foundries.io>
Signed-off-by: Josua Mayer <josua.mayer@jm0.eu>
---
 net/bluetooth/6lowpan.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/6lowpan.c b/net/bluetooth/6lowpan.c
index 1555b0c6f7ec..9001bf331d56 100644
--- a/net/bluetooth/6lowpan.c
+++ b/net/bluetooth/6lowpan.c
@@ -180,10 +180,16 @@ static inline struct lowpan_peer *peer_lookup_dst(struct lowpan_btle_dev *dev,
 	}
 
 	if (!rt) {
-		nexthop = &lowpan_cb(skb)->gw;
-
-		if (ipv6_addr_any(nexthop))
-			return NULL;
+		if (ipv6_addr_any(&lowpan_cb(skb)->gw)) {
+			/* There is neither route nor gateway,
+			 * probably the destination is a direct peer.
+			 */
+			nexthop = daddr;
+		} else {
+			/* There is a known gateway
+			 */
+			nexthop = &lowpan_cb(skb)->gw;
+		}
 	} else {
 		nexthop = rt6_nexthop(rt, daddr);
 
-- 
2.16.4

