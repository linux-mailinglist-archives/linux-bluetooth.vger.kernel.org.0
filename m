Return-Path: <linux-bluetooth+bounces-1115-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C986C82F02A
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 15:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 502131F25393
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Jan 2024 14:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A801C2A1;
	Tue, 16 Jan 2024 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRTZP9JX"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD5F1BDFB
	for <linux-bluetooth@vger.kernel.org>; Tue, 16 Jan 2024 14:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D68EAC43143;
	Tue, 16 Jan 2024 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705413639;
	bh=/kkyCayW86QPB7bv2KKkQj8ka4jKmnUp4RSzD3PbMBI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WRTZP9JXP/zhswap8dH8BBAYHGv2+HQo4BJhSfAIGgkDu6QJ/Sv3jLHnvsweI6x7a
	 84Y+4FRA5/iyzQ5zey05ebyr+wrOeaMh1PRnxkOlIFXP3rm4dTxcZLDGxavwNdvCO9
	 zr1zSAE8UUKZvhU0SizGLypOD5qjlW9e1edjDreLCuLxfatftrg9cnD0q1BkvwT5ck
	 YPfVL0lNbFqwuxaCpAP/T8RvLaJOrWtgD9iC0fShYSvd2wRna7y74NGAgHLFZCKszD
	 OkmrApxam7GOxwL2L1Nw0uL3rbtnZqQST/jW9UOzpfFFrbGCWdSqhZwD+R+t4fZFub
	 1/I9rhmKix3Iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49BBC47DA2;
	Tue, 16 Jan 2024 14:00:39 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Tue, 16 Jan 2024 14:00:37 +0000
Subject: [PATCH BlueZ 12/20] lib: const annotate hci_map instances and
 related API
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240116-const-v1-12-17c87978f40b@gmail.com>
References: <20240116-const-v1-0-17c87978f40b@gmail.com>
In-Reply-To: <20240116-const-v1-0-17c87978f40b@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705413636; l=6405;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=G1T1BpY+ViXL5Nqm153cSzTMq0Gn6gXun3Ula2nPawc=;
 b=Elld4fq5Oyb9/L/sc946Ajt+HH/VyXPxr5oX80RiYGtIQrdE9QDJxAonB6VxBMeY5ExMvAk8d
 7ykQs7iAeYLBPGEsSkQF3HS0lx4SZDlzzlhfS2bM6LeJvfVzdwc+jkY
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

---
 client/mgmt.c |  2 +-
 lib/hci.c     | 42 +++++++++++++++++++++---------------------
 lib/hci_lib.h |  4 ++--
 3 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/client/mgmt.c b/client/mgmt.c
