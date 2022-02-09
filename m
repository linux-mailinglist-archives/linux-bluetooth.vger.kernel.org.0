Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3F84AE958
	for <lists+linux-bluetooth@lfdr.de>; Wed,  9 Feb 2022 06:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbiBIFdy (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 9 Feb 2022 00:33:54 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:46254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233689AbiBIFS6 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 9 Feb 2022 00:18:58 -0500
X-Greylist: delayed 183 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 21:18:56 PST
Received: from xtrwkthc.outbound-mail.sendgrid.net (unknown [167.89.23.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E550C03BFFE
        for <linux-bluetooth@vger.kernel.org>; Tue,  8 Feb 2022 21:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fw-mail.com;
        h=subject:from:mime-version:reply-to:to:content-type:
        content-transfer-encoding;
        s=s1; bh=mQJ9UQi/vJSE2jCWHdHEEwVDmWVCEmHpNCfFo1wisw0=;
        b=YoaK3uGCE08onqxz1fIKPNEI4beOtKPaP5la9n0i2lFohS42o9sOK0mDS1kxwJ9/lQxM
        uP3ni6jrvkRvws2NQ5ILK/4curw9l7lOdmD6M1zXmrKY2HX13XqDouN1I5Hce1cBwfu8Lx
        zRRWvEclqUyf0o8bGsf3AdvpQX3uL5fF2H7V9aqstzAfE3x5f57bHtBGY4y/qEFcErYXEe
        ZBUQ/j2GmdXrocPXpZIkhwF41/XQ//DGjeIeWGaZ/jifHH/vI2sY0TLQ1ExDRLfvq1RUSi
        pSzLKb3Oq+S511rAw9cOzlzp3wFgIzp60ztKso40FKnxstFkVex/BgMO1K3MiREQ==
Received: by filterdrecv-7bf5c69d5-vrdq9 with SMTP id filterdrecv-7bf5c69d5-vrdq9-1-62034E07-3B
        2022-02-09 05:15:51.858510724 +0000 UTC m=+13848947.714723903
Received: from fw123949.localdomain (unknown)
        by geopod-ismtpd-3-1 (SG)
        with ESMTP id sUgZYpUmQ4GhEYEOqP3q2A
        for <linux-bluetooth@vger.kernel.org>;
        Wed, 09 Feb 2022 05:15:51.575 +0000 (UTC)
Received: by fw123949.localdomain (Postfix, from userid 998)
        id 6ED06BD5AE; Wed,  9 Feb 2022 05:15:51 +0000 (UTC)
X-Spam-Level: *****
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_95,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_MSPIKE_H2,SHORT_SHORTNER,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
Received: from fw123949 (localhost [127.0.0.1])
        by fw123949.localdomain (Postfix) with SMTP id 0D099BDC92
        for <linux-bluetooth@vger.kernel.org>; Wed,  9 Feb 2022 05:15:45 +0000 (UTC)
Subject: Mixed Freight "[your-subject]"
Date:   Wed, 09 Feb 2022 05:15:51 +0000 (UTC)
From:   Mixed Freight <wordpress@mixedfreight.com>
Message-ID: <cKxtSqQVhhG0gSy0WostyIuxOvkKn5azUVpxZGlqc@www.mixedfreight.com>
X-Mailer: PHPMailer 6.5.0 (https://github.com/PHPMailer/PHPMailer)
MIME-Version: 1.0
Reply-To: dwayne@digital360.mobi
X-SG-EID: =?us-ascii?Q?jumCh1ehWCMyaDLJ9In2nCsbpUwfQ5GSMOhzYnHTyWQhoMxBDmlenmc2kx6zPX?=
 =?us-ascii?Q?fP8NlTRtqQqVhVAvG5WvCUH8x2wUGq0xUThpVbk?=
 =?us-ascii?Q?63x1R+OP7sAtw6h4KRps9O3QhPKanzCK45rQ64=2F?=
 =?us-ascii?Q?CRy1uZYIqxUnv7=2Fie9Qh+xSgz2LJAYQN7VArR+h?=
 =?us-ascii?Q?frTvjPOUvIKnURmifvRL7DeK4xsk4WqqiqyX3+V?=
 =?us-ascii?Q?MU1D6GL4qV9m5SmpJQmRjX9xGYu20TPBAIXxKhM?=
 =?us-ascii?Q?Q8s5vc5X7kMPt0+UEO4Ag=3D=3D?=
X-SG-ID: =?us-ascii?Q?N2C25iY2uzGMFz6rgvQsb8raWjw0ZPf1VmjsCkspi=2FIVy1Wk0DfJfDJiWxWC7D?=
 =?us-ascii?Q?XK2GZrxUUFU6ugrPp5Mgr7HoKwCtTS5FVs=2Fxka+?=
 =?us-ascii?Q?qJeNwCiP+92NjDfbfmbdt21ZQFHnGXG7yOfFeeZ?=
 =?us-ascii?Q?tFdhi6umLg=3D=3D?=
To:     linux-bluetooth@vger.kernel.org
X-Entity-ID: O05F/WTL8PQsczgrO7GEiQ==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Report: *  3.0 BAYES_95 BODY: Bayes spam probability is 95 to 99%
        *      [score: 0.9610]
        * -0.0 RCVD_IN_MSPIKE_H2 RBL: Average reputation (+2)
        *      [167.89.23.12 listed in wl.mailspike.net]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
        *      mail domains are different
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.0 SHORT_SHORTNER Short body with little more than a link to a
        *      shortener
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi, ❤️ Victoria want to meet you! Click Here: https://clck.ru/auXR9?li26u ❤️

We have received your message successfully, Our team will back to you as soon as possible.

Thank you.
Mixed Freight
