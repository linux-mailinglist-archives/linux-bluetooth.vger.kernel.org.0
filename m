Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D03A3302A3A
	for <lists+linux-bluetooth@lfdr.de>; Mon, 25 Jan 2021 19:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbhAYS2n (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 25 Jan 2021 13:28:43 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:48968 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbhAYS2C (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 25 Jan 2021 13:28:02 -0500
Received: from marcel-macbook.holtmann.net (p4ff9f11c.dip0.t-ipconnect.de [79.249.241.28])
        by mail.holtmann.org (Postfix) with ESMTPSA id C5ED8CECCB;
        Mon, 25 Jan 2021 19:34:44 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [RESEND 2/2] Bluetooth: L2CAP: Fix handling fragmented length
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210113232858.1181251-2-luiz.dentz@gmail.com>
Date:   Mon, 25 Jan 2021 19:27:19 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <8CF7147B-A1E4-439A-9F04-2C359C7EA2B1@holtmann.org>
References: <20210113232858.1181251-1-luiz.dentz@gmail.com>
 <20210113232858.1181251-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> Bluetooth Core Specification v5.2, Vol. 3, Part A, section 1.4, table
> 1.1:
> 
> 'Start Fragments always either begin with the first octet of the Basic
>  L2CAP header of a PDU or they have a length of zero (see [Vol 2] Part
>  B, Section 6.6.2).'
> 
> Apparently this was changed by the following errata:
> 
> https://www.bluetooth.org/tse/errata_view.cfm?errata_id=10216
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/l2cap.h |   1 +
> net/bluetooth/l2cap_core.c    | 118 +++++++++++++++++++++++++++-------
> 2 files changed, 94 insertions(+), 25 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

