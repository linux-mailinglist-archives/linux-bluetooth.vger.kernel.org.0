Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C02C52E484
	for <lists+linux-bluetooth@lfdr.de>; Fri, 20 May 2022 07:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244615AbiETFsK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 20 May 2022 01:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235491AbiETFsH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 20 May 2022 01:48:07 -0400
X-Greylist: delayed 6890 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 19 May 2022 22:48:05 PDT
Received: from eddatermay.munkorgen.com (eddatermay.munkorgen.com [193.233.182.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2EF14B64B
        for <linux-bluetooth@vger.kernel.org>; Thu, 19 May 2022 22:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=munkorgen.com;
 h=Reply-To:From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding; i=sam.eas@munkorgen.com;
 bh=Xzhs2KcU3pB3MvMue/r/YOQvLMY=;
 b=K1igssIw+jarYQ3Upl3AwWEbjg9jYBdaMerttitihEF2BOxXHBHqRRcz4Sx1SbLeRHKr7N2/42ug
   AY7xm+2EZYVvlMf4R/JGwtLv/44nf8JFUxf+A02AN5ojoNoNxd1BAs5ap2zd9PAFO+EeYbgRRVd0
   YNCFmkGTKEjpI94x/VkDR6tY6XeYxyWyfvhpU6DJCDQrO81CmdnEdX6S6fFakIJ7KvFZNbUysfUv
   MT6eW51TdmnBveZNOiQdbV8lCo/ygqfSd5JlATpI7nLaQxhrQlxiaebpNBcOzikQvDBt2g0kG0fl
   F5J3++bDmmQRX7hb+G3koXUbOjI3aU7sG8gRpg==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=munkorgen.com;
 b=arLDsbJjwJmZwcT9Nta1Jly64b97fje3m0/MaAGGajnts7yY1hY45MhRfxFTZbC5S7JejZqRJ+XA
   yA+ySSwxFtYMVZgU7v8rHNCp1oEo5kBSPKZ4UOBzuCDmrKorGNF6cOiz2a4PbiXCVwGu8TFYckss
   aEvepb2gI24IvjgSMDFYU16PpQpxvqfV0hxdDcVAeEVTyCHNmdXRe7Mvg8YIAhbvlXRAKbPaE2rc
   jTK2Ug2k6Q/sfXqaGXTFinXn53+HtD8usMQWdIWDkxgHpuaihOFUw1VJdKPA2CnYIyWGc8l6MgVS
   FaKz3rkiSvlASu6UjxW7zNNYd0czlGd3TQMJ4Q==;
Reply-To: me.mayvaz@gmail.com
From:   Mustafa Ayvaz <sam.eas@munkorgen.com>
To:     linux-bluetooth@vger.kernel.org
Subject: RE: PARTNERSHIP
Date:   20 May 2022 05:53:12 +0200
Message-ID: <20220520055312.1A02E497071D7DE9@munkorgen.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.9 required=5.0 tests=BAYES_99,BAYES_999,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FORGED_REPLYTO,RCVD_IN_BL_SPAMCOP_NET,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  1.3 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in
        *      bl.spamcop.net
        *      [Blocked - see <https://www.spamcop.net/bl.shtml?193.233.182.80>]
        *  0.2 BAYES_999 BODY: Bayes spam probability is 99.9 to 100%
        *      [score: 1.0000]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 1.0000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Good day linux-bluetooth,

I was wondering if you got my previous email on partnership for=20
mutual benefits? I tried to reach you through email earlier,=20
kindly get back to me swiftly. It is very important.

Thank you.
Mustafa Ayvaz.
