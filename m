Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20AB74F4EC9
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Apr 2022 03:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233951AbiDFAhH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Apr 2022 20:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1572946AbiDERXp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Apr 2022 13:23:45 -0400
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79E1514012
        for <linux-bluetooth@vger.kernel.org>; Tue,  5 Apr 2022 10:21:46 -0700 (PDT)
Received: from smtpclient.apple (CMPC-089-239-127-162.CNet.Gawex.PL [89.239.127.162])
        by mail.holtmann.org (Postfix) with ESMTPSA id B394FCECC4;
        Tue,  5 Apr 2022 19:21:45 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH v4 4/4] Bluetooth: hci_sync: Split hci_dev_open_sync
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220401233826.122544-4-luiz.dentz@gmail.com>
Date:   Tue, 5 Apr 2022 19:21:44 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <E3FF7635-24F6-40E5-88A2-754454683D3A@holtmann.org>
References: <20220401233826.122544-1-luiz.dentz@gmail.com>
 <20220401233826.122544-4-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_00,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This splits hci_dev_open_sync so each stage is handle by its own
> function so it is easier to identify each stage.
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_sync.c | 225 ++++++++++++++++++++++-----------------
> 1 file changed, 126 insertions(+), 99 deletions(-)

can you try to create the diff with --patience or --histogram so that patch can be reviewed.

Regards

Marcel

