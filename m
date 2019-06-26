Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 437F556878
	for <lists+linux-bluetooth@lfdr.de>; Wed, 26 Jun 2019 14:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbfFZMTW (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 26 Jun 2019 08:19:22 -0400
Received: from mail-ed1-f43.google.com ([209.85.208.43]:34907 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727302AbfFZMTW (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 26 Jun 2019 08:19:22 -0400
Received: by mail-ed1-f43.google.com with SMTP id w20so3085718edd.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 26 Jun 2019 05:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=msQfMnlg3RPUQ1CZcNb38dz/uHSnl/U39F66ISbtJAc=;
        b=Brsf0wuABgYONoVR7TYd3B7Ucxo5HcQ5AAOhCh4RGXv4lP8MPR6876PWyuBMacwTdb
         OExHt3DQva/lx5b2cidG6tZSBv832L8+aItiIWenYY7y9RbKyOCeGOloA2Ql8c/hTfuz
         WqXhKwh2JvGKocfLEYpniPXTS/aUgVh+XshbAI+sNMDWIz7ic0x5lJW1AAxZjfZDsexi
         TagvmwpSNrhBK9aTWJ2SBR7vciulZIUcftDzFMzxWPcL3P4FOeftStojNa/8gokJBs4v
         pKscN9lSP//1mCJ7dE/ekWMOHX/MTbxGIsZvIqobAUWCy3O8FAOSNdsa3YrVoXr24iVy
         neAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=msQfMnlg3RPUQ1CZcNb38dz/uHSnl/U39F66ISbtJAc=;
        b=XpW8VdxXrvtvHTy1hgwHlGMaZWS0N2o8Sco7yYUJGJhheyLSOButrdNgzfFitrJoLN
         vDo07qHreoq6gr4jVOpLEIPR8CJYb5S0WSUIaf+ZQzAlwGfYqQfH2vHr8K+kkE4NH4/7
         fctdvgU6ucJz90U4bY8SQlGPT+D7P10quY9YbKssRyCd3wIWLKyu+OwNartHAFjC2HRS
         U9bzGAS9zO/vJdHj2VqDpjrYB9qlBgdON69ySGgYIzioZkTRyYR7Uz2qF/Chs8jHVtuD
         bGwJGsosPYY+L0WakEnxQq813AFAgt5PH5saRlgsWhZFMXyMY+DJmZNDYxc9C/8Hm+ym
         iITA==
X-Gm-Message-State: APjAAAVHDB9pg1kWH/AWU8ITfNFP/Ggkj0P4/c9c1h60EFSE2kq+6xP6
        9gtuDr2vkjmXba0DKgbPprx6hY6DaKGUa+H7filZRL7be6Y=
X-Google-Smtp-Source: APXvYqw8wMikw4boWb+F8zdLx4EemhusURLEtLrhQQjpS1JpYaibwjV1pWXRcB0ZPSe9eh+/riBCLN1tSKiS8SYTuA0=
X-Received: by 2002:a17:906:43c9:: with SMTP id j9mr3693057ejn.248.1561551560572;
 Wed, 26 Jun 2019 05:19:20 -0700 (PDT)
MIME-Version: 1.0
From:   Belisko Marek <marek.belisko@gmail.com>
Date:   Wed, 26 Jun 2019 14:19:09 +0200
Message-ID: <CAAfyv36tZvKHE3EqkHRx82miykuiBnLVCm+jo8+Pu7TSKs79Yw@mail.gmail.com>
Subject: hci_bcm probing issue with 5.2-rcx
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,

I'm adding bluetooth support for nano-pi-neo-air which is using AP6112
combo chip. I've described in dts UART node with all necessary pins
and regulators and 32kHz clock which is necessary to have BT part
working. It also looks like (from bootlog) that serdev is probed
properly but I cannot have hci_bcm platform driver probed. I see
driver is registered but there is no mention anywhere about hci_bcm
device (I would expect that in dts as it's platform device).  Am I
missing something? I get inspiration from other allwinner boards which
have same chip and probably there it works. Any ideas? Thanks.

BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
