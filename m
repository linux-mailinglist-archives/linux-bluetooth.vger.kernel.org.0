Return-Path: <linux-bluetooth+bounces-436-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C55788089E6
	for <lists+linux-bluetooth@lfdr.de>; Thu,  7 Dec 2023 15:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E97E1F2131D
	for <lists+linux-bluetooth@lfdr.de>; Thu,  7 Dec 2023 14:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF0241769;
	Thu,  7 Dec 2023 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fnZ4NFJ9"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883FE10F6
	for <linux-bluetooth@vger.kernel.org>; Thu,  7 Dec 2023 06:09:57 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-db548da6e3bso1838467276.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 07 Dec 2023 06:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701958197; x=1702562997; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5qgF3sSIvHz1zfLicY+6TVgFqCZEC8QJz84mVPu4JT0=;
        b=fnZ4NFJ9NmR/qCxRU79NGewBCmU7WI2JOWueNsfu/tGjssI98afaJBefSldy5rTbjA
         I6dt3qLGEfi5JZJOHJvNhdjzYesH1X9AZqJ833az11x/7zhV0vVMFKu6TYogMeM50u9g
         MdWDBLOkD58SigGjVLyno5hvFxq3wLLFOTf4O9CYd1WcqVwhYJvSvtZiDg3obQGjm7Pk
         MzitHMFWByZOQNz7S278KiKOjmImUw+AmwYEeUd71kSNvnGLWTJBkXveNZRbeflhp17e
         3QjW0g3dxQY905+3Ke3tC4qsoSHDQKPmUVSqSsY8WumxOzMxvT1OOgFbv/kxAI/QX6sm
         /AHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701958197; x=1702562997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qgF3sSIvHz1zfLicY+6TVgFqCZEC8QJz84mVPu4JT0=;
        b=oO/8BvAfXwzvswdyJfed2hiArcAWU3+JM/DT3R4xOtYsxsclLj/JQwG/SZFdfFZ3U+
         1j7eYsjCMtEIA66yqDQ/BxI324Qt9/1TzARmapwtWv1Zz663C9K0Q/rh26mFS+y4nAxp
         LGn/9aIaUVOG/5xfVoDDCX2Uc/lwR8Uzhy1oS0sM/IV2bDtKzMSjVh7BSPdeK7LF7gOU
         zNP/oFC+oQcgZY7KTObPK+IfkBn+7n30TGelCkmB8gVxcbZ5J9gy9jQRzE8d+MI/RrWk
         IuIcy0zcCtzVJpoWvmxlbn7eOsxA7g4qSjf1YhIp1wB9UmsJyqO9HhRDbVj0/rgDzL2o
         yKjg==
X-Gm-Message-State: AOJu0YyMnSCL1hIK6zNX9mO6uT7A5GIrLfJ2V6ZmuFpobpv+g8grEW2J
	Dnew6/zL2C8NnJ+gUiKVqrfYDvkGhN4ecl1UcrDEfg==
X-Google-Smtp-Source: AGHT+IHVRH9O+e/jlUGrQAx9xh4VLn2kxitHRh22/vDYDil0LX+cgDdw2m9RceCZ/RhFJs4fR36Mbayjmu8hE8wtVMY=
X-Received: by 2002:a25:da49:0:b0:db4:5cdd:f6b4 with SMTP id
 n70-20020a25da49000000b00db45cddf6b4mr3336991ybf.14.1701958196710; Thu, 07
 Dec 2023 06:09:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231206073712.17776-1-jirislaby@kernel.org> <20231206073712.17776-5-jirislaby@kernel.org>
In-Reply-To: <20231206073712.17776-5-jirislaby@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 7 Dec 2023 15:09:21 +0100
Message-ID: <CAPDyKFo=X+ESxuYov1TDvLEWk1XCSU2o98=+5Y8LvHWr2nKF6Q@mail.gmail.com>
Subject: Re: [PATCH 04/27] tty: make tty_operations::send_xchar accept u8 char
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-serial@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, netdev@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Dec 2023 at 08:37, Jiri Slaby (SUSE) <jirislaby@kernel.org> wrote:
>
> tty_operations::send_xchar is one of the last users of 'char' type for
> characters in the tty layer. Convert it to u8 now.
>
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Karsten Keil <isdn@linux-pingi.de>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Marcel Holtmann <marcel@holtmann.org>
> Cc: Johan Hedberg <johan.hedberg@gmail.com>
> Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
> Cc: netdev@vger.kernel.org
> Cc: linux-mmc@vger.kernel.org
> Cc: linux-bluetooth@vger.kernel.org

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC

Kind regards
Uffe

