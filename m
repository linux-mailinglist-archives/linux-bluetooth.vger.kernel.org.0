Return-Path: <linux-bluetooth+bounces-8974-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EB19D771A
	for <lists+linux-bluetooth@lfdr.de>; Sun, 24 Nov 2024 19:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8AABC22A4B
	for <lists+linux-bluetooth@lfdr.de>; Sun, 24 Nov 2024 15:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D446C23BFA6;
	Sun, 24 Nov 2024 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3JJaBSW"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3936B1F9F53;
	Sun, 24 Nov 2024 13:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732456361; cv=none; b=ct7TAZ1XkOCoT0X6rBVHtE+BcliRok4iASVFpPM4vi65Gt9mmvptJIHHmismYvvjnMByin8hQImgdck/+uv6Wpe8lHY0mlJj7hKmh7o+u3qfUkPV2eIzqGi/DlaxW5PF3AsbOHwRH+/sKTESfoKEQXvOxRcCEFwRyUZi2zqRy6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732456361; c=relaxed/simple;
	bh=WUxXE+l/1K030nx8u5auADTyi2FyC4GsdnlWRRxCj/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=neVbbq7BhHKOKmsGDVL5R1pTo0KwJF94EDYxg1f8c1VqhaYrC2PtQ/skMS49Myof7NAnZtJPPuaO9u+MP5B46/ABPMO4fV7lTKhSjLLF4oZkQpFNiWZ1G923U6xl193HZwRLjr81WvVv38ecrGXISU/uhy6ldtOqUH9hWPfAWLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3JJaBSW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E487AC4CED1;
	Sun, 24 Nov 2024 13:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732456361;
	bh=WUxXE+l/1K030nx8u5auADTyi2FyC4GsdnlWRRxCj/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m3JJaBSW2+I+3Qd3eGhubN2vBrKWkJwlAQ1iIkvVZMcRUd6xVie0K1QqwJG8yL6Iv
	 gUllUzarUTHPN7QQsBiuTKFhics+iHbspInRU7bISEDAIYjh2DlATpxq+A7yS++fTU
	 FiUsbHZ8AY8utsgjNRsOBsPA7lqdPqzYPWj3O5hbUNOfhkNwok0RMJqNXq5S+5OibZ
	 VlZ6dVU3P7yBlXLUxqZ6Ljfr121jaFcgS80NbZlbod0M38ZOq8FTkwL9DTohuZWePs
	 OGihtDDJqnp3b/UEEFqnwDlL/xG1kfG7dlP+swe/Mv5yWMZkkKkZU5oVdZUg1G4zL+
	 uqvfomB4kNGpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ignat Korchagin <ignat@cloudflare.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	marcel@holtmann.org,
	johan.hedberg@gmail.com,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 11/36] Bluetooth: L2CAP: do not leave dangling sk pointer on error in l2cap_sock_create()
Date: Sun, 24 Nov 2024 08:51:25 -0500
Message-ID: <20241124135219.3349183-11-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124135219.3349183-1-sashal@kernel.org>
References: <20241124135219.3349183-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.173
Content-Transfer-Encoding: 8bit

From: Ignat Korchagin <ignat@cloudflare.com>

[ Upstream commit 7c4f78cdb8e7501e9f92d291a7d956591bf73be9 ]

bt_sock_alloc() allocates the sk object and attaches it to the provided
sock object. On error l2cap_sock_alloc() frees the sk object, but the
dangling pointer is still attached to the sock object, which may create
use-after-free in other code.

Signed-off-by: Ignat Korchagin <ignat@cloudflare.com>
Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>
Reviewed-by: Eric Dumazet <edumazet@google.com>
Link: https://patch.msgid.link/20241014153808.51894-3-ignat@cloudflare.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/bluetooth/l2cap_sock.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
index 3a2be1b4a5743..57035e46f7151 100644
--- a/net/bluetooth/l2cap_sock.c
+++ b/net/bluetooth/l2cap_sock.c
@@ -1876,6 +1876,7 @@ static struct sock *l2cap_sock_alloc(struct net *net, struct socket *sock,
 	chan = l2cap_chan_create();
 	if (!chan) {
 		sk_free(sk);
+		sock->sk = NULL;
 		return NULL;
 	}
 
-- 
2.43.0


