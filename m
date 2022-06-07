Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB53A534792
	for <lists+linux-bluetooth@lfdr.de>; Thu, 26 May 2022 02:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238805AbiEZAjj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 May 2022 20:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbiEZAjf (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 May 2022 20:39:35 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 594A812A86
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 17:39:33 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id u12-20020a17090a1d4c00b001df78c7c209so3082322pju.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 25 May 2022 17:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aor+DmfdnpQY23FakMl48aNCnIGNZ2bX6fBl02wuj14=;
        b=gzzbMyFNOylo3KpzRbGcpulb5gkd/XkkxurNzaj9NMim9E+MowSQvqdEx98B8riLup
         ThbaEZVM4coi4agcmqD6koGsDnNVAHbZzL6nr1zX853IDbSPwM2tfyUxf7PUPVm7H2CM
         YhgKi9F35Oi6BiLV5O/W5c0RCNT6IDW2kwXkeVA5RpD+CJ4Slw0+U5AmRDQftStyWkHA
         WwotRj7STDRv5CsggPyAZ9RF1PVeObkgAV2LVNK38/2S4bQsstojrslrDNcByDt/L691
         ywOgIm0TZOOKMnqPdJ1f3N38e3P4xb79D72w4R1zCyESVcsvCaSlJsoYB/Wmxq3BF9A1
         MVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aor+DmfdnpQY23FakMl48aNCnIGNZ2bX6fBl02wuj14=;
        b=TGF/smM+c0CeZiDxo8cRNM0uIhMtPbI7t5877Y/GvtsABduHHSxMyHo9SGtwSpe0CI
         HrH915XWDBcP3dvx0dZmUUd8Qzu/aQ1v3MXJ9pxfdGn6vNEL0jbx9VXXwyvbmvmMRX0a
         uGKECEKttFX05203YrJ06rRHp6f/1M5nhdc5jn/aw4htNe0Z0n/EXcfycCHIN1pqJFND
         Kk0DwzJu4P0B8rR1aBJHFzvwiV8fnj1esn2YNrvcz9Bc5ZFvhFmi3qmmeIEhGp/2HwqE
         Xr9G9mtzI6u3XMOl9uiW4aFiBBEP9AOo4YrvCm6HIyvs2gtZcdCMw5RGoihurLwbn0SF
         +UcQ==
X-Gm-Message-State: AOAM531HUjbS9lnvco9YCWW09pR3xLyw+S+jHw2z+C4EKCqnqR7Ben7K
        5WBMdtOUE6cjjLdipck6mRSyGGTvyzs=
X-Google-Smtp-Source: ABdhPJyWs2aPd4DJGvH0hNvl0fNildSJNTbD37PoMNyd+vw2A9/NOczEWxOUfrBWOl6/mxolMxGQcA==
X-Received: by 2002:a17:90b:4a4a:b0:1df:a250:e583 with SMTP id lb10-20020a17090b4a4a00b001dfa250e583mr13203272pjb.172.1653525572162;
        Wed, 25 May 2022 17:39:32 -0700 (PDT)
Received: from lvondent-mobl4.. (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902860c00b00162529828aesm13339plo.109.2022.05.25.17.39.30
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 17:39:31 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ 2/3] monitor/att: Add decoding support for ASE Sink/Source
Date:   Wed, 25 May 2022 17:39:26 -0700
Message-Id: <20220526003927.3972965-2-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220526003927.3972965-1-luiz.dentz@gmail.com>
References: <20220526003927.3972965-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This adds decoding support for ASE Sink/Source attributes:

> ACL Data RX: Handle 42 flags 0x02 dlen 9
      Channel: 65 len 5 sdu 3 [PSM 39 mode Enhanced Credit (0x81)] {chan 0}
      ATT: Read Request (0x0a) len 2
        Handle: 0x002a Type: Sink ASE (0x2bc4)
< ACL Data TX: Handle 42 flags 0x00 dlen 9
      Channel: 64 len 5 sdu 3 [PSM 39 mode Enhanced Credit (0x81)] {chan 0}
      ATT: Read Response (0x0b) len 2
        Value: 0300
            ASE ID: 1
            State: Idle (0x00)
< ACL Data TX: Handle 42 flags 0x00 dlen 55
      Channel: 64 len 51 sdu 49 [PSM 39 mode Enhanced Credit (0x81)] {chan 0}
      ATT: Handle Multiple Value Notification (0x23) len 48
        Length: 0x0023
        Handle: 0x0024 Type: Sink ASE (0x2bc4)
          Data: 01010000000a00204e00409c00204e00409c0006000000000a02010302020103042800
            ASE ID: 1
            State: Codec Configured (0x01)
            Framing: Unframed PDUs supported (0x00)
            PHY: 0x00
            RTN: 0
            Max Transport Latency: 10
            Presentation Delay Min: 20000 us
            Presentation Delay Max: 40000 us
            Preferred Presentation Delay Min: 20000 us
            Preferred Presentation Delay Max: 40000 us
            Codec: LC3 (0x06)
            Codec Specific Configuration #0: len 0x02 type 0x01
            Codec Specific Configuration: 03
            Codec Specific Configuration #1: len 0x02 type 0x02
            Codec Specific Configuration: 01
            Codec Specific Configuration #2: len 0x03 type 0x04
            Codec Specific Configuration: 2800
< ACL Data TX: Handle 42 flags 0x00 dlen 37
      Channel: 64 len 33 sdu 31 [PSM 39 mode Enhanced Credit (0x81)] {chan 0}
      ATT: Handle Multiple Value Notification (0x23) len 30
        Length: 0x0011
        Handle: 0x0024 Type: Sink ASE (0x2bc4)
          Data: 0102000010270000022800020a00409c00
            ASE ID: 1
            State: QoS Configured (0x02)
            CIG ID: 0x00
            CIS ID: 0x00
            SDU Interval: 10000 usec
            Framing: Unframed (0x00)
            PHY: 0x02
            LE 2M PHY (0x02)
            Max SDU: 40
            RTN: 2
            Max Transport Latency: 10
            Presentation Delay: 40000 us
< ACL Data TX: Handle 42 flags 0x00 dlen 33
      Channel: 64 len 29 sdu 27 [PSM 39 mode Enhanced Credit (0x81)] {chan 0}
      ATT: Handle Multiple Value Notification (0x23) len 26
        Length: 0x000d
        Handle: 0x002a Type: Source ASE (0x2bc5)
          Data: 03030000060304030202000000
            ASE ID: 3
            State: Enabling (0x03)
            CIG ID: 0x00
            CIS ID: 0x00
            Metadata #0: len 0x03 type 0x04
            Metadata: 0302
            Metadata #1: len 0x02 type 0x00
< ACL Data TX: Handle 42 flags 0x00 dlen 39
      Channel: 64 len 35 sdu 33 [PSM 39 mode Enhanced Credit (0x81)] {chan 0}
      ATT: Handle Multiple Value Notification (0x23) len 32
        Length: 0x000d
        Handle: 0x002a Type: Source ASE (0x2bc5)
          Data: 03040000060304030202000000
            ASE ID: 3
            State: Streaming (0x04)
            CIG ID: 0x00
            CIS ID: 0x00
            Metadata #0: len 0x03 type 0x04
            Metadata: 0302
            Metadata #1: len 0x02 type 0x00
< ACL Data TX: Handle 42 flags 0x00 dlen 33
      Channel: 64 len 29 sdu 27 [PSM 39 mode Enhanced Credit (0x81)] {chan 0}
      ATT: Handle Multiple Value Notification (0x23) len 26
        Length: 0x000d
        Handle: 0x002a Type: Source ASE (0x2bc5)
          Data: 03050000060304030202000000
            ASE ID: 3
            State: Disabling (0x05)
            CIG ID: 0x00
            CIS ID: 0x00
            Metadata #0: len 0x03 type 0x04
            Metadata: 0302
            Metadata #1: len 0x02 type 0x00
---
 lib/bluetooth.h   |   4 +
 monitor/att.c     | 365 ++++++++++++++++++++++++++++++++++++++++++----
 monitor/l2cap.h   | 163 +++++++++++++++++++++
 src/shared/ascs.h |   4 +-
 4 files changed, 508 insertions(+), 28 deletions(-)

diff --git a/lib/bluetooth.h b/lib/bluetooth.h
index 73297c147..af5fbcfbc 100644
--- a/lib/bluetooth.h
+++ b/lib/bluetooth.h
@@ -413,6 +413,10 @@ void bt_free(void *ptr);
 int bt_error(uint16_t code);
 const char *bt_compidtostr(int id);
 
+typedef struct {
+	uint8_t data[3];
+} uint24_t;
+
 typedef struct {
 	uint8_t data[16];
 } uint128_t;
diff --git a/monitor/att.c b/monitor/att.c
index 2b1e21d05..fb0961102 100644
--- a/monitor/att.c
+++ b/monitor/att.c
@@ -255,6 +255,38 @@ static void gatt_ccc_write(const struct l2cap_frame *frame)
 	print_ccc_value(value);
 }
 
