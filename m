Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF9241ED566
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Jun 2020 19:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgFCRyB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Jun 2020 13:54:01 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:48497 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgFCRyA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Jun 2020 13:54:00 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id AEAF1CED2F;
        Wed,  3 Jun 2020 20:03:47 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v1] bluetooth:Removing noisy dbg message
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200601142059.136748-1-alainm@chromium.org>
Date:   Wed, 3 Jun 2020 19:53:59 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <E586C9D9-47C1-40F6-B227-F5BB90413F99@holtmann.org>
References: <20200601142059.136748-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This patch removes a particularly noisy dbg message.  The debug message
> isn't particularly interesting for debuggability so it was simply
> removed to reduce noise in dbg logs.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> net/bluetooth/af_bluetooth.c | 2 --
> 1 file changed, 2 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

