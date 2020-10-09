Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4827288C4B
	for <lists+linux-bluetooth@lfdr.de>; Fri,  9 Oct 2020 17:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388728AbgJIPMT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 9 Oct 2020 11:12:19 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:56995 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388696AbgJIPMQ (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 9 Oct 2020 11:12:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602256335; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=5ZPkzLsagVxrN2tOnXJLnl1GmeKaimSxCLAdFcqDJZ4=; b=EieO8ITuoKwyx6THL8RJYlaviFLwpFzAWtiex564E/y0Ng1gv+OBJ12q11vVfnv34stNJLRD
 8kt0KLTdO1cYL9nVchu/9ePQE0p+b3iGcfj03tw17vte9P2ii1m3Sy0Wbn424UQdjbR0TOSK
 Ew6I8qYPPBuJVuGt2WglNXh1hm4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI2MTA3ZSIsICJsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f807d66bfed2afaa668aa8c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Oct 2020 15:10:30
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BE96CC433CB; Fri,  9 Oct 2020 15:10:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EEA09C433F1;
        Fri,  9 Oct 2020 15:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EEA09C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Johannes Berg <johannes@sipsolutions.net>
Cc:     Taehee Yoo <ap420073@gmail.com>, davem@davemloft.net,
        kuba@kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com,
        b43-dev@lists.infradead.org, linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH net 001/117] mac80211: set .owner to THIS_MODULE in debugfs_netdev.c
References: <20201008155209.18025-1-ap420073@gmail.com>
        <e385f0c4d37812d9e69369645082baf4a352b6c3.camel@sipsolutions.net>
Date:   Fri, 09 Oct 2020 18:09:10 +0300
In-Reply-To: <e385f0c4d37812d9e69369645082baf4a352b6c3.camel@sipsolutions.net>
        (Johannes Berg's message of "Thu, 08 Oct 2020 18:06:56 +0200")
Message-ID: <87mu0vsag9.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Johannes Berg <johannes@sipsolutions.net> writes:

> On Thu, 2020-10-08 at 15:50 +0000, Taehee Yoo wrote:
>> If THIS_MODULE is not set, the module would be removed while debugfs is
>> being used.
>> It eventually makes kernel panic.
>> 
> Wow, 117 practically identical patches? No thanks ...
>
> Can you merge the ones that belong to a single driver?
>
> net/mac80211/ -> mac80211
> net/wireless/ -> cfg80211
>
> etc.
>
> I don't think we need more than one patch for each driver/subsystem.

Yes, one patch per driver is much better. And never send 100 patches in
one go, I will automatically drop these even without looking.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
