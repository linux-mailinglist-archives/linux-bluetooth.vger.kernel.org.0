Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56F525068EB
	for <lists+linux-bluetooth@lfdr.de>; Tue, 19 Apr 2022 12:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242306AbiDSKok convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 19 Apr 2022 06:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242585AbiDSKoh (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 19 Apr 2022 06:44:37 -0400
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C999122526
        for <linux-bluetooth@vger.kernel.org>; Tue, 19 Apr 2022 03:41:55 -0700 (PDT)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 19325CDD49
        for <linux-bluetooth@vger.kernel.org>; Tue, 19 Apr 2022 10:33:30 +0000 (UTC)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 982FE24000D;
        Tue, 19 Apr 2022 10:33:25 +0000 (UTC)
Message-ID: <7222b71167dd3ec90d7b4ad1b12b6179cc95f94d.camel@hadess.net>
Subject: Re: [PATCH v2 BlueZ 3/3] build: Make use of StateDirectory and
 ConfigurationDirectory
From:   Bastien Nocera <hadess@hadess.net>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org
Date:   Tue, 19 Apr 2022 12:33:24 +0200
In-Reply-To: <20220415223049.1155838-3-luiz.dentz@gmail.com>
References: <20220415223049.1155838-1-luiz.dentz@gmail.com>
         <20220415223049.1155838-3-luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Fri, 2022-04-15 at 15:30 -0700, Luiz Augusto von Dentz wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This makes use of StateDirectory[1] and ConfigurationDirectory[1] to
> inform systemd what those paths are used for instead of using
> ReadWritePaths and ReadOnlyPaths which can lead to issues.
> 
> Fixes: https://github.com/bluez/bluez/issues/329

FYI, my reviews on those patches are at:
https://github.com/bluez/bluez/issues/329#issuecomment-1102459104

Cheers
