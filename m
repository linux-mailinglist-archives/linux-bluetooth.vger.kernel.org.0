Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F30C550022
	for <lists+linux-bluetooth@lfdr.de>; Sat, 18 Jun 2022 00:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237569AbiFQWqL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 17 Jun 2022 18:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244720AbiFQWqK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 17 Jun 2022 18:46:10 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 423125F258
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jun 2022 15:46:10 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id o137-20020a4a2c8f000000b0041ba4b996b6so1028307ooo.3
        for <linux-bluetooth@vger.kernel.org>; Fri, 17 Jun 2022 15:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:subject:reply-to:from:to:in-reply-to
         :references;
        bh=IYZRMEYfOlIWw5glnoJsDzGViWTLnH4hPiDGcp4S+54=;
        b=QPIF1Z1EDPpv4z4cMEad6twnZHChrhP/c5VCWlv2nOcyu7gaCYRdC5DmSKYYHFeoqi
         cfTnDzbIaUL2VSjrLrX7ln3t/+NoWWgZGwk3dv/fMztU1Kj1vOY8eh+DVlCQFLcqNpqC
         4XJnE1OTq515Gh1s3l21IhumRJetxswPwSghgmskbfBD5ZIqKIVYoHy/o1o4WcpuPBFh
         HDoym0RvnXs5IKdCa5zgBz5QGie4Bur5OcCaPsfRKVr0/BcGgJB+E5e85z5PaxYBINE/
         AC4MzN3fSSD96sYy4wOKsHbHogqfIZttyh/V93KGp7630dg+3vqLVdBtUf6Uf5wVn+G4
         Y6nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:subject:reply-to
         :from:to:in-reply-to:references;
        bh=IYZRMEYfOlIWw5glnoJsDzGViWTLnH4hPiDGcp4S+54=;
        b=wjUxtOSEA7e99wTZKKU5gUnJ7+Rck0tsxG6Of4j3kqXPfpOxw9uW2UC1iZt6JpcwWD
         GPjeRAY0SF7xyYhF782Q8d9azDCXuZkxPvT7Y6fGi2h/a2OjLxK2xzCylX+Q+eImoqhk
         8yk/3Sqhq95/xma5kfVEenGO5PXvFDN2cWhI1bY5QWf7c1/xqQrCCcdzWCh0I1e7dkhw
         egSU0CNXIG7UwoChi0VPL9ZVbTAdULrul8nDNhRV8p1pcD7qN1XEdioHd/PHrOLSXUKS
         d+IPLLyuZBDNws8olWITopEX+AqxtdA0fHlLZCjAk/Yr2z8pkVP3/HnVSRB7w1SdWK+o
         kcLQ==
X-Gm-Message-State: AJIora/kajnsVC8+wBxkuIQbIXYUR2fO1WiUd6ojzvNrsi0E/DFEnkrI
        R0/Pu4kHrW+zowTvlKPfkavaQ8gYb1A=
X-Google-Smtp-Source: AGRyM1tcy1L9VBW3c2kUzFwPnsk4YHFCz0PytQfYt+caPjSOrmkVJazmVpMwKJAJ7RuFty9oc76ndA==
X-Received: by 2002:a4a:b818:0:b0:41b:e634:f90a with SMTP id g24-20020a4ab818000000b0041be634f90amr4775826oop.28.1655505969434;
        Fri, 17 Jun 2022 15:46:09 -0700 (PDT)
Received: from [172.17.0.2] ([20.225.132.56])
        by smtp.gmail.com with ESMTPSA id k6-20020a056870a4c600b00101b3c76674sm1202358oal.26.2022.06.17.15.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 15:46:09 -0700 (PDT)
Message-ID: <62ad0431.1c69fb81.c9c8e.334e@mx.google.com>
Date:   Fri, 17 Jun 2022 15:46:09 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============7112054205386700859=="
MIME-Version: 1.0
Subject: RE: [v3,1/7] Bluetooth: hci_core: Introduce hci_recv_event_data
Reply-To: linux-bluetooth@vger.kernel.org
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
In-Reply-To: <20220617221712.1394014-1-luiz.dentz@gmail.com>
References: <20220617221712.1394014-1-luiz.dentz@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============7112054205386700859==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is an automated email and please do not reply to this email.

Dear Submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While preparing the CI tests, the patches you submitted couldn't be applied to the current HEAD of the repository.

----- Output -----
error: patch failed: include/net/bluetooth/hci_core.h:251
error: include/net/bluetooth/hci_core.h: patch does not apply
error: patch failed: net/bluetooth/hci_core.c:1700
error: net/bluetooth/hci_core.c: patch does not apply
hint: Use 'git am --show-current-patch' to see the failed patch


Please resolve the issue and submit the patches again.


---
Regards,
Linux Bluetooth


--===============7112054205386700859==--
