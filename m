Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7EA3D260D
	for <lists+linux-bluetooth@lfdr.de>; Thu, 22 Jul 2021 16:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232400AbhGVOEd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 22 Jul 2021 10:04:33 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:40691 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbhGVOEc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 22 Jul 2021 10:04:32 -0400
Received: from smtpclient.apple (p5b3d2eb8.dip0.t-ipconnect.de [91.61.46.184])
        by mail.holtmann.org (Postfix) with ESMTPSA id 4C575CECE2;
        Thu, 22 Jul 2021 16:45:06 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH BlueZ 2/8] doc/mgmt-api: Add support for LE PHY Update
 Complete event
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210722054951.8291-3-ayush.garg@samsung.com>
Date:   Thu, 22 Jul 2021 16:45:05 +0200
Cc:     linux-bluetooth@vger.kernel.org, anupam.r@samsung.com,
        nitin.j@samsung.com
Content-Transfer-Encoding: 8BIT
Message-Id: <63C31A82-0E58-47DA-8F3D-9B1C484E5095@holtmann.org>
References: <20210722054951.8291-1-ayush.garg@samsung.com>
 <CGME20210722055010epcas5p45a16ff704c37d108a9df0d6c0a1942a8@epcas5p4.samsung.com>
 <20210722054951.8291-3-ayush.garg@samsung.com>
To:     Ayush Garg <ayush.garg@samsung.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Ayush,

> Reviewed-by: Anupam Roy <anupam.r@samsung.com>
> ---
> doc/mgmt-api.txt | 29 +++++++++++++++++++++++++++++
> 1 file changed, 29 insertions(+)
> 
> diff --git a/doc/mgmt-api.txt b/doc/mgmt-api.txt
> index 5355fedb0..f7379fcd9 100644
> --- a/doc/mgmt-api.txt
> +++ b/doc/mgmt-api.txt
> @@ -4910,3 +4910,32 @@ Controller Resume Event
> 	Address_Type. Otherwise, Address and Address_Type will both be zero.
> 
> 	This event will be sent to all management sockets.
> +
> +
> +LE PHY Update Complete Event
> +===============================
> +
> +	Event Code:		0x002f
> +	Controller Index:	<controller id>
> +	Event Parameters:	Address (6 Octets)
> +				Address_Type (1 Octet)
> +				Status (1 Octet)
> +				PHYs (4 Octets)
> +
> +	This event indicates that LE PHYs have been changed for this
> +	connected device.
> +
> +	The PHYs parameters are a bitmask with currently the
> +	following available bits:
> +
> +		9	LE 1M TX
> +		10	LE 1M RX
> +		11	LE 2M TX
> +		12	LE 2M RX
> +		13	LE Coded TX
> +		14	LE Coded RX
> +
> +	This event will be used in case of autonomous PHY update made
> +	by the controller or HCI_LE_SET_PHY command succeeded.
> +
> +	This event will be sent to all management sockets.

As mentioned in the code review, I don’t like doing it this way.

Regards

Marcel