> ---
>  drivers/isdn/capi/capi.c         | 4 ++--
>  drivers/mmc/core/sdio_uart.c     | 2 +-
>  drivers/tty/amiserial.c          | 2 +-
>  drivers/tty/serial/serial_core.c | 2 +-
>  drivers/tty/tty_io.c             | 2 +-
>  include/linux/tty.h              | 2 +-
>  include/linux/tty_driver.h       | 4 ++--
>  net/bluetooth/rfcomm/tty.c       | 2 +-
>  8 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/isdn/capi/capi.c b/drivers/isdn/capi/capi.c
> index 2f3789515445..6e80d7bd3c4d 100644
> --- a/drivers/isdn/capi/capi.c
> +++ b/drivers/isdn/capi/capi.c
> @@ -1231,9 +1231,9 @@ static void capinc_tty_hangup(struct tty_struct *tty)
>         tty_port_hangup(&mp->port);
>  }
>
> -static void capinc_tty_send_xchar(struct tty_struct *tty, char ch)
> +static void capinc_tty_send_xchar(struct tty_struct *tty, u8 ch)
>  {
> -       pr_debug("capinc_tty_send_xchar(%d)\n", ch);
> +       pr_debug("capinc_tty_send_xchar(%u)\n", ch);
>  }
>
>  static const struct tty_operations capinc_ops = {
> diff --git a/drivers/mmc/core/sdio_uart.c b/drivers/mmc/core/sdio_uart.c
> index a05322f15771..370fadf1d6d1 100644
> --- a/drivers/mmc/core/sdio_uart.c
> +++ b/drivers/mmc/core/sdio_uart.c
> @@ -792,7 +792,7 @@ static unsigned int sdio_uart_chars_in_buffer(struct tty_struct *tty)
>         return kfifo_len(&port->xmit_fifo);
>  }
>
> -static void sdio_uart_send_xchar(struct tty_struct *tty, char ch)
> +static void sdio_uart_send_xchar(struct tty_struct *tty, u8 ch)
>  {
>         struct sdio_uart_port *port = tty->driver_data;
>
> diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
> index a80f059f77bf..a30dc054ffbf 100644
> --- a/drivers/tty/amiserial.c
> +++ b/drivers/tty/amiserial.c
> @@ -811,7 +811,7 @@ static void rs_flush_buffer(struct tty_struct *tty)
>   * This function is used to send a high-priority XON/XOFF character to
>   * the device
>   */
> -static void rs_send_xchar(struct tty_struct *tty, char ch)
> +static void rs_send_xchar(struct tty_struct *tty, u8 ch)
>  {
>         struct serial_state *info = tty->driver_data;
>          unsigned long flags;
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 0393853b9947..80085b151b34 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -687,7 +687,7 @@ EXPORT_SYMBOL_GPL(uart_xchar_out);
>   * This function is used to send a high-priority XON/XOFF character to
>   * the device
>   */
> -static void uart_send_xchar(struct tty_struct *tty, char ch)
> +static void uart_send_xchar(struct tty_struct *tty, u8 ch)
>  {
>         struct uart_state *state = tty->driver_data;
>         struct uart_port *port;
> diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
> index 005d91c63707..6a502110da61 100644
> --- a/drivers/tty/tty_io.c
> +++ b/drivers/tty/tty_io.c
> @@ -1149,7 +1149,7 @@ ssize_t redirected_tty_write(struct kiocb *iocb, struct iov_iter *iter)
>   *
>   * Locking: none for xchar method, write ordering for write method.
>   */
> -int tty_send_xchar(struct tty_struct *tty, char ch)
> +int tty_send_xchar(struct tty_struct *tty, u8 ch)
>  {
>         bool was_stopped = tty->flow.stopped;
>
> diff --git a/include/linux/tty.h b/include/linux/tty.h
> index e96c85f4f91e..d3bedcc08738 100644
> --- a/include/linux/tty.h
> +++ b/include/linux/tty.h
> @@ -410,7 +410,7 @@ void tty_wait_until_sent(struct tty_struct *tty, long timeout);
>  void stop_tty(struct tty_struct *tty);
>  void start_tty(struct tty_struct *tty);
>  void tty_write_message(struct tty_struct *tty, char *msg);
> -int tty_send_xchar(struct tty_struct *tty, char ch);
> +int tty_send_xchar(struct tty_struct *tty, u8 ch);
>  int tty_put_char(struct tty_struct *tty, unsigned char c);
>  unsigned int tty_chars_in_buffer(struct tty_struct *tty);
>  unsigned int tty_write_room(struct tty_struct *tty);
> diff --git a/include/linux/tty_driver.h b/include/linux/tty_driver.h
> index f428c1b784a2..7372124fbf90 100644
> --- a/include/linux/tty_driver.h
> +++ b/include/linux/tty_driver.h
> @@ -242,7 +242,7 @@ struct serial_struct;
>   *     Optional: If not provided, the device is assumed to have no FIFO.
>   *     Usually correct to invoke via tty_wait_until_sent(). May sleep.
>   *
> - * @send_xchar: ``void ()(struct tty_struct *tty, char ch)``
> + * @send_xchar: ``void ()(struct tty_struct *tty, u8 ch)``
>   *
>   *     This routine is used to send a high-priority XON/XOFF character (@ch)
>   *     to the @tty device.
> @@ -374,7 +374,7 @@ struct tty_operations {
>         void (*flush_buffer)(struct tty_struct *tty);
>         void (*set_ldisc)(struct tty_struct *tty);
>         void (*wait_until_sent)(struct tty_struct *tty, int timeout);
> -       void (*send_xchar)(struct tty_struct *tty, char ch);
> +       void (*send_xchar)(struct tty_struct *tty, u8 ch);
>         int (*tiocmget)(struct tty_struct *tty);
>         int (*tiocmset)(struct tty_struct *tty,
>                         unsigned int set, unsigned int clear);
> diff --git a/net/bluetooth/rfcomm/tty.c b/net/bluetooth/rfcomm/tty.c
> index 94ec913dfb76..69c75c041fe1 100644
> --- a/net/bluetooth/rfcomm/tty.c
> +++ b/net/bluetooth/rfcomm/tty.c
> @@ -1041,7 +1041,7 @@ static void rfcomm_tty_flush_buffer(struct tty_struct *tty)
>         tty_wakeup(tty);
>  }
>
> -static void rfcomm_tty_send_xchar(struct tty_struct *tty, char ch)
> +static void rfcomm_tty_send_xchar(struct tty_struct *tty, u8 ch)
>  {
>         BT_DBG("tty %p ch %c", tty, ch);
>  }
> --
> 2.43.0
>

