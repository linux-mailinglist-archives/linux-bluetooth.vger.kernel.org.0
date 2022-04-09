Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 638EA4FA754
	for <lists+linux-bluetooth@lfdr.de>; Sat,  9 Apr 2022 13:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbiDILiv (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 9 Apr 2022 07:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241656AbiDILir (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 9 Apr 2022 07:38:47 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD83B1A8C
        for <linux-bluetooth@vger.kernel.org>; Sat,  9 Apr 2022 04:36:36 -0700 (PDT)
Received: from [192.168.0.2] (ip5f5ae90c.dynamic.kabel-deutschland.de [95.90.233.12])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4711461E6478B;
        Sat,  9 Apr 2022 13:36:34 +0200 (CEST)
Message-ID: <805b3f2f-3537-b8e0-2709-325041d7c98c@molgen.mpg.de>
Date:   Sat, 9 Apr 2022 13:36:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH BlueZ 1/1] adapter: Fix check of DISCOVERABLE setting
Content-Language: en-US
To:     Jakob Hilmer <jakob@hilmer.dk>
References: <20220409100130.9743-1-jakob@hilmer.dk>
 <20220409100130.9743-2-jakob@hilmer.dk>
Cc:     linux-bluetooth@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220409100130.9743-2-jakob@hilmer.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear Jakob,


Am 09.04.22 um 12:01 schrieb Jakob Hilmer:
> From: Jakob hilmer <jakob@hilmer.dk>

*H*ilmer?

> The test for `DISCOVERABLE` should be done with
> `MGMT_SETTING_DISCOVERABLE` instead of `MGMT_OP_SET_DISCOVERABLE`.
> ---
>   src/adapter.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/src/adapter.c b/src/adapter.c
> index 71de9e82b..f1197684e 100644
> --- a/src/adapter.c
> +++ b/src/adapter.c
> @@ -1993,7 +1993,7 @@ static bool set_discovery_discoverable(struct btd_adapter *adapter, bool enable)
>   		return true;
>   
>   	/* Reset discoverable filter if already set */
> -	if (enable && (adapter->current_settings & MGMT_OP_SET_DISCOVERABLE))
> +	if (enable && (adapter->current_settings & MGMT_SETTING_DISCOVERABLE))
>   		return true;
>   
>   	adapter->discovery_discoverable = enable;
> @@ -2229,7 +2229,7 @@ static int update_discovery_filter(struct btd_adapter *adapter)
>   	/* Only attempt to overwrite current discoverable setting when not
>   	 * discoverable.
>   	 */
> -	if (!(adapter->current_settings & MGMT_OP_SET_DISCOVERABLE)) {
> +	if (!(adapter->current_settings & MGMT_SETTING_DISCOVERABLE)) {
>   		GSList *l;
>   
>   		for (l = adapter->discovery_list; l; l = g_slist_next(l)) {

Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul
