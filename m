Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4A513761C2
	for <lists+linux-bluetooth@lfdr.de>; Fri,  7 May 2021 10:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236027AbhEGIUA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 7 May 2021 04:20:00 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:40260 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234484AbhEGIUA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 7 May 2021 04:20:00 -0400
Received: from smtpclient.apple (p4fefc624.dip0.t-ipconnect.de [79.239.198.36])
        by mail.holtmann.org (Postfix) with ESMTPSA id 07C9FCECDB;
        Fri,  7 May 2021 10:26:50 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: [Bluez PATCH v1] doc/mgmt-api - Add a new error code for HCI
 status 0x3e
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210429111523.Bluez.v1.1.Ic00ed950add081b346d6c8ced590bb7b2eb6e9f7@changeid>
Date:   Fri, 7 May 2021 10:18:58 +0200
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <44A0B714-12C5-4A43-9829-CAE3D8BF374B@holtmann.org>
References: <20210429111523.Bluez.v1.1.Ic00ed950add081b346d6c8ced590bb7b2eb6e9f7@changeid>
To:     Yu Liu <yudiliu@google.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Yu,

> We want to retry the pairing when HCI status 0x3e (Connection failed to
> established/Synchronization timeout) is returned from the controller.
> This is to add a new MGMT error code so that we can catch this 0x3e
> failure and issue a retry in the user space.
> 
> Reviewed-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
> 
> Changes in v1:
> - Initial change
> 
> doc/mgmt-api.txt | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/doc/mgmt-api.txt b/doc/mgmt-api.txt
> index 5355fedb0..f7cbf7ab2 100644
> --- a/doc/mgmt-api.txt
> +++ b/doc/mgmt-api.txt
> @@ -200,6 +200,7 @@ and Command Complete events:
> 0x12	RFKilled
> 0x13	Already Paired
> 0x14	Permission Denied
> +0x15	Connection Not Established
> 
> As a general rule all commands generate the events as specified below,
> however invalid lengths or unknown commands will always generate a
> @@ -1112,6 +1113,7 @@ Pair Device Command
> 				Not Powered
> 				Invalid Index
> 				Already Paired
> +				Connection Not Established

I really dislike the naming. And even more so, I request the motive here.

So looking at our code, we have 3 cases where we use the previous status:

	MGMT_STATUS_CONNECT_FAILED, /* Page Timeout */
	MGMT_STATUS_CONNECT_FAILED, /* Connection Establishment Failed */
	MGMT_STATUS_CONNECT_FAILED, /* MAC Connection Failed */

And they do map to the 3 available transports, either via BR/EDR or LE or AMP. That means if you call Pair Device you already know well today when it fails to establish the link and can retry it.

My question, what are you trying to fix here.

Regards

Marcel

