Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35AAC67A75F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Jan 2023 01:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjAYANt (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 24 Jan 2023 19:13:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbjAYANs (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 24 Jan 2023 19:13:48 -0500
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0CA222F6
        for <linux-bluetooth@vger.kernel.org>; Tue, 24 Jan 2023 16:13:46 -0800 (PST)
Received: from [192.168.0.2] (ip5f5aefc7.dynamic.kabel-deutschland.de [95.90.239.199])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0BD4D61CC40F9;
        Wed, 25 Jan 2023 01:13:44 +0100 (CET)
Message-ID: <a62f693d-6464-2e4a-6bfe-9d4c0c7cc12e@molgen.mpg.de>
Date:   Wed, 25 Jan 2023 01:13:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH BlueZ] AUTHORS: modify email address
To:     Brian Gix <brian.gix@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
References: <20230124220416.312697-1-brian.gix@gmail.com>
Content-Language: en-US
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230124220416.312697-1-brian.gix@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear Brian,


Am 24.01.23 um 23:04 schrieb Brian Gix:
> ---
>   AUTHORS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/AUTHORS b/AUTHORS
> index 291d9b049..45572d1db 100644
> --- a/AUTHORS
> +++ b/AUTHORS
> @@ -53,7 +53,7 @@ Daniel Orstadius <daniel.orstadius@gmail.com>
>   Anderson Briglia <anderson.briglia@openbossa.org>
>   Anderson Lizardo <anderson.lizardo@openbossa.org>
>   Bruna Moreira <bruna.moreira@openbossa.org>
> -Brian Gix <brian.gix@intel.com>
> +Brian Gix <brian.gix@gmail.com>

When reading `git log --oneline` the commit message summary below might 
be more specific:

AUTHORS: Update Brian Gix’ email address


Kind regards,

Paul
