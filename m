Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF1F3F3B90
	for <lists+linux-bluetooth@lfdr.de>; Sat, 21 Aug 2021 18:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhHURA3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 21 Aug 2021 13:00:29 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32311 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229617AbhHURA3 (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 21 Aug 2021 13:00:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629565189; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=ujkhECNouapb26XerCTlAGVvB0uG94bkpEup23oyjvA=;
 b=wDRKPUBzhHXdvMEH0ukn/2fFrI6Br8juoOypfg+10BPiDz/vp80u9EmMAiSx2ywJhcWFJWJj
 qDD8lGN0kI9SvrmS8SOksH3utfLErMgJ1vD5KFpocLaHIjR+tMeE79qD1aSvxLcaYgW3IQzf
 615umG1IeT/PTGjcLFsvuWhMYd8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2MTA3ZSIsICJsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 612131021ea75edcc36d3703 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 21 Aug 2021 16:59:46
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 33227C43616; Sat, 21 Aug 2021 16:59:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        MISSING_DATE,MISSING_MID,SPF_FAIL autolearn=no autolearn_force=no
        version=3.4.0
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AF230C4338F;
        Sat, 21 Aug 2021 16:59:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AF230C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/2] brcmfmac: add 43752 SDIO ids and initialization
From:   Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210812165218.2508258-2-angus@akkea.ca>
References: <20210812165218.2508258-2-angus@akkea.ca>
To:     Angus Ainslie <angus@akkea.ca>
Cc:     kernel@puri.sm, Arend van Spriel <aspriel@gmail.com>,
        Franky Lin <franky.lin@broadcom.com>,
        linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        linux-bluetooth@vger.kernel.org, Angus Ainslie <angus@akkea.ca>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210821165946.33227C43616@smtp.codeaurora.org>
Date:   Sat, 21 Aug 2021 16:59:46 +0000 (UTC)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Angus Ainslie <angus@akkea.ca> wrote:

> Add HW and SDIO ids for use with the SparkLan AP6275S
> Add the firmware mapping structures for the BRCM43752 chipset.
> The 43752 needs some things setup similar to the 43012 chipset.
> The WATERMARK shows better performance when initialized to the 4373 value.
> 
> Signed-off-by: Angus Ainslie <angus@akkea.ca>

Patch applied to wireless-drivers-next.git, thanks.

d2587c57ffd8 brcmfmac: add 43752 SDIO ids and initialization

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210812165218.2508258-2-angus@akkea.ca/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

