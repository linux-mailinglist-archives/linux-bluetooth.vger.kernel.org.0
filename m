Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F7D25A2700
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Aug 2022 13:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245568AbiHZLoN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 26 Aug 2022 07:44:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiHZLoM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 26 Aug 2022 07:44:12 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB760D2B04
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 Aug 2022 04:44:11 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id C91B6FF803
        for <linux-bluetooth@vger.kernel.org>; Fri, 26 Aug 2022 11:44:09 +0000 (UTC)
Message-ID: <75d7a9e5eb2a1025c7a353016d6173e91c989560.camel@hadess.net>
Subject: Re: [v3] adapter: Implement PowerState property
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Date:   Fri, 26 Aug 2022 13:44:09 +0200
In-Reply-To: <6308a0a8.170a0220.879ef.1fff@mx.google.com>
References: <20220826101509.124704-1-hadess@hadess.net>
         <6308a0a8.170a0220.879ef.1fff@mx.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.4 (3.44.4-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Fri, 2022-08-26 at 03:30 -0700, bluez.test.bot@gmail.com wrote:
> This is an automated email and please do not reply to this email.
> 
> Dear Submitter,
> 
> Thank you for submitting the patches to the linux bluetooth mailing
> list.
> While preparing the CI tests, the patches you submitted couldn't be
> applied to the current HEAD of the repository.
> 
> ----- Output -----
> error: patch failed: src/adapter.c:643
> error: src/adapter.c: patch does not apply
> hint: Use 'git am --show-current-patch' to see the failed patch

I don't understand why this fails.
