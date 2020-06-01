Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 192251EAE82
	for <lists+linux-bluetooth@lfdr.de>; Mon,  1 Jun 2020 20:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729990AbgFASyh (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 Jun 2020 14:54:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729854AbgFASB4 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 Jun 2020 14:01:56 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2100CC05BD43;
        Mon,  1 Jun 2020 11:01:56 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id B4C7111D69C3B;
        Mon,  1 Jun 2020 11:01:55 -0700 (PDT)
Date:   Mon, 01 Jun 2020 11:01:55 -0700 (PDT)
Message-Id: <20200601.110155.1133370282350346255.davem@davemloft.net>
To:     johan.hedberg@gmail.com
Cc:     linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: pull request: bluetooth-next 2020-06-01
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20200601070803.GA18009@jhedberg-mac01.home>
References: <20200601070803.GA18009@jhedberg-mac01.home>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 01 Jun 2020 11:01:55 -0700 (PDT)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Johan Hedberg <johan.hedberg@gmail.com>
Date: Mon, 1 Jun 2020 10:08:03 +0300

> Here's one last bluetooth-next pull request for 5.8, which I hope can
> still be accepted.
> 
>  - Enabled Wide-Band Speech (WBS) support for Qualcomm wcn3991
>  - Multiple fixes/imprvovements to Qualcomm-based devices
>  - Fix GAP/SEC/SEM/BI-10-C qualfication test case
>  - Added support for Broadcom BCM4350C5 device
>  - Several other smaller fixes & improvements
> 
> Please let me know if there are any issues pulling. Thanks.

Pulled, thanks Johan.
