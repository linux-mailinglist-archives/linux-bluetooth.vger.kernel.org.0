Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D85F6F39EF
	for <lists+linux-bluetooth@lfdr.de>; Mon,  1 May 2023 23:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbjEAVvB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 May 2023 17:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbjEAVu7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 May 2023 17:50:59 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46E9C1BCD
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 May 2023 14:50:58 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-19235381430so1493015fac.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 01 May 2023 14:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682977857; x=1685569857;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jx91q+nwB1T4OVa/w/jt43gsdRiJoZz1GVAzrBzSnLE=;
        b=ImDfkAzHfOlhFc6wv9Ux/sE2SSQAyIC6HYd1z2uX0zUOBD61c59eftU/jgczvtLaMk
         unrjDL2bUwOPLOOW08oLxyn8GMWJelI0pBRta+p6DlKYh08yah7CXFOx/Y+dQIY5Qo2I
         31ItbGPXcn3aYGjGRbGF4FOfijwgIpn6dX42AxyKUOovgT0rMcUhewXY97tNG97pjTnW
         q3lV/qdVURwKtkfJ+Y/515dgYUEdtgce+eRLxXVpELcRy14S9pHX+tmVaqOYoq5ezusH
         5OpN+4p8LfKbV8IiMKHdlb+R9Hirl2zujW20xuIRNe5lqor4VJXld6mOQ4MUQcHt0R+A
         03bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682977857; x=1685569857;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jx91q+nwB1T4OVa/w/jt43gsdRiJoZz1GVAzrBzSnLE=;
        b=AWTyXQOhoCkVlv2aFPFCGTYQF/n3vrrweqMts/JsXxFt4KYIsAVc3QrKRNEPgQLJEb
         VZPukNgBbzx2Yisp07SBbmn7O/yFv49wyvS3KY+6+U2m20ZcrW9k4uaEbz2owRYbUXQL
         qMXBfKOMqbVV5cDfelykn33IguX7ZeOTkPiGyZFqztj5iie0Rrg1f3hm0U4C8hDpIRr4
         G7OB8iIrySdvkHWLXqUU0tNnWaha9fFsdU66ZY1/QId3SOhxQ3c2kojJ649oPDvW1sfZ
         FzDT6WFHA7xeEA/iUq1dpVtOlbkD5EHGuW2DkNmvi42Hjxip6djqjr3hHf7ZflWzaH4K
         YUzQ==
X-Gm-Message-State: AC+VfDylQHLwzQAyCJN5CC8Er9jxxBFg2hBcNdy75nYMwnDW4OHN1UC8
        tbSuv87nBK5RoWDG7zhS+Gq7BA+knME=
X-Google-Smtp-Source: ACHHUZ4t3Y84vITqajvfRahsC4usAzLOJw5AD8T5qpWcBDJ8JQujlQdNnWUdOS3r2u/IkOQQ5Ewf3w==
X-Received: by 2002:a05:6870:7711:b0:18f:aff:8da4 with SMTP id dw17-20020a056870771100b0018f0aff8da4mr6965444oab.35.1682977857422;
        Mon, 01 May 2023 14:50:57 -0700 (PDT)
Received: from [172.17.0.2] ([40.84.170.122])
        by smtp.gmail.com with ESMTPSA id q33-20020a4a88e4000000b005476712364bsm362548ooh.19.2023.05.01.14.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 14:50:57 -0700 (PDT)
Message-ID: <64503441.4a0a0220.72dd6.3298@mx.google.com>
Date:   Mon, 01 May 2023 14:50:57 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============2176714021540402064=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v2,1/3] client/player: Add support for Metadata in BAP Profile
In-Reply-To: <20230501200326.1056736-1-luiz.dentz@gmail.com>
References: <20230501200326.1056736-1-luiz.dentz@gmail.com>
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

--===============2176714021540402064==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=744240

---Test result---

Test Summary:
CheckPatch                    PASS      1.58 seconds
GitLint                       PASS      0.96 seconds
BuildEll                      PASS      33.01 seconds
BluezMake                     PASS      1007.30 seconds
MakeCheck                     PASS      12.82 seconds
MakeDistcheck                 PASS      180.90 seconds
CheckValgrind                 PASS      297.29 seconds
CheckSmatch                   WARNING   399.65 seconds
bluezmakeextell               PASS      121.85 seconds
IncrementalBuild              PASS      2468.53 seconds
ScanBuild                     PASS      1234.32 seconds

Details
##############################
Test: CheckSmatch - WARNING
Desc: Run smatch tool with source
Output:
src/shared/shell.c: note: in included file (through /usr/include/readline/readline.h):src/shared/shell.c:615:21: warning: non-ANSI function declaration of function 'bt_shell_usage'src/shared/shell.c: note: in included file (through /usr/include/readline/readline.h):src/shared/shell.c:615:21: warning: non-ANSI function declaration of function 'bt_shell_usage'src/shared/shell.c: note: in included file (through /usr/include/readline/readline.h):src/shared/shell.c:615:21: warning: non-ANSI function declaration of function 'bt_shell_usage'


---
Regards,
Linux Bluetooth


--===============2176714021540402064==--
