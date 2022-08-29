Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6775A558D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 29 Aug 2022 22:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbiH2Uav (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 29 Aug 2022 16:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbiH2Uau (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 29 Aug 2022 16:30:50 -0400
X-Greylist: delayed 519 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 29 Aug 2022 13:30:49 PDT
Received: from twoot.bin.org.in (twoot.bin.org.in [5.9.7.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931FB696D4
        for <linux-bluetooth@vger.kernel.org>; Mon, 29 Aug 2022 13:30:49 -0700 (PDT)
Received: from [IPV6:2a02:8388:288f:6d80:7544:5e43:ff32:1f0b] (2a02-8388-288f-6d80-7544-5e43-ff32-1f0b.cable.dynamic.v6.surfer.at [IPv6:2a02:8388:288f:6d80:7544:5e43:ff32:1f0b])
        (Authenticated sender: flori@bin.org.in)
        by twoot.bin.org.in (Postfix) with ESMTPSA id 8269FCC09B3
        for <linux-bluetooth@vger.kernel.org>; Mon, 29 Aug 2022 22:22:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bin.org.in; s=2020;
        t=1661804527;
        h=from:from:reply-to:subject:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=IM8OcCd1J5H5NYYxqt8/UURDJnjX3/PpwHj5eTTFHqg=;
        b=bJnMCL81ZwIFu/4sFgzUZIUVaDMZRFMxAl3qEyRLxissVGBVG+LUOIXAwhx+EKcwe5VSi9
        lHvH3Ryd/B+yVJWgUNfIwb+SUYIk7Qfr/gJbiqekPwyNs4TExQJcIbrzTELvv1vae4MdhC
        1Axe2yE3h7FltYou129ErZwcbQcPuegLz/UKWETNmKVPFj/wh6veU6ANQrbtZNSeQ3GfGx
        4dyYdJjM/s7EvwjTmHCDvYR/In5TjVy24c/DuyTzD77YJ87gOr+zmHwjmXosmEkvNbH34o
        O16sxYvpTydfjoI3p5x05mc1UZC5RVlYR19tcZZlGwbrEEn/J7aCexeZa3f4aQ==
Message-ID: <addfa255-997e-fb0e-f189-5970ae818c43@bin.org.in>
Date:   Mon, 29 Aug 2022 22:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To:     linux-bluetooth@vger.kernel.org
Content-Language: de-DE
From:   Florian Leeber <flori@bin.org.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
        auth=pass smtp.auth=flori@bin.org.in smtp.mailfrom=flori@bin.org.in
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MISSING_SUBJECT,SPF_HELO_NONE,
        SPF_PASS,TVD_SPACE_RATIO,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Subscribe

