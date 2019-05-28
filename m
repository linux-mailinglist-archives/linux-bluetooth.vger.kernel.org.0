Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B80B2D0BA
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 May 2019 22:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbfE1Uy5 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 May 2019 16:54:57 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32970 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfE1Uy5 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 May 2019 16:54:57 -0400
Received: by mail-pf1-f193.google.com with SMTP id z28so63671pfk.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 28 May 2019 13:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=0pmw899+pptG3Q9+Pg72xOhxHG5C/1h5ZC62Ak+ZjHk=;
        b=I/88Y4xjt3vuZvcpleBS7NAPM0TrB+TP6YEfLLz0i0mjDhiJSVXL+dbCNOEUG3vl90
         3uRV7VEgDiaeFBQ+UAJN1bFRa5uOHCPLESwIWOVG1lquJgwgk81rfuTwxLY+eDRotQ/I
         JzfrI9FSMPSLL406eoLb+80EMibNAiwIYOGIbFEAgOUnlak4szn1K4OItfk7C4M2Vpl9
         +dfmyFw+yue6x5rd46SXZVdo1Ahn/DecLz5PXUiCKKMHMKFq5WpLnV12815ZqCEWhPnB
         Khxza55WX9KhEuxAJ72oKPOO5sF40Gftux9NoK8FxtzwBdxr5g0bBV/EjEtYGF4onBJm
         fdvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=0pmw899+pptG3Q9+Pg72xOhxHG5C/1h5ZC62Ak+ZjHk=;
        b=fHleNGv3ERE4NNH5pfjmCZfotkDD1jocdMvrKfncm4Qc1/LB2x4yExFsOjEilKthSy
         Y5u6pklUVhSWHf/4xV+RY4tM+y+edUthCWHLSWgFxef3Jn5HRPt3QrtxyS9MiAs1UNM1
         6b1T22KguZaYzvURSb4GH+OVf7YerHBiHoi26uJPGU1kGxDcQov+4agY8eMEp5JOKla1
         cZ96ib4+G7PHf0XLaI0rAcOycu0t9gmRQheSIWkuDRC2ViAmnh4Ji8Sh68MaWCp5Q2n5
         JhQY7T+MnM+tt6CBjEpDkc4sgFKSl+vgjxQhOdHXwgci8zrgT3gVrqmqKEBE/LLoPrFX
         hc8A==
X-Gm-Message-State: APjAAAVKrZrHlmM66yQlQB4lGypmIEhU4/20mhp+ik7Wl+malxZGUyOT
        YGtk0pF0t4Qb6rSPLJoJ3a2NnSpAbXU=
X-Google-Smtp-Source: APXvYqzTbLuUGZWbJg9OpsKuDpwPPn/gx/ZaIa94TjQdpKtSIK81F7E6nLz94IV0SaUR4Evq7Yxq+w==
X-Received: by 2002:a17:90a:25ca:: with SMTP id k68mr8496325pje.14.1559076896511;
        Tue, 28 May 2019 13:54:56 -0700 (PDT)
Received: from [192.168.1.13] ([172.103.152.101])
        by smtp.gmail.com with ESMTPSA id i7sm15283606pfo.19.2019.05.28.13.54.55
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 13:54:55 -0700 (PDT)
To:     linux-bluetooth@vger.kernel.org
From:   David Frey <dpfrey@gmail.com>
Subject: bluetoothctl "advertise on" fails
Message-ID: <ae0ac0fb-faae-edaa-7205-9ef9d6b03edd@gmail.com>
Date:   Tue, 28 May 2019 13:54:55 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi,

I have an embedded system running Yocto Linux and a desktop using Arch
Linux.  Bluez is 5.50 in both cases. I'm using the same Cypress CYW20719
Bluetooth chipset connected via a UART.  On the embedded system, running
"advertise on" in bluetoothctl fails with the error message:

"Failed to register advertisement: org.bluez.Error.NotPermitted"

I dug into the source code a bit and I suspect that the error is being
produced in register_advertisement() from advertising.c:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/src/advertising.c?h=5.50#n1135

On my Linux PC, running "advertise on" is successful.

The error message in the code is "Maximum advertisements reached", so I
decided to pursue that.  I ran the command "dbus-send --system
--print-reply --type=method_call --dest=org.bluez /
org.freedesktop.DBus.ObjectManager.GetManagedObjects" on both the
embedded system and the PC.

This is the snippet from the embedded system that I think is pertinent:
dict entry(
   string "org.bluez.LEAdvertisingManager1"
   array [
      dict entry(
         string "ActiveInstances"
         variant                         byte 0
      )
      dict entry(
         string "SupportedInstances"
         variant                         byte 0
      )
      dict entry(
         string "SupportedIncludes"
         variant                         array [
               string "local-name"
            ]
      )
   ]
)

And the corresponding snippet from the PC:
dict entry(
   string "org.bluez.LEAdvertisingManager1"
   array [
      dict entry(
         string "ActiveInstances"
         variant                         byte 0
      )
      dict entry(
         string "SupportedInstances"
         variant                         byte 5
      )
      dict entry(
         string "SupportedIncludes"
         variant                         array [
               string "tx-power"
               string "appearance"
               string "local-name"
            ]
      )
   ]
)

I'm not sure what "SupportedIncludes" really means, but I immediately
noticed that the value for "SupportedInstances" on the embedded system
is 0 while the on the PC it's 5.

Why are these values different?  Please let me know if there is any
other information that would be useful.

Thanks,
David
