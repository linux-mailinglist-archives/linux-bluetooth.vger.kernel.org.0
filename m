Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4E336EE449
	for <lists+linux-bluetooth@lfdr.de>; Tue, 25 Apr 2023 16:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234361AbjDYOwr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 25 Apr 2023 10:52:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbjDYOwm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 25 Apr 2023 10:52:42 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5286C19A2
        for <linux-bluetooth@vger.kernel.org>; Tue, 25 Apr 2023 07:52:40 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-187df75c906so4303472fac.3
        for <linux-bluetooth@vger.kernel.org>; Tue, 25 Apr 2023 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682434359; x=1685026359;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJVJ5dnNAnzZeM2Nb3aK3AA1Pstz/NNRaH6Qyz+4Yms=;
        b=IrTT4tnHDBrjObhyu38ginDgYadgl+9nXsOmP70KNhp5Asu5Z7pyJHI7toB3GjBJxj
         EzunuWwItSjwRZDWpSCq4DBaCEXKUXlzijetJk1nK4V/wPw5td+MUGytgDQgUVHjMcMx
         N0cwPTj4gHF5xBSZwfBBG02WODWb3vOj/Zbwl8rbCDFR0Qt8XsDSlSgwcBimgFOPQiZO
         TIFbzcmp3Y/EPOImq5PFR86/ihmFHetXpMObkKQm0fJfBW1QFUNi/QMi13UHh83uqmuy
         kMyCplxr+9oLG6TakXKR0MqjxyezE4HS10kNCXaRcRWByA9pJQFsGambimtTrhxkKGWI
         DUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682434359; x=1685026359;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJVJ5dnNAnzZeM2Nb3aK3AA1Pstz/NNRaH6Qyz+4Yms=;
        b=ke9Tg/GQg2nOOskv8YnFYFvRRG/pPC86tpLu1NDc8P9WJO++ijqgTuwudff3XdFr/t
         D9Hxv5WW08vnyysmUxr+o2PE1/fajdCeUF0qGBrzFzli9MPlb3NF2e+hEzpfPMi2/fSE
         7A7TfoDCn5703cIbM3UxUwiDZiamX6gVQB3ZYsWDBXdgttEGlU6vE/oj1KPenj7V5Zlz
         a/57GRWB6/gxKfkql4rJ5Kb2vkNkTc+BZ0VQtu6EQpoM6nEPHpokADp6yFB0dwkAnGeC
         PR4/DzLgGGO1OGcxd8oqk1qqvJoV/Kr7bKx0Dq41YCVcXOxVEfbWQRrCZJKjaj2nM/0+
         eBDQ==
X-Gm-Message-State: AAQBX9f7Ef5bNnLgUp/ljglZb7XMgxyQTdPlIfopKTeN1LVtgV0Eq+4c
        S/mZxHF1Un9HuU9eWSH/9pKlmQd7nSda5x8QTt8=
X-Google-Smtp-Source: AKy350YnwAKedxX2OtCt+z0SILAoeFvu0qKd/FiWaKYB0EdRLvhmt65j3JFVY0RI7AS3rH59YFKFMvxa84fcedHBO54=
X-Received: by 2002:a05:6870:f217:b0:18b:15cd:9b45 with SMTP id
 t23-20020a056870f21700b0018b15cd9b45mr10015838oao.40.1682434359414; Tue, 25
 Apr 2023 07:52:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6839:6292:b0:701:6145:5d6d with HTTP; Tue, 25 Apr 2023
 07:52:38 -0700 (PDT)
Reply-To: chiogb00@gmail.com
From:   "Mrs.Elaine Lam Su Yen" <mrdavidkekeli0@gmail.com>
Date:   Tue, 25 Apr 2023 16:52:38 +0200
Message-ID: <CANSBbRZ4H6fmGFSOb=cZhRoAFZBEOZkmN7paSedutNfS=Dz=XA@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_NAME_FM_MR_MRS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:33 listed in]
        [list.dnswl.org]
        * -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
        *      [score: 0.2023]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrdavidkekeli0[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [chiogb00[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mrdavidkekeli0[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  1.5 HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

I Still went to hear from you thanks.Mrs.Elaine Lam Su Yen.
