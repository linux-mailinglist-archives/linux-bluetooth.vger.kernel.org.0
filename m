Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFE5052C6DA
	for <lists+linux-bluetooth@lfdr.de>; Thu, 19 May 2022 00:57:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbiERW5S (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 18 May 2022 18:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231174AbiERW47 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 18 May 2022 18:56:59 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FDFC5F7D
        for <linux-bluetooth@vger.kernel.org>; Wed, 18 May 2022 15:56:55 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id i187so3920426ybg.6
        for <linux-bluetooth@vger.kernel.org>; Wed, 18 May 2022 15:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=ovbcf3BPb/ZrA/FpQ+ZjErGDIEZ9sF3fYOxqsE4Z0xdiTlYY9UY36hS3ty6MLllddq
         FdZzNc2PcFHW5cwKZ0FlQqx6F8uTY06Ab/cmT+eL89dkm6I4fHT5v6DDGzwY+fqIjM8b
         RjeYQt93Ckr4p0lPVWY342OwWKznH6xDl4nV36uj7bwrBPcHFh3ePzF5GNEmu/mQBhIV
         GwWDekgJIDWSV60014hyLdzt2NtjUStY8MI6SiwBWMH8LEBnRGkE0W6Db0zUE9IYWmDQ
         Ifd6nbhkESdcIbQrjo3sdEfmdPtb1VAIHCw/LAZv1DOtvQwqLYnhML4dVDmuoYeMmVFn
         q7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=e/FtoXuK5iBeR0ppWysfRUj6pSNAnkQNbsMwQxv7U8MI9GQMqJWNoNR/LBwrcR4nOF
         T29GvaCOkvDnVYknc5/EkoD80v0dsNkqD/MtG93nBcU4yxetNRYH2Fr6Hdyzfxee8AYL
         gf2DjIZdqxEkJ5d5NC8QEivxAaS5/zjOl4s+zewhpvUdh907JDtPK+ATCNRMPBujKzzc
         W36AQclFYRtWHlgO/QX7aF8BKOEZTjlh3DVoPU/KGMLAkg+vBQY6PKV9wpur3mxvS/DG
         nc8bsEl6a1pj4BHJiIj2vfFXx5OVDT3IbZ0qz/gjFHKX4yVsa7Jk7APsWbRTo3X8XDV2
         lcVA==
X-Gm-Message-State: AOAM5320T4mUtiJYtN4JhIPGmxYx2LQph/ieFcVWQ0GLQc4DFOcewrGe
        QpeFZqX8o/Foe9VxHnMIzC0HIx+Tk1rMtpFTby8=
X-Google-Smtp-Source: ABdhPJyyLDAg+sVdsLTxwEXiZ5avjedwK/uWMP/Y3UWcChEjwDE+iXuY4kOycHY8vIqM/rcV0hLTcVdg0IN0RAQYgBc=
X-Received: by 2002:a5b:f87:0:b0:64a:9aa6:e181 with SMTP id
 q7-20020a5b0f87000000b0064a9aa6e181mr1852277ybh.157.1652914614913; Wed, 18
 May 2022 15:56:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:7143:0:0:0:0 with HTTP; Wed, 18 May 2022 15:56:53
 -0700 (PDT)
Reply-To: tonywenn@asia.com
From:   Tony Wen <weboutloock4@gmail.com>
Date:   Thu, 19 May 2022 06:56:53 +0800
Message-ID: <CAE2_YrD=5bo8j9+ah-xptEBBV-HEC4=Gb0SRHf996phiopc3WQ@mail.gmail.com>
Subject: engage
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b33 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4933]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [weboutloock4[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [weboutloock4[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Can I engage your services?
