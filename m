Return-Path: <linux-bluetooth+bounces-1171-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EE0830F25
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Jan 2024 23:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B2BD289543
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Jan 2024 22:23:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A77286B0;
	Wed, 17 Jan 2024 22:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RI0ky3+g"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEB825630
	for <linux-bluetooth@vger.kernel.org>; Wed, 17 Jan 2024 22:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705530204; cv=none; b=RuMNtC0hax3u2PApe6aOGpVUouTwqSuQm6N/gHx8YV2JfI/u9B5HG3TbX9g9me6CdIx8TQF4HJa8tFX/ZPls353MGQkxnPNiHNkD0neNefj1q3gArfeHIaqufUNS/O7mZ3vZBD6HqSo+xeC7eaD05hEzg0GSJZl97vUJk3mm1hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705530204; c=relaxed/simple;
	bh=76cPZ5mhsCtHxxBJ5U7wsIr2Oc2/CaW3kC7AW7adCh8=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=k3OhNuwog8/z6TVx1t7K4i15V34vJiVxo9d2MyVOkEPUX+sGEhZxs+3dSZsX0m0gnc5GCm50Xc7a3atTZ9lRcttJl7Yabs/DR6H4vqkmc8gr7f2wEwXzVM34pUcKJPfxcmvmAHT0PKzCIpos1JjdldzfiBHScqua1ehg7QlDCis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RI0ky3+g; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dbed179f0faso109866276.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 17 Jan 2024 14:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705530200; x=1706135000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ONJG7FRMlx72GuboVlotHBCrYOWhc08p0x0PCdiUmjg=;
        b=RI0ky3+g4lCwQBWVX/ZkTN47bvNJECWM5zHmVeT6yI0H46vo0lBKBpjgu6APJQCGhi
         1SC6E7vo8Ld7Pm5ig1xlqV7NWYgWQ1bTRVd1L9sB/5AncQdxsR2LFIW8kRoTDXtbYrdT
         ux+SPPjxhcUU4n93Hl8/eeX6k4PmcyLDeGYSH+3Gsrwy2f9x9qMuLFxtyefMZQqjD4OR
         QfntBKvZJ4fM15PrZbv0zhdr/aWZeiAMJfab+5wTMxF1yBAhnhvKYOoIiKN0eF0t9NGn
         3W4ZNVVxVMUQys/xQxhQqqcfwnLjXtN+BKloUEID4Gb6AzZKammXTdZY0T3UI0QUPe0x
         ve8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705530200; x=1706135000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONJG7FRMlx72GuboVlotHBCrYOWhc08p0x0PCdiUmjg=;
        b=p9VqBvZjZ+7DReItKl9/WD6lpCnMv1NjiAtgMEj7xs86YkTqavEacaiZGzvSviz9BC
         yIResSqMOHipRbNWotDoNHUnsfxx56eqV2BzNoMXNxcGe9MHxER+RHg+co9YFKa/6CKM
         293AOHwQ8HB8LJfjqO89WZjntdrlYPsI2hjHJKH12mR2jw8byRMRxsmjhtZsv0bVBrbO
         H5eOhyf1YQs1Yg0JdxYstEUx8pqqA65ohbjocXVECNFGV+LSsVwluDWfjKYeclh8poLp
         gR9IDlZHACi6NzuhdblyWGiZTVCssBht0pC/JwSsK61OA0EfoiroZKoWC7NXNstRM0Zx
         uQMQ==
X-Gm-Message-State: AOJu0YzR0GWhyVUPdrSEPxyKqoOILrXBMwgLXK55PA/2J/6mHdraNOuT
	l2Idz/9a9M8GxagA3r6HtzvkoT+M0dk=
