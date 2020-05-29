Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 098961E8340
	for <lists+linux-bluetooth@lfdr.de>; Fri, 29 May 2020 18:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbgE2QKO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 29 May 2020 12:10:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725601AbgE2QKO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 29 May 2020 12:10:14 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5F4C03E969
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 May 2020 09:10:13 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id u17so1211241qtq.1
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 May 2020 09:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:from:to:subject:reply-to:in-reply-to
         :references;
        bh=fBUSErUfVkL0Yw/jlBriEpm5pfQ5AbA5RkOiDybcw1I=;
        b=L7QAFDfJ4iTIcVBeODw0gF3JVmlgQN5sAeIZmgZLVsgFGM0GtPlw8goWVcohAhzmN0
         Rg5YbW4HSid7oXfEcAUBM+YbE7RrQDtdpx9CLa96vGu95Sml3kDa+1Undrj+5A+2KwLb
         l8dUglEPXs6UjuPEEPOWorH/zWtdlIGnPA0X/RDN/1ZKAjFr0rY3B5VjYCK5hdF/OQBk
         RDh+LMZ4Ldg8dbMSt1xB400U1ZQozaI1B9QzgennjfCGR0jATJKbJW9lE392mOScxGz2
         l2YG4OH7j4SM9ohcXdmdG1mYUSl8ULJWVUK/SlNpRG1DVU56KbwZrYI7fOEQRECchFAc
         myRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :reply-to:in-reply-to:references;
        bh=fBUSErUfVkL0Yw/jlBriEpm5pfQ5AbA5RkOiDybcw1I=;
        b=E4ZjYAj3zkP2hptUGWihw/u2AQfl1hYUyGLq7aI7097kyNh/+gsrUGqZ6+IOQHfaRA
         lA35Q1GnxTHTZtf4Ojs9qOCq/jhIJtThdG8oPCoEtzC0RfXs3ND1t/dTI6vpG7smMSJd
         MDqV8ihD2mELK1O5Tu3D9nFkekyEwWOogLWB5+3BdNcU93Xp5842mSuvvyRTScK3ormp
         66LdIPoYXVwfTZnFwyuxeK9NrB2O51rJoMBX8LEXaPYjL4pNLKns4ZYaAIbmvAZAtPnF
         ay0r5X91kvk2ELURvShw1nYtfFMAK2x2uqb+sEgfPHlVwzds7pFYs/rV5/L2440QfdAf
         2jgQ==
X-Gm-Message-State: AOAM530D/qVHWx8KKVxDkRIJBQPDys2tf+ZZ7koFtgDQ7i6CbPsPVoQ9
        83MSQFU1adcLoG9H1q18V1y5TlVjxWc=
X-Google-Smtp-Source: ABdhPJwj+63vRiBp/HsbIwiutUOaYTTy9YF3L7vRSJ+sDeBHldhgqMu7rR/2IeVDysj/lCVHX6ZQQg==
X-Received: by 2002:ac8:691:: with SMTP id f17mr9550187qth.204.1590768612501;
        Fri, 29 May 2020 09:10:12 -0700 (PDT)
Received: from [172.17.0.2] ([104.46.108.37])
        by smtp.gmail.com with ESMTPSA id r37sm7805469qtk.34.2020.05.29.09.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 09:10:12 -0700 (PDT)
Message-ID: <5ed133e4.1c69fb81.9a617.d5af@mx.google.com>
Date:   Fri, 29 May 2020 09:10:12 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============2788192442689534142=="
MIME-Version: 1.0
From:   bluez.test.bot@gmail.com
To:     linux-bluetooth@vger.kernel.org, alainm@chromium.org
Subject: RE: [BlueZ,v3,4/4] fixing const decoration warnins on options.
Reply-To: linux-bluetooth@vger.kernel.org
In-Reply-To: <20200529153814.213125-5-alainm@chromium.org>
References: <20200529153814.213125-5-alainm@chromium.org>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

--===============2788192442689534142==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
While we are preparing for reviewing the patches, we found the following
issue/warning.

Test Result:
checkgitlint Failed

Outputs:
1: T3 Title has trailing punctuation (.): "fixing const decoration warnins on options."



---
Regards,
Linux Bluetooth

--===============2788192442689534142==--
