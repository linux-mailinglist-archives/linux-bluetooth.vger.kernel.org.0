Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB38032687B
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Feb 2021 21:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhBZUT4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 26 Feb 2021 15:19:56 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:43418 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbhBZUSD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 26 Feb 2021 15:18:03 -0500
Received: from marcel-macbook.holtmann.net (p4ff9fb90.dip0.t-ipconnect.de [79.249.251.144])
        by mail.holtmann.org (Postfix) with ESMTPSA id CE57FCEC82;
        Fri, 26 Feb 2021 21:24:52 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] Bluetooth: Fix for L2CAP/LE/CFC/BV-15-C
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210222103021.20923-1-magdalena.kasenberg@codecoup.pl>
Date:   Fri, 26 Feb 2021 21:17:19 +0100
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Szymon Janc <szymon.janc@codecoup.pl>
Content-Transfer-Encoding: 8BIT
Message-Id: <124AEB1E-158A-4CFB-BD5D-2DCA4C86ECD2@holtmann.org>
References: <20210222103021.20923-1-magdalena.kasenberg@codecoup.pl>
To:     Magdalena Kasenberg <magdalena.kasenberg@codecoup.pl>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Magdalena,

> This is required for the qualification test L2CAP/LE/CFC/BV-15-C
> 
> Implementation does not allow to set different key size for SMP and
> L2CAP, which is needed for a current specification of the test. This fix
> workarounds it with the debugfs variable le_l2cap_min_key_size.
> 
> Logs from the test when the IUT uses a min and max l2cap encryption key size 16.
> $ echo 16 > /sys/kernel/debug/bluetooth/hci0/le_l2cap_min_key_size
> The lower tester uses a key size 7.
> 
>> ACL Data RX: Handle 99 flags 0x02 dlen 11                #34 [hci0] 25.007392
>      SMP: Pairing Request (0x01) len 6
>        IO capability: DisplayYesNo (0x01)
>        OOB data: Authentication data not present (0x00)
>        Authentication requirement: Bonding, No MITM, SC, No Keypresses (0x09)
>        Max encryption key size: 7
>        Initiator key distribution: <none> (0x00)
>        Responder key distribution: <none> (0x00)
> < ACL Data TX: Handle 99 flags 0x00 dlen 11                #35 [hci0] 25.007591
>      SMP: Pairing Response (0x02) len 6
>        IO capability: KeyboardDisplay (0x04)
>        OOB data: Authentication data not present (0x00)
>        Authentication requirement: Bonding, No MITM, SC, No Keypresses (0x09)
>        Max encryption key size: 16
>        Initiator key distribution: <none> (0x00)
>        Responder key distribution: <none> (0x00)
> @ MGMT Event: New Long Term Key (0x000a) plen 37      {0x0001} [hci0] 28.788872
>        Store hint: Yes (0x01)
>        LE Address: C0:DE:C0:FF:FF:01 (OUI C0-DE-C0)
>        Key type: Unauthenticated key from P-256 (0x02)
>        Master: 0x00
>        Encryption size: 7
>        Diversifier: 0000
>        Randomizer: 0000000000000000
>        Key: 529e11e8c7b9f5000000000000000000
> 
> <snip>
> 
> After pairing with key size 7, L2CAP connection is requested which
> requires key size 16.
> 
>> ACL Data RX: Handle 99 flags 0x02 dlen 18                #56 [hci0] 34.998084
>      LE L2CAP: LE Connection Request (0x14) ident 3 len 10
>        PSM: 244 (0x00f4)
>        Source CID: 64
>        MTU: 256
>        MPS: 284
>        Credits: 1
> < ACL Data TX: Handle 99 flags 0x00 dlen 18                #57 [hci0] 34.998325
>      LE L2CAP: LE Connection Response (0x15) ident 3 len 10
>        Destination CID: 0
>        MTU: 0
>        MPS: 0
>        Credits: 0
>        Result: Connection refused - insufficient encryption key size (0x0007)
> 
> Signed-off-by: Magdalena Kasenberg <magdalena.kasenberg@codecoup.pl>
> Reviewed-by: Szymon Janc <szymon.janc@codecoup.pl>
> Cc: Szymon Janc <szymon.janc@codecoup.pl>
> ---
> include/net/bluetooth/hci_core.h |  1 +
> net/bluetooth/hci_core.c         |  1 +
> net/bluetooth/hci_debugfs.c      | 30 ++++++++++++++++++++++++++++++
> net/bluetooth/l2cap_core.c       | 25 +++++++++++++++++++++++++
> 4 files changed, 57 insertions(+)
> 
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
> index ebdd4afe30d2..0bf0543efec5 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -379,6 +379,7 @@ struct hci_dev {
> 	__u16		auth_payload_timeout;
> 	__u8		min_enc_key_size;
> 	__u8		max_enc_key_size;
> +	__u8		le_l2cap_min_key_size;
> 	__u8		pairing_opts;
> 	__u8		ssp_debug_mode;
> 	__u8		hw_error_code;
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index b0d9c36acc03..9ef4b39b380c 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -3788,6 +3788,7 @@ struct hci_dev *hci_alloc_dev(void)
> 	hdev->conn_info_max_age = DEFAULT_CONN_INFO_MAX_AGE;
> 	hdev->auth_payload_timeout = DEFAULT_AUTH_PAYLOAD_TIMEOUT;
> 	hdev->min_enc_key_size = HCI_MIN_ENC_KEY_SIZE;
> +	hdev->le_l2cap_min_key_size = HCI_MIN_ENC_KEY_SIZE;

so I am not a fan of doing this with another variable and managing through debugfs. Can we pass the qualification test case by using BT_SECURITY_FIPS (which will enforce 128-bit key size)?

If not then we might want to add a socket option to set min/max encryption key size requirement on a per socket basis.

Regards

Marcel

