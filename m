Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF3335F141
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 Apr 2021 12:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348968AbhDNKJZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 14 Apr 2021 06:09:25 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:35062 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348873AbhDNKJS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 14 Apr 2021 06:09:18 -0400
Received: from mac-pro.holtmann.net (p4fefc77b.dip0.t-ipconnect.de [79.239.199.123])
        by mail.holtmann.org (Postfix) with ESMTPSA id CC796CECDF;
        Wed, 14 Apr 2021 12:16:17 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [BlueZ] monitor: Fix the incorrect vendor name
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210414043857.371176-1-hj.tedd.an@gmail.com>
Date:   Wed, 14 Apr 2021 12:08:32 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <6D9FBA0A-3058-4C96-8CFD-6BE5B585DE8E@holtmann.org>
References: <tedd.an@intel.com> <20210414043857.371176-1-hj.tedd.an@gmail.com>
To:     Tedd Ho-Jeong An <hj.tedd.an@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Tedd,

> This patch fixes the vendor name is alwasy shown as "Microsoft" even
> though a different vendor.
> 
> < HCI Command: Microsoft Secure Send (0x3f|0x0009) plen 249
>        Type: Data fragment (0x01)
>> HCI Event: Command Complete (0x0e) plen 4
>      Microsoft Secure Send (0x3f|0x0009) ncmd 31
>        Status: Success (0x00)
> ---
> monitor/packet.c | 12 +++---------
> 1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/monitor/packet.c b/monitor/packet.c
> index d729a01cc..91d2294ff 100644
> --- a/monitor/packet.c
> +++ b/monitor/packet.c
> @@ -9325,18 +9325,12 @@ static const char *get_supported_command(int bit)
> 
> static const char *current_vendor_str(void)
> {
> -	uint16_t manufacturer, msft_opcode;
> +	uint16_t manufacturer;
> 
> -	if (index_current < MAX_INDEX) {
> +	if (index_current < MAX_INDEX)
> 		manufacturer = index_list[index_current].manufacturer;
> -		msft_opcode = index_list[index_current].msft_opcode;
> -	} else {
> +	else
> 		manufacturer = fallback_manufacturer;
> -		msft_opcode = BT_HCI_CMD_NOP;
> -	}
> -
> -	if (msft_opcode != BT_HCI_CMD_NOP)
> -		return "Microsoft";

seems we have a bug here, but the fix can not be correct either. If we are running on Intel firmware and the Microsoft extension is used, it should show Microsoft and not Intel for the vendor commands.

Regards

Marcel

