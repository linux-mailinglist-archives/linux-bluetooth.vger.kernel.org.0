Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AA61E9840
	for <lists+linux-bluetooth@lfdr.de>; Sun, 31 May 2020 16:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728120AbgEaOsm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 31 May 2020 10:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbgEaOsl (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 31 May 2020 10:48:41 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C2D3C061A0E
        for <linux-bluetooth@vger.kernel.org>; Sun, 31 May 2020 07:48:40 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id x1so6758741ejd.8
        for <linux-bluetooth@vger.kernel.org>; Sun, 31 May 2020 07:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=noa-labs.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=QOLKLtuEbtRh7GCfNluxpoQGx5B4CjLi+p8ryZb4UKY=;
        b=eJmItA1D549hG1erGwfbvioJ4quADH3ILKkUA47tQfHcTLOqKer0Nrh2kX+eINdvaI
         2BfJs0+TO5Gdx/3ANZ89o8IalDES2eDJn4eVzIXCmLfyIlrRLGCVhYZgjRtJ5Z5GnoO1
         7Y7l467uUXHDPs+bPrRmb1i6MzcLeK9ZsZN/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=QOLKLtuEbtRh7GCfNluxpoQGx5B4CjLi+p8ryZb4UKY=;
        b=qJdEZIYZfi83TCl7xFPeQM+WMp97NGZGm08cDIx0VVs25JdnDpos9ITm2DnS0fiJ0a
         UTQ6tO28lOOte9mCwLGhaoO/bTtfEh1rklPR1Eybe7dbM/MI6yaxCNQwyiS5H28P6N7n
         bYqSVxk4E/OsIAq+hqRucs80uMxd7v43jIcmjQTNfBZ8LesdQO4cAO2JlybW9avo2ePo
         9Z2h0smP4JywkX5/EtOg1uND2+YyWlhcBT5YLC/Fz81zHZpw3Dbhd+102jLmwY7SzxEa
         hb1TeWjcwbxVh8MRuU2T9syEuf6DbQUww4Fe9crhNZUrHxfwze+Cf81TELVfZXaTu7WJ
         2o7g==
X-Gm-Message-State: AOAM532Si211chvQlYoKUeFfj7MwOVHdozXro4xy2Rpsf5C8gqcqaDYk
        J9KsloQd1rijCQAqnGzK/KKlE8YDor3rcWdwufXE7sUasm1U5LYF
X-Google-Smtp-Source: ABdhPJw0yI1IaT1fPQZavG0htmUlkS94gOy9zmh5FKS3RcfaDOwWOBj9VjXOpBd1hp8q1eIFxBk+Wp4c+USeKzbfJUI=
X-Received: by 2002:a17:906:404:: with SMTP id d4mr8124935eja.173.1590936518721;
 Sun, 31 May 2020 07:48:38 -0700 (PDT)
MIME-Version: 1.0
From:   Pavel Nikulin <pavel@noa-labs.com>
Date:   Sun, 31 May 2020 20:48:27 +0600
Message-ID: <CAG-pW8FPh=Nyc5wFZ3xasOsenPAhE7qW-Ey58pQsL5W+QscWeQ@mail.gmail.com>
Subject: [Bluez] GATT battery service doesn't seem to function
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

I have to return to the topic of GATT battery service, it doesn't seem
to be working. My Rapoo bt 4.0 mouse shows
"0000180f-0000-1000-8000-00805f9b34fb" attribute ("battery service",)
but I see nothing exposed on the dbus interface.

Can somebody with a BT 4.0 mouse that has battery service check if it
works for them?