X-Google-Smtp-Source: AGHT+IFcBa1PHtUd1MiBQeRdDjeqpBfb6xg6oG7WWm2As9QhyHhAz32fegLtqWzDOp/vMjZxTWyV+g==
X-Received: by 2002:a05:690c:3382:b0:5f6:117c:a3f9 with SMTP id fl2-20020a05690c338200b005f6117ca3f9mr1178837ywb.30.1705530199528;
        Wed, 17 Jan 2024 14:23:19 -0800 (PST)
Received: from lvondent-mobl4.. (071-047-239-151.res.spectrum.com. [71.47.239.151])
        by smtp.gmail.com with ESMTPSA id x129-20020a814a87000000b005fc98de3763sm4640553ywa.79.2024.01.17.14.23.18
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 14:23:18 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v1 1/2] client/player: Add support for printing A2DP codec details
Date: Wed, 17 Jan 2024 17:23:16 -0500
Message-ID: <20240117222317.1792594-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This adds support for printing Capabilities and Configuration of A2DP
endpoints and transports:

bluetoothctl> endpoint.show /org/bluez/hci0/dev_94_DB_56_F7_F2_88/sep1
Endpoint /org/bluez/hci0/dev_94_DB_56_F7_F2_88/sep1
	UUID: 0000110b-0000-1000-8000-00805f9b34fb
	Codec: 0x00 (0)
	Media Codec: SBC
	Channel Modes: Mono DualChannel Stereo JointStereo
	Frequencies: 44.1Khz 48Khz
	Subbands: 4 8
	Blocks: 4 8 12 16
	Bitpool Range: 2-53
	...

bluetoothctl> transport.show /org/bluez/hci0/dev_94_DB_56_F7_F2_88/sep1/fd7
Transport /org/bluez/hci0/dev_94_DB_56_F7_F2_88/sep1/fd7
	UUID: 0000110a-0000-1000-8000-00805f9b34fb
	Codec: 0x00 (0)
	Media Codec: SBC
	Channel Modes: JointStereo
	Frequencies: 48Khz
	Subbands: 8
	Blocks: 16
	Bitpool Range: 2-53
---
 client/player.c | 548 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 538 insertions(+), 10 deletions(-)

diff --git a/client/player.c b/client/player.c
index dad243786a39..39d1be665c8f 100644
--- a/client/player.c
+++ b/client/player.c
@@ -72,6 +72,28 @@
 #define EP_SNK_CTXT 0x0fff
 #define EP_SUPPORTED_SNK_CTXT EP_SNK_CTXT
 
+#if __BYTE_ORDER == __LITTLE_ENDIAN
+
+struct avdtp_media_codec_capability {
+	uint8_t rfa0:4;
+	uint8_t media_type:4;
+	uint8_t media_codec_type;
+	uint8_t data[0];
+} __attribute__ ((packed));
+
+#elif __BYTE_ORDER == __BIG_ENDIAN
+
+struct avdtp_media_codec_capability {
+	uint8_t media_type:4;
+	uint8_t rfa0:4;
+	uint8_t media_codec_type;
+	uint8_t data[0];
+} __attribute__ ((packed));
+
+#else
+#error "Unknown byte order"
+#endif
+
 struct endpoint {
 	char *path;
 	char *uuid;
@@ -2298,23 +2320,506 @@ static struct endpoint *endpoint_find(const char *pattern)
 	return NULL;
 }
 
