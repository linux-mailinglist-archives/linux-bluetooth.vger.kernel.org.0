Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B052DAB30
	for <lists+linux-bluetooth@lfdr.de>; Thu, 17 Oct 2019 13:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439698AbfJQL3f (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 17 Oct 2019 07:29:35 -0400
Received: from mail-wr1-f54.google.com ([209.85.221.54]:42584 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405872AbfJQL3f (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 17 Oct 2019 07:29:35 -0400
Received: by mail-wr1-f54.google.com with SMTP id n14so1915345wrw.9
        for <linux-bluetooth@vger.kernel.org>; Thu, 17 Oct 2019 04:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=I7csLYiup3xQD57gOwiCpPTw1guySgCP7xZ0hNqoNZA=;
        b=exlmi1lqnpVKrGyGJq30BVRhuhY1UkL5f4NRsVLSrAxUfCrQr0NCfWN8BzZnGmfdiq
         4c925Cteob0R5fRIiegMmPZ6dJ84a0ogiP+a2O7kE1jsRB6fPH3ap9BjkXWVodfrYji+
         cmY+YUtk4BJ3ADbD3Tee5EEoLF6Yx43QH8BZUcJNEfgm+xkXh8d6yGzdAenBui5Drzqq
         Z4xRcj5pj+5lNbiE1o+WKJyzmrRXk4DyEJgET4Fd1Ri6eCETQMqI1taeci2NoVNaSvsl
         blc7WOhZ+oLMHiQXxRKm6POjHZb3JoDwVDThNRJRlxo8voKveAkb0SY4aXvRhQKlwNQS
         Rhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=I7csLYiup3xQD57gOwiCpPTw1guySgCP7xZ0hNqoNZA=;
        b=TbJsreDZOoW2dSiAEnGgEmFX2dFumzWtjqRK9EnzLTEpO4+HT0IzHZk6u1/wlzSxhA
         qN+hhwyHFZrF3Knshyomj5RvfTVwg/s2qVsyugNHg+HRfckrml7TSBjxOpEyitYqY6+r
         5XWdM8o0d7Uv8cFLLsHxf/aYP1+I/ypcmODG1aWPsaKZXLmyXlcV2V6Ro6+hJUyJQUaW
         Gbmh9/Vl6AdDiEscNmAgrFMYs+8gSCk02/XsZTzGcquT0I9eJmakQ1A5ZIN0XmyOU9Xw
         QhaRpRp62kicW3Ar8oe4wzz//GG4CQqHnEOkolcAhiNZcEUsbbnw1nt86ZU2coIFP6uG
         GiXQ==
X-Gm-Message-State: APjAAAUMEHQx4iPvjZVFdxQnjidbJVo7qPBVuttuSR1zbqcEt6eyFUPs
        zkAJg4cGOWum4I634C87SLw5rcld
X-Google-Smtp-Source: APXvYqzdumroWEEZw8n6M+VtYt1JjvolDikZKVFSMsQeEh6WnCXbwDjOHa5ga4ObOgBp0goEN2JvlQ==
X-Received: by 2002:adf:e982:: with SMTP id h2mr447039wrm.53.1571311772528;
        Thu, 17 Oct 2019 04:29:32 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id k3sm1754008wrn.41.2019.10.17.04.29.31
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 04:29:31 -0700 (PDT)
Date:   Thu, 17 Oct 2019 13:29:30 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: HSP/HFP profile daemon for bluez
Message-ID: <20191017112930.baovyz2n2qc2nzgj@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello!

I would like to open a discussion about problems related to HSP and HFP
profiles usage via bluez D-Bus API.

Bluez daemon since version 5 does not provide internal AT command parser
and relay on application's implementation which registers itself to
bluez via D-Bus API. Application get then via D-Bus bluetooth socket /
file descriptor and therefore must implement whole HSP and HFP profiles.

HSP/HFP profiles today provide lot of different services, including
custom vendors extensions. E.g. bi-directional audio, controls for GSM
calls (answer, reject, ring event), push button notification, battery
status indication, etc...

Basically set of fully different services which are on Linux system
managed by totally different layers or applications. E.g. audio by
pulseaudio, modem by ofono, buttons by linux input layer, battery by
upowerd, ... Some of them are running under ordinary user, some of them
as root; and at different D-Bus levels (system or different user
sessions); so synchronization is hard and maybe not possible (in some
cases).

Plus because different devices use different and custom vendor
extensions, all these services cannot be implemented by one application
which receive bluetooth socket from bluez D-Bus API.

To solve this problem, I would propose a solution for this:

Implement a new central daemon talking on system D-Bus which would
register for HSP and HFP profiles to bluez and then would export needed
information via D-Bus, so other application could implement needed
services (including those new custom vendor extensions).

What do you think about it?

-- 
Pali Rohár
pali.rohar@gmail.com
