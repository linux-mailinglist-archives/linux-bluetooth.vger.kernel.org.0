Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D1A71D09FF
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 May 2020 09:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729298AbgEMHfY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 13 May 2020 03:35:24 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:57871 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgEMHfY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 13 May 2020 03:35:24 -0400
Received: from [192.168.1.91] (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 19A53CED09;
        Wed, 13 May 2020 09:45:06 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH] Bluetooth: Handle Inquiry Cancel error after Inquiry
 Complete
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200506195503.5837-1-sonnysasaka@chromium.org>
Date:   Wed, 13 May 2020 09:34:53 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <933B812E-E805-4D2A-A758-D09235BB4030@holtmann.org>
References: <89566A98-F0CE-4E70-A344-915E81FB0C14@holtmann.org>
 <20200506195503.5837-1-sonnysasaka@chromium.org>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> After sending Inquiry Cancel command to the controller, it is possible
> that Inquiry Complete event comes before Inquiry Cancel command complete
> event. In this case the Inquiry Cancel command will have status of
> Command Disallowed since there is no Inquiry session to be cancelled.
> This case should not be treated as error, otherwise we can reach an
> inconsistent state.
> 
> Example of a btmon trace when this happened:
> 
> < HCI Command: Inquiry Cancel (0x01|0x0002) plen 0
>> HCI Event: Inquiry Complete (0x01) plen 1
>        Status: Success (0x00)
>> HCI Event: Command Complete (0x0e) plen 4
>      Inquiry Cancel (0x01|0x0002) ncmd 1
>        Status: Command Disallowed (0x0c)
> ---
> net/bluetooth/hci_event.c | 20 ++++++++++++++++++--
> 1 file changed, 18 insertions(+), 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

