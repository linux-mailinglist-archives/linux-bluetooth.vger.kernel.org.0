Return-Path: <linux-bluetooth+bounces-1809-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB33852FE0
	for <lists+linux-bluetooth@lfdr.de>; Tue, 13 Feb 2024 12:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91DCD1C226D4
	for <lists+linux-bluetooth@lfdr.de>; Tue, 13 Feb 2024 11:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65191381B4;
	Tue, 13 Feb 2024 11:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQJotswX"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24D43D966
	for <linux-bluetooth@vger.kernel.org>; Tue, 13 Feb 2024 11:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707825122; cv=none; b=pZjbBOuK0bVmxB64titI25ESlKIBnnUDVW+eVIshtkE2CR159Lc3uhi9NpLNNi28WmN3HAxDMWiYsC/taO0iDBrvLTgsbKqBRDaVFOPllyiddVwkUBTpltPlF3Fz4GwbBFJKyQqjzmaOhDFh4CffbYNONK3qkktmeJP/snd+Pkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707825122; c=relaxed/simple;
	bh=ib4FalMC37231m7i/t6CZk10KgRWCsu9K2dpezK+dC4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Mqntz9M8UFriS03iNMpD1q0aPMB1kYnR6tTtQUQG9EoPJsJ99oQIe/SIt4rnVoOcwYUCyMmmbpuBh3BfWjg12GhwjlEjCNpFRbiRDnKOGiUuJ9P5aa3b2r4wBc0JSpioggt64TadxBMjsAfsi6j1lv2E2hnHXV96OtknVtJFfkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQJotswX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707825120; x=1739361120;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ib4FalMC37231m7i/t6CZk10KgRWCsu9K2dpezK+dC4=;
  b=dQJotswXEhpVc+yEgXxi329qREnyhcqvsN21coUU68qF1OnaqIjZKTxy
   Bm7XXvy0nGBFioSYdl5bnZVxpkvwGyW/uuqIqzb9S2IK9SMAH7lHA2EbS
   Zs4c1aOmH6fHqAsm48ojnh+eRnp9mdokXMUrjK9nIMMD4wP9+oJoJP2m/
   ekyxMr9cc3FgeEpYjuO35MR4Oh08BI8tZCQ2I1hPJ/jDqPpJggFzLxji3
   3/58ECEg3NylyJ564Ag/gMyM7TpVRERx3gFddvZg3DG607pCDOVoavuhQ
   rrRoTMjMIW5qpHoyKQXoM8JXE5mbx56CF6c8ugDT1yhlWOruVCJnQ+kBs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1732582"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="1732582"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 03:51:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7469447"
Received: from lbtoe.iind.intel.com ([10.224.186.133])
  by fmviesa004.fm.intel.com with ESMTP; 13 Feb 2024 03:51:57 -0800
From: Shahid Vichhi <shahid.bashir.vichhi@intel.com>
To: linux-bluetooth@vger.kernel.org
Cc: Shahid Vichhi <shahid.bashir.vichhi@intel.com>
Subject: [PATCH BlueZ v6] monitor/att: Enable the notification logging support for the CCP
Date: Tue, 13 Feb 2024 06:53:04 +0200
Message-Id: <20240213045304.1558991-1-shahid.bashir.vichhi@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 monitor/att.c | 669 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 669 insertions(+)

diff --git a/monitor/att.c b/monitor/att.c
index e0164f3ddf3b..4628db44b139 100644
--- a/monitor/att.c
+++ b/monitor/att.c
@@ -2433,6 +2433,653 @@ static void seeking_speed_notify(const struct l2cap_frame *frame)
 	print_seeking_speed(frame);
 }
 
