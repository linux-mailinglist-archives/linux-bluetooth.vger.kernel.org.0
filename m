Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50E0C62DDCB
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Nov 2022 15:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240313AbiKQOTG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Nov 2022 09:19:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240327AbiKQOTF (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Nov 2022 09:19:05 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A67640F
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Nov 2022 06:19:02 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id E269B240003;
        Thu, 17 Nov 2022 14:18:59 +0000 (UTC)
Message-ID: <a677f489aa1c0d1c6723761b521d5f65b5d89401.camel@hadess.net>
Subject: Re: [PATCH BlueZ v7 6/6] adapter: Remove experimental flag for
 PowerState
From:   Bastien Nocera <hadess@hadess.net>
To:     Jonas =?ISO-8859-1?Q?Dre=DFler?= <jonas@dressler.it>,
        linux-bluetooth@vger.kernel.org, luiz.von.dentz@intel.com
Date:   Thu, 17 Nov 2022 15:18:59 +0100
In-Reply-To: <02bf340b-c908-6ee8-ca78-4203b965f3b5@dressler.it>
References: <20220901110719.176944-1-hadess@hadess.net>
         <20220901110719.176944-6-hadess@hadess.net>
         <02bf340b-c908-6ee8-ca78-4203b965f3b5@dressler.it>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.0 (3.46.0-2.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Sun, 2022-11-13 at 16:54 +0100, Jonas Dreßler wrote:
> Hi everyone,
> 
> Can we please apply this one, too? The property being experimental
> means distros
> need to downstream patch BlueZ for the feature to work, I'm not sure
> all packagers
> are aware of that.

I enabled it without the experimental flag in Fedora, because I wrote
it, and I know I'll be responsible for it should there be any bugs.

I really don't want to be on the spot for fixing a problem upstream, or
in another distribution if another distribution enables the feature
without testing it, or responsible for fixing their libraries should we
decide that the API isn't good enough.

> FWIW, I can confirm the feature in gnome-shell works after removing
> the flag!
