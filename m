Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CA5B13CE15
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Jan 2020 21:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728931AbgAOU3W convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Jan 2020 15:29:22 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:50239 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbgAOU3W (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Jan 2020 15:29:22 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id D8F31CECF2;
        Wed, 15 Jan 2020 21:38:38 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH v5 1/2] Adding a bt_dev_warn_ratelimited macro.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200107004317.152792-1-alainm@chromium.org>
Date:   Wed, 15 Jan 2020 21:29:20 +0100
Cc:     BlueZ <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <E7F62ACC-C199-40F3-9000-4A150EA40E2C@holtmann.org>
References: <20200107004317.152792-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> The macro will be used to display rate limited warning messages in the
> log.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> include/net/bluetooth/bluetooth.h |  4 ++++
> net/bluetooth/lib.c               | 16 ++++++++++++++++
> 2 files changed, 20 insertions(+)

this one confused me and I assumed it is an old patch set. I have applied this one back in December and it is already part of bluetooth-next tree.

Regards

Marcel