+static bool print_codec(const struct l2cap_frame *frame)
+{
+	uint8_t codec_id;
+	uint16_t codec_cid, codec_vid;
+
+	if (!l2cap_frame_get_u8((void *)frame, &codec_id)) {
+		print_text(COLOR_ERROR, "Codec: invalid size");
+		return false;
+	}
+
+	packet_print_codec_id("    Codec", codec_id);
+
+	if (!l2cap_frame_get_le16((void *)frame, &codec_cid)) {
+		print_text(COLOR_ERROR, "Codec Company ID: invalid size");
+		return false;
+	}
+
+	if (!l2cap_frame_get_le16((void *)frame, &codec_vid)) {
+		print_text(COLOR_ERROR, "Codec Vendor ID: invalid size");
+		return false;
+	}
+
+	if (codec_id == 0xff) {
+		print_field("    Codec Company ID: %s (0x%04x)",
+						bt_compidtostr(codec_cid),
+						codec_cid);
+		print_field("    Codec Vendor ID: 0x%04x", codec_vid);
+	}
+
+	return true;
+}
+
 static void print_pac(const struct l2cap_frame *frame)
 {
 	uint8_t num = 0, i;
@@ -267,38 +299,13 @@ static void print_pac(const struct l2cap_frame *frame)
 	print_field("  Number of PAC(s): %u", num);
 
 	for (i = 0; i < num; i++) {
-		uint8_t codec_id;
-		uint16_t codec_cid, codec_vid;
 		struct bt_hci_lv_data *cc;
 		struct bt_hci_lv_data *meta;
 
 		print_field("  PAC #%u:", i);
 
-		if (!l2cap_frame_get_u8((void *)frame, &codec_id)) {
-			print_text(COLOR_ERROR, "Codec: invalid size");
+		if (!print_codec(frame))
 			goto done;
-		}
-
-		packet_print_codec_id("    Codec", codec_id);
-
-		if (!l2cap_frame_get_le16((void *)frame, &codec_cid)) {
-			print_text(COLOR_ERROR,
-					"Codec Company ID: invalid size");
-			goto done;
-		}
-
-		if (!l2cap_frame_get_le16((void *)frame, &codec_vid)) {
-			print_text(COLOR_ERROR,
-					"Codec Vendor ID: invalid size");
-			goto done;
-		}
-
-		if (codec_id == 0xff) {
-			print_field("    Codec Company ID: %s (0x%04x)",
-						bt_compidtostr(codec_cid),
-						codec_cid);
-			print_field("    Codec Vendor ID: 0x%04x", codec_vid);
-		}
 
 		cc = l2cap_frame_pull((void *)frame, frame, sizeof(*cc));
 		if (!cc) {
@@ -345,6 +352,310 @@ static void pac_notify(const struct l2cap_frame *frame)
 	print_pac(frame);
 }
 
+static void print_prefer_framing(uint8_t value)
+{
+	switch (value) {
+	case 0x00:
+		print_field("    Framing: Unframed ISOAL PDUs supported "
+							"(0x%2.2x)", value);
+		return;
+	case 0x01:
+		print_field("    Framing: Unframed ISOAL PDUs not supported "
+							"(0x%2.2x)", value);
+		return;
+	default:
+		print_field("    Framing: Reserved (0x%2.2x)", value);
+	}
+}
+
+static const struct bitfield_data prefer_phy_table[] = {
+	{  0, "LE 1M PHY preffered (0x01)"		},
+	{  1, "LE 2M PHY preffered (0x02)"		},
+	{  2, "LE Codec PHY preffered (0x04)"		},
+	{ }
+};
+
+static void print_prefer_phy(uint8_t phy)
+{
+	uint8_t mask;
+
+	mask = print_bitfield(4, phy, prefer_phy_table);
+	if (mask)
+		print_text(COLOR_WHITE_BG, "    Unknown fields (0x%2.2x)",
+								mask);
+}
+
+static void print_ase_config(const struct l2cap_frame *frame)
+{
+	uint8_t framing, phy, rtn;
+	uint16_t latency;
+	uint32_t pd_min, pd_max, ppd_min, ppd_max;
+	struct bt_hci_lv_data *cc;
+
+	if (!l2cap_frame_get_u8((void *)frame, &framing)) {
+		print_text(COLOR_ERROR, "Framing: invalid size");
+		return;
+	}
+
+	print_prefer_framing(framing);
+
+	if (!l2cap_frame_get_u8((void *)frame, &phy)) {
+		print_text(COLOR_ERROR, "PHY: invalid size");
+		return;
+	}
+
+	print_prefer_phy(phy);
+
+	if (!l2cap_frame_get_u8((void *)frame, &rtn)) {
+		print_text(COLOR_ERROR, "RTN: invalid size");
+		return;
+	}
+
+	print_field("    RTN: %u", rtn);
+
+	if (!l2cap_frame_get_le16((void *)frame, &latency)) {
+		print_text(COLOR_ERROR, "RTN: invalid size");
+		return;
+	}
+
+	print_field("    Max Transport Latency: %u ms", latency);
+
+	if (!l2cap_frame_get_le24((void *)frame, &pd_min)) {
+		print_text(COLOR_ERROR, "Presentation Delay Min: invalid size");
+		return;
+	}
+
+	print_field("    Presentation Delay Min: %u us", pd_min);
+
+	if (!l2cap_frame_get_le24((void *)frame, &pd_max)) {
+		print_text(COLOR_ERROR, "Presentation Delay Max: invalid size");
+		return;
+	}
+
+	print_field("    Presentation Delay Max: %u us", pd_max);
+
+	if (!l2cap_frame_get_le24((void *)frame, &ppd_min)) {
+		print_text(COLOR_ERROR,
+			"Preferred Presentation Delay Min: invalid size");
+		return;
+	}
+
+	print_field("    Preferred Presentation Delay Min: %u us", ppd_min);
+
+	if (!l2cap_frame_get_le24((void *)frame, &ppd_max)) {
+		print_text(COLOR_ERROR,
+			"Preferred Presentation Delay Max: invalid size");
+		return;
+	}
+
+	print_field("    Preferred Presentation Delay Max: %u us", ppd_max);
+
+	if (!print_codec(frame))
+		return;
+
+	cc = l2cap_frame_pull((void *)frame, frame, sizeof(*cc));
+	if (!cc) {
+		print_text(COLOR_ERROR,
+				"Codec Specific Configuration: invalid size");
+		return;
+	}
+
+	if (!l2cap_frame_pull((void *)frame, frame, cc->len)) {
+		print_text(COLOR_ERROR,
+				"Codec Specific Configuration: invalid size");
+		return;
+	}
+
+	packet_print_ltv("    Codec Specific Configuration", cc->data, cc->len);
+}
+
+static void print_framing(uint8_t value)
+{
+	switch (value) {
+	case 0x00:
+		print_field("    Framing: Unframed (0x%2.2x)", value);
+		break;
+	case 0x01:
+		print_field("    Framing: Framed (0x%2.2x)", value);
+		break;
+	default:
+		print_field("    Framing: Reserved (0x%2.2x)", value);
+	}
+}
+
+static const struct bitfield_data phy_table[] = {
+	{  0, "LE 1M PHY (0x01)"		},
+	{  1, "LE 2M PHY (0x02)"		},
+	{  2, "LE Codec PHY (0x04)"		},
+	{ }
+};
+
+static void print_phy(uint8_t phy)
+{
+	uint8_t mask;
+
+	mask = print_bitfield(4, phy, phy_table);
+	if (mask)
+		print_text(COLOR_WHITE_BG, "    Unknown fields (0x%2.2x)",
+								mask);
+}
+
+static void print_ase_qos(const struct l2cap_frame *frame)
+{
+	uint8_t framing, phy, rtn;
+	uint16_t sdu, latency;
+	uint32_t interval, pd;
+
+	if (!l2cap_frame_print_u8((void *)frame, "    CIG ID"))
+		return;
+
+	if (!l2cap_frame_print_u8((void *)frame, "    CIS ID"))
+		return;
+
+	if (!l2cap_frame_get_le24((void *)frame, &interval)) {
+		print_text(COLOR_ERROR, "SDU Interval: invalid size");
+		return;
+	}
+
+	print_field("    SDU Interval: %u us", interval);
+
+	if (!l2cap_frame_get_u8((void *)frame, &framing)) {
+		print_text(COLOR_ERROR, "Framing: invalid size");
+		return;
+	}
+
+	print_framing(framing);
+
+	if (!l2cap_frame_get_u8((void *)frame, &phy)) {
+		print_text(COLOR_ERROR, "PHY: invalid size");
+		return;
+	}
+
+	print_phy(phy);
+
+	if (!l2cap_frame_get_le16((void *)frame, &sdu)) {
+		print_text(COLOR_ERROR, "Max SDU: invalid size");
+		return;
+	}
+
+	print_field("    Max SDU: %u", sdu);
+
+	if (!l2cap_frame_get_u8((void *)frame, &rtn)) {
+		print_text(COLOR_ERROR, "RTN: invalid size");
+		return;
+	}
+
+	print_field("    RTN: %u", rtn);
+
+	if (!l2cap_frame_get_le16((void *)frame, &latency)) {
+		print_text(COLOR_ERROR, "Max Transport Latency: invalid size");
+		return;
+	}
+
+	print_field("    Max Transport Latency: %u", sdu);
+
+	if (!l2cap_frame_get_le24((void *)frame, &pd)) {
+		print_text(COLOR_ERROR, "Presentation Delay: invalid size");
+		return;
+	}
+
+	print_field("    Presentation Delay: %u us", pd);
+}
+
+static void print_ase_metadata(const struct l2cap_frame *frame)
+{
+	struct bt_hci_lv_data *meta;
+
+	if (!l2cap_frame_print_u8((void *)frame, "    CIG ID"))
+		return;
+
+	if (!l2cap_frame_print_u8((void *)frame, "    CIS ID"))
+		return;
+
+	meta = l2cap_frame_pull((void *)frame, frame, sizeof(*meta));
+	if (!meta) {
+		print_text(COLOR_ERROR, "Metadata: invalid size");
+		return;
+	}
+
+	if (!l2cap_frame_pull((void *)frame, frame, meta->len)) {
+		print_text(COLOR_ERROR, "Metadata: invalid size");
+		return;
+	}
+
+	packet_print_ltv("    Metadata", meta->data, meta->len);
+}
+
+static void print_ase_status(const struct l2cap_frame *frame)
+{
+	uint8_t id, state;
+
+	if (!l2cap_frame_get_u8((void *)frame, &id)) {
+		print_text(COLOR_ERROR, "ASE ID: invalid size");
+		goto done;
+	}
+
+	print_field("    ASE ID: %u", id);
+
+	if (!l2cap_frame_get_u8((void *)frame, &state)) {
+		print_text(COLOR_ERROR, "ASE State: invalid size");
+		goto done;
+	}
+
+	switch (state) {
+	/* ASE_State = 0x00 (Idle) */
+	case 0x00:
+		print_field("    State: Idle (0x00)");
+		break;
+	/* ASE_State = 0x01 (Codec Configured) */
+	case 0x01:
+		print_field("    State: Codec Configured (0x01)");
+		print_ase_config(frame);
+		break;
+	/* ASE_State = 0x02 (QoS Configured) */
+	case 0x02:
+		print_field("    State: QoS Configured (0x02)");
+		print_ase_qos(frame);
+		break;
+	/* ASE_Status = 0x03 (Enabling) */
+	case 0x03:
+		print_field("    State: Enabling (0x03)");
+		print_ase_metadata(frame);
+		break;
+	/* ASE_Status = 0x04 (Streaming) */
+	case 0x04:
+		print_field("    State: Streaming (0x04)");
+		print_ase_metadata(frame);
+		break;
+	/* ASE_Status = 0x05 (Disabling) */
+	case 0x05:
+		print_field("    State: Disabling (0x05)");
+		print_ase_metadata(frame);
+		break;
+	/* ASE_Status = 0x06 (Releasing) */
+	case 0x06:
+		print_field("    State: Releasing (0x06)");
+		break;
+	default:
+		print_field("    State: Reserved (0x%2.2x)", state);
+		break;
+	}
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void ase_read(const struct l2cap_frame *frame)
+{
+	print_ase_status(frame);
+}
+
+static void ase_notify(const struct l2cap_frame *frame)
+{
+	print_ase_status(frame);
+}
+
 #define GATT_HANDLER(_uuid, _read, _write, _notify) \
 { \
 	.uuid = { \
@@ -366,6 +677,8 @@ struct gatt_handler {
 					gatt_ccc_write, NULL),
 	GATT_HANDLER(PAC_SINK_CHRC_UUID, pac_read, NULL, pac_notify),
 	GATT_HANDLER(PAC_SOURCE_CHRC_UUID, pac_read, NULL, pac_notify),
+	GATT_HANDLER(ASE_SINK_UUID, ase_read, NULL, ase_notify),
+	GATT_HANDLER(ASE_SOURCE_UUID, ase_read, NULL, ase_notify),
 };
 
 static struct gatt_handler *get_handler(struct gatt_db_attribute *attr)
diff --git a/monitor/l2cap.h b/monitor/l2cap.h
index c33d4c57f..00a8ffbbd 100644
--- a/monitor/l2cap.h
+++ b/monitor/l2cap.h
@@ -78,6 +78,21 @@ static inline bool l2cap_frame_get_u8(struct l2cap_frame *frame, uint8_t *value)
 	return true;
 }
 
+static inline bool l2cap_frame_print_u8(struct l2cap_frame *frame,
+					const char *label)
+{
+	uint8_t u8;
+
+	if (!l2cap_frame_get_u8(frame, &u8)) {
+		print_text(COLOR_ERROR, "%s: invalid size", label);
+		return false;
+	}
+
+	print_field("%s: 0x%2.2x", label, u8);
+
+	return true;
+}
+
 static inline bool l2cap_frame_get_be16(struct l2cap_frame *frame,
 								uint16_t *value)
 {
@@ -92,6 +107,21 @@ static inline bool l2cap_frame_get_be16(struct l2cap_frame *frame,
 	return true;
 }
 
+static inline bool l2cap_frame_print_be16(struct l2cap_frame *frame,
+						const char *label)
+{
+	uint16_t u16;
+
+	if (!l2cap_frame_get_be16(frame, &u16)) {
+		print_text(COLOR_ERROR, "%s: invalid size", label);
+		return false;
+	}
+
+	print_field("%s: 0x%4.4x", label, u16);
+
+	return true;
+}
+
 static inline bool l2cap_frame_get_le16(struct l2cap_frame *frame,
 								uint16_t *value)
 {
@@ -106,6 +136,79 @@ static inline bool l2cap_frame_get_le16(struct l2cap_frame *frame,
 	return true;
 }
 
+static inline bool l2cap_frame_print_le16(struct l2cap_frame *frame,
+						const char *label)
+{
+	uint16_t u16;
+
+	if (!l2cap_frame_get_le16(frame, &u16)) {
+		print_text(COLOR_ERROR, "%s: invalid size", label);
+		return false;
+	}
+
+	print_field("%s: 0x%4.4x", label, u16);
+
+	return true;
+}
+
+static inline bool l2cap_frame_get_be24(struct l2cap_frame *frame,
+								uint32_t *value)
+{
+	if (frame->size < sizeof(uint24_t))
+		return false;
+
+	if (value)
+		*value = get_be24(frame->data);
+
+	l2cap_frame_pull(frame, frame, sizeof(uint24_t));
+
+	return true;
+}
+
+static inline bool l2cap_frame_print_be24(struct l2cap_frame *frame,
+						const char *label)
+{
+	uint32_t u24;
+
+	if (!l2cap_frame_get_be24(frame, &u24)) {
+		print_text(COLOR_ERROR, "%s: invalid size", label);
+		return false;
+	}
+
+	print_field("%s: 0x%6.6x", label, u24);
+
+	return true;
+}
+
+static inline bool l2cap_frame_get_le24(struct l2cap_frame *frame,
+								uint32_t *value)
+{
+	if (frame->size < sizeof(uint24_t))
+		return false;
+
+	if (value)
+		*value = get_le24(frame->data);
+
+	l2cap_frame_pull(frame, frame, sizeof(uint24_t));
+
+	return true;
+}
+
+static inline bool l2cap_frame_print_le24(struct l2cap_frame *frame,
+						const char *label)
+{
+	uint32_t u24;
+
+	if (!l2cap_frame_get_le24(frame, &u24)) {
+		print_text(COLOR_ERROR, "%s: invalid size", label);
+		return false;
+	}
+
+	print_field("%s: 0x%6.6x", label, u24);
+
+	return true;
+}
+
 static inline bool l2cap_frame_get_be32(struct l2cap_frame *frame,
 								uint32_t *value)
 {
@@ -120,6 +223,21 @@ static inline bool l2cap_frame_get_be32(struct l2cap_frame *frame,
 	return true;
 }
 
+static inline bool l2cap_frame_print_be32(struct l2cap_frame *frame,
+						const char *label)
+{
+	uint32_t u32;
+
+	if (!l2cap_frame_get_be32(frame, &u32)) {
+		print_text(COLOR_ERROR, "%s: invalid size", label);
+		return false;
+	}
+
+	print_field("%s: 0x%8.8x", label, u32);
+
+	return true;
+}
+
 static inline bool l2cap_frame_get_le32(struct l2cap_frame *frame,
 								uint32_t *value)
 {
@@ -134,6 +252,21 @@ static inline bool l2cap_frame_get_le32(struct l2cap_frame *frame,
 	return true;
 }
 
+static inline bool l2cap_frame_print_le32(struct l2cap_frame *frame,
+						const char *label)
+{
+	uint32_t u32;
+
+	if (!l2cap_frame_get_le32(frame, &u32)) {
+		print_text(COLOR_ERROR, "%s: invalid size", label);
+		return false;
+	}
+
+	print_field("%s: 0x%8.8x", label, u32);
+
+	return true;
+}
+
 static inline bool l2cap_frame_get_be64(struct l2cap_frame *frame,
 								uint64_t *value)
 {
@@ -148,6 +281,21 @@ static inline bool l2cap_frame_get_be64(struct l2cap_frame *frame,
 	return true;
 }
 
+static inline bool l2cap_frame_print_be64(struct l2cap_frame *frame,
+						const char *label)
+{
+	uint64_t u64;
+
+	if (!l2cap_frame_get_be64(frame, &u64)) {
+		print_text(COLOR_ERROR, "%s: invalid size", label);
+		return false;
+	}
+
+	print_field("%s: 0x%zx", label, u64);
+
+	return true;
+}
+
 static inline bool l2cap_frame_get_le64(struct l2cap_frame *frame,
 								uint64_t *value)
 {
@@ -162,6 +310,21 @@ static inline bool l2cap_frame_get_le64(struct l2cap_frame *frame,
 	return true;
 }
 
+static inline bool l2cap_frame_print_le64(struct l2cap_frame *frame,
+						const char *label)
+{
+	uint64_t u64;
+
+	if (!l2cap_frame_get_le64(frame, &u64)) {
+		print_text(COLOR_ERROR, "%s: invalid size", label);
+		return false;
+	}
+
+	print_field("%s: 0x%zx", label, u64);
+
+	return true;
+}
+
 static inline bool l2cap_frame_get_be128(struct l2cap_frame *frame,
 					uint64_t *lvalue, uint64_t *rvalue)
 {
diff --git a/src/shared/ascs.h b/src/shared/ascs.h
index 230fdfe8a..2c875bd17 100644
--- a/src/shared/ascs.h
+++ b/src/shared/ascs.h
@@ -101,8 +101,8 @@ struct bt_ascs_ase_status_qos {
 	uint8_t  pd[3];
 } __packed;
 
-/* ASE_Status = 0x03 (Enabling), 0x04 (Streaming), 0x05 (Disabling), or
- * 0x06 (Releasing), defined in Table 4.9.
+/* ASE_Status = 0x03 (Enabling), 0x04 (Streaming), or 0x05 (Disabling)
+ * defined in Table 4.9.
  */
 struct bt_ascs_ase_status_metadata {
 	uint8_t  cig_id;
-- 
2.35.1

