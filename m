Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFC094C36ED
	for <lists+linux-bluetooth@lfdr.de>; Thu, 24 Feb 2022 21:35:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233902AbiBXUfo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 24 Feb 2022 15:35:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232642AbiBXUfn (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 24 Feb 2022 15:35:43 -0500
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6C4B22399D6
        for <linux-bluetooth@vger.kernel.org>; Thu, 24 Feb 2022 12:35:12 -0800 (PST)
Received: from smtpclient.apple (p4fefc101.dip0.t-ipconnect.de [79.239.193.1])
        by mail.holtmann.org (Postfix) with ESMTPSA id 10D4ACED1B;
        Thu, 24 Feb 2022 21:35:11 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH v2] Bluetooth: hci_sync: Fix not using conn_timeout
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220217211038.3064096-1-luiz.dentz@gmail.com>
Date:   Thu, 24 Feb 2022 21:35:10 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <F4E7AC54-9739-4A97-B924-C17F944EF936@holtmann.org>
References: <20220217211038.3064096-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> When using hci_le_create_conn_sync it shall wait for the conn_timeout
> since the connection complete may take longer than just 2 seconds.
> 
> Also fix the masking of HCI_EV_LE_ENHANCED_CONN_COMPLETE and
> HCI_EV_LE_CONN_COMPLETE so they are never both set so we can predict
> which one the controller will use in case of HCI_OP_LE_CREATE_CONN.
> 
> Fixes: 6cd29ec6ae5e3 ("Bluetooth: hci_sync: Wait for proper events when connecting LE")
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> v2: Add use_enhanced_conn_complete and include comments regarding when the use
> of HCI_EV_LE_ENHANCED_CONN_COMPLETE.
> 
> include/net/bluetooth/hci_core.h |  8 ++++++++
> net/bluetooth/hci_sync.c         | 21 +++++++++++++++------
> 2 files changed, 23 insertions(+), 6 deletions(-)

patch has been applied to bluetooth-stable tree.

Regards

Marcel

