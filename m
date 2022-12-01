Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 698D463F68A
	for <lists+linux-bluetooth@lfdr.de>; Thu,  1 Dec 2022 18:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbiLARqG (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 1 Dec 2022 12:46:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiLARpX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 1 Dec 2022 12:45:23 -0500
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED4CEA9E8E
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Dec 2022 09:45:03 -0800 (PST)
Received: from [172.18.236.247] (unknown [46.183.103.17])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5D36E60028140;
        Thu,  1 Dec 2022 18:44:54 +0100 (CET)
Message-ID: <ed43586d-5db7-862e-f012-1f54b5b6583d@molgen.mpg.de>
Date:   Thu, 1 Dec 2022 18:44:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH BlueZ v3 1/1] bluetooth.ver: Export sanitizer symbols
Content-Language: en-US
To:     Allen Webb <allenwebb@google.com>
References: <6388e0a6.020a0220.7a53b.4ef2@mx.google.com>
 <20221201171613.1819631-2-allenwebb@google.com>
Cc:     linux-bluetooth@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20221201171613.1819631-2-allenwebb@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear Allen,


Thank you for upstreaming your changes.


Am 01.12.22 um 18:16 schrieb Allen Webb:
> Fix llvm sanitizer support by not hidding sanitizer related symbols.

hiding

> ---
>   src/bluetooth.ver | 8 ++++++++
>   1 file changed, 8 insertions(+)

[…]


Kind regards,

Paul
