Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D34E181CF7
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Mar 2020 16:54:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729995AbgCKPyM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Mar 2020 11:54:12 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35075 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729848AbgCKPyM (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Mar 2020 11:54:12 -0400
Received: by mail-pl1-f193.google.com with SMTP id g6so1307444plt.2
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 Mar 2020 08:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zkKRih67nIXGMoMSRIIKy/nqbn5RrocuHsn8k5pVnAA=;
        b=YUiQneiW5Go1q+RAm5qkNRqk3wlN/KkqfhSfQx142Q7OOmktqS7t4LnMVhpRoBWGvI
         9gV2+adL6yuTX3zJaT7ty49b60tC+SpVbeDFHkNAn2rQ6qC/A3p1vb5ObvLMiBS/oSEN
         RFq33e+VH7QZtv8oR7RT2rJzo4TIz+KGCBSPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zkKRih67nIXGMoMSRIIKy/nqbn5RrocuHsn8k5pVnAA=;
        b=n/NArPfIhSNBeAeJcBIks/YKp/vwfLJs6AF4Fg6iQbLg/madum7ZcU3Ptyn7nOoCS5
         ZOiQ9FjN4bAw8jRK8tz66LNvry3yqewK2EmhBagLAdAwjsHL8cQXjxpU1klq3FF5sjWe
         x5i7tELdZIRG4eGv6P5mxG9ypX8O8vmARdpwmEXPFUs1KuW6Erf6nO/ALzI44bUYh6u6
         3b8r2+pMd4v2671EC4AzTOks8qGhzO74E/NP4bNYywytHDG0Npb+9CYfOwiKmvi0fWa6
         YrJhNt9P9WcgtwIC63A1cMyf59eTACkmr5/PgXaV61HLXGV5eUkZfzeNPzm59en7Q+Fb
         AeFQ==
X-Gm-Message-State: ANhLgQ1kKawyHjiFq5Kz1mrWEVGShT23f8xlDHna1jGwOGszcYgSY+ZX
        Vr+8QVreFc4ZUAO27kuJ3rKHPw==
X-Google-Smtp-Source: ADFU+vsc68T5f8y6CzTy4WAWs/4VVN02qUKM3eJ6zl4Dd7s9HaUQtp1+YxN2zW+bKvAD6MMjv11hOg==
X-Received: by 2002:a17:90b:19c3:: with SMTP id nm3mr4215441pjb.149.1583942050863;
        Wed, 11 Mar 2020 08:54:10 -0700 (PDT)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id a71sm13756265pfa.162.2020.03.11.08.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 08:54:10 -0700 (PDT)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     marcel@holtmann.org, luiz.dentz@gmail.com, alainm@chromium.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>
Subject: [RFC PATCH v6 0/5] Bluetooth: Handle system suspend gracefully
Date:   Wed, 11 Mar 2020 08:53:59 -0700
Message-Id: <20200311155404.209990-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
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

Series 3 has refactored it further and should have resolved the
whitelisting complexity in series 2.

Series 4 adds a fix to check for powered down and powering down adapters.

Series 5 moves set_wake_capable to the last patch in the series and
changes BT_DBG to bt_dev_dbg.

Please review and provide any feedback.

Thanks
Abhishek


Changes in v6:
* Removed unused variables in hci_req_prepare_suspend
* Add int old_state to this patch

Changes in v5:
* Convert BT_DBG to bt_dev_dbg
* Added wakeable list and changed BT_DBG to bt_dev_dbg
* Add wakeable to hci_conn_params and change BT_DBG to bt_dev_dbg
* Changed BT_DBG to bt_dev_dbg
* Wakeable entries moved to other commits
* Patch moved to end of series

Changes in v4:
* Added check for mgmt_powering_down and hdev_is_powered in notifier

Changes in v3:
* Refactored to only handle BR/EDR devices
* Split LE changes into its own commit
* Added wakeable property to le_conn_param
* Use wakeable list for BR/EDR and wakeable property for LE

Changes in v2:
* Moved pm notifier registration into its own patch and moved params out
  of separate suspend_state
* Refactored filters and whitelist settings to its own patch
* Refactored update_white_list to have clearer edge cases
* Add connected devices to whitelist (previously missing corner case)
* Refactored pause discovery + advertising into its own patch

Abhishek Pandit-Subedi (5):
  Bluetooth: Handle PM_SUSPEND_PREPARE and PM_POST_SUSPEND
  Bluetooth: Handle BR/EDR devices during suspend
  Bluetooth: Handle LE devices during suspend
  Bluetooth: Pause discovery and advertising during suspend
  Bluetooth: Add mgmt op set_wake_capable

 include/net/bluetooth/hci.h      |  17 +-
 include/net/bluetooth/hci_core.h |  43 ++++
 include/net/bluetooth/mgmt.h     |   7 +
 net/bluetooth/hci_core.c         | 102 ++++++++++
 net/bluetooth/hci_event.c        |  24 +++
 net/bluetooth/hci_request.c      | 331 ++++++++++++++++++++++++++-----
 net/bluetooth/hci_request.h      |   2 +
 net/bluetooth/mgmt.c             |  92 +++++++++
 8 files changed, 558 insertions(+), 60 deletions(-)

-- 
2.25.1.481.gfbce0eb801-goog

