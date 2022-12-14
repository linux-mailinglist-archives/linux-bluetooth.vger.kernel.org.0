Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D466164C5A3
	for <lists+linux-bluetooth@lfdr.de>; Wed, 14 Dec 2022 10:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbiLNJN5 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 14 Dec 2022 04:13:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbiLNJNz (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 14 Dec 2022 04:13:55 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6F36587
        for <linux-bluetooth@vger.kernel.org>; Wed, 14 Dec 2022 01:13:53 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 543FA1BF205;
        Wed, 14 Dec 2022 09:13:52 +0000 (UTC)
Message-ID: <f55ffe12286895920ff43916b3f715375a5950bc.camel@hadess.net>
Subject: Re: [PATCH BlueZ 1/3] client/player: Make transport.send
 non-blocking
From:   Bastien Nocera <hadess@hadess.net>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org
Date:   Wed, 14 Dec 2022 10:13:51 +0100
In-Reply-To: <20221214002129.2105777-1-luiz.dentz@gmail.com>
References: <20221214002129.2105777-1-luiz.dentz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, 2022-12-13 at 16:21 -0800, Luiz Augusto von Dentz wrote:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> This makes transport.send command non-blocking by using timerfd
> callback to initiate the transfers.

This might be more elegantly done using a GMainLoop from glib, or if
there's still this bizarre aversion to glib, implemented like glib's
timeout functions.

https://docs.gtk.org/glib/func.timeout_add.html

Cheers
