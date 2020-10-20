Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB9129423B
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Oct 2020 20:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389122AbgJTSiy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 20 Oct 2020 14:38:54 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:58558 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388540AbgJTSiy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 20 Oct 2020 14:38:54 -0400
Received: from marcel-macbook.fritz.box (p5b3d236a.dip0.t-ipconnect.de [91.61.35.106])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6F9E0CED0F;
        Tue, 20 Oct 2020 20:45:56 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: Entropy source based on the RSSI
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CABLzjm8S1J5MRhrwFu1pbX9fub7X5nXmYRWmtRsmVRObeJOCbw@mail.gmail.com>
Date:   Tue, 20 Oct 2020 20:38:51 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <B67F1317-2644-4803-8A16-2A2E7CC425F3@holtmann.org>
References: <CABLzjm8S1J5MRhrwFu1pbX9fub7X5nXmYRWmtRsmVRObeJOCbw@mail.gmail.com>
To:     Alexandre Augusto <alexandre.a.giron@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alexandre,

> based on the motivation that IoT devices do not have many entropy
> sources available, and also on the fact that trusting in a single
> source may be risky, I have researched some additional ways to collect
> randomness for the device, using bluetooth technology for that
> purpose.
> 
> For those who are interested in:
> 
> Github: https://github.com/AAGiron/Bluerandom
> Presentation: https://www.youtube.com/watch?v=iAKaKAmqCFo
> 
> I also want to say thanks in advance to Emil Lenngren for his valuable
> comments, here in this mailing list (back in 2019), and also to the
> Bluez community.

I would integrate as kernel driver. The Bluetooth stack could just use its
own LE random generator and an initial passive scan to gather RSSI values.
No need to push this into user space.

Regards

Marcel

