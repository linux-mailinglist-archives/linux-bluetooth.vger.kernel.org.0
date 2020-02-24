Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10EFE16ABC1
	for <lists+linux-bluetooth@lfdr.de>; Mon, 24 Feb 2020 17:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgBXQhn (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 24 Feb 2020 11:37:43 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:37210 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727160AbgBXQhm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 24 Feb 2020 11:37:42 -0500
Received: by mail-oi1-f178.google.com with SMTP id q84so9535518oic.4
        for <linux-bluetooth@vger.kernel.org>; Mon, 24 Feb 2020 08:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QDktMIum9nfP/O/Ny6TOrCd0NP+ud4c+P68sJ6ny/CE=;
        b=H7++ynNmGrC5BF/mQIfH0OM5i/sJloQ8yY3qU6GdrFOLz68Wre0nM4ZfY15njCdBoM
         pKQ/AG/LHNDvVBonBolCbdsPPRqzXOE4kESs7OUF1CMc0J1D6fwE67SDvvmXKwYpJ6YS
         9aMsVotEWxWLryQMp5bxJXfp9vQApze5tW0LIZI6LMayPRXvyN7+8liE+cUJv6+fg4vn
         hMuRv3trbZM5I7Jlm+blObpdJG5m1zjMu/1eE+8AQ7kdugRRFLW7jEU2BpMNw7rIl0Nj
         PdBz5v8SWwRdm2DNkZnZ5wxKhn8Lqx/fL/Hdzs5aP57UoI+9n5vr2PrUr+DQxk2xSoIt
         tULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QDktMIum9nfP/O/Ny6TOrCd0NP+ud4c+P68sJ6ny/CE=;
        b=SO5s2UCM6vsegADuMuqgM7d2O9H8fCChQRgPYZIMatBW4zZKc85EFSHisgiXtP4vkX
         ucaKhOdsaZ9JrI9ijwcQfGVKIt1TwjR8RBqh2BscKeOKtFrILm4M0r4xAQyQaAjr789F
         DLPtnPY2akzbZq88/Y5WOe+kc+8PeIZxXUZMS3qC3zt5phC9a/EoABuVtHbda0DnvN9b
         CkupJB8i6vNTHos3hYAJ2MbaerXhN6wGXtzlqRtoR+ZcJNiGb2iOihmEQnOVecdmEglU
         Ra49VxV1YA7jAbP9D1X101q/qcGvGzmkHjkRBRSnona8vLVCtScpaNSnXCJvEejNbnOf
         4b7g==
X-Gm-Message-State: APjAAAVletgZH3mfpyadcrqHFkAda2jXoHGSp93HKrS8EloAr83NxI1p
        qnqQZ19EQyCoHr0FnIPZOZccw3wkp9WgQir1vgI=
X-Google-Smtp-Source: APXvYqyrfTL9fboyrZfsz1fmwCCyygZilT0mgGVkP2HVy+YSJSxbwPaRdJM89Ot6Xqs3tXEakrR4o1G8nIjAL6kvXzk=
X-Received: by 2002:aca:ebcb:: with SMTP id j194mr13440471oih.154.1582562262269;
 Mon, 24 Feb 2020 08:37:42 -0800 (PST)
MIME-Version: 1.0
References: <CAD3n0hm61cRPK3=Scf02y3Y3aMJ66eCC5nwFh40Y9kfLBWk-tw@mail.gmail.com>
 <CAAu3APZ4WqFd=61eUfbC8biTbygWW4k2Te3De38B2+maYoBePw@mail.gmail.com>
In-Reply-To: <CAAu3APZ4WqFd=61eUfbC8biTbygWW4k2Te3De38B2+maYoBePw@mail.gmail.com>
From:   chris baker <chrisbkr2020@gmail.com>
Date:   Mon, 24 Feb 2020 08:37:31 -0800
Message-ID: <CAD3n0hnJkmXGjiei0-u=GBh0xoGb4N7tkuBh_uSvsuT7bAhXLA@mail.gmail.com>
Subject: Re: Bluez blotoothctl scan vs hcitool scan
To:     Barry Byford <31baz66@gmail.com>
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Mon, Feb 24, 2020 at 6:08 AM Barry Byford <31baz66@gmail.com> wrote:
>
> Hi Chris,
>
> On Mon, 24 Feb 2020 at 10:12, chris baker <chrisbkr2020@gmail.com> wrote:
> >
>
> > So my question is, is there a way to get those missing advertisements
> > through the dbus api, possibly some additional setting somewhere?
>
> Duplicates are disabled by default with the DBus API. This can be
> controlled with the DuplicateData setting:
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/doc/adapter-api.txt#n107
>
> Regards,
> Barry


My apologies, I guess I wasn't clear (long post) but, I turned
duplicate data on when using the bluetoothctl command (via the "scan"
submenu) and also used the flag, "hcitool lescan --duplicates", when
running the hcitool command. So both scans should have included any
duplicates (unless I've misunderstood something). Additionally, none
of the missing packets were duplicates (again, unless I'm
misunderstanding what "duplicates" means). each packet had a unique
sequence numbers as well as the button data field toggling.
