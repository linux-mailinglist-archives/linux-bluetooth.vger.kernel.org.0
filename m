Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 470B7181BB5
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Mar 2020 15:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729798AbgCKOtp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Mar 2020 10:49:45 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:55747 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729100AbgCKOtp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Mar 2020 10:49:45 -0400
Received: from [172.20.10.2] (x59cc8a78.dyn.telefonica.de [89.204.138.120])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6762BCECDF;
        Wed, 11 Mar 2020 15:59:12 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v1] bluetooth: Enforce classic key size verification.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200310151100.134881-1-alainm@chromium.org>
Date:   Wed, 11 Mar 2020 15:49:42 +0100
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <4C7539C9-2AEB-4B1A-93CD-23B468C49B2F@holtmann.org>
References: <20200310151100.134881-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change introduces a new configuration to strictly enforce key size
> checks.  This ensures that systems are in a secured configuration by
> default while allowing for a compatible posture via a Kconfig option to
> support controllers who may not support the read encryption key size
> command.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> net/bluetooth/Kconfig     | 10 ++++++++++
> net/bluetooth/hci_core.c  | 10 ++++++++++
> net/bluetooth/hci_event.c |  5 +++++
> 3 files changed, 25 insertions(+)
> 
> diff --git a/net/bluetooth/Kconfig b/net/bluetooth/Kconfig
> index 165148c7c4ce..6a155b7b6fb2 100644
> --- a/net/bluetooth/Kconfig
> +++ b/net/bluetooth/Kconfig
> @@ -128,4 +128,14 @@ config BT_DEBUGFS
> 	  Provide extensive information about internal Bluetooth states
> 	  in debugfs.
> 
> +config BT_ENFORCE_CLASSIC_KEY_SIZES
> +	bool "Enforces security requirements for Bluetooth classic"
> +	depends on BT
> +	default y
> +	help
> +	  Enforces Bluetooth classic security requirements by disallowing use of
> +	  insecure Bluetooth chips, i.e. that doesn't support Read Encryption
> +	  Key Size command to prevent BT classic connection with very short
> +	  encryption key.
> +

I would drop the CLASSIC part here since it doesn’t really matter that we can enforce this in the host for LE. In general we require the hardware to give us all basics. So I would just do

	config BT_ENFORCE_ENC_KEY_SIZE

I addition, I think that I want to put this behind BT_EXPERT option and actually have this default to n. Distributions or products should be conscious about enabling this. Otherwise I am fine doing this.

> source "drivers/bluetooth/Kconfig"
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 4e6d61a95b20..142130d4b66b 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -1540,6 +1540,16 @@ static int hci_dev_do_open(struct hci_dev *hdev)
> 
> 	clear_bit(HCI_INIT, &hdev->flags);
> 
> +#ifdef BT_ENFORCE_CLASSIC_KEY_SIZES
> +	/* Don't allow usage of Bluetooth if the chip doesn't support */
> +	/* Read Encryption Key Size command */
> +	if (!ret && !(hdev->commands[20] & 0x10)) {
> +		bt_dev_err(hdev,
> +			   "Disabling BT, Read Encryption Key Size !supported");
> +		ret = -EIO;
> +	}
> +#endif
> +

I do not need to check if this is best place. So actually I would like to keep the controller in unconfigured state if a command is missing. It would stay in unconfigured state forever since there is no way to undo it.

--- a/doc/mgmt-api.txt
+++ b/doc/mgmt-api.txt
@@ -2172,6 +2172,7 @@ Read Controller Configuration Information Command
 
                0       External configuration
                1       Bluetooth public address configuration
+               2       Encryption Key Size enforcement
 
        It is valid to call this command on controllers that do not
        require any configuration. It is possible that a fully configured

So if the Read Encryption Key Size command is supported, I would like to set the Supported_Options bit. And the Missing_Options bit would be set depending on this new Kconfig option.

The real advantage with doing it like this is that when a controller is unconfigured, it is easy to detect and can be skipped for systems that have multiple controllers attached.

One fun part of course is that you could disable BR/EDR and enable LE and this option could become allowed again. I would have to check if we can do that with existing mgmt commands and it would flip the Missing_Options bit.

> 	if (!ret) {
> 		hci_dev_hold(hdev);
> 		hci_dev_set_flag(hdev, HCI_RPA_EXPIRED);
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index a40ed31f6eb8..6605da7ec72e 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -2902,7 +2902,12 @@ static void read_enc_key_size_complete(struct hci_dev *hdev, u8 status,
> 	if (rp->status) {
> 		bt_dev_err(hdev, "failed to read key size for handle %u",
> 			   handle);
> +#ifdef BT_ENFORCE_CLASSIC_KEY_SIZES
> +		hci_disconnect(conn, HCI_ERROR_REMOTE_USER_TERM);
> +		hci_conn_drop(conn);
> +#else
> 		conn->enc_key_size = HCI_LINK_KEY_SIZE;
> +#endif

> 	} else {
> 		conn->enc_key_size = rp->key_size;
> 	}

This change is not needed at all if you can not bring up a controller that missing the command.

Regards

Marcel