+static void print_bearer_name(const struct l2cap_frame *frame)
+{
+	char *name;
+
+	name = name2utf8((uint8_t *)frame->data, frame->size);
+
+	print_field("  Bearer Name: %s", name);
+}
+
+static void bearer_name_read(const struct l2cap_frame *frame)
+{
+	print_bearer_name(frame);
+}
+
+static void bearer_name_notify(const struct l2cap_frame *frame)
+{
+	print_bearer_name(frame);
+}
+
+static void bearer_uci_read(const struct l2cap_frame *frame)
+{
+	char *name;
+
+	name = name2utf8((uint8_t *)frame->data, frame->size);
+
+	print_field("  Bearer Uci Name: %s", name);
+}
+
+static void print_technology_name(const struct l2cap_frame *frame)
+{
+	int8_t tech_id;
+	const char *str;
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&tech_id)) {
+		print_text(COLOR_ERROR, "  Technology id:: invalid size");
+		goto done;
+	}
+
+	switch (tech_id) {
+	case 0x01:
+		str = "3G";
+		break;
+	case 0x02:
+		str = "4G";
+		break;
+	case 0x03:
+		str = "LTE";
+		break;
+	case 0x04:
+		str = "WiFi";
+		break;
+	case 0x05:
+		str = "5G";
+		break;
+	case 0x06:
+		str = "GSM";
+		break;
+	case 0x07:
+		str = "CDMA";
+		break;
+	case 0x08:
+		str = "2G";
+		break;
+	case 0x09:
+		str = "WCDMA";
+		break;
+	default:
+		str = "Reserved";
+		break;
+	}
+
+	print_field("Technology: %s  (0x%2.2x)", str, tech_id);
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void bearer_technology_read(const struct l2cap_frame *frame)
+{
+	print_technology_name(frame);
+}
+
+static void bearer_technology_notify(const struct l2cap_frame *frame)
+{
+	print_technology_name(frame);
+}
+
+static void print_uri_scheme_list(const struct l2cap_frame *frame)
+{
+	char *name;
+
+	name = name2utf8((uint8_t *)frame->data, frame->size);
+
+	print_field("  Uri scheme Name: %s", name);
+}
+
+static void bearer_uri_schemes_list_read(const struct l2cap_frame *frame)
+{
+	print_uri_scheme_list(frame);
+}
+
+static void print_signal_strength(const struct l2cap_frame *frame)
+{
+	uint8_t signal_strength;
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&signal_strength)) {
+		print_text(COLOR_ERROR, " signal_strength:: invalid size");
+		goto done;
+	}
+
+	print_field("  signal_strength: %x", signal_strength);
+
+	if (signal_strength == 0)
+		print_field("  No Service");
+	else if (signal_strength == 0x64)
+		print_field("  Maximum signal strength");
+	else if ((signal_strength > 0) && (signal_strength < 0x64))
+		print_field("  Implementation specific");
+	else if (signal_strength == 0xFF)
+		print_field("  Signal strength is unavailable");
+	else
+		print_field("  RFU");
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void bearer_signal_strength_read(const struct l2cap_frame *frame)
+{
+	print_signal_strength(frame);
+}
+
+static void bearer_signal_strength_notify(const struct l2cap_frame *frame)
+{
+	print_signal_strength(frame);
+}
+
+static void
+print_signal_strength_rep_intrvl(const struct l2cap_frame *frame)
+{
+	int8_t reporting_intrvl;
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&reporting_intrvl)) {
+		print_text(COLOR_ERROR, "Reporting_interval:: invalid size");
+		goto done;
+	}
+
+	print_field("  Reporting_interval: 0x%x", reporting_intrvl);
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void
+bearer_signal_strength_rep_intrvl_read(const struct l2cap_frame *frame)
+{
+	print_signal_strength_rep_intrvl(frame);
+}
+
+static void
+bearer_signal_strength_rep_intrvl_write(const struct l2cap_frame *frame)
+{
+	print_signal_strength_rep_intrvl(frame);
+}
+
+static void print_call_list(const struct l2cap_frame *frame)
+{
+	uint8_t list_item_length;
+	uint8_t call_index;
+	uint8_t call_state;
+	uint8_t call_flag;
+	char *call_uri;
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&list_item_length)) {
+		print_text(COLOR_ERROR, "    list_item_length:: invalid size");
+		goto done;
+	}
+
+	print_field("  list_item_length: 0x%x", list_item_length);
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&call_index)) {
+		print_text(COLOR_ERROR, "  call_index:: invalid size");
+		goto done;
+	}
+
+	print_field("  call_index: 0x%x", call_index);
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&call_state)) {
+		print_text(COLOR_ERROR, "  call_state:: invalid size");
+		goto done;
+	}
+
+	print_field("  call_state: 0x%x", call_state);
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&call_flag)) {
+		print_text(COLOR_ERROR, "  call_flag:: invalid size");
+		goto done;
+	}
+
+	print_field("  call_flag: 0x%x", call_flag);
+
+	call_uri = name2utf8((uint8_t *)frame->data, frame->size);
+
+	print_field("  call_uri: %s", call_uri);
+
+done:
+	if (frame->size)
+		print_hex_field("  call_list Data", frame->data, frame->size);
+}
+
+static void bearer_current_call_list_read(const struct l2cap_frame *frame)
+{
+	print_call_list(frame);
+}
+
+static void bearer_current_call_list_notify(const struct l2cap_frame *frame)
+{
+	print_call_list(frame);
+}
+
+static void print_ccid(const struct l2cap_frame *frame)
+{
+	int8_t ccid;
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&ccid)) {
+		print_text(COLOR_ERROR, "  ccid:: invalid size");
+		goto done;
+	}
+
+	print_field("  ccid: %x", ccid);
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void call_content_control_id_read(const struct l2cap_frame *frame)
+{
+	print_ccid(frame);
+}
+
+static void print_status_flag(const struct l2cap_frame *frame)
+{
+	int16_t flag;
+
+	if (!l2cap_frame_get_le16((void *)frame, (uint16_t *)&flag)) {
+		print_text(COLOR_ERROR, "  status flag:: invalid size");
+		goto done;
+	}
+
+	print_field("  status flag:");
+
+	if (flag & 0x1)
+		print_field("  Inband Ringtone Enabled:");
+	else
+		print_field("  Inband Ringtone Disabled:");
+
+	if (flag & 0x2)
+		print_field("  Server in silent Mode");
+	else
+		print_field("  Server Not in silent Mode");
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void status_flag_read(const struct l2cap_frame *frame)
+{
+	print_status_flag(frame);
+}
+
+static void status_flag_notify(const struct l2cap_frame *frame)
+{
+	print_status_flag(frame);
+}
+
+static void print_target_uri(const struct l2cap_frame *frame)
+{
+	char *name;
+	uint8_t call_idx;
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&call_idx)) {
+		print_text(COLOR_ERROR, "  call_idx:: invalid size");
+		goto done;
+	}
+
+	print_field("  call_idx: %x", call_idx);
+
+	name = name2utf8((uint8_t *)frame->data, frame->size);
+
+	print_field("  Uri: %s", name);
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void incom_target_bearer_uri_read(const struct l2cap_frame *frame)
+{
+	print_target_uri(frame);
+}
+
+static void incom_target_bearer_uri_notify(const struct l2cap_frame *frame)
+{
+	print_target_uri(frame);
+}
+
+static void print_call_state(const struct l2cap_frame *frame)
+{
+	uint8_t call_Index;
+	uint8_t call_state;
+	uint8_t call_flag;
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&call_Index)) {
+		print_text(COLOR_ERROR, "  call_Index:: invalid index");
+		goto done;
+	}
+
+	print_field("  call_Index: 0x%2.2x", call_Index);
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&call_state)) {
+		print_text(COLOR_ERROR, "  call_state:: invalid state");
+		goto done;
+	}
+
+	print_field("  call_state: 0x%2.2x", call_state);
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&call_flag)) {
+		print_text(COLOR_ERROR, "  call_flag:: invalid flag");
+		goto done;
+	}
+
+	print_field("  call_flag: 0x%2.2x", call_flag);
+
+done:
+	if (frame->size)
+		print_hex_field("   call_state Data", frame->data, frame->size);
+}
+
+static void call_state_read(const struct l2cap_frame *frame)
+{
+	print_call_state(frame);
+}
+
+static void call_state_notify(const struct l2cap_frame *frame)
+{
+	print_call_state(frame);
+}
+
+static void print_call_cp(const struct l2cap_frame *frame)
+{
+	uint8_t opcode;
+	uint8_t parameter;
+	const char *str;
+	char *name;
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&opcode)) {
+		print_text(COLOR_ERROR, "  opcode:: invalid size");
+		goto done;
+	}
+
+	print_field("  opcode: 0x%2.2x", opcode);
+
+	switch (opcode) {
+	case 0x00:
+		str = "Accept";
+		if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&parameter)) {
+			print_text(COLOR_ERROR, "  parameter:: invalid size");
+			goto done;
+		}
+		print_field("  Operation: %s  (0x%2.2x)", str, parameter);
+		break;
+	case 0x01:
+		str = "Terminate";
+		if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&parameter)) {
+			print_text(COLOR_ERROR, "  parameter:: invalid size");
+			goto done;
+		}
+		print_field("  Operation: %s  (0x%2.2x)", str, parameter);
+		break;
+	case 0x02:
+		str = "Local Hold";
+		if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&parameter)) {
+			print_text(COLOR_ERROR, "  parameter:: invalid size");
+			goto done;
+		}
+		print_field("  Operation: %s  (0x%2.2x)", str, parameter);
+		break;
+	case 0x03:
+		str = "Local Retrieve";
+		if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&parameter)) {
+			print_text(COLOR_ERROR, "  parameter:: invalid size");
+			goto done;
+		}
+		print_field("  Operation: %s  (0x%2.2x)", str, parameter);
+		break;
+	case 0x04:
+		str = "Originate";
+		name = name2utf8((uint8_t *)frame->data, frame->size);
+		print_field("  Operation: %s  Uri: %s", str, name);
+		break;
+	case 0x05:
+		str = "Join";
+		if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&parameter)) {
+			print_text(COLOR_ERROR, "  parameter:: invalid size");
+			goto done;
+		}
+		print_field("  Operation: %s  (0x%2.2x)", str, parameter);
+		break;
+	default:
+		str = "RFU";
+		print_field("  Operation: %s", str);
+		break;
+	}
+
+done:
+	if (frame->size)
+		print_hex_field("call_cp Data", frame->data, frame->size);
+}
+
+static void print_call_cp_notification(const struct l2cap_frame *frame)
+{
+	uint8_t opcode;
+	uint8_t result_code;
+	const char *str;
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&opcode)) {
+		print_text(COLOR_ERROR, "  result_code:: invalid opcode");
+		goto done;
+	}
+
+	print_field("  opcode: 0x%2.2x", opcode);
+
+	if (!l2cap_frame_get_u8((void *)frame, (uint8_t *)&result_code)) {
+		print_text(COLOR_ERROR, "  result_code:: invalid result_code");
+		goto done;
+	}
+
+	print_field("  result_code: 0x%2.2x", result_code);
+
+	switch (result_code) {
+	case 0x00:
+		str = "SUCCESS";
+		break;
+	case 0x01:
+		str = "OPCODE NOT SUPPORTED";
+		break;
+	case 0x02:
+		str = "OPERATION NOT POSSIBLE";
+		break;
+	case 0x03:
+		str = "INVALID CALL INDEX";
+		break;
+	case 0x04:
+		str = "STATE MISMATCH";
+		break;
+	case 0x05:
+		str = "LACK OF RESOURCES";
+		break;
+	case 0x06:
+		str = "INVALID OUTGOING URI";
+		break;
+	default:
+		str = "RFU";
+		break;
+	}
+
+	print_field("  Status: %s", str);
+
+done:
+	if (frame->size)
+		print_hex_field("  call_cp Data", frame->data, frame->size);
+}
+
+static void call_cp_write(const struct l2cap_frame *frame)
+{
+	print_call_cp(frame);
+}
+
+static void call_cp_notify(const struct l2cap_frame *frame)
+{
+	print_call_cp_notification(frame);
+}
+
+static void print_call_cp_opt(const struct l2cap_frame *frame)
+{
+	uint16_t operation;
+
+	if (!l2cap_frame_get_le16((void *)frame, (uint16_t *)&operation)) {
+		print_text(COLOR_ERROR, "  status operation:: invalid size");
+		goto done;
+	}
+
+	print_field("  operation: 0x%2x", operation);
+
+	if (operation & 0x1) {
+		print_field("  Local Hold and Local Retrieve "
+								"Call Control Point Opcodes supported");
+	} else {
+		print_field("  Local Hold and Local Retrieve "
+								"Call Control Point Opcodes not supported");
+	}
+
+	if (operation & 0x2)
+		print_field("  Join Call Control Point Opcode supported");
+	else
+		print_field("  Join Call Control Point Opcode not supported");
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void call_cp_opt_opcodes_read(const struct l2cap_frame *frame)
+{
+	print_call_cp_opt(frame);
+}
+
+static void print_term_reason(const struct l2cap_frame *frame)
+{
+	uint8_t call_id, reason;
+
+	if (!l2cap_frame_get_u8((void *)frame, &call_id)) {
+		print_text(COLOR_ERROR, "Call Index: invalid size");
+		goto done;
+	}
+	print_field("  call Index: %u", call_id);
+
+	if (!l2cap_frame_get_u8((void *)frame, &reason)) {
+		print_text(COLOR_ERROR, "Reason: invalid size");
+		goto done;
+	}
+
+	print_field("  Reason:");
+
+	switch (reason) {
+	case 0x00:
+		print_field("  Improper URI");
+		break;
+	case 0x01:
+		print_field("  Call Failed");
+		break;
+	case 0x02:
+		print_field("  Remote party ended the call");
+		break;
+	case 0x03:
+		print_field("  Server  ended the call");
+		break;
+	case 0x04:
+		print_field("  Line was Busy");
+		break;
+	case 0x05:
+		print_field("  Network Congestion");
+		break;
+	case 0x06:
+		print_field("  Client terminated the call");
+		break;
+	case 0x07:
+		print_field("  No service");
+		break;
+	case 0x08:
+		print_field("  No answer");
+		break;
+	case 0x09:
+		print_field("  Unspecified");
+		break;
+	default:
+		print_field("  RFU");
+		break;
+	}
+
+done:
+	if (frame->size)
+		print_hex_field("  Data", frame->data, frame->size);
+}
+
+static void call_termination_reason_notify(const struct l2cap_frame *frame)
+{
+	print_term_reason(frame);
+}
+
+static void print_incom_call(const struct l2cap_frame *frame)
+{
+	char *name;
+	uint8_t call_id;
+
+	if (!l2cap_frame_get_u8((void *)frame, &call_id)) {
+		print_text(COLOR_ERROR, "Call Index: invalid size");
+		goto done;
+	}
+
+	print_field("  Call Index: %u", call_id);
+
+	name = name2utf8((uint8_t *)frame->data, frame->size);
+
+	print_field("  call_string: %s", name);
+
+done:
+	if (frame->size)
+		print_hex_field(" Data", frame->data, frame->size);
+}
+
+static void incoming_call_read(const struct l2cap_frame *frame)
+{
+	print_incom_call(frame);
+}
+
+static void incoming_call_notify(const struct l2cap_frame *frame)
+{
+	print_incom_call(frame);
+}
+
+static void print_call_friendly_name(const struct l2cap_frame *frame)
+{
+	char *name;
+	uint8_t call_id;
+
+	if (!l2cap_frame_get_u8((void *)frame, &call_id)) {
+		print_text(COLOR_ERROR, "Call Index: invalid size");
+		goto done;
+	}
+
+	print_field("  Call Index: %u", call_id);
+
+	name = name2utf8((uint8_t *)frame->data, frame->size);
+
+	print_field("  Friendly Name: %s", name);
+
+done:
+	if (frame->size)
+		print_hex_field(" Data", frame->data, frame->size);
+}
+
+static void call_friendly_name_read(const struct l2cap_frame *frame)
+{
+	print_call_friendly_name(frame);
+}
+
+static void call_friendly_name_notify(const struct l2cap_frame *frame)
+{
+	print_call_friendly_name(frame);
+}
+
 static const char *play_order_str(uint8_t order)
 {
 	switch (order) {
@@ -3392,6 +4039,28 @@ static const struct gatt_handler {
 	GATT_HANDLER(0x2bc7, NULL, bcast_audio_scan_cp_write, NULL),
 	GATT_HANDLER(0x2bc8, bcast_recv_state_read, NULL,
 					bcast_recv_state_notify),
+	GATT_HANDLER(0x2bb3, bearer_name_read, NULL, bearer_name_notify),
+	GATT_HANDLER(0x2bb4, bearer_uci_read, NULL, NULL),
+	GATT_HANDLER(0x2bb5, bearer_technology_read, NULL,
+					bearer_technology_notify),
+	GATT_HANDLER(0x2bb6, bearer_uri_schemes_list_read, NULL, NULL),
+	GATT_HANDLER(0x2bb7, bearer_signal_strength_read, NULL,
+					bearer_signal_strength_notify),
+	GATT_HANDLER(0x2bb8, bearer_signal_strength_rep_intrvl_read,
+			bearer_signal_strength_rep_intrvl_write, NULL),
+	GATT_HANDLER(0x2bb9, bearer_current_call_list_read, NULL,
+					bearer_current_call_list_notify),
+	GATT_HANDLER(0x2bba, call_content_control_id_read, NULL, NULL),
+	GATT_HANDLER(0x2bbb, status_flag_read, NULL, status_flag_notify),
+	GATT_HANDLER(0x2bbc, incom_target_bearer_uri_read, NULL,
+					incom_target_bearer_uri_notify),
+	GATT_HANDLER(0x2bbd, call_state_read, NULL, call_state_notify),
+	GATT_HANDLER(0x2bbe, NULL, call_cp_write, call_cp_notify),
+	GATT_HANDLER(0x2bbf, call_cp_opt_opcodes_read, NULL, NULL),
+	GATT_HANDLER(0x2bc0, NULL, NULL, call_termination_reason_notify),
+	GATT_HANDLER(0x2bc1, incoming_call_read, NULL, incoming_call_notify),
+	GATT_HANDLER(0x2bc2, call_friendly_name_read, NULL,
+					call_friendly_name_notify),
 	GMAS
 };
 
-- 
2.34.1