+static void print_aptx_common(a2dp_aptx_t *aptx)
+{
+	bt_shell_printf("\n\t\tFrequencies: ");
+	if (aptx->frequency & APTX_SAMPLING_FREQ_16000)
+		bt_shell_printf("16kHz ");
+	if (aptx->frequency & APTX_SAMPLING_FREQ_32000)
+		bt_shell_printf("32kHz ");
+	if (aptx->frequency & APTX_SAMPLING_FREQ_44100)
+		bt_shell_printf("44.1kHz ");
+	if (aptx->frequency & APTX_SAMPLING_FREQ_48000)
+		bt_shell_printf("48kHz ");
+
+	bt_shell_printf("\n\t\tChannel modes: ");
+	if (aptx->channel_mode & APTX_CHANNEL_MODE_MONO)
+		bt_shell_printf("Mono ");
+	if (aptx->channel_mode & APTX_CHANNEL_MODE_STEREO)
+		bt_shell_printf("Stereo ");
+}
+
+static void print_aptx(a2dp_aptx_t *aptx, uint8_t size)
+{
+	bt_shell_printf("\t\tVendor Specific Value (aptX)");
+
+	if (size < sizeof(*aptx)) {
+		bt_shell_printf(" (broken)\n");
+		return;
+	}
+
+	print_aptx_common(aptx);
+
+	bt_shell_printf("\n");
+}
+
+static void print_faststream(a2dp_faststream_t *faststream, uint8_t size)
+{
+	bt_shell_printf("\t\tVendor Specific Value (FastStream)");
+
+	if (size < sizeof(*faststream)) {
+		bt_shell_printf(" (broken)\n");
+		return;
+	}
+
+	bt_shell_printf("\n\t\tDirections: ");
+	if (faststream->direction & FASTSTREAM_DIRECTION_SINK)
+		bt_shell_printf("sink ");
+	if (faststream->direction & FASTSTREAM_DIRECTION_SOURCE)
+		bt_shell_printf("source ");
+
+	if (faststream->direction & FASTSTREAM_DIRECTION_SINK) {
+		bt_shell_printf("\n\t\tSink Frequencies: ");
+		if (faststream->sink_frequency &
+				FASTSTREAM_SINK_SAMPLING_FREQ_44100)
+			bt_shell_printf("44.1kHz ");
+		if (faststream->sink_frequency &
+				FASTSTREAM_SINK_SAMPLING_FREQ_48000)
+			bt_shell_printf("48kHz ");
+	}
+
+	if (faststream->direction & FASTSTREAM_DIRECTION_SOURCE) {
+		bt_shell_printf("\n\t\tSource Frequencies: ");
+		if (faststream->source_frequency &
+				FASTSTREAM_SOURCE_SAMPLING_FREQ_16000)
+			bt_shell_printf("16kHz ");
+	}
+
+	bt_shell_printf("\n");
+}
+
+static void print_aptx_ll(a2dp_aptx_ll_t *aptx_ll, uint8_t size)
+{
+	a2dp_aptx_ll_new_caps_t *aptx_ll_new;
+
+	bt_shell_printf("\t\tVendor Specific Value (aptX Low Latency)");
+
+	if (size < sizeof(*aptx_ll)) {
+		bt_shell_printf(" (broken)\n");
+		return;
+	}
+
+	print_aptx_common(&aptx_ll->aptx);
+
+	bt_shell_printf("\n\tBidirectional link: %s",
+			aptx_ll->bidirect_link ? "Yes" : "No");
+
+	aptx_ll_new = &aptx_ll->new_caps[0];
+	if (aptx_ll->has_new_caps &&
+	    size >= sizeof(*aptx_ll) + sizeof(*aptx_ll_new)) {
+		bt_shell_printf("\n\tTarget codec buffer level: %u",
+			(unsigned int)aptx_ll_new->target_level2 |
+			((unsigned int)(aptx_ll_new->target_level1) << 8));
+		bt_shell_printf("\n\tInitial codec buffer level: %u",
+			(unsigned int)aptx_ll_new->initial_level2 |
+			((unsigned int)(aptx_ll_new->initial_level1) << 8));
+		bt_shell_printf("\n\tSRA max rate: %g",
+			aptx_ll_new->sra_max_rate / 10000.0);
+		bt_shell_printf("\n\tSRA averaging time: %us",
+			(unsigned int)aptx_ll_new->sra_avg_time);
+		bt_shell_printf("\n\tGood working codec buffer level: %u",
+			(unsigned int)aptx_ll_new->good_working_level2 |
+			((unsigned int)(aptx_ll_new->good_working_level1) << 8)
+			);
+	}
+
+	bt_shell_printf("\n");
+}
+
+static void print_aptx_hd(a2dp_aptx_hd_t *aptx_hd, uint8_t size)
+{
+	bt_shell_printf("\t\tVendor Specific Value (aptX HD)");
+
+	if (size < sizeof(*aptx_hd)) {
+		bt_shell_printf(" (broken)\n");
+		return;
+	}
+
+	print_aptx_common(&aptx_hd->aptx);
+
+	bt_shell_printf("\n");
+}
+
+static void print_ldac(a2dp_ldac_t *ldac, uint8_t size)
+{
+	bt_shell_printf("\t\tVendor Specific Value (LDAC)");
+
+	if (size < sizeof(*ldac)) {
+		bt_shell_printf(" (broken)\n");
+		return;
+	}
+
+	bt_shell_printf("\n\t\tFrequencies: ");
+	if (ldac->frequency & LDAC_SAMPLING_FREQ_44100)
+		bt_shell_printf("44.1kHz ");
+	if (ldac->frequency & LDAC_SAMPLING_FREQ_48000)
+		bt_shell_printf("48kHz ");
+	if (ldac->frequency & LDAC_SAMPLING_FREQ_88200)
+		bt_shell_printf("88.2kHz ");
+	if (ldac->frequency & LDAC_SAMPLING_FREQ_96000)
+		bt_shell_printf("96kHz ");
+	if (ldac->frequency & LDAC_SAMPLING_FREQ_176400)
+		bt_shell_printf("176.4kHz ");
+	if (ldac->frequency & LDAC_SAMPLING_FREQ_192000)
+		bt_shell_printf("192kHz ");
+
+	bt_shell_printf("\n\t\tChannel modes: ");
+	if (ldac->channel_mode & LDAC_CHANNEL_MODE_MONO)
+		bt_shell_printf("Mono ");
+	if (ldac->channel_mode & LDAC_CHANNEL_MODE_DUAL)
+		bt_shell_printf("Dual ");
+	if (ldac->channel_mode & LDAC_CHANNEL_MODE_STEREO)
+		bt_shell_printf("Stereo ");
+
+	bt_shell_printf("\n");
+}
+
+static void print_vendor(a2dp_vendor_codec_t *vendor, uint8_t size)
+{
+	uint32_t vendor_id;
+	uint16_t codec_id;
+	int i;
+
+	if (size < sizeof(*vendor)) {
+		bt_shell_printf("\tMedia Codec: Vendor Specific A2DP Codec "
+				"(broken)");
+		return;
+	}
+
+	vendor_id = A2DP_GET_VENDOR_ID(*vendor);
+	codec_id = A2DP_GET_CODEC_ID(*vendor);
+
+	bt_shell_printf("\tMedia Codec: Vendor Specific A2DP Codec");
+
+	bt_shell_printf("\n\tVendor ID 0x%08x", vendor_id);
+
+	bt_shell_printf("\n\tVendor Specific Codec ID 0x%04x", codec_id);
+
+	bt_shell_printf("\n\tVendor Specific Data:");
+	for (i = 6; i < size; ++i)
+		bt_shell_printf(" 0x%.02x", ((unsigned char *)vendor)[i]);
+	bt_shell_printf("\n");
+
+	if (vendor_id == APTX_VENDOR_ID && codec_id == APTX_CODEC_ID)
+		print_aptx((void *) vendor, size);
+	else if (vendor_id == FASTSTREAM_VENDOR_ID &&
+			codec_id == FASTSTREAM_CODEC_ID)
+		print_faststream((void *) vendor, size);
+	else if (vendor_id == APTX_LL_VENDOR_ID && codec_id == APTX_LL_CODEC_ID)
+		print_aptx_ll((void *) vendor, size);
+	else if (vendor_id == APTX_HD_VENDOR_ID && codec_id == APTX_HD_CODEC_ID)
+		print_aptx_hd((void *) vendor, size);
+	else if (vendor_id == LDAC_VENDOR_ID && codec_id == LDAC_CODEC_ID)
+		print_ldac((void *) vendor, size);
+}
+
+static void print_mpeg24(a2dp_aac_t *aac, uint8_t size)
+{
+	unsigned int freq, bitrate;
+
+	if (size < sizeof(*aac)) {
+		bt_shell_printf("\tMedia Codec: MPEG24 (broken)\n");
+		return;
+	}
+
+	freq = AAC_GET_FREQUENCY(*aac);
+	bitrate = AAC_GET_BITRATE(*aac);
+
+	bt_shell_printf("\tMedia Codec: MPEG24\n\tObject Types: ");
+
+	if (aac->object_type & AAC_OBJECT_TYPE_MPEG2_AAC_LC)
+		bt_shell_printf("MPEG-2 AAC LC ");
+	if (aac->object_type & AAC_OBJECT_TYPE_MPEG4_AAC_LC)
+		bt_shell_printf("MPEG-4 AAC LC ");
+	if (aac->object_type & AAC_OBJECT_TYPE_MPEG4_AAC_LTP)
+		bt_shell_printf("MPEG-4 AAC LTP ");
+	if (aac->object_type & AAC_OBJECT_TYPE_MPEG4_AAC_SCA)
+		bt_shell_printf("MPEG-4 AAC scalable ");
+
+	bt_shell_printf("\n\tFrequencies: ");
+	if (freq & AAC_SAMPLING_FREQ_8000)
+		bt_shell_printf("8kHz ");
+	if (freq & AAC_SAMPLING_FREQ_11025)
+		bt_shell_printf("11.025kHz ");
+	if (freq & AAC_SAMPLING_FREQ_12000)
+		bt_shell_printf("12kHz ");
+	if (freq & AAC_SAMPLING_FREQ_16000)
+		bt_shell_printf("16kHz ");
+	if (freq & AAC_SAMPLING_FREQ_22050)
+		bt_shell_printf("22.05kHz ");
+	if (freq & AAC_SAMPLING_FREQ_24000)
+		bt_shell_printf("24kHz ");
+	if (freq & AAC_SAMPLING_FREQ_32000)
+		bt_shell_printf("32kHz ");
+	if (freq & AAC_SAMPLING_FREQ_44100)
+		bt_shell_printf("44.1kHz ");
+	if (freq & AAC_SAMPLING_FREQ_48000)
+		bt_shell_printf("48kHz ");
+	if (freq & AAC_SAMPLING_FREQ_64000)
+		bt_shell_printf("64kHz ");
+	if (freq & AAC_SAMPLING_FREQ_88200)
+		bt_shell_printf("88.2kHz ");
+	if (freq & AAC_SAMPLING_FREQ_96000)
+		bt_shell_printf("96kHz ");
+
+	bt_shell_printf("\n\tChannels: ");
+	if (aac->channels & AAC_CHANNELS_1)
+		bt_shell_printf("1 ");
+	if (aac->channels & AAC_CHANNELS_2)
+		bt_shell_printf("2 ");
+
+	bt_shell_printf("\n\tBitrate: %u", bitrate);
+
+	bt_shell_printf("\n\tVBR: %s", aac->vbr ? "Yes\n" : "No\n");
+}
+
+static void print_mpeg12(a2dp_mpeg_t *mpeg, uint8_t size)
+{
+	uint16_t bitrate;
+
+	if (size < sizeof(*mpeg)) {
+		bt_shell_printf("\tMedia Codec: MPEG12 (broken)\n");
+		return;
+	}
+
+	bitrate = MPEG_GET_BITRATE(*mpeg);
+
+	bt_shell_printf("\tMedia Codec: MPEG12\n\tChannel Modes: ");
+
+	if (mpeg->channel_mode & MPEG_CHANNEL_MODE_MONO)
+		bt_shell_printf("Mono ");
+	if (mpeg->channel_mode & MPEG_CHANNEL_MODE_DUAL_CHANNEL)
+		bt_shell_printf("DualChannel ");
+	if (mpeg->channel_mode & MPEG_CHANNEL_MODE_STEREO)
+		bt_shell_printf("Stereo ");
+	if (mpeg->channel_mode & MPEG_CHANNEL_MODE_JOINT_STEREO)
+		bt_shell_printf("JointStereo");
+
+	bt_shell_printf("\n\tFrequencies: ");
+	if (mpeg->frequency & MPEG_SAMPLING_FREQ_16000)
+		bt_shell_printf("16Khz ");
+	if (mpeg->frequency & MPEG_SAMPLING_FREQ_22050)
+		bt_shell_printf("22.05Khz ");
+	if (mpeg->frequency & MPEG_SAMPLING_FREQ_24000)
+		bt_shell_printf("24Khz ");
+	if (mpeg->frequency & MPEG_SAMPLING_FREQ_32000)
+		bt_shell_printf("32Khz ");
+	if (mpeg->frequency & MPEG_SAMPLING_FREQ_44100)
+		bt_shell_printf("44.1Khz ");
+	if (mpeg->frequency & MPEG_SAMPLING_FREQ_48000)
+		bt_shell_printf("48Khz ");
+
+	bt_shell_printf("\n\tCRC: %s", mpeg->crc ? "Yes" : "No");
+
+	bt_shell_printf("\n\tLayer: ");
+	if (mpeg->layer & MPEG_LAYER_MP1)
+		bt_shell_printf("1 ");
+	if (mpeg->layer & MPEG_LAYER_MP2)
+		bt_shell_printf("2 ");
+	if (mpeg->layer & MPEG_LAYER_MP3)
+		bt_shell_printf("3 ");
+
+	if (bitrate & MPEG_BIT_RATE_FREE) {
+		bt_shell_printf("\n\tBit Rate: Free format");
+	} else {
+		if (mpeg->layer & MPEG_LAYER_MP1) {
+			bt_shell_printf("\n\tLayer 1 Bit Rate: ");
+			if (bitrate & MPEG_MP1_BIT_RATE_32000)
+				bt_shell_printf("32kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_64000)
+				bt_shell_printf("64kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_96000)
+				bt_shell_printf("96kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_128000)
+				bt_shell_printf("128kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_160000)
+				bt_shell_printf("160kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_192000)
+				bt_shell_printf("192kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_224000)
+				bt_shell_printf("224kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_256000)
+				bt_shell_printf("256kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_320000)
+				bt_shell_printf("320kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_352000)
+				bt_shell_printf("352kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_384000)
+				bt_shell_printf("384kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_416000)
+				bt_shell_printf("416kbps ");
+			if (bitrate & MPEG_MP1_BIT_RATE_448000)
+				bt_shell_printf("448kbps ");
+		}
+
+		if (mpeg->layer & MPEG_LAYER_MP2) {
+			bt_shell_printf("\n\tLayer 2 Bit Rate: ");
+			if (bitrate & MPEG_MP2_BIT_RATE_32000)
+				bt_shell_printf("32kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_48000)
+				bt_shell_printf("48kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_56000)
+				bt_shell_printf("56kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_64000)
+				bt_shell_printf("64kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_80000)
+				bt_shell_printf("80kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_96000)
+				bt_shell_printf("96kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_112000)
+				bt_shell_printf("112kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_128000)
+				bt_shell_printf("128kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_160000)
+				bt_shell_printf("160kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_192000)
+				bt_shell_printf("192kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_224000)
+				bt_shell_printf("224kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_256000)
+				bt_shell_printf("256kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_320000)
+				bt_shell_printf("320kbps ");
+			if (bitrate & MPEG_MP2_BIT_RATE_384000)
+				bt_shell_printf("384kbps ");
+		}
+
+		if (mpeg->layer & MPEG_LAYER_MP3) {
+			bt_shell_printf("\n\tLayer 3 Bit Rate: ");
+			if (bitrate & MPEG_MP3_BIT_RATE_32000)
+				bt_shell_printf("32kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_40000)
+				bt_shell_printf("40kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_48000)
+				bt_shell_printf("48kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_56000)
+				bt_shell_printf("56kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_64000)
+				bt_shell_printf("64kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_80000)
+				bt_shell_printf("80kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_96000)
+				bt_shell_printf("96kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_112000)
+				bt_shell_printf("112kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_128000)
+				bt_shell_printf("128kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_160000)
+				bt_shell_printf("160kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_192000)
+				bt_shell_printf("192kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_224000)
+				bt_shell_printf("224kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_256000)
+				bt_shell_printf("256kbps ");
+			if (bitrate & MPEG_MP3_BIT_RATE_320000)
+				bt_shell_printf("320kbps ");
+		}
+	}
+
+	bt_shell_printf("\n\tVBR: %s", mpeg->vbr ? "Yes" : "No");
+
+	bt_shell_printf("\n\tPayload Format: ");
+	if (mpeg->mpf)
+		bt_shell_printf("RFC-2250 RFC-3119\n");
+	else
+		bt_shell_printf("RFC-2250\n");
+}
+
+static void print_sbc(a2dp_sbc_t *sbc, uint8_t size)
+{
+	if (size < sizeof(*sbc)) {
+		bt_shell_printf("\tMedia Codec: SBC (broken)\n");
+		return;
+	}
+
+	bt_shell_printf("\tMedia Codec: SBC\n\tChannel Modes: ");
+
+	if (sbc->channel_mode & SBC_CHANNEL_MODE_MONO)
+		bt_shell_printf("Mono ");
+	if (sbc->channel_mode & SBC_CHANNEL_MODE_DUAL_CHANNEL)
+		bt_shell_printf("DualChannel ");
+	if (sbc->channel_mode & SBC_CHANNEL_MODE_STEREO)
+		bt_shell_printf("Stereo ");
+	if (sbc->channel_mode & SBC_CHANNEL_MODE_JOINT_STEREO)
+		bt_shell_printf("JointStereo");
+
+	bt_shell_printf("\n\tFrequencies: ");
+	if (sbc->frequency & SBC_SAMPLING_FREQ_16000)
+		bt_shell_printf("16Khz ");
+	if (sbc->frequency & SBC_SAMPLING_FREQ_32000)
+		bt_shell_printf("32Khz ");
+	if (sbc->frequency & SBC_SAMPLING_FREQ_44100)
+		bt_shell_printf("44.1Khz ");
+	if (sbc->frequency & SBC_SAMPLING_FREQ_48000)
+		bt_shell_printf("48Khz ");
+
+	bt_shell_printf("\n\tSubbands: ");
+	if (sbc->allocation_method & SBC_SUBBANDS_4)
+		bt_shell_printf("4 ");
+	if (sbc->allocation_method & SBC_SUBBANDS_8)
+		bt_shell_printf("8");
+
+	bt_shell_printf("\n\tBlocks: ");
+	if (sbc->block_length & SBC_BLOCK_LENGTH_4)
+		bt_shell_printf("4 ");
+	if (sbc->block_length & SBC_BLOCK_LENGTH_8)
+		bt_shell_printf("8 ");
+	if (sbc->block_length & SBC_BLOCK_LENGTH_12)
+		bt_shell_printf("12 ");
+	if (sbc->block_length & SBC_BLOCK_LENGTH_16)
+		bt_shell_printf("16 ");
+
+	bt_shell_printf("\n\tBitpool Range: %d-%d\n",
+				sbc->min_bitpool, sbc->max_bitpool);
+}
+
+static int print_a2dp_codec(uint8_t codec, void *data, uint8_t size)
+{
+	int i;
+
+	switch (codec) {
+	case A2DP_CODEC_SBC:
+		print_sbc(data, size);
+		break;
+	case A2DP_CODEC_MPEG12:
+		print_mpeg12(data, size);
+		break;
+	case A2DP_CODEC_MPEG24:
+		print_mpeg24(data, size);
+		break;
+	case A2DP_CODEC_VENDOR:
+		print_vendor(data, size);
+		break;
+	default:
+		bt_shell_printf("\tMedia Codec: Unknown\n");
+		bt_shell_printf("\t\tCodec Data:");
+		for (i = 0; i < size - 2; ++i)
+			bt_shell_printf(" 0x%.02x", ((unsigned char *)data)[i]);
+		bt_shell_printf("\n");
+	}
+
+	return 0;
+}
+
 static void print_capabilities(GDBusProxy *proxy)
 {
 	DBusMessageIter iter, subiter;
+	const char *uuid;
 	uint8_t codec;
 	uint8_t *data;
 	int len;
 
+	if (!g_dbus_proxy_get_property(proxy, "UUID", &iter))
+		return;
+
+	dbus_message_iter_get_basic(&iter, &uuid);
+
 	if (!g_dbus_proxy_get_property(proxy, "Codec", &iter))
 		return;
 
 	dbus_message_iter_get_basic(&iter, &codec);
 
-	if (codec != LC3_ID) {
-		print_property(proxy, "Capabilities");
-		return;
-	}
-
 	if (!g_dbus_proxy_get_property(proxy, "Capabilities", &iter))
 		return;
 
@@ -2322,6 +2827,17 @@ static void print_capabilities(GDBusProxy *proxy)
 
 	dbus_message_iter_get_fixed_array(&subiter, &data, &len);
 
+	if (!strcasecmp(uuid, A2DP_SINK_UUID) ||
+			!strcasecmp(uuid, A2DP_SOURCE_UUID)) {
+		print_a2dp_codec(codec, data, len);
+		return;
+	}
+
+	if (codec != LC3_ID) {
+		print_property(proxy, "Capabilities");
+		return;
+	}
+
 	print_lc3_caps(data, len);
 
 	if (!g_dbus_proxy_get_property(proxy, "Metadata", &iter))
@@ -4179,20 +4695,21 @@ static void cmd_list_transport(int argc, char *argv[])
 static void print_configuration(GDBusProxy *proxy)
 {
 	DBusMessageIter iter, subiter;
+	const char *uuid;
 	uint8_t codec;
 	uint8_t *data;
 	int len;
 
+	if (!g_dbus_proxy_get_property(proxy, "UUID", &iter))
+		return;
+
+	dbus_message_iter_get_basic(&iter, &uuid);
+
 	if (!g_dbus_proxy_get_property(proxy, "Codec", &iter))
 		return;
 
 	dbus_message_iter_get_basic(&iter, &codec);
 
-	if (codec != LC3_ID) {
-		print_property(proxy, "Configuration");
-		return;
-	}
-
 	if (!g_dbus_proxy_get_property(proxy, "Configuration", &iter))
 		return;
 
@@ -4200,6 +4717,17 @@ static void print_configuration(GDBusProxy *proxy)
 
 	dbus_message_iter_get_fixed_array(&subiter, &data, &len);
 
+	if (!strcasecmp(uuid, A2DP_SINK_UUID) ||
+			!strcasecmp(uuid, A2DP_SOURCE_UUID)) {
+		print_a2dp_codec(codec, (void *)data, len);
+		return;
+	}
+
+	if (codec != LC3_ID) {
+		print_property(proxy, "Configuration");
+		return;
+	}
+
 	print_lc3_cfg(data, len);
 
 	if (!g_dbus_proxy_get_property(proxy, "Metadata", &iter))
-- 
2.43.0


