Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46C6319827A
	for <lists+linux-bluetooth@lfdr.de>; Mon, 30 Mar 2020 19:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727302AbgC3RhI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 30 Mar 2020 13:37:08 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36067 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbgC3RhI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 30 Mar 2020 13:37:08 -0400
Received: by mail-ot1-f67.google.com with SMTP id l23so18985690otf.3
        for <linux-bluetooth@vger.kernel.org>; Mon, 30 Mar 2020 10:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=67vkxxG5IjKR4LqSgE1x6AexDxwbLkScIxAdK6GHZoQ=;
        b=cj/32gijfSHC5q5OQdOzgat89ObzzxOs0wSXH7L7UcLRv00XLykligALpCDSkZfSMH
         Bynr8r8OPb+WpONwL3+x989LXrJlnMVD7IFCyKFgVF7N1KRjPuZ4/ROEkeLWeyRCBcot
         bEAiZrB6YeHOT6grHGMVynURkOoC6fXVOLVp6owdrfsWtYAL3fWjxjt2A27CxXqgsTBY
         2p0ZP5L6TDNuBMxXuHjT3O1gXQqdalx+X0LaCKAW9sQh2RNdppKd74CfK7pdTrOB3s7x
         JG+8nkc/j9GpW2IGHHLyQBp7fHM7cM7ncoX33U623IE64fFucTOOkXcyXwHzS0yAJFyp
         B+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=67vkxxG5IjKR4LqSgE1x6AexDxwbLkScIxAdK6GHZoQ=;
        b=VZYHWORy1LXWndN3BgGN8YzYzPGm9CaTaWSUsDzj3kP/4JwkgAUFG9wPi1J7/KqOrN
         OGV3GlfqwMru2CmR3ovBabi70A1puJUEgcG6qOYD5zavj3juCifPH01h79E5SAoBGJQd
         FPbeLvPu3eV3p63WAMfLln9zPJ4MEANVaD0psZWggGxJVFWUUCtMqDkuD8IhddBb9dF2
         kfwJZtUZXkFH+D1jYO+1UN6gprvzM2QE2BX3HUXAGMRfYndY83PraAkqFHCpU2wmVrDc
         PRMi5Z2Rsrxe09oXLyg1ybuByNF8DcYibIZOqJYNnPiorcEsdMFdQY+U/GBkqCPNg35z
         mBqA==
X-Gm-Message-State: ANhLgQ070ViNmN5C65zdn4PVtCPp7yTTb0iyeUFsNYWciuHMDkvxtNT8
        tLcDrCSiqI8GLYDrLqfDUSCDUwXQsBSA8EimNJsNNs/V
X-Google-Smtp-Source: ADFU+vvtYSU5C+tI4LnlGm8blbZZzhcL/TsTP4Ju10Q5dnC6YBjhDk5gdXw/U+pdBz/dSiAMhiJ+g+ih/rshMnx2lJQ=
X-Received: by 2002:a9d:644:: with SMTP id 62mr5082858otn.177.1585589827525;
 Mon, 30 Mar 2020 10:37:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200330173006.12785-1-luiz.dentz@gmail.com>
In-Reply-To: <20200330173006.12785-1-luiz.dentz@gmail.com>
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date:   Mon, 30 Mar 2020 10:36:56 -0700
Message-ID: <CABBYNZKZe6CSKn88-JQMr5wj7MYc50sn21MxRSoSRJBnHwg-5Q@mail.gmail.com>
Subject: Re: [PATCH BlueZ 1/2] btmgmt: Fix irks command parsing
To:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

On Mon, Mar 30, 2020 at 10:30 AM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>
> btshell does not allow use of nested parameter delimiters.
> ---
>  tools/btmgmt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/btmgmt.c b/tools/btmgmt.c
> index b1820b41c..37c1c1c9e 100644
> --- a/tools/btmgmt.c
> +++ b/tools/btmgmt.c
> @@ -4455,7 +4455,7 @@ static const struct bt_shell_menu main_menu = {
>                 cmd_keys,               "Load Link Keys"                },
>         { "ltks",               NULL,
>                 cmd_ltks,               "Load Long Term Keys"           },
> -       { "irks",               "[--local <index>] [--file <file path>]",
> +       { "irks",               "[--local index] [--file file path]",
>                 cmd_irks,               "Load Identity Resolving Keys"  },
>         { "block",              "[-t type] <remote address>",
>                 cmd_block,              "Block Device"                  },
> --
> 2.21.1
>

Pushed.

-- 
Luiz Augusto von Dentz
