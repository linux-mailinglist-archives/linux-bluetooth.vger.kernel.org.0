Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6096115F413
	for <lists+linux-bluetooth@lfdr.de>; Fri, 14 Feb 2020 19:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730407AbgBNSSO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 14 Feb 2020 13:18:14 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:57345 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730403AbgBNSSJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 14 Feb 2020 13:18:09 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 64667CECEA;
        Fri, 14 Feb 2020 19:27:31 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v4] Bluetooth: Add BT_PHY socket option
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200214180857.7279-1-luiz.dentz@gmail.com>
Date:   Fri, 14 Feb 2020 19:18:07 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <CBACEED8-EE66-4173-98D9-9DB96E58B982@holtmann.org>
References: <20200214180857.7279-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This adds BT_PHY socket option (read-only) which can be used to read
> the PHYs in use by the underline connection.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/bluetooth.h |  17 +++++
> include/net/bluetooth/hci_core.h  |   2 +
> net/bluetooth/hci_conn.c          | 107 ++++++++++++++++++++++++++++++
> net/bluetooth/l2cap_sock.c        |  13 ++++
> net/bluetooth/sco.c               |  13 ++++
> 5 files changed, 152 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

