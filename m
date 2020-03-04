Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF0BE178B49
	for <lists+linux-bluetooth@lfdr.de>; Wed,  4 Mar 2020 08:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727026AbgCDH2G (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 4 Mar 2020 02:28:06 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:33199 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgCDH2G (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 4 Mar 2020 02:28:06 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 3DE21CECDA;
        Wed,  4 Mar 2020 08:37:32 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v3] bluetooth: guard against controllers sending zero'd
 events
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200303155534.127645-1-alainm@chromium.org>
Date:   Wed, 4 Mar 2020 08:28:04 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <3F146946-8F93-4541-B2EC-9EAE4262176F@holtmann.org>
References: <20200303155534.127645-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> Some controllers have been observed to send zero'd events under some
> conditions.  This change guards against this condition as well as adding
> a trace to facilitate diagnosability of this condition.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> net/bluetooth/hci_event.c | 6 ++++++
> 1 file changed, 6 insertions(+)

patch has been applied to bluetooth-next tree.

Regards

Marcel

