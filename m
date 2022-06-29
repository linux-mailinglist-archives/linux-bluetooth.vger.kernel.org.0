Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 599E455F69D
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 Jun 2022 08:34:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbiF2Gdu (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 29 Jun 2022 02:33:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbiF2Gdt (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 29 Jun 2022 02:33:49 -0400
Received: from giacobini.uberspace.de (giacobini.uberspace.de [185.26.156.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17D712B1A8
        for <linux-bluetooth@vger.kernel.org>; Tue, 28 Jun 2022 23:33:46 -0700 (PDT)
Received: (qmail 22110 invoked by uid 990); 29 Jun 2022 06:33:44 -0000
Authentication-Results: giacobini.uberspace.de;
        auth=pass (plain)
Message-ID: <0b943515-915b-8bdd-2e60-a6f38e0db17a@eknoes.de>
Date:   Wed, 29 Jun 2022 08:33:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To:     John Klug <John.Klug@multitech.com>,
        Linux-Bluetooth MailingList <linux-bluetooth@vger.kernel.org>
References: <SJ0PR13MB575532A88E75738299CB1636FEB49@SJ0PR13MB5755.namprd13.prod.outlook.com>
From:   =?UTF-8?Q?S=c3=b6nke_Huster?= <soenke.huster@eknoes.de>
Subject: Re: Linux v5.4.199: Bluetooth: hci_event: Ignore multiple conn
 complete events
In-Reply-To: <SJ0PR13MB575532A88E75738299CB1636FEB49@SJ0PR13MB5755.namprd13.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: BAYES_HAM(-0.087143) MIME_GOOD(-0.1)
X-Rspamd-Score: -0.187143
Received: from unknown (HELO unkown) (::1)
        by giacobini.uberspace.de (Haraka/2.8.28) with ESMTPSA; Wed, 29 Jun 2022 08:33:44 +0200
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        MSGID_FROM_MTA_HEADER,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi John,

On 25.06.22 00:46, John Klug wrote:
> This patch updated for the 5.4.199 kernel on Friday, 24 June 2022 by
> John Klug <john.klug@multitech.com>

Thanks for backporting! I do not know how the process is for backporting patches to stable releases - do you need my Tested-by or Reviewed-by or similar? I'll test it in the afternoon.

Furthermore, I think it must go to stable, and there seem to be some guidance how that works over here:
https://www.kernel.org/doc/html/v4.17/process/stable-kernel-rules.html#option-3

Best
Sönke
