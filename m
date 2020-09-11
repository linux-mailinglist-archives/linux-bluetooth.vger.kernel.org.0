Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A262266274
	for <lists+linux-bluetooth@lfdr.de>; Fri, 11 Sep 2020 17:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726575AbgIKPqc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 11 Sep 2020 11:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbgIKPoC (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 11 Sep 2020 11:44:02 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD2EC0613ED
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Sep 2020 08:44:02 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id y5so8705982otg.5
        for <linux-bluetooth@vger.kernel.org>; Fri, 11 Sep 2020 08:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u6rIMAYi8YQ+iHRx2SZ568AIEDi3Qgp+XMjB0kWcHNI=;
        b=OCaWXHqabF5JRwYd3qv+b7U8DNGeVhSelbamEm+sHyDOJbsD8V2vAOPh8TLnAZbkvA
         LklsBfMjbzkVwwyZQ+jXmf7zbpF+ZPe6P8IkBtXAP05DNIid8UQE8sYhnxlkqUj6tRZ3
         9eJ8zL/yCpjGymoChlxIlt1mQW+MCnGtUl8HVkaR7lT3U66hoJmolxy+3LMes3d1zznG
         oEIgapWwOTj27Cx81vuyoLyRN0tZEk14hMxcEceTVQEL8YQBHzfeGn1FxI/kiT9YNR3Z
         4O5/zpLCoSJeSSGvczIPxdcMKmhKu/QsjJrAllSYj1wq1ctP7g/Ahro0ywSUNw5GlF9w
         lcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6rIMAYi8YQ+iHRx2SZ568AIEDi3Qgp+XMjB0kWcHNI=;
        b=HOqRIeOvRdJJUNT9KJ8Vi6ufhZpj8ipdKuZ8o1U5pHIocF8c+aXqtcgE7tTJ/kxWcL
         CWKcq2bVXAC+PFK/Y8iYF+37M/mt5+tssa3g+Szmqaq/fM0FwY7BsK2z/OpRHJ20jjEz
         roNLMzxW7OXF1C4HMUihDns5MxA6jFMQ/D0E964qBfCVoRSDdfw4v6bru+cGMspNmXd6
         cluK29lhmnqXFdL+m464F2qYjFJUiGjFArNyM+nEIg+Z1kgcKP1gDnzZ0crSlSEHlWqg
         H1Qb/xbjbhP5xnQkxm5ualumRoKExYXpGFy3MaiFGCzlUQANxtg5s1YoMtNpEA3ig8m7
         37nw==
X-Gm-Message-State: AOAM530AB9xu3m/bdAjMNdtHwMlk03vHlrIWQLziOVC7rCgkiW5MGn2q
        J1O8/iYsKG2q1oGQf+YuHujSa6CrqcCe4qxZzWg=
X-Google-Smtp-Source: ABdhPJyuiKTIj9KCL7tOayUd9SRhKG7iUS646HUcsrHS8UysZOxdLmAa5lBHnbVcKVP7kE7qKCBauaO2H84VERiU8q4=
X-Received: by 2002:a9d:429:: with SMTP id 38mr1482226otc.88.1599839040717;
 Fri, 11 Sep 2020 08:44:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200901115913.Bluez.v2.1.Ieeae14ab680eda03474551fdb7a0a020f950e9c1@changeid>
In-Reply-To: <20200901115913.Bluez.v2.1.Ieeae14ab680eda03474551fdb7a0a020f950e9c1@changeid>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Fri, 11 Sep 2020 08:43:50 -0700
Message-ID: <CABBYNZLsYsV51nFLFp0pfkMm-oLtNAw1_eXAdx2dxOeQgMA5eg@mail.gmail.com>
Subject: Re: [Bluez PATCH v2] audio/transport: Don't set volume if it's invalid
To:     Archie Pusaka <apusaka@google.com>
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        CrosBT Upstreaming <chromeos-bluetooth-upstreaming@chromium.org>,
        Archie Pusaka <apusaka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Archie,

On Mon, Aug 31, 2020 at 9:00 PM Archie Pusaka <apusaka@google.com> wrote:
>
> From: Archie Pusaka <apusaka@chromium.org>
>
> Adding a check inside media_transport_update_volume to prevent
> the volume being updated with an invalid value.
> ---
>
> Changes in v2:
> * Move the check from media.c:set_configuration
>
>  profiles/audio/transport.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/profiles/audio/transport.c b/profiles/audio/transport.c
> index a2c4f7dfb..dd1c553a2 100644
> --- a/profiles/audio/transport.c
> +++ b/profiles/audio/transport.c
> @@ -941,6 +941,9 @@ void media_transport_update_volume(struct media_transport *transport,
>  {
>         struct a2dp_transport *a2dp = transport->data;
>
> +       if (volume < 0)
> +               return;
> +
>         /* Check if volume really changed */
>         if (a2dp->volume == volume)
>                 return;
> --
> 2.28.0.402.g5ffc5be6b7-goog
>

Applied, thanks.

-- 
Luiz Augusto von Dentz
