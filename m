Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8AA857DB60
	for <lists+linux-bluetooth@lfdr.de>; Fri, 22 Jul 2022 09:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234424AbiGVHgL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 22 Jul 2022 03:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233842AbiGVHgJ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 22 Jul 2022 03:36:09 -0400
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871B86B247
        for <linux-bluetooth@vger.kernel.org>; Fri, 22 Jul 2022 00:36:06 -0700 (PDT)
Received: from [192.168.0.2] (ip5f5aeb44.dynamic.kabel-deutschland.de [95.90.235.68])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 14FB561EA192A;
        Fri, 22 Jul 2022 09:36:04 +0200 (CEST)
Message-ID: <8ad3f309-b691-508d-537b-b997a2613bcd@molgen.mpg.de>
Date:   Fri, 22 Jul 2022 09:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v2] Bluetooth: MGMT: Fix helding hci_conn reference while
 command is queued
Content-Language: en-US
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <20220722002600.632792-1-luiz.dentz@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20220722002600.632792-1-luiz.dentz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear Luiz,


Thank you for the patch.

I’d write holding instead of helding in the commit message summary.


Kind regards,

Paul
