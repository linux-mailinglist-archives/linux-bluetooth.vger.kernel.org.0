Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 926E84AC4B5
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Feb 2022 17:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233166AbiBGQAD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 7 Feb 2022 11:00:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378180AbiBGPzK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 7 Feb 2022 10:55:10 -0500
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CEA1AC0401D1
        for <linux-bluetooth@vger.kernel.org>; Mon,  7 Feb 2022 07:55:09 -0800 (PST)
Received: from smtpclient.apple (p4ff9f3e5.dip0.t-ipconnect.de [79.249.243.229])
        by mail.holtmann.org (Postfix) with ESMTPSA id 25B52CECF1;
        Mon,  7 Feb 2022 16:55:09 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH] Bluetooth: hci_core: Fix leaking sent_cmd skb
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220204211236.2690926-1-luiz.dentz@gmail.com>
Date:   Mon, 7 Feb 2022 16:55:08 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <86A18D0A-1A28-4578-BFB9-B52060B055B7@holtmann.org>
References: <20220204211236.2690926-1-luiz.dentz@gmail.com>
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

> sent_cmd memory is not freed before freeing hci_dev causing it to leak
> it contents.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_core.c | 1 +
> 1 file changed, 1 insertion(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

