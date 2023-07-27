Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7D57644C7
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 Jul 2023 06:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjG0EOg (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 27 Jul 2023 00:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjG0EOd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 27 Jul 2023 00:14:33 -0400
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F272626B8
        for <linux-bluetooth@vger.kernel.org>; Wed, 26 Jul 2023 21:14:31 -0700 (PDT)
Received: from [192.168.0.2] (ip5f5ae953.dynamic.kabel-deutschland.de [95.90.233.83])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id E6C1361E5FE01;
        Thu, 27 Jul 2023 06:14:24 +0200 (CEST)
Message-ID: <cf4bc7af-085b-a7aa-88a0-b27a61e52187@molgen.mpg.de>
Date:   Thu, 27 Jul 2023 06:14:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
From:   Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH RFC 1/6] Bluetooth: hci_conn: hci_conn_cleanup is not
 needed, combine with del
To:     Pauli Virtanen <pav@iki.fi>
References: <cover.1690399379.git.pav@iki.fi>
 <30c5e6a7dc62ce209a2b9916fe8b2579d1b27756.1690399379.git.pav@iki.fi>
Content-Language: en-US
Cc:     linux-bluetooth@vger.kernel.org
In-Reply-To: <30c5e6a7dc62ce209a2b9916fe8b2579d1b27756.1690399379.git.pav@iki.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear Pauli,


Thank you for your patch.

You might want to make the commit message summary a statement about the 
action. Maybe:

Combine unneeded hci_conn_cleanup() with hci_conn_del()

Am 26.07.23 um 23:25 schrieb Pauli Virtanen:
> hci_conn_cleanup is no longer needed, so move the code back to

Why is it no longer needed?

> hci_conn_del to keep the hci_conn teardown in a single place.
> 
> This undoes commit b958f9a3e877 ("Bluetooth: Fix reference counting for
> LE-scan based connections"), but keeps the current order of cleanup
> operations.
> 
> Signed-off-by: Pauli Virtanen <pav@iki.fi>
> ---
>   net/bluetooth/hci_conn.c | 78 +++++++++++++++++-----------------------
>   1 file changed, 33 insertions(+), 45 deletions(-)

[…]


Kind regards,

Paul
