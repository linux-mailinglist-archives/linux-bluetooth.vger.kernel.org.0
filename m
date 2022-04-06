Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0304F685C
	for <lists+linux-bluetooth@lfdr.de>; Wed,  6 Apr 2022 19:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239921AbiDFR60 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 6 Apr 2022 13:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240137AbiDFR5x (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 6 Apr 2022 13:57:53 -0400
Received: from mail.pelzflorian.de (pelzflorian.de [5.45.111.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FEE174E80
        for <linux-bluetooth@vger.kernel.org>; Wed,  6 Apr 2022 09:08:43 -0700 (PDT)
Received: from pelzflorian.localdomain (unknown [5.45.111.108])
        by mail.pelzflorian.de (Postfix) with ESMTPSA id 75858360631
        for <linux-bluetooth@vger.kernel.org>; Wed,  6 Apr 2022 18:08:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pelzflorian.de;
        s=mail; t=1649261321;
        bh=yqakA5XRJ8Hh3qojYpmakV+31cpA3N86w6veQDfeVd0=;
        h=Date:From:To:Subject:References:In-Reply-To;
        b=J55NGyAuK6CGkI2kmOt9BimfqmOHd1YRxQaqdS6nacPsS/2YmfsU3GQLR7L7hI5Op
         xJjufcNRKubKvsUvZlRVKNZW08OZ7vhACvSKAKNGHwcUXnoy2b2O1AriRDs/9axHaF
         1vp606Q5GbEuLRG5+yjXm4elvmtuuFp1kQz04CPE=
Date:   Wed, 6 Apr 2022 18:08:32 +0200
From:   "pelzflorian (Florian Pelz)" <pelzflorian@pelzflorian.de>
To:     linux-bluetooth@vger.kernel.org
Subject: Re: [v2] main: Remove unused main.conf option NameResolving
Message-ID: <20220406160832.y5mw64ey45donzew@pelzflorian.localdomain>
References: <20220406084357.iai4k6jvg6gnnbyi@pelzflorian.localdomain>
 <624da59d.1c69fb81.2e0bd.0aa2@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <624da59d.1c69fb81.2e0bd.0aa2@mx.google.com>
X-Spam-Status: No, score=1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,DOS_RCVD_IP_TWICE_B,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, Apr 06, 2022 at 07:37:17AM -0700, bluez.test.bot@gmail.com wrote:
> WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '826023de5689', maybe rebased or not pulled?
> #49: 
> Commit 826023de5689 ("core: Create devices dynamically during

This patch is for BlueZ, not Linux.
