Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC7619D2C1
	for <lists+linux-bluetooth@lfdr.de>; Fri,  3 Apr 2020 10:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390362AbgDCIzM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 3 Apr 2020 04:55:12 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:57212 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727868AbgDCIzM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 3 Apr 2020 04:55:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585904111; h=Message-ID: Subject: Cc: To: From: Date:
 Content-Transfer-Encoding: Content-Type: MIME-Version: Sender;
 bh=2BB4XDt82weA6QO3EKEICdWU8jbHAn3rmAUZkFbsLWY=; b=iAJtt2+nFZs8JpyIxYUx74ixYQWADmtU+LohBWeiRrvAJKGechgGqJJLjHNsbKGQkI96wJMp
 7T3zoEejnuTFkjS4JusMJsVIlupl/+slCm/tQryxaUWuqR1BYH0J03pfyirprDJ99lPQodxv
 6rI8jZzBRzdVzPTKNl+mjFl42W8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2MTA3ZSIsICJsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e86f9eb.7f11ace800a0-smtp-out-n03;
 Fri, 03 Apr 2020 08:55:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 334FEC433BA; Fri,  3 Apr 2020 08:55:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D0C2FC433D2;
        Fri,  3 Apr 2020 08:55:06 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 03 Apr 2020 14:25:06 +0530
From:   bgodavar@codeaurora.org
To:     linux-firmware@kernel.org
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, gubbaven@codeaurora.org
Subject: Update fw file to enable transparent WBS
Message-ID: <4ac4959d44823e7a23618b970f68293e@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The following changes since commit 
edf390c23a4e185ff36daded36575f669f5059f7:

   Merge branch 'v12573.77' of https://github.com/erinlo/linux_fw_scp 
(2020-03-20 07:39:19 -0400)

are available in the git repository at:

   https://github.com/bgodavar/qca_bt_fw

for you to fetch changes up to 1a8b0dc00f77ec8bbc8aece2d1fc19222326efe5:

   qca: Enable transparent WBS for WCN3991 (2020-04-03 14:15:42 +0530)

----------------------------------------------------------------
Balakrishna Godavarthi (1):
       qca: Enable transparent WBS for WCN3991

  qca/crnv32.bin | Bin 5388 -> 5388 bytes
  1 file changed, 0 insertions(+), 0 deletions(-)
