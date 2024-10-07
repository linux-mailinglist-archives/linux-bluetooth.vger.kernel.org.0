Return-Path: <linux-bluetooth+bounces-7709-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30170993949
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Oct 2024 23:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE73A282FF5
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Oct 2024 21:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D686C18DF79;
	Mon,  7 Oct 2024 21:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="gNJI+tRX"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD60A18CBFC
	for <linux-bluetooth@vger.kernel.org>; Mon,  7 Oct 2024 21:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336941; cv=none; b=DRpvuqryF7Rm2d1rfJAZHqHdfLnkeNFuGxxOkLqrpCFu1N1+BBqBAX5tHelBiMsECHaZxe8JFAj5BgruOPTN9Q//OhmtSCPzzbhGNanVsoco8fbiyHTeYETddR2pJfGdGmlXUjIQXJBUvWnipmtna6Aba+tc7SMOuNuGoL8qbeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336941; c=relaxed/simple;
	bh=RcIs+XM/c9JJbPNWfZbV/Z6TaGGOUNRFsh8gxXUISQs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QYD2e4OEV9P7o2lNNHSGvT4T08WwM+tPXnRpG/GR3s8j+xlwm5JlhlsneFT8/CWsappToTbIBoaxs8cbtzzpWBKF+U6StxhkG//wt0jSngmXTSr1j5kqWbEZCS1hbnF4N4Q/8QV8vgO8PRrYMuGvGx/el352hZIb4wrrLBfJbiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=gNJI+tRX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37ce8458ae3so4537690f8f.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 07 Oct 2024 14:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1728336938; x=1728941738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+WOxbNpY99MeFQgjqBrr6wWjmGKbOSspT6QoIunVVM=;
        b=gNJI+tRXKEOT+JmcWvkPAw+RE/UwTHAIQzQz3mH5eMTdSUyJvr1cM0VXOXIehowi+a
         ZxKNoAfqF4keeHK7Q3r5LdOrpiFHPw1GAcSf/kO6JdLmV6p6GoUO6lrGeQNDfHVa2oQr
         kjzOkMLPvNepFcrXbKERtQwyH0D3eSgJKtFDj9TfG9of0783iW9hkSusWZXTyMOqRBIY
         iXuKjjw+36/id77T9pdpj+mwDpIjs2tOeej6/jokFU2UuvIMEWcyeCam3Yb78KvUnhWF
         VZL9ahbtiAycL8iJZ/02cBFxtMCyjAzehpoICIGE36gZFrz4t0KvG0UAoFtLqSCTX1TV
         nBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336938; x=1728941738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+WOxbNpY99MeFQgjqBrr6wWjmGKbOSspT6QoIunVVM=;
        b=oORQMfkPwDcnwQ2U76nbRQqV885QJKNgdCtwlS5CWq9eUyh4zrrCgHETs1mLBQBxrP
         CF+EpQJvfFz6z1/LGR1rcE1iebzQbbqsexrHtsLaBnzVD8678aKqzdl5ykBBgfcoaUox
         +VJNxoiiNT0ADEVEuAzIc3xyKmnwQlnwIH//rZL41VnUpcf4xuE3qLmmH+i9XNFWbg2O
         yaOZ2WslDFgiVDORv2yafFTqqcyi9YQNZ1V8minToj6qLi0vZEktrR6fl1yPsv0BZqyv
         GFoJXcuSBJaWaLWtpAjX4EWWnOKlP6KbIeBoYtpfcI8lMHRkjbEjHTMviqltnHDXVKCx
         2otg==
X-Forwarded-Encrypted: i=1; AJvYcCXSIg5qzSuAPxwfJILvvJSVIctPIpYw3C0Ie4CjG2k8X/Ua9yZ4nnByyNkTpeJRC+JZ166yj81V+ZA2TFHplC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7BqL3Q904mKrlKw8CQd3TRMpXVypsSTls9denD4xti1mDAQOa
	hyeGILvzWozDEy62VPXV4D25anLOcRNcyeZ/V3Kw42o9rEIvLQZvENuzjQpgiHc=
X-Google-Smtp-Source: AGHT+IEAHU3X4+3NGeDfduAV1o0hQG1DQDEgIfBCr8/wft+nMF9Tib13AWSIHVXOd+aWgaKXq2y7Dw==
X-Received: by 2002:adf:a199:0:b0:374:c9f0:7533 with SMTP id ffacd0b85a97d-37d0e8daaf4mr10614171f8f.41.1728336938164;
        Mon, 07 Oct 2024 14:35:38 -0700 (PDT)
Received: from localhost.localdomain ([104.28.192.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691a4absm6535887f8f.29.2024.10.07.14.35.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Oct 2024 14:35:37 -0700 (PDT)
From: Ignat Korchagin <ignat@cloudflare.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	David Ahern <dsahern@kernel.org>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-wpan@vger.kernel.org
Cc: kernel-team@cloudflare.com,
	kuniyu@amazon.com,
	alibuda@linux.alibaba.com,
	Ignat Korchagin <ignat@cloudflare.com>
Subject: [PATCH v2 2/8] af_packet: avoid erroring out after sock_init_data() in packet_create()
Date: Mon,  7 Oct 2024 22:34:56 +0100
Message-Id: <20241007213502.28183-3-ignat@cloudflare.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241007213502.28183-1-ignat@cloudflare.com>
References: <20241007213502.28183-1-ignat@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After sock_init_data() the allocated sk object is attached to the provided
sock object. On error, packet_create() frees the sk object leaving the
dangling pointer in the sock object on return. Some other code may try
to use this pointer and cause use-after-free.

Suggested-by: Eric Dumazet <edumazet@google.com>
Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>
---
 net/packet/af_packet.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
index a705ec214254..97774bd4b6cb 100644
--- a/net/packet/af_packet.c
+++ b/net/packet/af_packet.c
@@ -3421,17 +3421,17 @@ static int packet_create(struct net *net, struct socket *sock, int protocol,
 	if (sock->type == SOCK_PACKET)
 		sock->ops = &packet_ops_spkt;
 
+	po = pkt_sk(sk);
+	err = packet_alloc_pending(po);
+	if (err)
+		goto out_sk_free;
+
 	sock_init_data(sock, sk);
 
-	po = pkt_sk(sk);
 	init_completion(&po->skb_completion);
 	sk->sk_family = PF_PACKET;
 	po->num = proto;
 
-	err = packet_alloc_pending(po);
-	if (err)
-		goto out2;
-
 	packet_cached_dev_reset(po);
 
 	sk->sk_destruct = packet_sock_destruct;
@@ -3463,7 +3463,7 @@ static int packet_create(struct net *net, struct socket *sock, int protocol,
 	sock_prot_inuse_add(net, &packet_proto, 1);
 
 	return 0;
-out2:
+out_sk_free:
 	sk_free(sk);
 out:
 	return err;
-- 
2.39.5


