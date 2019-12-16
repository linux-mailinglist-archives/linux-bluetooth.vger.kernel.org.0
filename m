Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB0D120186
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Dec 2019 10:53:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbfLPJxE (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 16 Dec 2019 04:53:04 -0500
Received: from mga17.intel.com ([192.55.52.151]:4377 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726926AbfLPJxE (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 16 Dec 2019 04:53:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 01:53:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; 
   d="scan'208";a="364976289"
Received: from unknown (HELO ajay-desktop.iind.intel.com) ([10.223.96.133])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2019 01:53:03 -0800
From:   Ajay Kishore <ajay.kishore@intel.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 6/6] doc/obex-api: Update documentation
Date:   Mon, 16 Dec 2019 14:58:28 +0530
Message-Id: <1576488509-26331-1-git-send-email-ajay.kishore@intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This adds documentation with the conversation listing feature

Signed-off-by: Ajay Kishore <ajay.kishore@intel.com>
---
 doc/obex-api.txt | 65 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/doc/obex-api.txt b/doc/obex-api.txt
index f39355a..9a76159 100644
--- a/doc/obex-api.txt
+++ b/doc/obex-api.txt
@@ -712,6 +712,71 @@ Methods		void SetFolder(string name)
 			Possible errors: org.bluez.obex.Error.InvalidArguments
 					 org.bluez.obex.Error.Failed
 
+
+
+		array{object, dict} listconversations(string folder, dict filter)
+			Returns an array containing the conversations found in the
+			given subfolder of the current folder, or in the current
+			folder if folder is empty.
+
+			Possible Filters: LastActivityBegin, LastActivityEnd,
+			ReadStatus, Recipient
+
+
+			Properties:
+
+				string id:
+
+					Conversation unique identification
+
+				string name:
+
+					Conversation name
+
+				string last_activity:
+
+					Conversation timestamp for the last activity
+
+				boolean read_status:
+
+					Conversation read flag
+
+				string version_counter:
+
+					128 bits version counter.
+					The ‘Conversation-Listing Version Counter’,
+					‘Conversation Version Counter’, and ‘Folder
+					Version Counter’ are used to detect if something
+					has changed
+
+				string summary:
+
+					Conversation summary
+
+				string display:
+
+					Conversation participants name
+
+				string chat_state:
+
+					Conversation current chat state of the participants
+
+				string presence_availability:
+
+					Conversation  participants availability
+
+				string presence_text:
+
+					User defined status of the conversation
+
+				uint16 priority:
+
+					Conversation participant priority
+
+			Possible errors: org.bluez.obex.Error.InvalidArguments
+					 org.bluez.obex.Error.Failed
+
+
 		void UpdateInbox(void)
 
 			Request remote to update its inbox.
-- 
2.7.4

