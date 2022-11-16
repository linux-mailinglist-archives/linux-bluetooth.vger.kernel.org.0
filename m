Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66B6762C27A
	for <lists+linux-bluetooth@lfdr.de>; Wed, 16 Nov 2022 16:27:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbiKPP1U (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 16 Nov 2022 10:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234653AbiKPP1T (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 16 Nov 2022 10:27:19 -0500
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D761C10B4F
        for <linux-bluetooth@vger.kernel.org>; Wed, 16 Nov 2022 07:27:17 -0800 (PST)
Received: from [10.16.7.85] (hh-wlan-02.rz-berlin.mpg.de [141.14.51.18])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5DC8161EA1931;
        Wed, 16 Nov 2022 16:27:16 +0100 (CET)
Message-ID: <3327fd61-b414-1f4e-d716-da0ad1355c02@molgen.mpg.de>
Date:   Wed, 16 Nov 2022 16:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hci_event: handling CIS QoS
Content-Language: en-US
To:     Abhay Maheta <abhay.maheshbhai.maheta@intel.com>
Cc:     luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org
References: <20221116143334.4990-1-abhay.maheshbhai.maheta@intel.com>
From:   Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20221116143334.4990-1-abhay.maheshbhai.maheta@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Please Abhav,


Thank you for the patch.

Am 16.11.22 um 15:33 schrieb Abhay Maheta:
> This sets QoS on CIS connction establishement.

Two typos: connection, establishment

Please extend the commit message with a problem description, and how you 
tested the fix.


Kind regards,

Paul
