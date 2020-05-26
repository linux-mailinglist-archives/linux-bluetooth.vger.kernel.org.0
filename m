Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476F91D497F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 15 May 2020 11:27:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbgEOJ1L (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 15 May 2020 05:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728110AbgEOJ1L (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 15 May 2020 05:27:11 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E3EC061A0C
        for <linux-bluetooth@vger.kernel.org>; Fri, 15 May 2020 02:27:11 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id z15so3957185pjb.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 15 May 2020 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wMOi5U83vahobRubdonT8bbur/MVa6A0w3GNhnyDUz4=;
        b=AQc3IgVYYvNRW4qGcvufZghnKSjxTPNroOiMoahmIELJkZLXL5dmyy9wxalXOuHT3Y
         r+tS6aqIvct3Fby8P19vx72oVTDtEHHDlLQkRC3YKH6Ar3gucQ5Na3/e0nCSTy0yqJF7
         OjmW2o9d63Jju7sSaV5QlbS6BwJB4eSNr2dng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wMOi5U83vahobRubdonT8bbur/MVa6A0w3GNhnyDUz4=;
        b=DzWV/iUScn+5RlTC5NH1FcEMr3UzBDegFksu38z8OH4AxB4+n+CrXjj8sDfnZPLyvC
         DAD6FhlbTR6ioesqA6x5HMS7+lrCwmoEQZBWGhg/jfS8MHLnWUo+Gf99IkgI890tUfjj
         8wpMC5XRemd6CuRs5Yw6NiCoMZ4b/86yZGasc1K3hBVUxCpGh2reuc9QHegBIzxBaT/d
         BNIjPNH8uKccTup5kWZxuyA8PPfasZJ/vn+eQBN2BFesf2wSclQ5jKRu2RoJjZEMbimt
         v8MtVUNoXQ4R+uiykZJczVFpI7PQoT8T1B4hdp6FXUHMXWyEt+y6o7IerY/9Wlw9Wh8S
         M2dA==
X-Gm-Message-State: AOAM5305nq6Wo0Sqt5zHzwYoI0broNNiIiKT/S2D2kD+9msV3lWx/NwJ
        BDpbHFCXtOhFLHEPlLKbee4HB/e8KDc=
X-Google-Smtp-Source: ABdhPJzHhXjBoIyj2ZJXGFU2c+94wmBwHsCvl+Pdg/bz4NgGDYbmPGTe6x67OlnPX+/nDgvf0f+81Q==
X-Received: by 2002:a17:902:7b92:: with SMTP id w18mr2628500pll.273.1589534830054;
        Fri, 15 May 2020 02:27:10 -0700 (PDT)
Received: from hychaoz840.tpe.corp.google.com ([2401:fa00:1:10:a03d:e7d8:93ef:b2])
        by smtp.gmail.com with ESMTPSA id p9sm1340961pgb.19.2020.05.15.02.27.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 15 May 2020 02:27:08 -0700 (PDT)
From:   Hsin-Yu Chao <hychao@chromium.org>
X-Google-Original-From: Hsin-Yu Chao <hychao@google.com>
To:     linux-bluetooth@vger.kernel.org, marcel@holtmann.org
Cc:     chromeos-bluetooth-upstreaming@chromium.org, alainm@chromium.org,
        linux-kernel@vger.kernel.org, Hsin-Yu Chao <hychao@chromium.org>
Subject: [PATCH] Bluetooth: Add SCO fallback for invalid LMP parameters error
Date:   Fri, 15 May 2020 17:27:04 +0800
Message-Id: <20200515092704.902-1-hychao@google.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Hsin-Yu Chao <hychao@chromium.org>

Bluetooth PTS test case HFP/AG/ACC/BI-12-I accepts SCO connection
with invalid parameter at the first SCO request expecting AG to
attempt another SCO request with the use of "safe settings" for
given codec, base on section 5.7.1.2 of HFP 1.7 specification.

This patch addresses it by adding "Invalid LMP Parameters" (0x1e)
to the SCO fallback case. Verified with below log:

< HCI Command: Setup Synchronous Connection (0x01|0x0028) plen 17
        Handle: 256
        Transmit bandwidth: 8000
        Receive bandwidth: 8000
        Max latency: 13
        Setting: 0x0003
          Input Coding: Linear
          Input Data Format: 1's complement
          Input Sample Size: 8-bit
          # of bits padding at MSB: 0
          Air Coding Format: Transparent Data
        Retransmission effort: Optimize for link quality (0x02)
        Packet type: 0x0380
          3-EV3 may not be used
          2-EV5 may not be used
          3-EV5 may not be used
> HCI Event: Command Status (0x0f) plen 4
      Setup Synchronous Connection (0x01|0x0028) ncmd 1
        Status: Success (0x00)
> HCI Event: Number of Completed Packets (0x13) plen 5
        Num handles: 1
        Handle: 256
        Count: 1
> HCI Event: Max Slots Change (0x1b) plen 3
        Handle: 256
        Max slots: 1
> HCI Event: Synchronous Connect Complete (0x2c) plen 17
        Status: Invalid LMP Parameters / Invalid LL Parameters (0x1e)
        Handle: 0
        Address: 00:1B:DC:F2:21:59 (OUI 00-1B-DC)
        Link type: eSCO (0x02)
        Transmission interval: 0x00
        Retransmission window: 0x02
        RX packet length: 0
        TX packet length: 0
        Air mode: Transparent (0x03)
< HCI Command: Setup Synchronous Connection (0x01|0x0028) plen 17
        Handle: 256
        Transmit bandwidth: 8000
        Receive bandwidth: 8000
        Max latency: 8
        Setting: 0x0003
          Input Coding: Linear
          Input Data Format: 1's complement
          Input Sample Size: 8-bit
          # of bits padding at MSB: 0
          Air Coding Format: Transparent Data
        Retransmission effort: Optimize for link quality (0x02)
        Packet type: 0x03c8
          EV3 may be used
          2-EV3 may not be used
          3-EV3 may not be used
          2-EV5 may not be used
          3-EV5 may not be used
> HCI Event: Command Status (0x0f) plen 4
      Setup Synchronous Connection (0x01|0x0028) ncmd 1
        Status: Success (0x00)
> HCI Event: Max Slots Change (0x1b) plen 3
        Handle: 256
        Max slots: 5
> HCI Event: Max Slots Change (0x1b) plen 3
        Handle: 256
        Max slots: 1
> HCI Event: Synchronous Connect Complete (0x2c) plen 17
        Status: Success (0x00)
        Handle: 257
        Address: 00:1B:DC:F2:21:59 (OUI 00-1B-DC)
        Link type: eSCO (0x02)
        Transmission interval: 0x06
        Retransmission window: 0x04
        RX packet length: 30
        TX packet length: 30
        Air mode: Transparent (0x03)

Signed-off-by: Hsin-Yu Chao <hychao@chromium.org>
---
 net/bluetooth/hci_event.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index 73aabca0064b7..f024b3d57a1c7 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -4337,6 +4337,7 @@ static void hci_sync_conn_complete_evt(struct hci_dev *hdev,
 	case 0x11:	/* Unsupported Feature or Parameter Value */
 	case 0x1c:	/* SCO interval rejected */
 	case 0x1a:	/* Unsupported Remote Feature */
+	case 0x1e:	/* Invalid LMP Parameters */
 	case 0x1f:	/* Unspecified error */
 	case 0x20:	/* Unsupported LMP Parameter value */
 		if (conn->out) {
-- 
2.24.1

