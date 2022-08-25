Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFF65A1CF0
	for <lists+linux-bluetooth@lfdr.de>; Fri, 26 Aug 2022 01:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237680AbiHYXGe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 25 Aug 2022 19:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbiHYXGc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 25 Aug 2022 19:06:32 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95695AC269
        for <linux-bluetooth@vger.kernel.org>; Thu, 25 Aug 2022 16:06:29 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id m5so19492513lfj.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 25 Aug 2022 16:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=YjSutSfQLPTSJkfTJCo7/0dczplHjBlUMeDJAi+0FrM=;
        b=km8I0QHqM3AIrh4uNA4tR0QT0/A8bydKsQYDIz4HWWjw9AqIf9tPBEIE4P6A/0ZQ9a
         406FW88QVSpoIO+I5VnrjX73LngYcMSXXNBGXqAmH1cqEjBr0088WAh7xD8q/0skeFmk
         giG0zmLcdqFkA6IBrCqGgBjbMHN+tTv1e6wNPFncBtoGl4wh5+xBEzdk/iHNuBy0Z51N
         8cbfZNnlhXYV6zKqY7sez2o3PeJfSK41DYQB9iG1JndSwlP9IEkNTd9UZsuxVKX4FyTV
         wrRAQrVHWiVLyXXA2XJ81ckHjLRlYoco5shkl8hdWlz4DtuUxOEf5WisctTOlFqWIXPi
         r1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=YjSutSfQLPTSJkfTJCo7/0dczplHjBlUMeDJAi+0FrM=;
        b=7tw49ilqVDJHHh7wLdABS+hUQwKNCR/z/fi/Obbhodn0r71vhDngHT+2elhm9EABf7
         6bW1NOGYRUWa7LJDlcjub1uUuWnLF4Jlzh7PeWqMLXrPyadPb8wv93JQMBllZP9t0pji
         zSYXifzsiEKUGEmjOj82Adn/6rU66LTPoJ8jlgXdq1WV2kztm58dB41n77dmxvGV2y2c
         30LYdxFBhEiwpaIkO5Zi/hQ0NTgUtY0EceWp1zwqZ7+pxe8+hFkFL4X0nKwQJsOpaacX
         CIn8wBnaAwrirO/G47QU8jHd4g+0wG/gMNUKK8j390zFJtpGfxJt5A6iJJITn0HLNs6d
         VU+Q==
X-Gm-Message-State: ACgBeo2at84JHIbSjHsF+1r5GWHO3hPw6Y2GKcKnBqWI89FtCamRMkiS
        H9VW1EpqUCnjXq0VOJimDf2iTbYeFxXcrGGOYxODA4MP2zc=
X-Google-Smtp-Source: AA6agR5n9r9bH3E+B8OMFtj+K8n6POVnzFsBfHtmrkFfLveCEMuKepwfY9q51vSqMVnj+UNsnUc2y4XJhx3+hHpnMfE=
X-Received: by 2002:a05:6512:2621:b0:47f:d228:bdeb with SMTP id
 bt33-20020a056512262100b0047fd228bdebmr1623861lfb.121.1661468787853; Thu, 25
 Aug 2022 16:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <db39101f70c945026e76d7b49ee358d9a2330358.camel@hadess.net> <6422b1f3f94e959917f919af20a2aa43b4c13a89.camel@hadess.net>
In-Reply-To: <6422b1f3f94e959917f919af20a2aa43b4c13a89.camel@hadess.net>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Thu, 25 Aug 2022 16:06:15 -0700
Message-ID: <CABBYNZ+TKBSHr67Avm+g-_ce8bKE17OSp9xMayJk_y--MsAuDQ@mail.gmail.com>
Subject: Re: [PATCH] adapter: Implement PowerState property
To:     Bastien Nocera <hadess@hadess.net>
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Bastien,

On Thu, Aug 25, 2022 at 8:32 AM Bastien Nocera <hadess@hadess.net> wrote:
>
> On Thu, 2022-08-25 at 15:26 +0200, Bastien Nocera wrote:
> > This property should allow any program to show the transitional
> > state,
> > not just the one that requested the change, and will also show
> > transitional states that were the results of other system changes,
> > like
> > rfkill changes.
>
> Looks like the bot doesn't like where I put those comments.
>
> If anyone can comment on the API I used, and I'll iterate the actual
> implementation. I'd like the API to be settled by the time GNOME 43
> ships, so we can rely on it there.

I wonder what are you actually after with these changes, in most cases
I'd say the changes shall just be queued, anyway perhaps the problem
was something related to:

https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=ede7b915980fbc80eff80aa189c35ca016956c61

-- 
Luiz Augusto von Dentz
