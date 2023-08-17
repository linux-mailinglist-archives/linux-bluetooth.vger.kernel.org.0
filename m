Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7A477F201
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Aug 2023 10:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348733AbjHQIXH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Aug 2023 04:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348845AbjHQIWg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Aug 2023 04:22:36 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DCDB2727
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Aug 2023 01:22:36 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3a7d7df4e67so5243757b6e.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Aug 2023 01:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692260555; x=1692865355;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UAhP3zNaNkNMAzSs1NaImelnPJTcBRTSrI3wN2rGWKc=;
        b=W91+KGKH6ROjq7VFfWPf6i4MR8ECKlOztyc3/h5Wci3cBfBZFcoa+l7ykQ2aG0Y2Sa
         VX4Xz2FDoJ8qPz2Jhmy+n+KiYB2j+GGxyvUlAJO6noopA+ymjyKmRJIYVeLoWJA2VvoR
         224P4iBIjF7Jj8a3toUXpFZuOapjpL8/XNjuQ0nqoyCrn5jBhI46a2kcEACrEH7XfEiy
         9JyZhg1U6NkkIWDydIv1raFw0oDAJUg0UHz0D3t/cw/fuhkfnpK12GdBNCHqIY3pjV9K
         04lpyp8APjt8F2Bc8gQ3zbBwFMvLiPanqic4cwIAIxDF+TuOHqXA9N9MDx5jlLNlXvur
         ohig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692260555; x=1692865355;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAhP3zNaNkNMAzSs1NaImelnPJTcBRTSrI3wN2rGWKc=;
        b=GX1yhwUPLdOU0PX8XAstW/7Z1elUp3+kVEkdT2vrnd5xEjG3zZu7sXFOvmWY4PiJsg
         zHcprwt7+d9PlPlLnYfxlNL1ph3SwORPul9WKjOw6kBaqWHLHGtb5RS3iQqt+tGCtJ+N
         Prm0znA0PkxS8cyUYfIaspwm+JMPkVLvtVgC+kbS+/kL1/FuN0tkTVE2yAAx2kgwqTdX
         OqI4FXboxHpw0Y907wwlpWE85TmOrLWiGemiWgs1Q4P0eIKB/Orcl1P2nluSwe7n7Adf
         XOrT8JYoa5OrFUOmwM71YRNUS/k28MDxH3QUeuZYdIMhQjo39irOeqc+bvlEvMbIZ3sS
         NIFg==
X-Gm-Message-State: AOJu0Yw4OgeLlBw5inaF1p9NnGg4CPy2eZHf5aSvt08VqJHr/9gG1t6s
        CaiMF/sOd5T9g8+uMpYy5GyXjxOSImk=
X-Google-Smtp-Source: AGHT+IFouWuJ+RtIBji8H91dmZHnld4GS8zLzHCYvnURBFNDpk+YoT7MUhDIOPl15nqYpFQJAtTMGw==
X-Received: by 2002:a05:6808:23c3:b0:3a8:17f2:f97f with SMTP id bq3-20020a05680823c300b003a817f2f97fmr6161725oib.5.1692260555097;
        Thu, 17 Aug 2023 01:22:35 -0700 (PDT)
Received: from [172.17.0.2] ([13.66.79.85])
        by smtp.gmail.com with ESMTPSA id l10-20020a54450a000000b003a79a5cc3bfsm7226861oil.41.2023.08.17.01.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 01:22:34 -0700 (PDT)
Message-ID: <64ddd8ca.540a0220.22d17.a34a@mx.google.com>
Date:   Thu, 17 Aug 2023 01:22:34 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============2237149737027547568=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, iulia.tanasescu@nxp.com
Subject: RE: iso-tester: Add test for bcast receiver defer setup
In-Reply-To: <20230817064853.3706-2-iulia.tanasescu@nxp.com>
References: <20230817064853.3706-2-iulia.tanasescu@nxp.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============2237149737027547568==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=776877

---Test result---

Test Summary:
CheckPatch                    PASS      0.50 seconds
GitLint                       PASS      0.31 seconds
BuildEll                      PASS      29.99 seconds
BluezMake                     PASS      1082.29 seconds
MakeCheck                     PASS      12.11 seconds
MakeDistcheck                 PASS      173.12 seconds
CheckValgrind                 PASS      273.89 seconds
CheckSmatch                   PASS      389.45 seconds
bluezmakeextell               PASS      112.12 seconds
IncrementalBuild              PASS      922.77 seconds
ScanBuild                     PASS      1204.73 seconds



---
Regards,
Linux Bluetooth


--===============2237149737027547568==--
