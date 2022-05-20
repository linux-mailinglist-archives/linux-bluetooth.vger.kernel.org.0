Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC25B52E895
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 May 2022 11:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346856AbiETJSb convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 May 2022 05:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239056AbiETJS3 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 May 2022 05:18:29 -0400
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F39368CCDA
        for <linux-bluetooth@vger.kernel.org>; Fri, 20 May 2022 02:18:05 -0700 (PDT)
Received: from smtpclient.apple (p4ff9fb9d.dip0.t-ipconnect.de [79.249.251.157])
        by mail.holtmann.org (Postfix) with ESMTPSA id 131A3CED09;
        Fri, 20 May 2022 11:18:05 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH v2 1/3] Bluetooth: hci_conn: Fix hci_connect_le_sync
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220519202258.2459530-1-luiz.dentz@gmail.com>
Date:   Fri, 20 May 2022 11:18:04 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <4A64967D-9487-4E8E-80F1-64B0389B2D95@holtmann.org>
References: <20220519202258.2459530-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> The handling of connection failures shall be handled by the request
> completion callback as already done by hci_cs_le_create_conn, also make
> sure to use hci_conn_failed instead of hci_le_conn_failed as the later
> don't actually call hci_conn_del to cleanup.
> 
> Fixes: 8e8b92ee60de5 ("Bluetooth: hci_sync: Add hci_le_create_conn_sync")
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_conn.c  | 5 +++--
> net/bluetooth/hci_event.c | 8 +++++---
> 2 files changed, 8 insertions(+), 5 deletions(-)

you are making a bit mess with yet another v2 of this. I rather have you mark this as [PATCH -stable] or something so that we get this one into that tree and then later the rest into -next.

Regards

Marcel