index 6fd43887d..62167727c 100644
--- a/client/mgmt.c
+++ b/client/mgmt.c
@@ -1484,7 +1484,7 @@ static void ext_index_rsp(uint8_t status, uint16_t len, const void *param,
 
 	for (i = 0; i < count; i++) {
 		uint16_t index = le16_to_cpu(rp->entry[i].index);
-		char *busstr = hci_bustostr(rp->entry[i].bus);
+		const char *busstr = hci_bustostr(rp->entry[i].bus);
 
 		switch (rp->entry[i].type) {
 		case 0x00:
diff --git a/lib/hci.c b/lib/hci.c
index bd735a440..937e65d48 100644
--- a/lib/hci.c
+++ b/lib/hci.c
@@ -42,7 +42,7 @@ typedef struct {
 	unsigned int val;
 } hci_map;
 
-static char *hci_bit2str(hci_map *m, unsigned int val)
+static char *hci_bit2str(const hci_map *m, unsigned int val)
 {
 	char *str = malloc(120);
 	char *ptr = str;
@@ -59,10 +59,10 @@ static char *hci_bit2str(hci_map *m, unsigned int val)
 	return str;
 }
 
-static int hci_str2bit(hci_map *map, char *str, unsigned int *val)
+static int hci_str2bit(const hci_map *map, char *str, unsigned int *val)
 {
 	char *t, *ptr;
-	hci_map *m;
+	const hci_map *m;
 	int set;
 
 	if (!str || !(str = ptr = strdup(str)))
@@ -83,7 +83,7 @@ static int hci_str2bit(hci_map *map, char *str, unsigned int *val)
 	return set;
 }
 
-static char *hci_uint2str(hci_map *m, unsigned int val)
+static char *hci_uint2str(const hci_map *m, unsigned int val)
 {
 	char *str = malloc(50);
 	char *ptr = str;
@@ -102,10 +102,10 @@ static char *hci_uint2str(hci_map *m, unsigned int val)
 	return str;
 }
 
-static int hci_str2uint(hci_map *map, char *str, unsigned int *val)
+static int hci_str2uint(const hci_map *map, char *str, unsigned int *val)
 {
 	char *t, *ptr;
-	hci_map *m;
+	const hci_map *m;
 	int set = 0;
 
 	if (!str)
@@ -127,7 +127,7 @@ static int hci_str2uint(hci_map *map, char *str, unsigned int *val)
 	return set;
 }
 
-char *hci_bustostr(int bus)
+const char *hci_bustostr(int bus)
 {
 	switch (bus) {
 	case HCI_VIRTUAL:
@@ -157,7 +157,7 @@ char *hci_bustostr(int bus)
 	}
 }
 
-char *hci_dtypetostr(int type)
+const char *hci_dtypetostr(int type)
 {
 	return hci_bustostr(type & 0x0f);
 }
@@ -175,7 +175,7 @@ char *hci_typetostr(int type)
 }
 
 /* HCI dev flags mapping */
-static hci_map dev_flags_map[] = {
+static const hci_map dev_flags_map[] = {
 	{ "UP",      HCI_UP      },
 	{ "INIT",    HCI_INIT    },
 	{ "RUNNING", HCI_RUNNING },
@@ -192,7 +192,7 @@ char *hci_dflagstostr(uint32_t flags)
 {
 	char *str = bt_malloc(50);
 	char *ptr = str;
-	hci_map *m = dev_flags_map;
+	const hci_map *m = dev_flags_map;
 
 	if (!str)
 		return NULL;
@@ -211,7 +211,7 @@ char *hci_dflagstostr(uint32_t flags)
 }
 
 /* HCI packet type mapping */
-static hci_map pkt_type_map[] = {
+static const hci_map pkt_type_map[] = {
 	{ "DM1",   HCI_DM1  },
 	{ "DM3",   HCI_DM3  },
 	{ "DM5",   HCI_DM5  },
@@ -230,7 +230,7 @@ static hci_map pkt_type_map[] = {
 	{ NULL }
 };
 
-static hci_map sco_ptype_map[] = {
+static const hci_map sco_ptype_map[] = {
 	{ "HV1",   0x0001   },
 	{ "HV2",   0x0002   },
 	{ "HV3",   0x0004   },
@@ -265,7 +265,7 @@ int hci_strtoscoptype(char *str, unsigned int *val)
 }
 
 /* Link policy mapping */
-static hci_map link_policy_map[] = {
+static const hci_map link_policy_map[] = {
 	{ "NONE",	0		},
 	{ "RSWITCH",	HCI_LP_RSWITCH	},
 	{ "HOLD",	HCI_LP_HOLD	},
@@ -285,7 +285,7 @@ int hci_strtolp(char *str, unsigned int *val)
 }
 
 /* Link mode mapping */
-static hci_map link_mode_map[] = {
+static const hci_map link_mode_map[] = {
 	{ "NONE",	0		},
 	{ "ACCEPT",	HCI_LM_ACCEPT	},
 	{ "CENTRAL",	HCI_LM_MASTER	},
@@ -332,7 +332,7 @@ int hci_strtolm(char *str, unsigned int *val)
 }
 
 /* Command mapping */
-static hci_map commands_map[] = {
+static const hci_map commands_map[] = {
 	{ "Inquiry",					0   },
 	{ "Inquiry Cancel",				1   },
 	{ "Periodic Inquiry Mode",			2   },
@@ -605,7 +605,7 @@ char *hci_cmdtostr(unsigned int cmd)
 char *hci_commandstostr(uint8_t *commands, char *pref, int width)
 {
 	unsigned int maxwidth = width - 3;
-	hci_map *m;
+	const hci_map *m;
 	char *off, *ptr, *str;
 	int size = 10;
 
@@ -645,7 +645,7 @@ char *hci_commandstostr(uint8_t *commands, char *pref, int width)
 }
 
 /* Version mapping */
-static hci_map ver_map[] = {
+static const hci_map ver_map[] = {
 	{ "1.0b",	0x00 },
 	{ "1.1",	0x01 },
 	{ "1.2",	0x02 },
@@ -683,7 +683,7 @@ int lmp_strtover(char *str, unsigned int *ver)
 	return hci_str2uint(ver_map, str, ver);
 }
 
-static hci_map pal_map[] = {
+static const hci_map pal_map[] = {
 	{ "3.0",	0x01 },
 	{ NULL }
 };
@@ -699,7 +699,7 @@ int pal_strtover(char *str, unsigned int *ver)
 }
 
 /* LMP features mapping */
-static hci_map lmp_features_map[8][9] = {
+static const hci_map lmp_features_map[8][9] = {
 	{	/* Byte 0 */
 		{ "<3-slot packets>",	LMP_3SLOT	},	/* Bit 0 */
 		{ "<5-slot packets>",	LMP_5SLOT	},	/* Bit 1 */
@@ -794,7 +794,7 @@ char *lmp_featurestostr(uint8_t *features, char *pref, int width)
 	int i, size = 10;
 
 	for (i = 0; i < 8; i++) {
-		hci_map *m = lmp_features_map[i];
+		const hci_map *m = lmp_features_map[i];
 
 		while (m->str) {
 			if (m->val & features[i])
@@ -816,7 +816,7 @@ char *lmp_featurestostr(uint8_t *features, char *pref, int width)
 	off = ptr;
 
 	for (i = 0; i < 8; i++) {
-		hci_map *m = lmp_features_map[i];
+		const hci_map *m = lmp_features_map[i];
 
 		while (m->str) {
 			if (m->val & features[i]) {
diff --git a/lib/hci_lib.h b/lib/hci_lib.h
index 6b1a548b5..baf3d3e12 100644
--- a/lib/hci_lib.h
+++ b/lib/hci_lib.h
@@ -132,9 +132,9 @@ int hci_le_read_remote_features(int dd, uint16_t handle, uint8_t *features, int
 int hci_for_each_dev(int flag, int(*func)(int dd, int dev_id, long arg), long arg);
 int hci_get_route(bdaddr_t *bdaddr);
 
-char *hci_bustostr(int bus);
+const char *hci_bustostr(int bus);
 char *hci_typetostr(int type);
-char *hci_dtypetostr(int type);
+const char *hci_dtypetostr(int type);
 char *hci_dflagstostr(uint32_t flags);
 char *hci_ptypetostr(unsigned int ptype);
 int hci_strtoptype(char *str, unsigned int *val);

-- 
2.43.0


