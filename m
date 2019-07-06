Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5630C61035
	for <lists+linux-bluetooth@lfdr.de>; Sat,  6 Jul 2019 13:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfGFLBj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 6 Jul 2019 07:01:39 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:42138 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfGFLBj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 6 Jul 2019 07:01:39 -0400
Received: from [192.168.0.113] (CMPC-089-239-107-172.CNet.Gawex.PL [89.239.107.172])
        by mail.holtmann.org (Postfix) with ESMTPSA id DA9BFCEFAE;
        Sat,  6 Jul 2019 13:10:09 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] Bluetooth:: btrtl: Add support for RTL8723DU
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20190529181234.12744-1-Larry.Finger@lwfinger.net>
Date:   Sat, 6 Jul 2019 13:01:37 +0200
Cc:     "Gustavo F. Padovan" <gustavo@padovan.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <D352CD85-84BE-4B4C-A051-F9C9FA297907@holtmann.org>
References: <20190529181234.12744-1-Larry.Finger@lwfinger.net>
To:     Larry Finger <Larry.Finger@lwfinger.net>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Larry,

> This device is functionally equivalent to the BT part of the RTL8723DE,
> uses the same firmware, but the LMP subversion and HCI revision are unique.
> 
> Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
> ---
> drivers/bluetooth/btrtl.c | 8 ++++++++
> 1 file changed, 8 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

