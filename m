Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50FE32A44F7
	for <lists+linux-bluetooth@lfdr.de>; Tue,  3 Nov 2020 13:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbgKCMTB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 3 Nov 2020 07:19:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:38764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728236AbgKCMTB (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 3 Nov 2020 07:19:01 -0500
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7909922243;
        Tue,  3 Nov 2020 12:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604405940;
        bh=YcZ+qbMTINH60ub9nXWqAb1Pauw637PEUlGsMsXvbmU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K5/jiVt9Fxrb2DBVqGIgcXMjp1lzqjG9GChPE+YlaZCi0ZZLcvV9j59ja9BEevzLX
         PrSUTthI5RXwYHmgjL+5qwqgPyMJEqie1usjP11IburUc0OvKP9UJ5GR2uD6hoIa2i
         S1hiDMPlhRB+QKqkMc7zGkMzC1tebihSakEwWz28=
Received: by pali.im (Postfix)
        id 0543E7E5; Tue,  3 Nov 2020 13:18:57 +0100 (CET)
Date:   Tue, 3 Nov 2020 13:18:57 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Joschi 127 <127.joschi@gmail.com>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>, usharma@chromium.org,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Ujjwal Sharma <ryzokuken@igalia.com>,
        Andrew Fuller <mactalla.obair@gmail.com>,
        Aleksandar Kostadinov <akostadi@redhat.com>,
        David Heidelberg <david@ixit.cz>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Paul Stejskal <paul.stejskal@gmail.com>
Subject: Re: Bluetooth: Allow to use configure SCO socket codec parameters
Message-ID: <20201103121857.jbsp5wnqihx5trrp@pali>
References: <CABBYNZLWsYHeOo3_+hcq4r+gY_0sLBQhftW7My7Y4D1n9o5jxg@mail.gmail.com>
 <20200518165011.jfarrp5mtqoy3mqz@pali>
 <6da08b42-34d5-9d20-bfc1-161cc8d0f2ea@igalia.com>
 <CABBYNZ+myxfFmobLuzGeYfP_G5tM_ptKgCQCmpQCiUkPZYemuQ@mail.gmail.com>
 <aff611bb-4b38-7614-ce61-fc3e7c012615@igalia.com>
 <20200604204343.eor47oe3fbzf6rbv@pali>
 <20200929210452.bus2qqbikvu2xtwy@pali>
 <f40ad39dad23c813441a3082550ad44f85671f2d.camel@gmail.com>
 <847879c75cceebee9f2d414089b527cb5dcdcece.camel@gmail.com>
 <ecd1a31bb0c26947cce23a9c473fea834205a67e.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecd1a31bb0c26947cce23a9c473fea834205a67e.camel@gmail.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tuesday 03 November 2020 13:10:50 Joschi 127 wrote:
> @Pali: Can you check if my summary above is correct? What has to be
> done to finalize this?

Hello Joschi!

The last update of proposed API (without implementation) with
explanation is in email:

https://lore.kernel.org/linux-bluetooth/20200419234937.4zozkqgpt557m3o6@pali/

What is needed is to review proposed API, approve it and then implement
kernel code for this API.
