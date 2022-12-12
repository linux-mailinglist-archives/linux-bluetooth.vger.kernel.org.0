Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16AE264A0E9
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Dec 2022 14:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbiLLNcr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 12 Dec 2022 08:32:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbiLLNco (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 12 Dec 2022 08:32:44 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E3DF70
        for <linux-bluetooth@vger.kernel.org>; Mon, 12 Dec 2022 05:32:40 -0800 (PST)
Received: (Authenticated sender: arthur@marmottus.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 80A36100008;
        Mon, 12 Dec 2022 13:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
        s=gm1; t=1670851959;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=2RY7cTrhQEgwdw5WQfvViwhomUucV8XI0mr8amJIJlo=;
        b=hFJ/EMzXAkvMgpyoP/AWq/cYRXfHBdmCW7QY/HfZ2NMPI2RgIV3l2ui1F2fF2wC6kvGDNr
        9/rbT4kQ1gKfYsMp/KqfTtCMYSI0qVx+U/JLlmyKIkhCSobdxt8sgROq5fid0AOuvUVD3E
        r395DLwcujhhyOSQ9RRJP+A9EYEr0c0WyO1lkvMWgU5/aod48nNLGTT3qfMqFBrbr7B1A5
        I2DBLkLKUvmvM1iadFqMaHFj2ABkknUSQ8OUyqZCfxI0r3ooMPindfAhxV5WJMSf1ULJy1
        K0kIQDplIfnp2cioop83Q9p1QAnjwoFoOU/Zu/EeN7Ed64dSDoQPX6iH4WEktQ==
From:   Arthur Crepin-Leblond <arthur@marmottus.net>
To:     linux-bluetooth@vger.kernel.org
Cc:     Arthur Crepin-Leblond <arthur@marmottus.net>
Subject: [PATCH BlueZ 0/1] Expose the disconnect reason over D-Bus
Date:   Mon, 12 Dec 2022 14:32:34 +0100
Message-Id: <20221212133235.79657-1-arthur@marmottus.net>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

I am trying to expose the device disconnect reason over D-Bus and the
most elegant way I found was to subscribe to the adapter notify
callback that gives the reason as an argument.

Arthur Crepin-Leblond (1):
  device: Expose the disconnect reason over D-Bus

 src/device.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

-- 
2.38.1

