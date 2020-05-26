Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921841DB717
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 May 2020 16:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgETOb2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 20 May 2020 10:31:28 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:50744 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgETOb2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 20 May 2020 10:31:28 -0400
Received: from marcel-macbook.fritz.box (p4fefc5a7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id BA18DCED09;
        Wed, 20 May 2020 16:41:11 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 4/4] Bluetooth: Consolidate encryption handling in
 hci_encrypt_cfm
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200519202519.219335-4-luiz.dentz@gmail.com>
Date:   Wed, 20 May 2020 16:31:27 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <56E3599B-2B9B-479A-B2ED-832B2357158A@holtmann.org>
References: <20200519202519.219335-1-luiz.dentz@gmail.com>
 <20200519202519.219335-4-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This makes hci_encrypt_cfm calls hci_connect_cfm in case the connection
> state is BT_CONFIG so callers don't have to check the state.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> include/net/bluetooth/hci_core.h | 20 ++++++++++++++++++--
> net/bluetooth/hci_event.c        | 28 +++-------------------------
> 2 files changed, 21 insertions(+), 27 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

