Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F48D14483F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 22 Jan 2020 00:27:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726584AbgAUX1H (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 21 Jan 2020 18:27:07 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44537 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgAUX1H (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 21 Jan 2020 18:27:07 -0500
Received: by mail-pl1-f193.google.com with SMTP id d9so2016872plo.11
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 Jan 2020 15:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jIKZ28+3W2EAr85v3sL7r0rk71wvn5AGJg9e/M1kbkI=;
        b=GAPEjbpjSbJHrBi9gyP80c2GsFzOa8NJIUiSAOy6NVQjfZZwhoy54rWii/bxQ489fd
         ZJpsmGUEl91j4SRWGa/TpXkbbmrKaIa7IWvzLYdtzBCAaiPyNed5WB//Ks+s4V7i8vh5
         /1C11uFtrIm2WkqwTKfImmF19L+gVMg62kquI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jIKZ28+3W2EAr85v3sL7r0rk71wvn5AGJg9e/M1kbkI=;
        b=SJzEL0sw2UNGBEysFI++UUlElx/2xDkEpO1g7go4fIuS2e+S/P2KcAhNf+erzlvzyo
         BCGXadGrHEJ0R34uEky3buCYMPeImM7zDsMkqvZVmZ6a0/kFCCf5HK8YvWzVO/sUAyuA
         FQZ0JgUNM+rDkdw84OnxU1ebz+6+7Gq4W1aRmJjc8GZIDHATR0HEJMRUbh5kj1l3olK0
         kcZ9XSJNfTqS8tMh2cbVqYP5vExd4LVs+vq5s+hat3vdjQZm2Sfx5fvN0/Uum2Jtd/f9
         uzEMq6gSTK42IFO8eJTJ85Ug4IvZEPG2dHlt11WBWrkkzfaLJxo94EPNNPc2BIuhzSwp
         BVtA==
X-Gm-Message-State: APjAAAV2mRfMUEUJ9lTKfWdamF0lduFyKaDBYwSnxOyXKIfto9yPrdct
        PI1hsVZuLY6Jf+L0bCzyYySYxA==
X-Google-Smtp-Source: APXvYqwpCMg7yZJlNL7Zm8FbUY7EQJ8ZO0WpcnHWzfEJ7BgCiscNtfAON2FVf2KqcpH40zyQYXrf6w==
X-Received: by 2002:a17:90a:d783:: with SMTP id z3mr971346pju.3.1579649226940;
        Tue, 21 Jan 2020 15:27:06 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id l8sm498320pjy.24.2020.01.21.15.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 15:27:06 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     luiz.dentz@gmail.com, marcel@holtmann.org, alainm@chromium.org
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Subject: [BlueZ PATCH v2 0/3] device: Allow devices to be marked as wake capable
Date:   Tue, 21 Jan 2020 15:26:57 -0800
Message-Id: <20200121232700.158933-1-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


Hi bluez maintainers,

This change accompanies changes in the kernel to mark HID devices as
wake capable so they can wake the system from suspend. The
implementation depends on the Set Wake Capable management operation. It
is currently a separate management operation but it may be added as an
extension to an exiting operand like add_device (need some feedback
regarding this).

Per request on the last patch, I've moved docs/mgmt-api.txt into its own
patch so we can continue discussions on it.

This change was tested with appropriate kernel changes on v4.19
(verified that HID devices were being marked as wake capable in the
kernel).

Thanks
Abhishek


Changes in v2:
* Separated docs/mgmt-api.txt into its own patch
* Added dbus api "WakeCapable" to set value
* Update device_set_wake_capable to be called by
  adapter_set_wake_capable_complete so we can emit property changed
* Newly added to show whether device is wake capable
* Removed automatically setting wake capable for HID devices

Abhishek Pandit-Subedi (3):
  mgmt: Add docs for Set Wake Capable
  device: Allow device to be marked as wake capable
  client: Display wake capable property with info

 client/main.c    |  1 +
 doc/mgmt-api.txt | 19 ++++++++++++++
 lib/mgmt.h       |  9 +++++++
 src/adapter.c    | 65 ++++++++++++++++++++++++++++++++++++++++++++++++
 src/adapter.h    |  2 ++
 src/device.c     | 59 +++++++++++++++++++++++++++++++++++++++++++
 src/device.h     |  2 ++
 7 files changed, 157 insertions(+)

-- 
2.25.0.341.g760bfbb309-goog

