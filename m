Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70173FB8E1
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Aug 2021 17:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237203AbhH3PQY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Aug 2021 11:16:24 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:39755 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237528AbhH3PQX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Aug 2021 11:16:23 -0400
Received: from smtpclient.apple (p5b3d2185.dip0.t-ipconnect.de [91.61.33.133])
        by mail.holtmann.org (Postfix) with ESMTPSA id ABEEACEC82
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Aug 2021 17:15:28 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Anybody still using BlueZ for Android support?
Message-Id: <5CCD9480-1D51-4744-8F27-CAE06E6A3285@holtmann.org>
Date:   Mon, 30 Aug 2021 17:15:28 +0200
To:     "open list:BLUETOOTH SUBSYSTEM" <linux-bluetooth@vger.kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

the BlueZ for Android support hasn’t been updated in a long time and recent Android version are unlikely to be supported. So my plan is to remove the code to ease the burden on maintaining BlueZ userspace.

Regards

Marcel

