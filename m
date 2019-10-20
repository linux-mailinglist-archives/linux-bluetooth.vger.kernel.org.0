Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C41EDDFA6
	for <lists+linux-bluetooth@lfdr.de>; Sun, 20 Oct 2019 19:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbfJTRIO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 20 Oct 2019 13:08:14 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:32840 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbfJTRIO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 20 Oct 2019 13:08:14 -0400
Received: from marcel-macbook.fritz.box (p4FEFC197.dip0.t-ipconnect.de [79.239.193.151])
        by mail.holtmann.org (Postfix) with ESMTPSA id 258F9CED1D;
        Sun, 20 Oct 2019 19:17:12 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: mgmt_new_default sometimes fail
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CAB+bgRa-Lh0iR7nRe6kfFYqz_etHdYTjd+3MfWGWm8CRgTsa=w@mail.gmail.com>
Date:   Sun, 20 Oct 2019 19:08:12 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <406D15DB-1CD8-42DE-8A3C-640A4D24AC48@holtmann.org>
References: <CAB+bgRa-Lh0iR7nRe6kfFYqz_etHdYTjd+3MfWGWm8CRgTsa=w@mail.gmail.com>
To:     Ordit Gross <ordit.gross@orcam.com>
X-Mailer: Apple Mail (2.3594.4.19)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Ordit,

> On our application we used the code sample btmgmt.c
> which uses mgmt_new_default, this function will fail if
> fd >127 (because mainloop_add_fd will fail in io_new function).
> 
> mgmt_new_default:
> fd = socket(PF_BLUETOOTH, SOCK_RAW | SOCK_CLOEXEC | SOCK_NONBLOCK, BTPROTO_HCI);
> 
> what is the best way to workaround this issue assuming I have only
> btmgmt.c code and would rather not change other files?

because we have #define MAX_MAINLOOP_ENTRIES 128 in the mainloop.c code. I assumed that 127 file descriptors is plenty for what any BlueZ application is doing.

Regards

Marcel

