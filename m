Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE085A956F
	for <lists+linux-bluetooth@lfdr.de>; Thu,  1 Sep 2022 13:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbiIALHw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 1 Sep 2022 07:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbiIALH2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 1 Sep 2022 07:07:28 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A0E4138CBF
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 04:07:23 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id DE862100002
        for <linux-bluetooth@vger.kernel.org>; Thu,  1 Sep 2022 11:07:21 +0000 (UTC)
Message-ID: <b331a0db8894953b4eea704990b4048fdb3e9eae.camel@hadess.net>
Subject: Re: [PATCH BlueZ v6 1/6] adapter: Keep track of whether the adapter
 is rfkill'ed
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Date:   Thu, 01 Sep 2022 13:07:15 +0200
In-Reply-To: <20220901104331.174588-1-hadess@hadess.net>
References: <20220901104331.174588-1-hadess@hadess.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, 2022-09-01 at 12:43 +0200, Bastien Nocera wrote:
> diff --git a/src/rfkill.c b/src/rfkill.c
> index 2099c5ac5..511e351b8 100644
> --- a/src/rfkill.c
> +++ b/src/rfkill.c
> @@ -55,12 +55,73 @@ struct rfkill_event {
>  };
>  #define RFKILL_EVENT_SIZE_V1    8
>  
> +int rfkill_get_blocked(uint16_t index)
> +{
> +       struct rfkill_event event = { 0 };
> +       int fd;
> +       ssize_t len;
> +       int blocked = -1;

I simplified this code in v7 (as well as fixing indentation problems).
