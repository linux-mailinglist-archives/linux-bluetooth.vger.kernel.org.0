Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB6DE1459F9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Jan 2020 17:38:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgAVQiG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 22 Jan 2020 11:38:06 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:42272 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgAVQiG (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 22 Jan 2020 11:38:06 -0500
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id D925ECECF3;
        Wed, 22 Jan 2020 17:47:23 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH] bluetooth: adding missing const decoration to
 mgmt_status_table
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200122160916.156321-1-alainm@chromium.org>
Date:   Wed, 22 Jan 2020 17:38:04 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <A33A3AFD-5782-40DE-BD0E-77ACEA9599DB@holtmann.org>
References: <20200122160916.156321-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change simply adds a missing const decoration to the
> mtmt_status_table definition.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> net/bluetooth/mgmt.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

