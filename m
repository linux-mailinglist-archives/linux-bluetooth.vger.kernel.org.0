Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F842F8517
	for <lists+linux-bluetooth@lfdr.de>; Tue, 12 Nov 2019 01:20:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbfKLAUI (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 11 Nov 2019 19:20:08 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43169 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbfKLAUH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 11 Nov 2019 19:20:07 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so10568577pgh.10
        for <linux-bluetooth@vger.kernel.org>; Mon, 11 Nov 2019 16:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i3QVtv45Axk545voSCTdnsYQERVAGrIgwCeqw/o3MX4=;
        b=LsEHNxuNOsi4smeIUmloCDxQwN5wRT573S/dAcRBGQmdn1PyWUEE9OCntdlNebllY0
         tqwl/eRcJss7RnMsihQjohvTPAUWT6tFej9W29LueU8pO2WEFNtm6j4GfDXuGHLZstU8
         wgYDR0ZZNkcghB2cgaOOxCjkKmEDYo8vR2E8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i3QVtv45Axk545voSCTdnsYQERVAGrIgwCeqw/o3MX4=;
        b=Y/imzaTXtvAATXqqUyxhes/7nVM7WCLNDsIMAUrrGXQ0Q6fVXdQlENxAbzGLANz2IL
         8L3S7z0tVVug1lDLBTRguhhS+NZBU4lluqzB6UD20BkXNihz/jiPPCSYUZiETgCT2FNv
         XWeO0tY0B7o0VIIpU1YZDIEwRk65Ci/BGbLK6rz05ElZiNdHW+dCJdURDr7678OSI8gX
         hxHZWacH28M4tRbRGqOM35xfEkBdrOewOiMMzdQTLg/T4JBmSehpfiacmDeS+rvdbwtB
         URd6kgOpRkvCpqK9lUBAsIBcaUDmaeNJtjg/v1AMYaL7WPiYWWfqDiEUC2ZsTtDLuhQW
         xqQw==
X-Gm-Message-State: APjAAAWfU7OAkx8YkuY9fNoBbABuqBef2d8QSEclizDIHWjrp4c8SkgA
        p9qOGDaRhmfq0ZLckJjcnOEB0g==
X-Google-Smtp-Source: APXvYqxzTENXdlmig2BxhIs7QT2d4w+X0eoLnSbb7/QBWfE3yeHGYTXXdZ2kzCALg0JoqA1Yj05w6Q==
X-Received: by 2002:aa7:9e52:: with SMTP id z18mr32297912pfq.149.1573518007037;
        Mon, 11 Nov 2019 16:20:07 -0800 (PST)
Received: from apsdesk.mtv.corp.google.com ([2620:15c:202:1:e09a:8d06:a338:aafb])
        by smtp.gmail.com with ESMTPSA id h23sm8430898pgg.58.2019.11.11.16.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:20:06 -0800 (PST)
From:   Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-bluetooth@vger.kernel.org, dianders@chromium.org,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        devicetree@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 4/4] dt-bindings: net: broadcom-bluetooth: Add pcm config
Date:   Mon, 11 Nov 2019 16:19:49 -0800
Message-Id: <20191112001949.136377-5-abhishekpandit@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191112001949.136377-1-abhishekpandit@chromium.org>
References: <20191112001949.136377-1-abhishekpandit@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Add documentation for pcm parameters.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

---

Changes in v3:
- Change disallow baudrate setting to return -EBUSY if called before
  ready. bcm_proto is no longer modified and is back to being const.
- Changed btbcm_set_pcm_params to btbcm_set_pcm_int_params
- Changed brcm,sco-routing to brcm,bt-sco-routing

Changes in v2:
- Use match data to disallow baudrate setting
- Parse pcm parameters by name instead of as a byte string
- Fix prefix for dt-bindings commit

 .../devicetree/bindings/net/broadcom-bluetooth.txt    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index c749dc297624..42fb2fa8143d 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -29,6 +29,11 @@ Optional properties:
    - "lpo": external low power 32.768 kHz clock
  - vbat-supply: phandle to regulator supply for VBAT
  - vddio-supply: phandle to regulator supply for VDDIO
+ - brcm,bt-sco-routing: 0-3 (PCM, Transport, Codec, I2S)
+ - brcm,pcm-interface-rate: 0-4 (128KBps, 256KBps, 512KBps, 1024KBps, 2048KBps)
+ - brcm,pcm-frame-type: 0-1 (short, long)
+ - brcm,pcm-sync-mode: 0-1 (slave, master)
+ - brcm,pcm-clock-mode: 0-1 (slave, master)
 
 
 Example:
@@ -40,5 +45,11 @@ Example:
        bluetooth {
                compatible = "brcm,bcm43438-bt";
                max-speed = <921600>;
+
+               brcm,bt-sco-routing = [01];
+               brcm,pcm-interface-rate = [02];
+               brcm,pcm-frame-type = [00];
+               brcm,pcm-sync-mode = [01];
+               brcm,pcm-clock-mode = [01];
        };
 };
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

