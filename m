Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 515A5764602
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 Jul 2023 07:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjG0Fq4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 Jul 2023 01:46:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232425AbjG0Fqe (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 Jul 2023 01:46:34 -0400
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98993C11
        for <linux-bluetooth@vger.kernel.org>; Wed, 26 Jul 2023 22:45:53 -0700 (PDT)
Received: from [192.168.0.2] (ip5f5ae953.dynamic.kabel-deutschland.de [95.90.233.83])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 45C0E61E5FE01;
        Thu, 27 Jul 2023 07:45:16 +0200 (CEST)
Message-ID: <df6450f0-661d-3039-7fe8-f5b4eb62630d@molgen.mpg.de>
Date:   Thu, 27 Jul 2023 07:45:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
To:     bluez.test.bot@gmail.com
Content-Language: en-US
Cc:     linux-bluetooth@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Add overall result to subject line
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear bot operators,


Thank you for running the bot.

Would it be possible to add the overall result to the subject? That way 
for runs, where all tests passed, it’s not necessary to open the 
message, as it’s clear, that you won’t find anything else in the message 
body.


Kind regards,

Paul
