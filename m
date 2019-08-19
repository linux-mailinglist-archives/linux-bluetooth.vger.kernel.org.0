Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB21194A7D
	for <lists+linux-bluetooth@lfdr.de>; Mon, 19 Aug 2019 18:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfHSQiD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 19 Aug 2019 12:38:03 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:36591 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfHSQiD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 19 Aug 2019 12:38:03 -0400
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 59224100003;
        Mon, 19 Aug 2019 16:38:01 +0000 (UTC)
Message-ID: <5ff510e995cc0e97645c8dc9bb77a64c15886d9d.camel@hadess.net>
Subject: Re: BT advertising packets and s2idle issue
From:   Bastien Nocera <hadess@hadess.net>
To:     Mario.Limonciello@dell.com, ckellner@redhat.com,
        linux-bluetooth@vger.kernel.org
Date:   Mon, 19 Aug 2019 18:37:59 +0200
In-Reply-To: <3d106f2c49514f4db2d418d8b7ad8b3e@AUSX13MPC101.AMER.DELL.COM>
References: <87sgqoewqv.fsf@kellner.me>
         <ccb1c793a9094d3d9cac1c63b695d5e5@AUSX13MPC105.AMER.DELL.COM>
         <3d106f2c49514f4db2d418d8b7ad8b3e@AUSX13MPC101.AMER.DELL.COM>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Mon, 2019-08-19 at 13:37 +0000, Mario.Limonciello@dell.com wrote:
> > 
<snip>
> Another approach to this may be to submit a revert to the kernel for
> this commit:
> https://github.com/torvalds/linux/commit/a0085f2510e8976614ad8f766b209448b385492f
> until LE privacy support is in place.
> 
> This seems a regression to me that the system wakes up from any BLE
> traffic after that commit.

You should send a revert and CC: the original author and committer on
it, otherwise I'm afraid that it might not get traction.

Cheers

