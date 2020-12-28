Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A7F2E32B6
	for <lists+linux-bluetooth@lfdr.de>; Sun, 27 Dec 2020 21:37:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgL0Ug7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 27 Dec 2020 15:36:59 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:34742 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726067AbgL0Ug7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 27 Dec 2020 15:36:59 -0500
Received: from marcel-macbook.holtmann.net (p4ff9f924.dip0.t-ipconnect.de [79.249.249.36])
        by mail.holtmann.org (Postfix) with ESMTPSA id DB1C8CECDB;
        Sun, 27 Dec 2020 21:43:36 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Fix initializing response id after clearing struct
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <f2e0ca7e-4ffa-4e39-bd46-e0f70d23567e@www.fastmail.com>
Date:   Sun, 27 Dec 2020 21:36:17 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <F7899F70-6238-4DFA-A0D0-95A18E256A4D@holtmann.org>
References: <f2e0ca7e-4ffa-4e39-bd46-e0f70d23567e@www.fastmail.com>
To:     Christopher William Snowhill <chris@kode54.net>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Christopher,

> Looks like this was missed when patching the source to clear the structures throughout, causing this one instance to clear the struct after the response id is assigned.
> 
> This is in regard to Message ID <20200806181714.3216076-1-luiz.dentz@gmail.com>,
> subject: [PATCH 1/4] Bluetooth: A2MP: Fix not initializing all members
> 
> I must apologize for not noticing this sooner, as I remember reading the articles linking to this patch several months ago. Either it slipped my mind, or I failed to notice it then. Apparently, nobody else noticed it, either, so I guess it's just not that obvious.
> 
> ---
> net/bluetooth/a2mp.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

