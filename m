Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65C4E3DF6E6
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Aug 2021 23:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbhHCVcX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 3 Aug 2021 17:32:23 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58936 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbhHCVcW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 3 Aug 2021 17:32:22 -0400
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
        by mail.holtmann.org (Postfix) with ESMTPSA id D1D9BCED2F;
        Tue,  3 Aug 2021 23:32:09 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [RESEND 1/2] Bluetooth: HCI: Add proper tracking for enable
 status of adv instances
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210802235619.238065-1-luiz.dentz@gmail.com>
Date:   Tue, 3 Aug 2021 23:32:09 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <147A8C71-BB78-4726-B22D-5EDFB72D14A9@holtmann.org>
References: <20210802235619.238065-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This adds a field to track if advertising instances are enabled or not
> and only clear HCI_LE_ADV flag if there is no instance left advertising.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/hci_core.h |  1 +
> net/bluetooth/hci_event.c        | 28 ++++++++++++++++++++++++++++
> 2 files changed, 29 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

