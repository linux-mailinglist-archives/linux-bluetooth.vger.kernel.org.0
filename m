Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27B141B4BD7
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Apr 2020 19:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbgDVRgF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Apr 2020 13:36:05 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:34739 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726006AbgDVRgF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Apr 2020 13:36:05 -0400
Received: from [192.168.1.91] (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id DFB79CECFD;
        Wed, 22 Apr 2020 19:45:41 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 2/3] bluetooth:allow scatternet connections if
 supported.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200421155954.137391-3-alainm@chromium.org>
Date:   Wed, 22 Apr 2020 19:36:03 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <4FD88B61-D457-467F-975D-84C7202271D6@holtmann.org>
References: <20200421155954.137391-1-alainm@chromium.org>
 <20200421155954.137391-3-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change allows scatternet connections to be created if the
> controller reports support and the HCI_QUIRK_VALID_LE_STATES indicates
> that the reported LE states can be trusted.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> net/bluetooth/hci_event.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 0a591be8b0ae..34cd98a1d370 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -5245,7 +5245,9 @@ static struct hci_conn *check_pending_le_conn(struct hci_dev *hdev,
> 	/* Most controller will fail if we try to create new connections
> 	 * while we have an existing one in slave role.
> 	 */
> -	if (hdev->conn_hash.le_num_slave > 0)
> +	if (hdev->conn_hash.le_num_slave > 0 &&
> +	    (hdev->quirks & HCI_QUIRK_VALID_LE_STATES) == 0 ||

please use test_bit() here.

> +	     !(hdev->le_states[3] & 0x10))
> 		return NULL;

Regards

Marcel

