Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 823B61F140E
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Jun 2020 09:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbgFHH6F convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 Jun 2020 03:58:05 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:36188 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729077AbgFHH6E (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 Jun 2020 03:58:04 -0400
Received: from marcel-macpro.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 37ADDCECF6;
        Mon,  8 Jun 2020 10:07:52 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Should we disable ERTM as default?
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CAPHZWUd=t6icDXpz=td0teDoKHtE6FMH3OPE5R+BH53GOrXAdg@mail.gmail.com>
Date:   Mon, 8 Jun 2020 09:58:02 +0200
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        ChromeOS BT Qualification <chromeos-bt-qual@google.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <558DADDA-AC07-4463-A94E-085B16976AAB@holtmann.org>
References: <CAPHZWUe9sLt8jsD57i3=PQxMfjODP7dUYLBm2qpSXFdgd9cvAQ@mail.gmail.com>
 <64A824C9-7C3C-4B08-8A9E-827121C4786D@holtmann.org>
 <CABBYNZJtgCNeZCYQ9tWno9qD9Vi2AaJNLH5TLxMtASHS-c+ySQ@mail.gmail.com>
 <CAPHZWUd=t6icDXpz=td0teDoKHtE6FMH3OPE5R+BH53GOrXAdg@mail.gmail.com>
To:     Yun-hao Chung <howardchung@google.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Yun-hao,

> I think it is more likely to be the PTS's limitations. I realized the
> problem is in the media channel not in the signaling channel. PTS
> wants to use streaming mode, but bluez rejects it, and then PTS aborts
> the test. According to the MPS 1.0 Spec 6.2, L2CAP streaming mode is
> the recommendation for optimization when using MPS media control
> channels, so I think bluez doesn't do anything wrong during this test.

do you have the btmon trace for this. I think we should accept ERTM on the media channel. The unfortunate part is that control and media channels both use PSM 25 and so we can’t be really selective when we are the acceptor. If MPS wants us to accept ERTM on the media channel we should allow. For all I care we can even accept it on the control channel, but it is just a waste of overhead on the L2CAP headers. Actually the new Enhanced Flow Control mode on BR/EDR would be more efficient for A2DP.

Regards

Marcel

