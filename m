Return-Path: <linux-bluetooth+bounces-7710-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6559A99394E
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Oct 2024 23:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D931BB230C0
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Oct 2024 21:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1667B1917C4;
	Mon,  7 Oct 2024 21:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Iz9zRhD6"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F258B18E044
	for <linux-bluetooth@vger.kernel.org>; Mon,  7 Oct 2024 21:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336945; cv=none; b=HbKfnQxCPJFAdVcuts0XDxDyia8sfYhW8O60E03dW4p6QxR9SzUPPpe2vwo0AoYJCprMv7wOA3pihY6aVeC3XO9d+1yN/8P4R922mM/W66/rivb5k8zAF94HAdoyf0JwMJMFZWwvuRfd9BOZz6w8ymLK8NA5jMENVde7teDoBsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336945; c=relaxed/simple;
	bh=Za6d2/ag0cx5W3bmCrv67Ur4+k+VPgr8uvsyupNoJnM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DSbhbphDl40s6+5fSGvsN49Nm/LPvm51gzDMHKTK7NPSyox82DVTmLcZmKKh6oj7Vjxj20BGCKqdljzoGC3vFwApF6gPmCm+sYqGeBq8Q7CoUtRyQ07lLo7sbGw+c+Fu9wtd50Cd0h4UV8aml1iU+P6zXRI6DMh/V4R318Noyxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Iz9zRhD6; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37d1eda8c7cso1089135f8f.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 07 Oct 2024 14:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1728336942; x=1728941742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TINcLHJMJcRO8N8gtca7WYNoZRWtOQnWeYtX29logTQ=;
        b=Iz9zRhD6wRn/Ctlf5ev018am/0nLW5at2MOCHuyXmr9uE/SP8mt91WzpI+bJTy3//g
         qeaWtbKMspHNaRemf3MWYiJ3S4Ap6lieJC+WscCoyAtzSfXgr4MOnF18UIzs0v2ChBMY
         QdnhiluDaWedij+0IxHt0FA7VH4rabbN9hVAbTzSyjam3GmzLUtzj6J9yhB+tyuC6AGJ
         mW/pyl8g+Gi8ATYHoacuOD4Ji1f4axXRvN+O3CfItkX/vobcRdEiuz5+jgshw6vyfTX7
         dSrln/uuccSJSaiILA/Hh0Hb+jsWlPNbIn0ayI4d72IqcCeXZfYWnFJtYmAlSJ8MnRq0
         6zoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336942; x=1728941742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TINcLHJMJcRO8N8gtca7WYNoZRWtOQnWeYtX29logTQ=;
        b=GR5MpLBUBnWXimmHwbWx51Mk/bjGh5VkI0jmyWQq+kLutAKf2XE6IRFQ8iYxcemATa
         wUs2DUFrB/0j8wWMxtFPRLTvWiLImDJTWCY+zNuuHOYKEcI9Jpf1gvDbpHL8+EvgVC8C
         MCDmVJuP+cv7hlwMsjb+aa4WTCcoyDNaz1EzxpRa/vqzMfjsngIEZcIyDY9vTquT3bFh
         fVHgcGpHAyCnFUYRcrsgpQ7rpU4jqo0sHtgPpppEx8v5R2qPCgVux+V5V2mYohm6zZsb
         KzxHCE6NmfbCgmmBIIDXGgEJt/1V627IpPJlVTg2Q2ynzra+1DgRC7NS5snnJxWDNlMG
         5JKA==
X-Forwarded-Encrypted: i=1; AJvYcCWBRQ+7nt79Pl2hti7x8Qs6taQjC2TQsYWzgluN+Is/piduyI/CYHgvDpFO3SpZHBOjshVtMKSF1IK7t9N5yYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj7qmJHqEgCcS/eni0CB70R8HGewSBj9tEtAOPFep64VvDGB80
	MJuCDGRhrpHZVFEVRKHO9fKvZhOXy5S7TnTQynMVG5to9iRSetkDfhFrLNco+xY=
X-Google-Smtp-Source: AGHT+IHAyQYt8epuqdqQ1WiemxSSnJdRW7ySGcsdfEr9r4QwNV8qbe0cvU/RBNztpAk9AJdBnDqlqA==
X-Received: by 2002:a5d:6052:0:b0:37c:c9ae:23fb with SMTP id ffacd0b85a97d-37d0e7d43fbmr7244020f8f.40.1728336942347;
        Mon, 07 Oct 2024 14:35:42 -0700 (PDT)
Received: from localhost.localdomain ([104.28.192.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691a4absm6535887f8f.29.2024.10.07.14.35.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Oct 2024 14:35:40 -0700 (PDT)
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
Subject: [PATCH v2 3/8] Bluetooth: L2CAP: do not leave dangling sk pointer on error in l2cap_sock_create()
Date: Mon,  7 Oct 2024 22:34:57 +0100
Message-Id: <20241007213502.28183-4-ignat@cloudflare.com>
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

bt_sock_alloc() allocates the sk object and attaches it to the provided
sock object. On error l2cap_sock_alloc() frees the sk object, but the
dangling pointer is still attached to the sock object, which may create
use-after-free in other code.

Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>
---
 net/bluetooth/l2cap_sock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index ba437c6f6ee5..18e89e764f3b 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1886,6 +1886,7 @@ static struct sock *l2cap_sock_alloc(struct net *net, struct socket *sock,
 	chan = l2cap_chan_create();
 	if (!chan) {
 		sk_free(sk);
+		sock->sk = NULL;
 		return NULL;
 	}
 
-- 
2.39.5


