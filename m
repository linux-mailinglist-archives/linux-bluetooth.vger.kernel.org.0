Return-Path: <linux-bluetooth+bounces-411-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA017806892
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Dec 2023 08:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 067071C20AA2
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Dec 2023 07:37:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4F6179B7;
	Wed,  6 Dec 2023 07:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRlvlu/l"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE7110A25;
	Wed,  6 Dec 2023 07:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAC18C433C7;
	Wed,  6 Dec 2023 07:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701848249;
	bh=YBWUFqOAhQYvAfOCxrjSoMu61oZulwiM8oxn+ueFF5E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eRlvlu/lJ4h/JFsaezO85sUEgvb7C+8piV61wdrD5QvERroxh3GYgVDDrvE8kOgxr
	 BmhFaeDd5Xeni1GvMhA/yjqYbWtjNmYo4CkffRYRL/W9fQrRo4BzJJcPc4oIOQ5W/6
	 frO8Iiv+js1PGz1ermFXBGZ+tC0rQ0W77OFDbamQycRCO5Vn3UuZ8X8nLv3ZYIyR3k
	 wFqJ9ClH9IwPCft7PGEpDPuEqrOCkPWhubLeiLkoYLacjijazfboPzGZaxXLNqUvjy
	 6FrFKxhfqQYv7voDp0miMVB+Yg80NlG0q8d+3+VbmyhjGhfdQcGkwpKLOJ0wCn7QAs
	 b9vQVkyeAXICw==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Karsten Keil <isdn@linux-pingi.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	netdev@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH 04/27] tty: make tty_operations::send_xchar accept u8 char
Date: Wed,  6 Dec 2023 08:36:49 +0100
Message-ID: <20231206073712.17776-5-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206073712.17776-1-jirislaby@kernel.org>
References: <20231206073712.17776-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tty_operations::send_xchar is one of the last users of 'char' type for
characters in the tty layer. Convert it to u8 now.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Karsten Keil <isdn@linux-pingi.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org
---
 drivers/isdn/capi/capi.c         | 4 ++--
 drivers/mmc/core/sdio_uart.c     | 2 +-
 drivers/tty/amiserial.c          | 2 +-
 drivers/tty/serial/serial_core.c | 2 +-
 drivers/tty/tty_io.c             | 2 +-
 include/linux/tty.h              | 2 +-
 include/linux/tty_driver.h       | 4 ++--
 net/bluetooth/rfcomm/tty.c       | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/isdn/capi/capi.c b/drivers/isdn/capi/capi.c
index 2f3789515445..6e80d7bd3c4d 100644
--- a/drivers/isdn/capi/capi.c
+++ b/drivers/isdn/capi/capi.c
@@ -1231,9 +1231,9 @@ static void capinc_tty_hangup(struct tty_struct *tty)
 	tty_port_hangup(&mp->port);
 }
 
-static void capinc_tty_send_xchar(struct tty_struct *tty, char ch)
+static void capinc_tty_send_xchar(struct tty_struct *tty, u8 ch)
 {
-	pr_debug("capinc_tty_send_xchar(%d)\n", ch);
+	pr_debug("capinc_tty_send_xchar(%u)\n", ch);
 }
 
 static const struct tty_operations capinc_ops = {
diff --git a/drivers/mmc/core/sdio_uart.c b/drivers/mmc/core/sdio_uart.c
index a05322f15771..370fadf1d6d1 100644
--- a/drivers/mmc/core/sdio_uart.c
+++ b/drivers/mmc/core/sdio_uart.c
@@ -792,7 +792,7 @@ static unsigned int sdio_uart_chars_in_buffer(struct tty_struct *tty)
 	return kfifo_len(&port->xmit_fifo);
 }
 
