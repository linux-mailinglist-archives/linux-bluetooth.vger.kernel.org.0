Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95F132C80A
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Mar 2021 02:14:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348294AbhCDAdp (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Mar 2021 19:33:45 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:52619 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343662AbhCCP6M (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Mar 2021 10:58:12 -0500
Received: from marcel-macbook.holtmann.net (p4ff9fb90.dip0.t-ipconnect.de [79.249.251.144])
        by mail.holtmann.org (Postfix) with ESMTPSA id D4233CED05;
        Wed,  3 Mar 2021 16:56:28 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH BlueZ v4] monitor: Add option to set fallback width
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210302004019.7150-1-sonnysasaka@chromium.org>
Date:   Wed, 3 Mar 2021 16:48:54 +0100
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Daniel Winkler <danielwinkler@google.com>
Content-Transfer-Encoding: 7bit
Message-Id: <9242422E-E9A6-4D50-9743-88D5E3CF4FAD@holtmann.org>
References: <20210302004019.7150-1-sonnysasaka@chromium.org>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> Sometimes we want to be able to pipe the output of btmon to a
> non-terminal device. The current fallback width is usually not long
> enough so this patch adds an option to specify the column width. This is
> especially needed for text logs from bluetoothd.
> 
> Reviewed-by: Daniel Winkler <danielwinkler@google.com>
> 
> ---
> monitor/display.c | 8 +++++++-
> monitor/display.h | 1 +
> monitor/main.c    | 8 +++++++-
> 3 files changed, 15 insertions(+), 2 deletions(-)

patch has been applied.

Regards

Marcel

