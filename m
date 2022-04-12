Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 398344FCEF7
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Apr 2022 07:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347955AbiDLFax (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 12 Apr 2022 01:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240383AbiDLFaw (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 12 Apr 2022 01:30:52 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCA5834677
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Apr 2022 22:28:34 -0700 (PDT)
Received: from [192.168.0.2] (ip5f5aef95.dynamic.kabel-deutschland.de [95.90.239.149])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id B4F5761EA1929;
        Tue, 12 Apr 2022 07:28:31 +0200 (CEST)
Message-ID: <b31674e7-f05b-2acc-109c-23e0597307ea@molgen.mpg.de>
Date:   Tue, 12 Apr 2022 07:28:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH BlueZ] btdev: Fix not cleanup ssp_status and
 ssp_auto_complete
Content-Language: en-US
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <20220411235804.3776702-1-luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220411235804.3776702-1-luiz.dentz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear Luiz,


Thank you for your patch.

Am 12.04.22 um 01:58 schrieb Luiz Augusto von Dentz:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This fixes not clenup ssp_status and ssp_auto_complete flags on

cle*a*nup

> auth_complete.

I’d just write:

Clean up ssp_status and ssp_auto_complete flags on auth_complete

(Same for the commit message summary.)

> ---
>   emulator/btdev.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/emulator/btdev.c b/emulator/btdev.c
> index f70fa9136..ccfaed36b 100644
> --- a/emulator/btdev.c
> +++ b/emulator/btdev.c
> @@ -1366,6 +1366,11 @@ static void auth_complete(struct btdev_conn *conn, uint8_t status)
>   	ev.status = status;
>   
>   	send_event(conn->dev, BT_HCI_EVT_AUTH_COMPLETE, &ev, sizeof(ev));
> +
> +	conn->dev->ssp_status = 0;
> +	conn->dev->ssp_auth_complete = false;
> +	conn->link->dev->ssp_status = 0;
> +	conn->link->dev->ssp_auth_complete = false;
>   }
>   
>   static int cmd_link_key_reply_complete(struct btdev *dev, const void *data,

Acked-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul
