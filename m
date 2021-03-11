Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9BB233706F
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 Mar 2021 11:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232394AbhCKKsc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 11 Mar 2021 05:48:32 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:53557 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbhCKKsP (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 11 Mar 2021 05:48:15 -0500
Received: from marcel-macbook.holtmann.net (p4fefc126.dip0.t-ipconnect.de [79.239.193.38])
        by mail.holtmann.org (Postfix) with ESMTPSA id CD15FCECE2;
        Thu, 11 Mar 2021 11:55:49 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2 2/2] Bluetooth: SMP: Convert BT_ERR/BT_DBG to
 bt_dev_err/bt_dev_dbg
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210310221309.894602-2-luiz.dentz@gmail.com>
Date:   Thu, 11 Mar 2021 11:48:13 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <5976CE60-F269-49A8-B787-C5ADD6DB4CEE@holtmann.org>
References: <20210310221309.894602-1-luiz.dentz@gmail.com>
 <20210310221309.894602-2-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This converts instances of BT_ERR and BT_DBG to bt_dev_err and
> bt_dev_dbg which can be enabled at runtime when BT_FEATURE_DEBUG is
> enabled.
> 
> Note: Not all instances could be converted as some are exercised by
> selftest.

so you added the note and then still converted the selftests ;)

Regards

Marcel

