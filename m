Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5AA4B18C9
	for <lists+linux-bluetooth@lfdr.de>; Thu, 10 Feb 2022 23:49:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345227AbiBJWrd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 10 Feb 2022 17:47:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345226AbiBJWrc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 10 Feb 2022 17:47:32 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7075F4E
        for <linux-bluetooth@vger.kernel.org>; Thu, 10 Feb 2022 14:47:32 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id y6so19835059ybc.5
        for <linux-bluetooth@vger.kernel.org>; Thu, 10 Feb 2022 14:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=colorremedies-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=HMa7oS0CmDrrKygTGF/ZlkmorzP0NmH2st8gqoaLAIo=;
        b=y9fMhd+hExxwY9rSbEJIzoHprfOkn7D2W5Tb24AFrQ9S73kTAmD51s24DbgxY1e5CZ
         Wmb0xGhpUzl85xJH9A3vQ0NGc/iG9229idgYBMYlQj324+nuiUlrevMGUqObG99iWb5q
         D08bT2m+Lx6FZ5q3NYcRmSgPBoT8pOqBtV2Q1KGpy5vZEA3KSM5SmZR60ZYfmvWo4u6R
         TlVB5EnBVCspA50WoSCwcUdbCUIOMTGD/fRZUiqUemrDVOWu1D6raMVPIoob8m6aMaeL
         ZpDWjLtlUPs2NQbVrVfK3MmbhHK2xC4/J+13l93m/EeIUMqbiqT/LCTL+N8vEORCJ3WC
         D/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=HMa7oS0CmDrrKygTGF/ZlkmorzP0NmH2st8gqoaLAIo=;
        b=f9UIvgp2ww91RDNgOvu0ZFMDSWaugeeI9u4lHZTv2Eh/YMZvSOHyLu7zJ/V6/A5J54
         S2of05pAvCC/k4Cb2cC5QgmvWDL8Ix191p6znZc57ZBSZT2FznokFmIfSsM3NxQm3tkI
         XajV9eQvHdH97jmGaq+UdIHfTRzc7s4rOp2rH2Gkdrmfq98wULCfEvRdK+bQoWc5lRju
         xAuc7jiiguNZsRBkGKIBjuTKL5ftV7qFtJNOik+q+PXt9qCiIAib+x/g+DlraytS/zpO
         8gQNMdJulOz9pQ5Y9apqkB42CzGOSuf27CvD78lVULFPZ6VWaOYA5FiNbkbRIBjIWxBn
         2j6g==
X-Gm-Message-State: AOAM531rQvcVH3hkadoX+pzdUYC/XW8DGHXXKu8M7guVLxZzG33NcruC
        IOIAoDe0sE0DvtoqVmr+u8byzqTJWqjAOVLYOCl72s9pzN1Ezw==
X-Google-Smtp-Source: ABdhPJwp8a/R6+ydzzSD314lSaSN3cy4wiVUnSoy9XD1HFrGJIQyXJQP6dmziI02hbQWkC07x1miEnLJUOJ1Vw7ytCg=
X-Received: by 2002:a25:b706:: with SMTP id t6mr8812466ybj.695.1644533252125;
 Thu, 10 Feb 2022 14:47:32 -0800 (PST)
MIME-Version: 1.0
From:   Chris Murphy <lists@colorremedies.com>
Date:   Thu, 10 Feb 2022 15:47:16 -0700
Message-ID: <CAJCQCtR9Ynhtvs6jvq-6sHNuaOr48cG3j2YNyw2dNq=AXcwa+Q@mail.gmail.com>
Subject: 
To:     Bluetooth <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

subscribe linux-bluetooth
