Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8D8114EF0
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Dec 2019 11:20:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfLFKUd (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 6 Dec 2019 05:20:33 -0500
Received: from mail-pl1-f175.google.com ([209.85.214.175]:37244 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfLFKUd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 6 Dec 2019 05:20:33 -0500
Received: by mail-pl1-f175.google.com with SMTP id bb5so2554077plb.4
        for <linux-bluetooth@vger.kernel.org>; Fri, 06 Dec 2019 02:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=ghLrXJLhDfe3OOmUKO+fQNmcK1W4zF2wIIsHccAKmSk=;
        b=YRcEssbmcYq8g2MuAQSEx3EgvjSyDIT15Z4nKOIa1X6q5yEpeGqAPAtOU2VboPZ+ln
         zYOzEP+ZhBZgLRXzUJnEE9AjCTii40BabczCYLKQP4aLmXes/lXvoCvBkyjj/sfEnaaP
         KHzVKQIwBPnVJvZT8E3kfwwyaoPmJwMQgAAHgGUFGLJbG/YwU5b9J+dLpG5iu1RyI6RE
         mfA0qXcMk7Iq1D4GccTL9fHfEKQsoBGIiSbMXHYSDPuYxXABz3m55HFuSt9wR0PBJu22
         kwmMWxZsO6nlZQ2w5MLslmiTYPom9/bihApCZR+K8IpRVBTVirMg49JVIyPTK/hhh9Vw
         FHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=ghLrXJLhDfe3OOmUKO+fQNmcK1W4zF2wIIsHccAKmSk=;
        b=K3ihaAQGyY8KFlMQ+NsxDElWOtSbWP/O9MHUhW0wULCtts2AJFxdoKYLHCIvXuK5HU
         Zei9OwlAOyDRj3iT7r67vHi1jv4R2HlxILuCZjHvx7q61Y24pyrZsAR9FLXhFNL3A1N7
         /xI89geH+/IR95GwJuCpiYUoZd0YlQByUiyJMN7e5odREOM1Eb71HhMwqaMYHZc36SB+
         +JSD817nh9l/1wp1s2Q529mVo3H4aDowTx+mNCHu6FPpmNOR/eiKCtCsVqVYBmRL4D3Z
         I8udOPMwVS9cH6uRUXJbBC5jvqG7uocjCR3Q1wKIi4AClJj5t8wR+J8es/NpaPmVB7PK
         aW1A==
X-Gm-Message-State: APjAAAV0DgJp4UgcGwrqfVJJGKOHrbML9EKhLLmn4ZnHsvjaNpEd7siW
        BEoTeCHXJDleoJTb36xhZK/2mDqcLYM7oGNxypLxbPpX5T8=
X-Google-Smtp-Source: APXvYqwqWmES6WbvfmmyTrU8AWkqIp7xDIo8wyvKTK2o5Qoqw20mLiLyirUE/xHx5MEEz0R7TbgdZsjMShuayMTM100=
X-Received: by 2002:a17:90a:1a1a:: with SMTP id 26mr14781699pjk.129.1575627631915;
 Fri, 06 Dec 2019 02:20:31 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:90a:d103:0:0:0:0 with HTTP; Fri, 6 Dec 2019 02:20:31
 -0800 (PST)
From:   Abhay Agarwal <aabhay169@gmail.com>
Date:   Fri, 6 Dec 2019 15:50:31 +0530
Message-ID: <CALbZ3NKzi=YLS4EjoCqK2j0921oQyeDueyrxtXTA1LYD0OUdqA@mail.gmail.com>
Subject: 
To:     linux-bluetooth@vger.kernel.org
Cc:     "ananupam.r" <anupam.r@samsung.com>,
        "aay.agarwal" <ay.agarwal@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi

I am trying the mesh-cfgclient tool to control a sylvania smart+ bulb with it.
I am able to provision the device on PB-ADV.

Unfortunately I am not able to configure the device. It shows the
error message as
[config: Target = 00aa]# appkey-add 0
No response for "AppKeyAdd" from 00aa

Note that I have been able to configure and control the device
(on/off) using meshctl.

Please advise what can be the issue and how to debug this.

Thanks and Regards,
Abhay Agarwal
