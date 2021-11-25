Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A70445E152
	for <lists+linux-bluetooth@lfdr.de>; Thu, 25 Nov 2021 21:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356917AbhKYULf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 25 Nov 2021 15:11:35 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:54555 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350870AbhKYUJ1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 25 Nov 2021 15:09:27 -0500
Received: from smtpclient.apple (p5b3d2e91.dip0.t-ipconnect.de [91.61.46.145])
        by mail.holtmann.org (Postfix) with ESMTPSA id A8F59CECC5;
        Thu, 25 Nov 2021 21:06:14 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.20.0.1.32\))
Subject: Re: [PATCH v2 1/2] Bluetooth: HCI: Fix definition of
 hci_rp_read_stored_link_key
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20211125001613.3274241-1-luiz.dentz@gmail.com>
Date:   Thu, 25 Nov 2021 21:06:14 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <FA8A3A60-B9B2-4B1B-BA14-6FDB138F08DC@holtmann.org>
References: <20211125001613.3274241-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> Both max_num_keys and num_key are 2 octects:
> 
> BLUETOOTH CORE SPECIFICATION Version 5.3 | Vol 4, Part E
> page 1985:
> 
>  Max_Num_Keys:
>  Size: 2 octets
>  Range: 0x0000 to 0xFFFF
> 
>  Num_Keys_Read:
>  Size: 2 octets
>  Range: 0x0000 to 0xFFFF
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> v2: Use __le16 instead of __u16 in hci_rp_read_stored_link_key and update
> fields in hci_dev to properly store 2 octects. Also add a patch for
> hci_rp_delete_stored_link_key since num_keys is also 2 octecs like
> hci_rp_read_stored_link_key.
> 
> include/net/bluetooth/hci.h      | 4 ++--
> include/net/bluetooth/hci_core.h | 4 ++--
> net/bluetooth/hci_event.c        | 4 ++--
> 3 files changed, 6 insertions(+), 6 deletions(-)

patch has been applied to bluetooth-next tree. However I had to fix some alignment issue.

Regards

Marcel

