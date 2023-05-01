Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3EBF6F3A56
	for <lists+linux-bluetooth@lfdr.de>; Tue,  2 May 2023 00:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbjEAWP0 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 May 2023 18:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjEAWPZ (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 May 2023 18:15:25 -0400
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECA9199B
        for <linux-bluetooth@vger.kernel.org>; Mon,  1 May 2023 15:15:24 -0700 (PDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-187af4a5453so1308043fac.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 01 May 2023 15:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682979322; x=1685571322;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+uJ1+KwQjMpdNiCngwvlv2FTzZnzkokoCYASnN36NE=;
        b=DM/LrkBOL5H/rXYMZ/U+G3NjaflDuG0vD07dowNpza1bVYo9h6SanvCdCsHVCfkbQz
         1/UtaANqi5yPh5x41O0ROcZRXYqv8QfPsDMyBoheFYcLl6NPI1RY8pQ06lfgwFEMNXw2
         pu2NkuYLfMkL/493QT7HxEY+jJ/OM4X+tbLQa+/9zs+p1iacncNev7qBuzZP6wflnIH0
         wmjpTV5hfXi7SO0texBXwJg3OCI/3y956ioDcqx0KgaTA9yvFWWSXTClgGRKf4/pY7BG
         vi5UIHT9QJxnByreMDa0odlV7ZqeIz9aeQCkvyAzlPeY9vOAh4rn/WG0SKquNp80CWKZ
         R2oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682979322; x=1685571322;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+uJ1+KwQjMpdNiCngwvlv2FTzZnzkokoCYASnN36NE=;
        b=VPrb213u4QFkHr/IOq69jxW2btbwWGupAAIrj2GcUdpd59tXRtWDfigfXIas2gSfAV
         779z6Cg2AphBTY7JRgcr8fF09v0my+qR3AttW6uDxkAHzorT6SA6bgA2tOkZWoonA8xP
         JNfCdiHn79d91zyVqKPVrM44AEY/70IKqAliCQv/97SKs6fMWjKbW9qT84VDxU1qPyMn
         dyhk+F4TTi4uH8UO6JbtV/4PmBCiE6ppeKNrnn32PuTAAX9sjRshNVu0MlQRCwM4BS0H
         6kyWTFBCphpCQ/PqmkO1oFHtooMeNDsMYkf0qbz18CM5cf9PkYqV710XUqApi/8p0EMX
         aIPg==
X-Gm-Message-State: AC+VfDwGfEcS2MlBPHYeCpVW4dPB3FuWPjrUjGn+qZc0nKHQuaHIYYD7
        DZDNVwzxNS8v8wjdUU7BSIlB36d8aI7Kglsy9TE=
X-Google-Smtp-Source: ACHHUZ6mOZpQyFyKc8LzaiCknvvWBF3N2EqXq2imfD+3gxhxZak+/qnY8iZIfvejBEg0UxqVi5QwVh6YQqh+FBjzB4M=
X-Received: by 2002:a05:6871:545:b0:187:9ebd:3946 with SMTP id
 t5-20020a056871054500b001879ebd3946mr6259260oal.51.1682979322036; Mon, 01 May
 2023 15:15:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6838:1e4e:b0:701:6145:5d6d with HTTP; Mon, 1 May 2023
 15:15:21 -0700 (PDT)
Reply-To: chiogb00@gmail.com
From:   "Mrs.Elaine Lam Su Yen" <mrdavidkekeli0@gmail.com>
Date:   Tue, 2 May 2023 00:15:21 +0200
Message-ID: <CANSBbRY56UxdK=gvo3YknJrg0cYGqF2yPjViZo3uOQd7LFvCZw@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,BODY_SINGLE_WORD,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,HK_NAME_FM_MR_MRS,RCVD_IN_DNSWL_NONE,
        SCC_BODY_SINGLE_WORD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5049]
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
        *  0.0 SCC_BODY_SINGLE_WORD No description available.
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 BODY_SINGLE_WORD Message body is only one word (no spaces)
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi
