Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF0817222FF
	for <lists+linux-bluetooth@lfdr.de>; Mon,  5 Jun 2023 12:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231774AbjFEKJO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 5 Jun 2023 06:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbjFEKJI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 5 Jun 2023 06:09:08 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB5AE9
        for <linux-bluetooth@vger.kernel.org>; Mon,  5 Jun 2023 03:09:07 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 2adb3069b0e04-4f611ac39c5so3850309e87.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 05 Jun 2023 03:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685959746; x=1688551746;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRmE3g2QJT0SgK/3STNj6b7IqlONWZa1zmfHqIOOFUE=;
        b=pPitXbowu2ulsAF7xZx34mTyP6nrz+mCZYtJ7K8sOhfkzlOWi8+qMvwiTLqym3IaIN
         sFmLnWh0yA4N6h98DzKZKuGxEDvdxEbF+g7CZMuN9uLjB/gG0WmD0SCZ+ZqH7xksRnJi
         IpUue3x7k2vl+gPREFd+Q7c9DdHomMDSURuMcRJKL0cPmVPknChKJm3GvIXoJfrYAnBI
         FrY7SJehZ4z9jn/uVww5+2nLO+WAKqkRLwjuUO3VkzJ3fYR/JGHVVNVx35C2/tCdQPqF
         UmFVsMHuUk7Ut+qSTbrvnw7PI1VIEUnzsUsltNv+EezWUFKyHQr7DYmT21VI+TLBKPbN
         E4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685959746; x=1688551746;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BRmE3g2QJT0SgK/3STNj6b7IqlONWZa1zmfHqIOOFUE=;
        b=KNkeeNDiz6BQzXKxC0DSyjjz9bRlAUWC7gjGrEEHtUf7GjfD4GtRALdUl9XvK6Leto
         8FtZpf5w9gas1+yrygqkcy1c02mBOemcxnnkPgbQzkhsulhXbaROnEmnHExNiTt0Tc3+
         /UPmin4Zso7IyQkVTrOR0icShmXbISoEzdHS1YUrQJ6AY4HjO+/p8odUpLXJzKI1JTuh
         EzjHPHElFW1jYYry20M9gO/PRLoJDRHLSM4FnZ43Abv1mBN0DPJ3oLjoRSHU077Ce1OP
         7mY82K5pO2XX2QxBVzrfDwCc9ux9sw/26+fxPGVCmUhx6j1eeyWgukaT0OPZTr/N6iX8
         PwlQ==
X-Gm-Message-State: AC+VfDw0HaOqGqTPX5nXXyClA0MpB24KqXIxW6Ou/iDfOEMSbEYVFIA9
        P4JMq0gjhooCqs4b/l9jRZscjrw6o0TOCS5cTIA=
X-Google-Smtp-Source: ACHHUZ7UydXn6tsY3Evtp3nqjZqJWS/5EK8Uaq4rxtzRpD3t8Xp7ozeh8a1xXqVVgTbIUzdvWHD2zNiUcDPUoa58eIs=
X-Received: by 2002:ac2:4d13:0:b0:4f3:7c24:1029 with SMTP id
 r19-20020ac24d13000000b004f37c241029mr4614430lfi.60.1685959745750; Mon, 05
 Jun 2023 03:09:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6f02:6796:b0:51:35b4:7d33 with HTTP; Mon, 5 Jun 2023
 03:09:05 -0700 (PDT)
Reply-To: felixglas37@gmail.com
From:   "Mr. Douglas Felix" <felixdou123@gmail.com>
Date:   Mon, 5 Jun 2023 10:09:05 +0000
Message-ID: <CAE7V6wxxHmEZfzO3i2m5gQy+tWXpMOPYjrZgXEMMtaPaToGHig@mail.gmail.com>
Subject: Good day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

A mail was sent to you sometime last week with the expectation of
having a return mail from you but to my surprise you never bothered to replied.
Kindly reply for further explanations.

Respectfully yours,
Barrister Douglas Felix.
