Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1094D118E30
	for <lists+linux-bluetooth@lfdr.de>; Tue, 10 Dec 2019 17:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbfLJQwr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 10 Dec 2019 11:52:47 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:52375 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727572AbfLJQwr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 10 Dec 2019 11:52:47 -0500
Received: from marcel-macbook.fritz.box (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 40D98CECC6;
        Tue, 10 Dec 2019 18:01:56 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH sbc] sbc: Fix visibility of sbc_reinit_a2dp()
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191210160954.2154412-1-john@metanate.com>
Date:   Tue, 10 Dec 2019 17:52:45 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <927CEFC4-3DD4-419E-850F-301543EAEC7D@holtmann.org>
References: <20191210160954.2154412-1-john@metanate.com>
To:     John Keeping <john@metanate.com>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi John,

> sbc_reinit_a2dp() is missing the SBC_EXPORT attribute so it's not
> visibile to be used by consumers of the shared object.
> ---
> sbc/sbc.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied.

Regards

Marcel

