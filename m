Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAF71174AD4
	for <lists+linux-bluetooth@lfdr.de>; Sun,  1 Mar 2020 03:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbgCACtO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 29 Feb 2020 21:49:14 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:55297 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgCACtO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 29 Feb 2020 21:49:14 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id CA220CED13;
        Sun,  1 Mar 2020 03:58:38 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [PATCH v2 00/12] Userspace Bluetooth 5.2 initial support
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200228234701.14614-1-luiz.dentz@gmail.com>
Date:   Sun, 1 Mar 2020 03:49:11 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <9E347C8A-CD93-44DF-9B90-721518816F21@holtmann.org>
References: <20200228234701.14614-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This introduces the initial support for Bluetooth 5.2 features:
> 
> * ISO channels:
>        + tools/isotest command line tool to run validation tests
> 
> * L2CAP Enhanced Credit Based Flow Control Mode
>        + tools/l2test has been update to include the new mode

I prefer if we not merge these two just yet. Let this settle a bit first and figure out what the best userspace API is. Otherwise we are stuck with an API that doesn’t work.

> * Enhanced ATT Bearer:
>        + Client and Server support
>        + Include all new procedures
>        + Automaticlly detects and enables channels
>        + Number of channels configurable via main.conf

This looks ok to be merged.

Regards

Marcel

