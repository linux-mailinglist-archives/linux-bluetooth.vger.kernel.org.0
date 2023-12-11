Return-Path: <linux-bluetooth+bounces-519-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BF680D23A
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Dec 2023 17:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4D3281963
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Dec 2023 16:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BC5321A3;
	Mon, 11 Dec 2023 16:40:33 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D76FD8;
	Mon, 11 Dec 2023 08:40:27 -0800 (PST)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 1DDDE2075D;
	Mon, 11 Dec 2023 17:40:25 +0100 (CET)
From: Francesco Dolcini <francesco@dolcini.it>
To: Sean Wang <sean.wang@mediatek.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Amitkumar Karwar <amitkumar.karwar@nxp.com>,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2 0/3] Bluetooth: fix recv_buf() return value
Date: Mon, 11 Dec 2023 17:40:17 +0100
Message-Id: <20231211164020.173253-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Serdev recv_buf() callback is supposed to return the amount of bytes consumed, therefore an int in between 0 and count.

Do not return negative number in case of issue, just print an error and return count. This fixes a WARN in ttyport_receive_buf().

In addition to that a small cleanup patch is added on btnxpuart to remove a useless assignment.

v2:
 - improved commit messages

Francesco Dolcini (3):
  Bluetooth: btnxpuart: fix recv_buf() return value
  Bluetooth: btmtkuart: fix recv_buf() return value
  Bluetooth: btnxpuart: remove useless assignment

 drivers/bluetooth/btmtkuart.c | 11 +++--------
 drivers/bluetooth/btnxpuart.c |  8 +++-----
 2 files changed, 6 insertions(+), 13 deletions(-)

-- 
2.25.1


