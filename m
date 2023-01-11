Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA38166629B
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Jan 2023 19:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233386AbjAKSQD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Jan 2023 13:16:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbjAKSP7 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Jan 2023 13:15:59 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59180FF7
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 Jan 2023 10:15:56 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id d2-20020a4ab202000000b004ae3035538bso4232950ooo.12
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 Jan 2023 10:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyQfDA5JQKapTqk95xlLXJ5aD/AVTOh+bnm0DaoViy4=;
        b=ncC1HRDr1HLqCB4cpsrd1r+M3EZICO+pbQGx9PwGjrxYSKnUiYDqlGj+OWubii4jiH
         rA9OjPDnxMn6+q5WtVikfzQSdGYjGVWVLMXrrbaPK8ixtxSy/UuYujrpTXN0B5IY74oH
         dnkuIa4bcdetiDq07V6nB6+Ws/aO9rEPf2fWBcrSCWbwKyTgBzVmRBxAR7/i4S/NbtTR
         v2vv87Pp2dmnc9qr60FLt12HQKYcMExP6Oc0fUseydJkNMcNS+AUKSCKNPz6UJWs6jGv
         +czMVljPD55dhT7Cq+At7A1DzGbkQ9cl6r6SVQKM6ok4ngvKqCsOG9rb+PAviOOvf97+
         Heew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HyQfDA5JQKapTqk95xlLXJ5aD/AVTOh+bnm0DaoViy4=;
        b=bl8GOosAakyqDutGGhFI757ukG/+6JM57L8pOGjFeIjgHO7GLme63NyY5Dqn5EfY1M
         D7Ku1paWyKSY0qL2COViQzgOGoag/HQl+qriOQATNraS/ENscxPb4dAc8SkQv58MA+R8
         gr05yxKGVhcaqwAjNVrL465dYIi0UtRrxEaPEBPjHd13Jn4Z6/XPFYWH0HB6pOOZzK1A
         kMdheKxJxj907fYfVLZKmIGJcQZ8wFiuab11BV9ltYNOV+ClFI5LI9O2KjHIE0CCbPLt
         ++x0ruraJjg5p02N0uJ06jV12gg4XN5TUov/8B+ZWsqGrTnZVosI1+l6xU1/OKcEuzj0
         ebHg==
X-Gm-Message-State: AFqh2krHF4UXTFZyMLXX0dBQn5+QAxtxN23G1TwmZY8cDKIu0rNzgMQx
        T8smzO/DB9Hg3zSpIJoT+HdsOgC1JNMmQBpU944=
X-Google-Smtp-Source: AMrXdXsjMPHuWBdD1hz6674wZ6e1drRynUg7383d/bdXYR118a0w84WM9sMUaKMZz4LALzD79oEYO173HGviQA0zenU=
X-Received: by 2002:a4a:5257:0:b0:4af:3115:e580 with SMTP id
 d84-20020a4a5257000000b004af3115e580mr3402830oob.90.1673460955333; Wed, 11
 Jan 2023 10:15:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6851:a23:b0:3dc:8009:5533 with HTTP; Wed, 11 Jan 2023
 10:15:54 -0800 (PST)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <tracywi178@gmail.com>
Date:   Wed, 11 Jan 2023 10:15:54 -0800
Message-ID: <CAAxj-_hE=dHAYcPoozOKYuJZ8JvnZFRBovT4MqvqUXXbaGpHiw@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:c2f listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tracywi178[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [tracywi178[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

-- 
Hello Dear,
How are you doing.My name is DR. AVA SMITH from United States.
I am a French and American national (dual) living in the U.S and
sometimes in the U.K for the Purpose of Work.
I hope you consider my friend request and consider me worthy to be your friend.
I will share some of my pics and more details about my self when i get
your response
With love
Dr. Ava