-static void sdio_uart_send_xchar(struct tty_struct *tty, char ch)
+static void sdio_uart_send_xchar(struct tty_struct *tty, u8 ch)
 {
 	struct sdio_uart_port *port = tty->driver_data;
 
diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
index a80f059f77bf..a30dc054ffbf 100644
--- a/drivers/tty/amiserial.c
+++ b/drivers/tty/amiserial.c
@@ -811,7 +811,7 @@ static void rs_flush_buffer(struct tty_struct *tty)
  * This function is used to send a high-priority XON/XOFF character to
  * the device
  */
-static void rs_send_xchar(struct tty_struct *tty, char ch)
+static void rs_send_xchar(struct tty_struct *tty, u8 ch)
 {
 	struct serial_state *info = tty->driver_data;
         unsigned long flags;
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 0393853b9947..80085b151b34 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -687,7 +687,7 @@ EXPORT_SYMBOL_GPL(uart_xchar_out);
  * This function is used to send a high-priority XON/XOFF character to
  * the device
  */
-static void uart_send_xchar(struct tty_struct *tty, char ch)
+static void uart_send_xchar(struct tty_struct *tty, u8 ch)
 {
 	struct uart_state *state = tty->driver_data;
 	struct uart_port *port;
diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 005d91c63707..6a502110da61 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -1149,7 +1149,7 @@ ssize_t redirected_tty_write(struct kiocb *iocb, struct iov_iter *iter)
  *
  * Locking: none for xchar method, write ordering for write method.
  */
-int tty_send_xchar(struct tty_struct *tty, char ch)
+int tty_send_xchar(struct tty_struct *tty, u8 ch)
 {
 	bool was_stopped = tty->flow.stopped;
 
diff --git a/include/linux/tty.h b/include/linux/tty.h
index e96c85f4f91e..d3bedcc08738 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -410,7 +410,7 @@ void tty_wait_until_sent(struct tty_struct *tty, long timeout);
 void stop_tty(struct tty_struct *tty);
 void start_tty(struct tty_struct *tty);
 void tty_write_message(struct tty_struct *tty, char *msg);
-int tty_send_xchar(struct tty_struct *tty, char ch);
+int tty_send_xchar(struct tty_struct *tty, u8 ch);
 int tty_put_char(struct tty_struct *tty, unsigned char c);
 unsigned int tty_chars_in_buffer(struct tty_struct *tty);
 unsigned int tty_write_room(struct tty_struct *tty);
diff --git a/include/linux/tty_driver.h b/include/linux/tty_driver.h
index f428c1b784a2..7372124fbf90 100644
--- a/include/linux/tty_driver.h
+++ b/include/linux/tty_driver.h
@@ -242,7 +242,7 @@ struct serial_struct;
  *	Optional: If not provided, the device is assumed to have no FIFO.
  *	Usually correct to invoke via tty_wait_until_sent(). May sleep.
  *
- * @send_xchar: ``void ()(struct tty_struct *tty, char ch)``
+ * @send_xchar: ``void ()(struct tty_struct *tty, u8 ch)``
  *
  *	This routine is used to send a high-priority XON/XOFF character (@ch)
  *	to the @tty device.
@@ -374,7 +374,7 @@ struct tty_operations {
 	void (*flush_buffer)(struct tty_struct *tty);
 	void (*set_ldisc)(struct tty_struct *tty);
 	void (*wait_until_sent)(struct tty_struct *tty, int timeout);
-	void (*send_xchar)(struct tty_struct *tty, char ch);
+	void (*send_xchar)(struct tty_struct *tty, u8 ch);
 	int (*tiocmget)(struct tty_struct *tty);
 	int (*tiocmset)(struct tty_struct *tty,
 			unsigned int set, unsigned int clear);
diff --git a/net/bluetooth/rfcomm/tty.c b/net/bluetooth/rfcomm/tty.c
index 94ec913dfb76..69c75c041fe1 100644
--- a/net/bluetooth/rfcomm/tty.c
+++ b/net/bluetooth/rfcomm/tty.c
@@ -1041,7 +1041,7 @@ static void rfcomm_tty_flush_buffer(struct tty_struct *tty)
 	tty_wakeup(tty);
 }
 
-static void rfcomm_tty_send_xchar(struct tty_struct *tty, char ch)
+static void rfcomm_tty_send_xchar(struct tty_struct *tty, u8 ch)
 {
 	BT_DBG("tty %p ch %c", tty, ch);
 }
-- 
2.43.0


