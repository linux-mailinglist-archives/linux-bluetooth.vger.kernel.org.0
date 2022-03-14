Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2584F4D8FF8
	for <lists+linux-bluetooth@lfdr.de>; Tue, 15 Mar 2022 00:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238795AbiCNXBO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 14 Mar 2022 19:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235867AbiCNXBN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 14 Mar 2022 19:01:13 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC1C340F5
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Mar 2022 16:00:02 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id z66so14151129qke.10
        for <linux-bluetooth@vger.kernel.org>; Mon, 14 Mar 2022 16:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=mbtLeXD28C/lS/cQVTYlbf97d+KmdNWnY2YdxQhTvtg=;
        b=EtyYfFS5qw3O9TL28Sc/HHtezocl73csMzZ9RqrQ5qK9XUMUM8+Z1mFhtTs15kjyQ2
         0Y1XPs4q+gy4C4ulNN3RzKIRRq6UZwRaisrGWGu3CmiQMGhQSl+SRC+k1GBKmIm83snv
         O+C29Yr/wA32tmaYN0YcAuUMlDSAd8Uislex/1fZXMnE0QU9UFAAuTGn+hSuajZQvoOj
         HCWpufWf8xQI0fYhU42wY5BXFrGwvqnO44IwWzobnjB9BPok/6BO0NUFNQObxzXrqm61
         PmqcI4WJ9kF+f46d5CHrvcUzSHPe3Gk7oGW7wdUPGtcUZL3yp0/I4QrYoU/3bdY9jWwr
         XvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=mbtLeXD28C/lS/cQVTYlbf97d+KmdNWnY2YdxQhTvtg=;
        b=mYEKqwnsK2+2axae9NTymAUCGUHtmZgxL/FvftHrH6m2B+5B3/k5EkKtSf9/afR63w
         uzASosnwMSw+HOkjygQaKyMug32ZfyMX7ET/fpiJJw7N0eUqqR+1JB0tYocGYkAFqpRY
         z+GD+hvcjtPNoYFYxxKekcckAcGXp+ypRL+aTtRl2WmIyKajgq5ZruOF6Nyx0nm55jvZ
         +wgZR0r8GmYOEKHz1mGuGio8uYG8rfAmRe83eTlFBK7rjyzH7s6uPkACxmDOMuvzwp1T
         CsKNuAcHG53fgMV+AmsZAa7RVU+FiKdZTzWdrKdB6XAT/3xALLKbsfv8FTLdRxstr2Cz
         boGA==
X-Gm-Message-State: AOAM531hC4zFvW+BRyat+9c+xTuno9472+sm6zZE8ZhR6LDCx/XziBiv
        jWuXCoERyPTScV8r30HO0ya+J9QbHjaVLQ==
X-Google-Smtp-Source: ABdhPJxTp+YVxaT3E41k+fXsQaVWFEbQo2ofJomoTO67bax95ALeLhkqaGVi5qY6hN+zsUYsErTsdA==
X-Received: by 2002:a05:620a:2904:b0:67d:db5a:b27f with SMTP id m4-20020a05620a290400b0067ddb5ab27fmr3886114qkp.529.1647298801534;
        Mon, 14 Mar 2022 16:00:01 -0700 (PDT)
Received: from [172.17.0.2] ([20.127.24.128])
        by smtp.gmail.com with ESMTPSA id r12-20020a05620a03cc00b0067d370e414esm8275889qkm.15.2022.03.14.16.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:00:01 -0700 (PDT)
Message-ID: <622fc8f1.1c69fb81.88503.f82a@mx.google.com>
Date:   Mon, 14 Mar 2022 16:00:01 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============2038456191293125417=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, gavin@matician.com
Subject: RE: [v2] Bluetooth: fix incorrect nonblock bitmask in bt_sock_wait_ready()
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20220314224252.3166367-1-gavin@matician.com>
References: <20220314224252.3166367-1-gavin@matician.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============2038456191293125417==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=623339

---Test result---

Test Summary:
CheckPatch                    PASS      1.85 seconds
GitLint                       PASS      1.04 seconds
SubjectPrefix                 PASS      0.92 seconds
BuildKernel                   PASS      31.27 seconds
BuildKernel32                 PASS      27.91 seconds
Incremental Build with patchesPASS      38.17 seconds
TestRunner: Setup             PASS      478.89 seconds
TestRunner: l2cap-tester      PASS      15.81 seconds
TestRunner: bnep-tester       PASS      6.20 seconds
TestRunner: mgmt-tester       PASS      101.58 seconds
TestRunner: rfcomm-tester     PASS      8.03 seconds
TestRunner: sco-tester        PASS      7.81 seconds
TestRunner: smp-tester        PASS      7.77 seconds
TestRunner: userchan-tester   PASS      5.91 seconds



---
Regards,
Linux Bluetooth


--===============2038456191293125417==--
