Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14DA6241FA2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 11 Aug 2020 20:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726068AbgHKSXB (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 11 Aug 2020 14:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgHKSXA (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 11 Aug 2020 14:23:00 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81528C06174A
        for <linux-bluetooth@vger.kernel.org>; Tue, 11 Aug 2020 11:23:00 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id t10so9776122ejs.8
        for <linux-bluetooth@vger.kernel.org>; Tue, 11 Aug 2020 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=80MqzdbmpekdCOXsCwtPy9E0KJ1f3RCz3JzvHIOL3oY=;
        b=Qov1Ikofkd7DoHpiXC5igXurZ5v0Fvtjl+PLkSmwodk8fciUbwQimTCfxTm/zSRUOY
         WD4Q2JekSdtbDP0bZ4qoYU1kcFF6focFzeOcL2e3WLdEGHR9MKVJJKlrrTtPQqjhOw0r
         I+pMLZoCKCCkCOzUuxdAi1Sxch5YKtVeowhCrpJkNI+JlLqMHYZFERed+5kZdH7MA3CH
         EH1meiLs3l7uuMJs2pNbeuPQtDqzXNuHqW9QrPJZtBHoCjOlOfjb8WIquyqkyH6E9VJd
         cdvhZp6UdMemlkMwrvxKs94e7VHwjZGjetznnYtjedCYvlXodfuxWoYuevAsfndovGlq
         nPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=80MqzdbmpekdCOXsCwtPy9E0KJ1f3RCz3JzvHIOL3oY=;
        b=rIEdXzn7uWr7ECLLTLRtmg1WSSxUeJVrnwmKMjHysHLk85DfTFSIYGqOOCg+mERxhr
         wH2I3WFth7iwDLtRETvf+toiOvz+fqdIz04aq9R3jtYIHahw5IGQ58dMQGMsikfeAn82
         FdJo5WNmoblhDr8Ferdh9xqC5ERVDp2N5La9s/Evu3dJjvVRWuxQ2wIKSC4X2ESzJIVy
         t6SMICG/dpgTz7XY9lDv3JIVpoCMgvRnC4/hGMDQg0wL+P8EQlxj+ou2VflIWXBVxSas
         LsxKgWgMpqniU2vwPOh0ctY/0ZkTr3OKbVIhwkehpbFdUgRRTkuX2jFTTY9090zYNQnt
         TlWA==
X-Gm-Message-State: AOAM5337xboVfOzDSfH8nO+7UR8QkAkp5Wc+2WNQNhZbW/g6B6ebXo89
        OrsM9fWE0B47yk8I9LLGSVv48qwtz/CALdETwjKwbYwzNSs=
X-Google-Smtp-Source: ABdhPJz7gfcfvfKo7suWvZgVOZYBNf4mG71TTgwLfhwgWewfIVZTES92hBbalSac1fPK52XAEgPevutKUKCZ5VHIbQw=
X-Received: by 2002:a17:906:e093:: with SMTP id gh19mr11531736ejb.210.1597170177637;
 Tue, 11 Aug 2020 11:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200803235811.2441774-1-yudiliu@google.com> <20200803165804.RFC.v1.1.Ibaa1dfd49179a141c19a651f3c2132a28b71b344@changeid>
In-Reply-To: <20200803165804.RFC.v1.1.Ibaa1dfd49179a141c19a651f3c2132a28b71b344@changeid>
From:   Yu Liu <yudiliu@google.com>
Date:   Tue, 11 Aug 2020 11:22:21 -0700
Message-ID: <CAHC-ybxKkrDzvtyj3ksyeh4zMuoCGeCOoRodLHi1ADLBYL1efQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/1] adapter - D-Bus API for querying the adapter's capability
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Friendly ping for comments, thanks.


On Mon, Aug 3, 2020 at 4:58 PM Yu Liu <yudiliu@google.com> wrote:
>
> From: Archie Pusaka <apusaka@chromium.org>
>
> Initially this is introduced to query whether WBS is supported by the adapter,
> the API is generic enough to be extended to support querying others in
> the future.
>
> Reviewed-by: sonnysasaka@chromium.org
>
> ---
>
> Changes in v1:
> - Initial change
>
>  doc/adapter-api.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/doc/adapter-api.txt b/doc/adapter-api.txt
> index 1a7255750..250d0e9b3 100644
> --- a/doc/adapter-api.txt
> +++ b/doc/adapter-api.txt
> @@ -204,6 +204,23 @@ Methods            void StartDiscovery()
>                                          org.bluez.Error.NotReady
>                                          org.bluez.Error.Failed
>
> +               dict GetSupportedCapabilities()
> +
> +                       This method returns a dictionary of supported
> +                       capabilities that is populated when the adapter
> +                       initiated.
> +
> +                       The dictionary is following the format
> +                       {capability : value}, where:
> +
> +                       string capability:      The supported capability under
> +                                               discussion.
> +                       variant value:          A more detailed description of
> +                                               the capability.
> +
> +                       Possible errors: org.bluez.Error.NotReady
> +                                        org.bluez.Error.Failed
> +
>  Properties     string Address [readonly]
>
>                         The Bluetooth device address.
> --
> 2.28.0.163.g6104cc2f0b6-goog
>
