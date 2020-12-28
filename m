Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A60712E3722
	for <lists+linux-bluetooth@lfdr.de>; Mon, 28 Dec 2020 13:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726847AbgL1Mdp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 28 Dec 2020 07:33:45 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:40528 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgL1Mdp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 28 Dec 2020 07:33:45 -0500
Received: from mac-pro.holtmann.net (p4ff9f924.dip0.t-ipconnect.de [79.249.249.36])
        by mail.holtmann.org (Postfix) with ESMTPSA id A8739CECEC;
        Mon, 28 Dec 2020 13:40:22 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: getting address type from scan result
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CAB+bgRb6vh4Pv9nZjYGoNXimTGoW1jYjxHk8ouvf6cBb8PcOXQ@mail.gmail.com>
Date:   Mon, 28 Dec 2020 13:33:02 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <DB427788-0164-494A-9262-4AA6A2A0F6F4@holtmann.org>
References: <CAB+bgRb6vh4Pv9nZjYGoNXimTGoW1jYjxHk8ouvf6cBb8PcOXQ@mail.gmail.com>
To:     Ordit Gross <ordit.gross@orcam.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Ordit,

> Up till now the peripheral device we worked against was configured
> with public address,
> now it might also be random (both BDADDR_LE_RANDOM, BDADDR_LE_PUBLIC).
> The type of address is needed to connect correctly to the device
> (using l2cap_connect).
> 
> How can I get the address type from the scan report?
> I'm currently using bluetoothctl, which seems not to expose this
> information in Device1 interface.
> thanks in advance! and happy holidays

it is in the Device1 interface for the Identity Address. Why are you going to connect an L2CAP socket in the first place for a LE device.

Regards

Marcel

