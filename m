Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5068C11A8C6
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Dec 2019 11:22:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbfLKKWE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Dec 2019 05:22:04 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:53451 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfLKKWE (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Dec 2019 05:22:04 -0500
Received: from marcel-macpro.fritz.box (p4FF9F0D1.dip0.t-ipconnect.de [79.249.240.209])
        by mail.holtmann.org (Postfix) with ESMTPSA id 04C85CECD1;
        Wed, 11 Dec 2019 11:31:14 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v3 1/2] Adding a bt_dev_warn_ratelimited macro.
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191211015444.143341-1-alainm@chromium.org>
Date:   Wed, 11 Dec 2019 11:22:02 +0100
Cc:     BlueZ <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <E90E4F30-1DC2-4581-8A30-1A895B9E00D3@holtmann.org>
References: <20191211015444.143341-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3601.0.10)
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

patch has been applied to bluetooth-next tree.

Regards

Marcel

