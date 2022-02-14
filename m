Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05C414B4D8B
	for <lists+linux-bluetooth@lfdr.de>; Mon, 14 Feb 2022 12:12:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349788AbiBNLMR (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 14 Feb 2022 06:12:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350320AbiBNLL0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 14 Feb 2022 06:11:26 -0500
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F98AA025
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Feb 2022 02:39:49 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id 71so13958547qkf.4
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Feb 2022 02:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=GtLzJvPbX/5GEi5DZIPvU6mzXzD1tLj8A1AM7NggqHg=;
        b=iAOJgVpfbF1BsVv4PnsZRQwuKgnjKKlfOMi+gNFOdCXlgUY7XEUJod6P1Lqc+AB49V
         5BSuwp60ZNEJi+kb/MUTuW+MRQJ5VOiHTkfy/BV7AfhZtBScMkfKbYX+V/p07kvdW94U
         1DkhhajDZBRwuePdvXFnm+IpRMesUepPYfRL/VwTfkDTfeTPJypn7a1wYpIt93yBp9to
         1UEF1kP5mVj/1wqTY2XBNMirE9v+fZpYhKc15MJq675FKDAO7yMel2rbLu/WIVKYwCWR
         0/bQwwyc3z9U549LRCuEEb3oJjOXPj0i4F7Hv1B6u3ODL3prWvdUAIgl54pdd16VJLmB
         yqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=GtLzJvPbX/5GEi5DZIPvU6mzXzD1tLj8A1AM7NggqHg=;
        b=e1ororyF7WxJjgtroIML2kV6zwKzlX+txglYg/687cAqMwJYiZEPtCFZmFQa4z/3gd
         OHoj5hLbPHh+vw5ezwp25Ki5Kypnf/AkY0pduBnwx6V6WXJBTPKRrJ2CJfV1akuvqmRC
         FPxZgmgxcRi2CaFiewmrU2cm3rtxrVuDwM3MGDPG3G5DgjlVBFW0uvEjMPfFhPcYcxJ4
         61Ne3ErpEDPW6En0u2cdmoQOzbVjDUjo3lPc7QpJ5wDxWkdlETX5fTSnKQZNB5e3CeC6
         +566OQZTnK4rdBTgJp1yo9bUP4uqYLMrTwLeRYSAvR1jQVzPxYXrfvuw+zdL46SFazgd
         QTmQ==
X-Gm-Message-State: AOAM532zKhm5rEiYUWF+ymcfgjYdPW7i4+ek2jjNyTwKLS+2n47ZtfCH
        5PrN4pa1n9g6v87+kCZ7GmRT/Ck6NzT0kg==
X-Google-Smtp-Source: ABdhPJyUGbtJ+BsC/FOWYTld3nBD+c+4+LTTb6SoaxcRjv9PX2oF5af3gMGEOn6salOi7wJL18tSwg==
X-Received: by 2002:a37:a1c1:: with SMTP id k184mr6657441qke.553.1644835186278;
        Mon, 14 Feb 2022 02:39:46 -0800 (PST)
Received: from [172.17.0.2] ([20.186.183.180])
        by smtp.gmail.com with ESMTPSA id h6sm15343124qkk.14.2022.02.14.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 02:39:45 -0800 (PST)
Message-ID: <620a3171.1c69fb81.acd53.0819@mx.google.com>
Date:   Mon, 14 Feb 2022 02:39:45 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============5618122426620706998=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, howardchung@google.com
Subject: RE: [Bluez,v1] lib: fix hci_strtolm crash
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20220214171329.Bluez.v1.1.I8c72b5af2506378bba6da369228ae50483231e35@changeid>
References: <20220214171329.Bluez.v1.1.I8c72b5af2506378bba6da369228ae50483231e35@changeid>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============5618122426620706998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=614021

---Test result---

Test Summary:
CheckPatch                    PASS      1.45 seconds
GitLint                       PASS      0.99 seconds
Prep - Setup ELL              PASS      48.69 seconds
Build - Prep                  PASS      0.86 seconds
Build - Configure             PASS      10.41 seconds
Build - Make                  PASS      1734.15 seconds
Make Check                    PASS      12.61 seconds
Make Check w/Valgrind         PASS      513.86 seconds
Make Distcheck                PASS      274.19 seconds
Build w/ext ELL - Configure   PASS      10.20 seconds
Build w/ext ELL - Make        PASS      1758.78 seconds
Incremental Build with patchesPASS      0.00 seconds



---
Regards,
Linux Bluetooth


--===============5618122426620706998==--
