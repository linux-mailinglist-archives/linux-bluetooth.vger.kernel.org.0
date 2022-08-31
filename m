Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B7F5A7C40
	for <lists+linux-bluetooth@lfdr.de>; Wed, 31 Aug 2022 13:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiHaLgf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 31 Aug 2022 07:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiHaLge (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 31 Aug 2022 07:36:34 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB197A7237
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 Aug 2022 04:36:32 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 33A981C0011
        for <linux-bluetooth@vger.kernel.org>; Wed, 31 Aug 2022 11:36:30 +0000 (UTC)
Message-ID: <77f437c81585829cc800379ee1fd3096ece092ac.camel@hadess.net>
Subject: Re: [BlueZ,v4,1/6] adapter: Keep track of whether the adapter is
 rfkill'ed
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-bluetooth@vger.kernel.org
Date:   Wed, 31 Aug 2022 13:36:30 +0200
In-Reply-To: <630f3693.c80a0220.658dc.628a@mx.google.com>
References: <20220831091912.47894-1-hadess@hadess.net>
         <630f3693.c80a0220.658dc.628a@mx.google.com>
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

On Wed, 2022-08-31 at 03:23 -0700, bluez.test.bot@gmail.com wrote:
> This is automated email and please do not reply to this email!
> 
> Dear submitter,
> 
> Thank you for submitting the patches to the linux bluetooth mailing
> list.
> This is a CI test results with your patch series:
> PW
> Link:https://patchwork.kernel.org/project/bluetooth/list/?series=6727
> 64
> 
> ---Test result---
> 
> Test Summary:
> CheckPatch                    FAIL      9.12 seconds

All those should be fixed in v5.
