Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1569E1A39A1
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Apr 2020 20:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgDISL7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Apr 2020 14:11:59 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:47001 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDISL7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Apr 2020 14:11:59 -0400
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id A2CAECECFE;
        Thu,  9 Apr 2020 20:21:33 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] device: Add device type property
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200401221320.12105-1-sonnysasaka@chromium.org>
Date:   Thu, 9 Apr 2020 20:11:58 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        Eric Caruso <ejcaruso@chromium.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <6A574E50-BBF3-4967-9C93-6F4B6DAFB47D@holtmann.org>
References: <20200401221320.12105-1-sonnysasaka@chromium.org>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> This allows us to gather information about whether a device
> supports BR/EDR, BLE, or both. It appears as DBus Property
> "Type" on the org.bluez.Device1 interface.
> ---
> doc/device-api.txt |  5 +++++
> src/device.c       | 31 +++++++++++++++++++++++++++++++
> 2 files changed, 36 insertions(+)

my preference is not to combine API documentation patches with code.

> 
> diff --git a/doc/device-api.txt b/doc/device-api.txt
> index 65d8fee37..ceb68d2f6 100644
> --- a/doc/device-api.txt
> +++ b/doc/device-api.txt
> @@ -158,6 +158,11 @@ Properties	string Address [readonly]
> 
> 			The Bluetooth class of device of the remote device.
> 
> +		string Type [readonly, optional]
> +
> +			The carriers supported by this remote device. If it
> +			exists, it can be one of "BR/EDR", "LE", or "DUAL".
> +

So all values need to be lower case. That is just how we design all API.

If we do this, then I think the name “Bearer” might be better. Also it might be better as array{string} actually.

Regards

Marcel

