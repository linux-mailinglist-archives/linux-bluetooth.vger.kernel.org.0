Return-Path: <linux-bluetooth+bounces-7707-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CA799393F
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Oct 2024 23:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1E2A1C2346F
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Oct 2024 21:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F7018C913;
	Mon,  7 Oct 2024 21:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="YsrItt43"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2141A18BC16
	for <linux-bluetooth@vger.kernel.org>; Mon,  7 Oct 2024 21:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336937; cv=none; b=krZwpmk6SSLBdR0awes9tIcCWCmAQIu3VZlqUynL3uLLckibkl4buKDZ5wfTYcCkHdgFamTHBO5PbINldj59OxnnGJO09cBYXg3oQGP7jV2z4m0bJyqKpYCsSbttdUiDRk5dyqw3u0WxtwwpUsBt788MqyVIyMPHpPBrePMH+80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336937; c=relaxed/simple;
	bh=Cj/g2VTG0C81FjDq7sBsvd4h8InwdCQJmL5VU9F0Z9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qZrdHYDAJLXS96REnn5yBqgiRWWV7Qgyo0FREOIk/ansp/qMAozNVpe5Tv7PyfjFh6jIUSjaBcELXsUj0QW4hm/vnL5gN1UjseONM68E8RuiX/jbfvw2aUox5k01jLuIuNf65OBBM4w61ncAJ/SkgVb0TYH+7hfYAYDBToCv8HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=YsrItt43; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso50782215e9.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 07 Oct 2024 14:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1728336932; x=1728941732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jrqMOPb+Ys+vm2FHKNfe83E/YEHFtEwX37/HgcffrLo=;
        b=YsrItt43njWe4aw+ykZd/UEPseVGMOZjD0t3/bWccbWX/hc4Qb1wzL3A2/9nSjtQFu
         90S7U5/c/lYwBLL/6koIGOTJynxk1S3kCOCM2vtPPsx3vzUCjU7AQBH/DfkFP5hoqHOA
         vfB+/nBhtSB2AvFgE+R7rq6stUTeqVmW8lUDexWnnOnlv5RXwL1Ruox4UhQ5BBcAoqYw
         bIQbNgqU5FLGJIAJYkABvf1R52isIKe0kT/Dqy0WHCW1EMDZoctcy1MlTApLozI8vUmU
         CWXV/TtaKYugUxkU2Q3m68XgF+j1b+ZaDwLaxSH4lPrjRH5Z3epL28z8oBQyu/S4j742
         wLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728336932; x=1728941732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrqMOPb+Ys+vm2FHKNfe83E/YEHFtEwX37/HgcffrLo=;
        b=HstK9xMGKKhRT+np9lxLIbKlWLFhf4L0K1jhrIbrJHN2SkW2hxpzEG0TAm+Boj3I/o
         CJ8tvEi++64Rf78MPAjFAoJhLAfr0EB6f/EgPo/2yFJ9bRG3NHG0iQxiSkdDtZYlHORd
         8JbqgPQX6wTy+XtcXRwTdoylnv7+51/A0DKOsFeaY+R3LSK83KdR/LAR/xJ0POcxJJd4
         3TtmzypoHe6fNepfemitZ5TtpXBBufHO2uWlEEInTPh801Itim3mOy7Tak//1O8BjQ9Z
         UeWx0EjQCWdGBO4fJH+BvdEYkpiW+cUNAhS+o0HdmTO1qCtnAm+4FPNKahZ/QGVDUHke
         xBcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4sz8fn0+3lywWcAaxQjeAVjeTrXFJpDGK1hdQmuSA1JMcnhJ4u+LYTqyDC1kC6c6C0lhimDkzK76ynGQSPAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEFnGUKhqrMWl1COs99t3NSlwCMzrLUHfQfDiuaZHuoLfhcceQ
	rXsKu6oXnpxFCklL6WJ//pniBo2CHFTYErsBpERJCOUdvJhMOJOOZVjRvWSdU2g=
X-Google-Smtp-Source: AGHT+IHlG2I62I2zeXAxqMGyHeNmGHzkATxTykamA43gyhtpvqM0nGUZ+C0M68aJb9FCrknBGd5udA==
X-Received: by 2002:a05:600c:5804:b0:42c:b1ee:4b04 with SMTP id 5b1f17b1804b1-42f85ae918amr92954035e9.28.1728336932471;
        Mon, 07 Oct 2024 14:35:32 -0700 (PDT)
Received: from localhost.localdomain ([104.28.192.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691a4absm6535887f8f.29.2024.10.07.14.35.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Oct 2024 14:35:31 -0700 (PDT)
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
Subject: [PATCH v2 0/8] do not leave dangling sk pointers in pf->create functions
Date: Mon,  7 Oct 2024 22:34:54 +0100
Message-Id: <20241007213502.28183-1-ignat@cloudflare.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some protocol family create() implementations have an error path after
allocating the sk object and calling sock_init_data(). sock_init_data()
attaches the allocated sk object to the sock object, provided by the
caller.

If the create() implementation errors out after calling sock_init_data(),
it releases the allocated sk object, but the caller ends up having a
dangling sk pointer in its sock object on return. Subsequent manipulations
on this sock object may try to access the sk pointer, because it is not
NULL thus creating a use-after-free scenario.

While the first patch in the series should be enough to handle this
scenario Eric Dumazet suggested that it would be a good idea to refactor
the code for the af_packet implementation to avoid the error path, which
leaves a dangling pointer, because it may be better for some tools like
kmemleak. I went a bit further and tried to actually fix all the
implementations, which could potentially leave a dangling sk pointer.

Changes in V2:
  * reverted the change introduced in 6cd4a78d962b ("net: do not leave a
    dangling sk pointer, when socket creation fails")
  * added optional commits to all pf->create implementaions to clear the
    sk pointer on error after sock_init_data()

Ignat Korchagin (8):
  net: explicitly clear the sk pointer, when pf->create fails
  af_packet: avoid erroring out after sock_init_data() in
    packet_create()
  Bluetooth: L2CAP: do not leave dangling sk pointer on error in
    l2cap_sock_create()
  Bluetooth: RFCOMM: avoid leaving dangling sk pointer in
    rfcomm_sock_alloc()
  net: af_can: do not leave a dangling sk pointer in can_create()
  net: ieee802154: do not leave a dangling sk pointer in
    ieee802154_create()
  net: inet: do not leave a dangling sk pointer in inet_create()
  inet6: do not leave a dangling sk pointer in inet6_create()

 net/bluetooth/l2cap_sock.c  |  1 +
 net/bluetooth/rfcomm/sock.c | 10 +++++-----
 net/can/af_can.c            |  1 +
 net/core/sock.c             |  3 ---
 net/ieee802154/socket.c     | 12 +++++++-----
 net/ipv4/af_inet.c          | 22 ++++++++++------------
 net/ipv6/af_inet6.c         | 22 ++++++++++------------
 net/packet/af_packet.c      | 12 ++++++------
 net/socket.c                |  7 ++++++-
 9 files changed, 46 insertions(+), 44 deletions(-)

-- 
2.39.5


