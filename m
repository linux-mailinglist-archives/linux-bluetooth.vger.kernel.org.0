Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35A7314ADC2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 28 Jan 2020 02:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgA1B65 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 27 Jan 2020 20:58:57 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35259 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgA1B65 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 27 Jan 2020 20:58:57 -0500
Received: by mail-pg1-f195.google.com with SMTP id l24so6135703pgk.2
        for <linux-bluetooth@vger.kernel.org>; Mon, 27 Jan 2020 17:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R3FwTdU3+YYxJ9SH0Yd6M6zNVwXOrrZbQeuDM/vJ5Fw=;
        b=luBgcOEnWPjDt+cpT6KoP8uJi/NyTEjILoOu/xFOsfstZZ4hs0ZnNeftmkm1qLl4Zk
         BoTvNCtfRaBYdsE/zKSlCiM95nPfKXMjRLfqj8uNOZge+T3uJ4bcmK5S5p3ANJPREa8s
         5HBk3/1H8fscF5HrR7a9CY7l2k2Lg9NZadM1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R3FwTdU3+YYxJ9SH0Yd6M6zNVwXOrrZbQeuDM/vJ5Fw=;
        b=WTJeqaX88I73xGoJwpi21D0rcVEvctNZHvhCR2ru13KbarZKpidmo8NusJdZqFzH7X
         5SGqcruyj9Z9hL1wX5CHWqfPu+vBVkNUOswZOj2JFUbstGvjfuAWvglvyETkNl0h0tM6
         PzvOqltWh+CAL4TsYB7lxzXewYFvDuP3W0Jxu+9vSejjWJn2aeSjHONQBRm8t5J64CCI
         NUt3q6oTNIUCExicmCEMVQa9g3vgfy/jaTjulLxTmpDGg/Y/YKv2dEDwlpqmYq4aQTLW
         mJY4LA8J4nhuKIe11Jbt50eWZEgARPjE33qi4JvEEEzXEmNADTO5Zw88lv5r1ZAfeakD
         sCVw==
X-Gm-Message-State: APjAAAXBT7jhSlWKD8WW5ctoLqoIDtqa9/J0a4oJtvqEjhpBe8nKyiW6
        3/cWEuzkAivK1Q9zzBNjrcgnIg==
X-Google-Smtp-Source: APXvYqxlHkQg/XtYWAHxf1igobzjJd7JwdFaEZsHNaEUCxNG40zoohunADuPkXpcBb/S4ivNa/zShQ==
X-Received: by 2002:a63:d04c:: with SMTP id s12mr22613870pgi.105.1580176736512;
        Mon, 27 Jan 2020 17:58:56 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id a17sm364153pjv.6.2020.01.27.17.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 17:58:55 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     marcel@holtmann.org, luiz.dentz@gmail.com, alainm@chromium.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [RFC PATCH v2 0/4] Bluetooth: Handle system suspend gracefully
Date:   Mon, 27 Jan 2020 17:58:44 -0800
Message-Id: <20200128015848.226966-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


Hi linux-bluetooth,

This patch series prepares the Bluetooth controller for system suspend
by disconnecting all devices and preparing the event filter and LE
whitelist with devices that can wake the system from suspend.

The main motivation for doing this is so we can enable Bluetooth as
a wake up source during suspend without it being noisy. Bluetooth should
wake the system when a HID device receives user input but otherwise not
send any events to the host.

This patch series was tested on several Chromebooks with both btusb and
hci_serdev on kernel 4.19. The set of tests was basically the following:
* Reconnects after suspend succeed
* HID devices can wake the system from suspend (needs some related bluez
  changes to call the Set Wake Capable management command)
* System properly pauses and unpauses discovery + advertising around
  suspend
* System does not wake from any events from non wakeable devices

Series 2 has refactored the change into multiple smaller commits as
requested. I tried to simplify some of the whitelist filtering edge
cases but unfortunately it remains quite complex.

Please review and provide any feedback.

Thanks
Abhishek


Changes in v2:
* Moved pm notifier registration into its own patch and moved params out
  of separate suspend_state
* Refactored filters and whitelist settings to its own patch
* Refactored update_white_list to have clearer edge cases
* Add connected devices to whitelist (previously missing corner case)
* Refactored pause discovery + advertising into its own patch

Abhishek Pandit-Subedi (4):
  Bluetooth: Add mgmt op set_wake_capable
  Bluetooth: Handle PM_SUSPEND_PREPARE and PM_POST_SUSPEND
  Bluetooth: Update filters/whitelists for suspend
  Bluetooth: Pause discovery and advertising during suspend

 include/net/bluetooth/hci.h      |  17 +-
 include/net/bluetooth/hci_core.h |  38 ++++
 include/net/bluetooth/mgmt.h     |   7 +
 net/bluetooth/hci_core.c         |  71 ++++++
 net/bluetooth/hci_event.c        |  28 ++-
 net/bluetooth/hci_request.c      | 370 ++++++++++++++++++++++++++-----
 net/bluetooth/hci_request.h      |   2 +
 net/bluetooth/mgmt.c             |  89 ++++++++
 8 files changed, 554 insertions(+), 68 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog

