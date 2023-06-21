Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 189D773908B
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jun 2023 22:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjFUUK6 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 21 Jun 2023 16:10:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbjFUUK5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 21 Jun 2023 16:10:57 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3608186
        for <linux-bluetooth@vger.kernel.org>; Wed, 21 Jun 2023 13:10:55 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9896216338cso194382966b.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 21 Jun 2023 13:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687378254; x=1689970254;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kXc7F0vDxlzd1AokQYCYYdoPVzWHskFkBQhq3A2c8d4=;
        b=KWF3+Xi/qBS6wZIlvFKlCG5nr8sIX12AfB1sWpEk1rfo1edx+VN+0bglTTSJ04E+pC
         bFI4GxMILlpchC0OlAmcaapW4ERQQM4oEB9lSVK9UYKD1ilxUAbTbJasFUQz9WXSeKDN
         pqmCud5HfGigISRclOiThTUiokNid6djxX/J0KUkrsLsiW9GG9dl7LQe/NMOCjcLb1B5
         +xOdhj0PkHmr3UPY4MFCl+aewJ2DLEGvXoZpTJaAEytmaOc6QP63/Z0ZbKAPZWqcRE/i
         QdYMbjrSOX30J6OnMNBRLzjJwHCLPFTjl/ZUHQZYXorNClHamKk3ibJcP8ykoRgYOn8W
         b+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687378254; x=1689970254;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXc7F0vDxlzd1AokQYCYYdoPVzWHskFkBQhq3A2c8d4=;
        b=Nxkq9P8zqP7eftqGD151vSDubWXF7PNYLGuKv5YprL4LRwFfTrVrGUnnGSZ/iB4/ie
         1raNhwkYq+XEj+PoHZjP1JvoYJPpS/hEZT5oOP8SxsWFNa8+IKBxd9CDVGdiKx1Q2hbd
         8/e4t5Wqb2h543TXtA9tw4kvOO5O5POS9eh3CxYIhZXRcVWETueJdwtXm7PVmZ1kPYRt
         BLc5mOWzaHfzkr06vduyLTZvIeaw02z1FPRnRVr8T365KzsN2UABQ3O/RZJ5NevikJAQ
         IK/h9iJmOeHPqiPl+ApgJaIDjPACA67rnJbpFy3Rym35dSK+mK/qmeuT6vZ8BEyr6Ign
         10Mg==
X-Gm-Message-State: AC+VfDz001inmy6VAnG3cWyGM7ktQQH9ZEe91eMMamAeKXHS5u2B5YSG
        ovmi+rwD3yhHpRKBUS/gOCOiF+jP8VZ+qE0/tsg=
X-Google-Smtp-Source: ACHHUZ4+xw9RGGzA1ilXik1vQRNvvmjNv9Kb9BPBfudieyBroBpUt+atPHjLMNd8NCkDfq5Ns2/1Hlckyicn3J569EM=
X-Received: by 2002:a17:907:7e95:b0:987:350e:771a with SMTP id
 qb21-20020a1709077e9500b00987350e771amr13456706ejc.72.1687378254142; Wed, 21
 Jun 2023 13:10:54 -0700 (PDT)
MIME-Version: 1.0
From:   Athena Maria <attendeesdataprovaider@gmail.com>
Date:   Thu, 22 Jun 2023 01:40:41 +0530
Message-ID: <CAGSAy6RCAGbrYfWX2VH=KnLqJ+KOYfqvySFvgQpBo4SWdRtE_Q@mail.gmail.com>
Subject: RE: LightFair Attendees Email list- 2023
To:     Athena Maria <attendeesdataprovaider@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FILL_THIS_FORM,
        FILL_THIS_FORM_LONG,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

Would you be interested in acquiring the LightFair Attendees Email List-2023?

Our package includes a list of 21,986 attendees from the 2023
LightFair , including their contact information such as Company Name,
Contact Name, First Name, Middle Name, Last Name, Title, Address,
Street, City, Zip code, State, Country, Telephone, Email address, and
more.

LightFair Data package is available for $ 1,689.

Interested? Email me back; I would love to provide more information on the list.

Best regards,
Athena Maria
