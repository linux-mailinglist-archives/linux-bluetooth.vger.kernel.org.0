Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23FB45A466E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 29 Aug 2022 11:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiH2JtT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 29 Aug 2022 05:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiH2JtS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 29 Aug 2022 05:49:18 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D562D1C0
        for <linux-bluetooth@vger.kernel.org>; Mon, 29 Aug 2022 02:49:17 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id A8514E0002;
        Mon, 29 Aug 2022 09:49:15 +0000 (UTC)
Message-ID: <3dd715a9d8b30ccb6dce4d4e1e034cf8d0458d44.camel@hadess.net>
Subject: Re: What could cause pairing to fail when bluetoothctl is not
 running?
From:   Bastien Nocera <hadess@hadess.net>
To:     John Klug <John.Klug@multitech.com>,
        Linux-Bluetooth MailingList <linux-bluetooth@vger.kernel.org>
Date:   Mon, 29 Aug 2022 11:49:15 +0200
In-Reply-To: <SJ0PR13MB5755709642FB995921E6F68CFE759@SJ0PR13MB5755.namprd13.prod.outlook.com>
References: <SJ0PR13MB5755C6DDC8E269258C410586FE709@SJ0PR13MB5755.namprd13.prod.outlook.com>
         <SJ0PR13MB5755709642FB995921E6F68CFE759@SJ0PR13MB5755.namprd13.prod.outlook.com>
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

On Fri, 2022-08-26 at 22:43 +0000, John Klug wrote:
> Maybe I need to create a pairing AgentManager, even though I don't
> use one?

You need a pairing agent otherwise all pairing attempts will be
rejected. This is a security feature.

The bluez-tools at:
https://github.com/khvzak/bluez-tools
can help if you want to automate pairing without writing new code (or
to experiment).
