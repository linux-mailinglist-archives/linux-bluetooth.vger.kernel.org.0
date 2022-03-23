Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 748A74E506E
	for <lists+linux-bluetooth@lfdr.de>; Wed, 23 Mar 2022 11:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243580AbiCWKh3 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 23 Mar 2022 06:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234425AbiCWKh2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 23 Mar 2022 06:37:28 -0400
Received: from mail.holtmann.org (coyote.holtmann.net [212.227.132.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7CD0025E81
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Mar 2022 03:35:55 -0700 (PDT)
Received: from smtpclient.apple (p5b3d2183.dip0.t-ipconnect.de [91.61.33.131])
        by mail.holtmann.org (Postfix) with ESMTPSA id 789C0CED2C;
        Wed, 23 Mar 2022 11:35:54 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH BlueZ v2 1/9] log: Introduce DBG_IS_ENABLED
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20220323000654.3157833-1-luiz.dentz@gmail.com>
Date:   Wed, 23 Mar 2022 11:35:53 +0100
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <7C167E0B-0DCB-405E-B2D2-65FE655BA522@holtmann.org>
References: <20220323000654.3157833-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> This introduces DBG_IS_ENABLE macro which can be used to check if
> BTD_DEBUG_FLAG_PRINT has been enabled for the current file.
> ---
> src/log.c | 12 ++++++++++++
> src/log.h | 11 +++++++++++
> 2 files changed, 23 insertions(+)
> 
> diff --git a/src/log.c b/src/log.c
> index 0155a6bba..1157859ef 100644
> --- a/src/log.c
> +++ b/src/log.c
> @@ -179,6 +179,18 @@ void __btd_log_init(const char *debug, int detach)
> 	info("Bluetooth daemon %s", VERSION);
> }
> 
> +bool __btd_log_is_enabled(const char *file)
> +{
> +	struct btd_debug_desc *desc;
> +
> +	for (desc = __start___debug; desc < __stop___debug; desc++) {
> +		if (desc->file && g_pattern_match_simple(file, desc->file))
> +			return desc->flags & BTD_DEBUG_FLAG_PRINT;
> +	}
> +
> +	return false;
> +}
> +

this is an expensive operation. What do you need this for?

Regards

Marcel

