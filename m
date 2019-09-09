Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63AA0ADDD4
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Sep 2019 19:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728779AbfIIRLZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 9 Sep 2019 13:11:25 -0400
Received: from smtprelay0126.hostedemail.com ([216.40.44.126]:50168 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727423AbfIIRLZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 9 Sep 2019 13:11:25 -0400
X-Greylist: delayed 536 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Sep 2019 13:11:24 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id DB5D41801A5FE
        for <linux-bluetooth@vger.kernel.org>; Mon,  9 Sep 2019 17:02:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 78F6A18224D99;
        Mon,  9 Sep 2019 17:02:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::,RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1537:1566:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3865:3866:3868:3870:3873:4321:4605:5007:10004:10400:10848:11026:11232:11658:11914:12048:12297:12740:12760:12895:13069:13311:13357:13439:14659:21080:21212:21433:21627:21939:30054:30091,0,RBL:47.151.152.152:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:30,LUA_SUMMARY:none
X-HE-Tag: bulb50_4f83836154911
X-Filterd-Recvd-Size: 1233
Received: from XPS-9350.home (unknown [47.151.152.152])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Mon,  9 Sep 2019 17:02:26 +0000 (UTC)
Message-ID: <78acf5cf46bec83c007692be057851a28bed9108.camel@perches.com>
Subject: Re: [PATCH] Bluetooth: trivial: tidy up printk message output from
 btrtl.
From:   Joe Perches <joe@perches.com>
To:     Rui Salvaterra <rsalvaterra@gmail.com>, marcel@holtmann.org,
        johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Mon, 09 Sep 2019 10:02:25 -0700
In-Reply-To: <20190909150329.1779-1-rsalvaterra@gmail.com>
References: <20190909150329.1779-1-rsalvaterra@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Mon, 2019-09-09 at 16:03 +0100, Rui Salvaterra wrote:
> The rtl_dev_* calls in the Realtek USB Bluetooth driver add unnecessary
> device prefixes and new lines at the end of most messages, which make the
> dmesg output look like this:

OK, but maybe you could fix this one too:

drivers/bluetooth/hci_h5.c:             rtl_dev_err(h5->hu->hdev, "set baud rate command failed\n");


