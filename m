Return-Path: <linux-bluetooth+bounces-205-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C63947F7405
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Nov 2023 13:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67044B21478
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Nov 2023 12:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B96215AC5;
	Fri, 24 Nov 2023 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="TjJZuYWL"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C96BFD67;
	Fri, 24 Nov 2023 04:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1700829785; x=1701088985;
	bh=xhB/DmgzfwUevUrSqZtG4Ipg2x/lvgmqOCUKZ45I4RY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TjJZuYWLQVCazH8QtZccduSXZj2ym4vE67mDxrAUNHCd3G8rdyauX/zp5a0UPf26A
	 K7Prdk0DjPfcwYhYrU+Kbt3Vwg4KTpDUHCQ/PBniNo3JJF2je6KijA5wmej+3APPDM
	 4ESL+NHV9iDIMLifD8PczVwlF3sptWaLosCEgdNAvbfgtZ6pCkQBPbXJM2P0tTsNXd
	 mc6DGjmG/qeUoBOqFp2Ncoc857csDide6uwfRhvO605FOrKF0YMaGuKQHXHfRiLNlQ
	 XClWvjPVfh6EKtdz6F8PE9Ni1xTuB/udJRkFCu7udzDJCQ2vgWnf4hemWfnTUGQgnT
	 X+OtNyjLqhV6g==
Date: Fri, 24 Nov 2023 12:42:51 +0000
To: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/1] Bluetooth: btintel: Demote DSM support error to info
Message-ID: <20231124124248.7621-1-akoskovich@pm.me>
Feedback-ID: 37836894:user:proton
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Newer Intel platforms support reset of Bluetooth device via ACPI DSM
methods, but not all. If the platform doesn't support restarting
Bluetooth via DSM an info message is more appropriate as nothing
is actually wrong, since this is new behavior as of v6.6.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/bluetooth/btintel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 2462796a512a..e025a80e10b5 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -2536,7 +2536,7 @@ static void btintel_set_dsm_reset_method(struct hci_d=
ev *hdev,
=20
 =09=09if (!acpi_check_dsm(handle, &btintel_guid_dsm, 0,
 =09=09=09=09    BIT(DSM_SET_WDISABLE2_DELAY))) {
-=09=09=09bt_dev_err(hdev, "No dsm support to set reset delay");
+=09=09=09bt_dev_info(hdev, "No dsm support to set reset delay");
 =09=09=09return;
 =09=09}
 =09=09argv4.integer.type =3D ACPI_TYPE_INTEGER;
--=20
2.43.0



