Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFB6378CF68
	for <lists+linux-bluetooth@lfdr.de>; Wed, 30 Aug 2023 00:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236745AbjH2WRk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 29 Aug 2023 18:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238591AbjH2WR0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 29 Aug 2023 18:17:26 -0400
Received: from javispedro.com (javispedro.com [IPv6:2001:41d0:401:3000::34c4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BCA194
        for <linux-bluetooth@vger.kernel.org>; Tue, 29 Aug 2023 15:17:23 -0700 (PDT)
Received: from [2a01:cb15:804c:e300:8337:b625:5964:c1be]
        by javispedro.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <dev.git@javispedro.com>)
        id 1qb71U-003N8F-3Z; Wed, 30 Aug 2023 00:17:20 +0200
Message-ID: <fbcbbac9-5507-da1f-aae7-9ed368d9ed65@javispedro.com>
Date:   Wed, 30 Aug 2023 00:17:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH BlueZ] shared/gatt-client: Fix not sending confirmations
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org
References: <20230828175553.518129-1-luiz.dentz@gmail.com>
Content-Language: en-US
From:   Javier de San Pedro <dev.git@javispedro.com>
In-Reply-To: <20230828175553.518129-1-luiz.dentz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

El 28/8/23 a las 19:55, Luiz Augusto von Dentz escribió:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> Commit fde32ff9c9c0 ("shared/gatt-client: Allow registering with NULL
> callback") added an early return to the notify_cb function when the
> current client's notify_list is empty which prevents sending
> confirmations to indications.

Thanks, confirming your patch also works for me.

Javier.
