Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 721C858282C
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Jul 2022 16:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232641AbiG0ODx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Jul 2022 10:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231204AbiG0ODv (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Jul 2022 10:03:51 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB45B03
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Jul 2022 07:03:50 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id r14so19927809ljp.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Jul 2022 07:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=3aFTw8H5phswNH2+dV7HvXz/6aW0iiy4e+J50BzPHa8=;
        b=cMT6Palrzsi2VRiJmROtTVABshO1kHS1F1unVebrYn7XThJ6FCMDei4iQov9qvOfFl
         vVKYuQ10ux4Dxp6yDXIHWEGdfYMpFTI3NXddxyikcmTVYRBpUBoXT7FuuFTdHVmWHIzq
         LBIN9xkbZ54BnJ+VTU+3VWBqvJ2pl8fmPReeHAcumM7jhPeVEWR/64HcBdV2Nw4Wy2C+
         AyX/VDoy/ql58LkP6VGgphC/6In8GNwiD8glX1UjmWUa5SnSZBcJIfx3PKTj3hPT7N76
         wMJSkO8V5k/Kq9T3OXHLVzISBMIRHrVbHNAlKos0hp2MeZ9sAw0bEMpnQ+OOiEayMhV2
         3qAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=3aFTw8H5phswNH2+dV7HvXz/6aW0iiy4e+J50BzPHa8=;
        b=vn3BQ53CF4SYdjZCK+ZAXsKBqnx1LlOY32/UPkbEkbY41gsJpSev+xd/5y1uRIFVLX
         +ByzP8oL8xu4WmCHfrV8DTxsn76nJn1v/D5VZOYIkhGNtdB653KOAfp22bSEneUmrH5r
         ClkGfSgd+9rE0KLInWuZHLlFWPN15d/CUrsYl2BD67zVlmR8b/Z8eTWcJ94ECPXbInJ6
         3XvEeA+eMNGbi6eXRRJQxASj8vXRDCKDdEcy/4YqShyOpGrT8/Nx30JjmhQNeQorEGnq
         3/N+K+ilBL3BHhj98PwNWpMNlvn5FDPPXcIEAJT4IENs1RFeJV96mwWo+nizboKBEyKD
         Oh0g==
X-Gm-Message-State: AJIora9mbaVv5C4AjIDIuNjpmn3yX/88W6uSNxTvA7GJJkixt/QFsPwD
        hPt0VSlT7asMaUxiFH8Y3UjULF0BdwIC+4Ivhsw=
X-Google-Smtp-Source: AGRyM1uUcL/1eDt8M0pIpkW1m/Zl2ZXq3I4cT5M1aKx7Yi7mSJwr+p3EDMB9KBprJ22fB4iMx2usUj7z+dzu5psNBD8=
X-Received: by 2002:a2e:96c9:0:b0:25d:fc67:8df6 with SMTP id
 d9-20020a2e96c9000000b0025dfc678df6mr6950305ljj.518.1658930629241; Wed, 27
 Jul 2022 07:03:49 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkalamanthey@gmail.com
Sender: tantaadjo@gmail.com
Received: by 2002:a2e:a16d:0:0:0:0:0 with HTTP; Wed, 27 Jul 2022 07:03:48
 -0700 (PDT)
From:   Kayla Manthey <sgtkalamanthey@gmail.com>
Date:   Wed, 27 Jul 2022 07:03:48 -0700
X-Google-Sender-Auth: _zRR2LVSkFTTwdu8308YSWzdIk0
Message-ID: <CAOji6HA7qCysqknZb9Cg3stP59SsckXhhvA-OnfOF4DpEA2KyA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Ol=C3=A1, voc=C3=AA recebeu meus e -mails? Por favor, verifique e me respon=
da
