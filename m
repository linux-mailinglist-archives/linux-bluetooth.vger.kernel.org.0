Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9CAF7641EA
	for <lists+linux-bluetooth@lfdr.de>; Thu, 27 Jul 2023 00:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjGZWMS (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 26 Jul 2023 18:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjGZWMS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 26 Jul 2023 18:12:18 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AD76271C
        for <linux-bluetooth@vger.kernel.org>; Wed, 26 Jul 2023 15:12:16 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1b8b4749013so2304935ad.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 26 Jul 2023 15:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690409536; x=1691014336;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ9ezzsPlk2BgEwn4Mpaj5PPINHvEwuSj4QWBu2zWXQ=;
        b=fOnjgnJxPmX15CeNuhpOUlo0KkTaRPKupbn79CilkXebwgwTn0O9p1Wn9snzUFkBxn
         OQ0b8XP93bH0BZdcF5MLUBJr4g95DZz/h3dao0yoWPEdoc2p0mlcKGBUNbKaeXplWe9s
         Dpp5nhFjc062VTNfGkauo2Fj/YWlOPT04kIlpIyCuhMM0fBJA7hKmL7uGtVmRkIYSHnj
         iD4wGN/XWmcWeB/l/+zdiKLfN+QnY6TKKwPVXSnGwGPhkhHIHv09r0K1PUNJcmZB/snO
         r9ojY6HMPqJdkfaLkaFXvxGG5+RVH28eJNo6jK5S03wpbXECR416FOpnUB9/b8nNYs2R
         poYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690409536; x=1691014336;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CQ9ezzsPlk2BgEwn4Mpaj5PPINHvEwuSj4QWBu2zWXQ=;
        b=OeB1gqVyWnrr4NvDnq9imATQzoGEvPqe1oK42RQns+pUUWVhz6aenrUZA9fYf4OTRG
         ERGRMehE2uoPDT/0SjFtywZ1UZrZeEbWuXCTOnDC521pplVuQEgRxQFlRXrP3vpnVn0d
         58jyIS9UpqpcPWcaXU1nlcdxSFYvTxC9Rb/CtICRi4Ajp1y9yfMbb3cv+XroDoietrgW
         M+nYmcab6c0N3iPAeVIVV21BqRjaCi/A/mJAFwjmWwBVx9yjBMJseIJXWbzwkQPMHoMt
         PLq8TUErzLos6LGxAmqDUKvcE76t2/DGJC9vSCqQx43sxSIjuxGJnmoK8WIEeIqfNbd3
         yCsA==
X-Gm-Message-State: ABy/qLa7x8XDdwrBCmj+xbXCCu2j7Br6I+1sH74wcEGS4SAC6JzEVO58
        IvCiC+hQChOc7XLKeDFwpnUvzNCelOY=
X-Google-Smtp-Source: APBJJlHe+UwUyZ1jiKH8dVDQI3Wt0nlOtNrZIFzAv5TvREcsFk3+oSiRUv+kpoJ3GOXjJQnXI3SR4A==
X-Received: by 2002:a17:902:8d81:b0:1bb:1504:b659 with SMTP id v1-20020a1709028d8100b001bb1504b659mr2655766plo.40.1690409535677;
        Wed, 26 Jul 2023 15:12:15 -0700 (PDT)
Received: from [172.17.0.2] ([13.86.156.32])
        by smtp.gmail.com with ESMTPSA id g8-20020a1709029f8800b001a80ad9c599sm17141plq.294.2023.07.26.15.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 15:12:15 -0700 (PDT)
Message-ID: <64c19a3f.170a0220.d5536.00a7@mx.google.com>
Date:   Wed, 26 Jul 2023 15:12:15 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============0461381495644910862=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, svenpavel@gmail.com
Subject: RE: Bluetooth: btusb: Support one more MediaTek 7922 VID/PID
In-Reply-To: <20230726215040.17827-1-svenpavel@gmail.com>
References: <20230726215040.17827-1-svenpavel@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============0461381495644910862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is an automated email and please do not reply to this email.

Dear Submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While preparing the CI tests, the patches you submitted couldn't be applied to the current HEAD of the repository.

----- Output -----

error: patch failed: drivers/bluetooth/btusb.c:628
error: drivers/bluetooth/btusb.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch

Please resolve the issue and submit the patches again.


---
Regards,
Linux Bluetooth


--===============0461381495644910862==--
