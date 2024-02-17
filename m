Return-Path: <linux-bluetooth+bounces-1958-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4BD8589FC
	for <lists+linux-bluetooth@lfdr.de>; Sat, 17 Feb 2024 00:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B83572889E5
	for <lists+linux-bluetooth@lfdr.de>; Fri, 16 Feb 2024 23:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C9714F9FD;
	Fri, 16 Feb 2024 23:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pnZOWXKh"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C327148FE3
	for <linux-bluetooth@vger.kernel.org>; Fri, 16 Feb 2024 23:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708125071; cv=none; b=B1AHWWjKe2Ys1PFEV8RxnWtIByg7KDz+adXAv5hRFzTahRnyyOEMwEnrreR2LZ4tgcetcxKazSAe1hLJedcsbqBdIEcKD2Lix6Ez3WMz4EKoYfHFIM4crsYlvPLJ4icDbYwyhR+2ZPE0KBE9nlM4EFuaWcHvOnNQdMQIMSWXq7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708125071; c=relaxed/simple;
	bh=+inixSoJIlsm/AfXavYZY5O2m+mkG8Tff3fFVNoC3ak=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mlpj8v0yX2ohjVcVlgY0UEJOAvdsed5lBCvG0/A9QZjevFjzr1XDeDNWXRhCsT8iiU6M+lSji9JOdrkL7nlbEaTWgj5ZQiHClAHW21orr+hpaBbwErsPiikwdgnJYKTnHxfAUm/Rg4kPh2QrrHeyZuQ7o2VpQYhM5B6PTRu7XoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pnZOWXKh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1AE2C433F1;
	Fri, 16 Feb 2024 23:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708125070;
	bh=+inixSoJIlsm/AfXavYZY5O2m+mkG8Tff3fFVNoC3ak=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pnZOWXKhZppjSmEJB68Vral5cQTQ28N4d5stnGubaZ5wJcbbkYPaet+YnRHYXcfuV
	 ewxMkC9jRUqveEc3HQNwT1DWV1aa15UQ/zNnWhgD8TNyMd0KSbvaKFeTlzU3gfPDdV
	 Gqm6KDbTEZ5b1jM/YPOJGPyqEN6Jlwc3dtULxmzZHoy7wcyAfbai3EOaoHnbruv5sI
	 hbyRE98o6Jg87/owRgIkmMq40E7rnTIw76JVlbWeh7Sp3GI7tUedKYLuC/Bl+6/BpD
	 w5HiX1PLaUQNxGowLY8cJpzfDQ0Ldh5Z5gibvqDfvev/jgDEBGk4FrsnfEKN5JZfC2
	 7RHJBmyGq7Sug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C911EC48260;
	Fri, 16 Feb 2024 23:11:10 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Subject: [PATCH BlueZ v2 00/10] Handful of build fixes and cleanups
Date: Fri, 16 Feb 2024 23:11:04 +0000
Message-Id: <20240216-hook-fixup-v2-0-a6b192d1a6ad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAInrz2UC/22MQQ7CIBBFr9LM2jFAEY2r3sN0gXUoE21pQImm4
 e5i1y7f/3lvhUSRKcG5WSFS5sRhrqB2DQzeziMh3yqDEkoLJTX6EO7o+P1a0CnTCn09ytYYqMI
 SqR5b7NJX9pyeIX62dpa/9W8mSxQoSB5OzpGVWnTjZPmxH8IEfSnlCzCBGjukAAAA
To: linux-bluetooth@vger.kernel.org
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, 
 Emil Velikov <emil.l.velikov@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1708125068; l=15367;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=+inixSoJIlsm/AfXavYZY5O2m+mkG8Tff3fFVNoC3ak=;
 b=0SklF0jwgiX9e1E+YbgWo38N9ZnRCWAdsIqUwJtFFthrXRAP+TcPKzw2XcbpI2YejUx+NqNDi
 LS255e6OZSGC9ve6jBkuf5/hWMV7v7zj6oN6ivyGF7a254cG/tl3aHH
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

Hello list,

Here are bunch of regression fixes caused by yours truly - mea culpa.

Changes in v2:
 - rework first (install-data-hooks) to per-target hooks
 - add renamed files to gitignore (rules patch)
 - introduced six extra patches
   - fix the @@ substitution in the service.in files
   - drop erroneous -fPIC
   - add org.bluez.obex.service to gitignore
   - drop duplicate -I include in obexd
   - adds all manpages to gitignore
   - moves libbluetooth public header to sub-folder

You can see the original v1 below.

- Link to v1: https://lore.kernel.org/r/20240214-hook-fixup-v1-0-0e158ffea140@gmail.com

---
Emil Velikov (10):
      build: rework {install-data,uninstall}-hook
      build: install obexd (dbus,systemd} services as needed
      build: handle relative libexecdir instances
      build: drop %.rules make rule
      build: simplify coverage handling
      build: drop explicit -fPIC from obexd CFLAGS
      gitignore: add org.bluez.obex.service
      build: obexd: remove duplicate include -I$(builddir)/lib
      gitignore: ignore all manual pages
      build: move public headers to sub-folder

 .gitignore                                | 26 +++------------
 Makefile.am                               | 53 +++++++++++++------------------
 Makefile.mesh                             |  2 +-
 Makefile.obexd                            | 17 ++++++----
 android/a2dp-sink.c                       |  2 +-
 android/a2dp.c                            |  6 ++--
 android/avctp.c                           |  2 +-
 android/avdtp.c                           |  2 +-
 android/avdtptest.c                       |  6 ++--
 android/avrcp-lib.c                       |  2 +-
 android/avrcp.c                           |  6 ++--
 android/bluetooth.c                       |  8 ++---
 android/bluetoothd-snoop.c                |  4 +--
 android/gatt.c                            |  4 +--
 android/handsfree-client.c                |  6 ++--
 android/handsfree.c                       |  6 ++--
 android/health.c                          |  8 ++---
 android/hidhost.c                         |  6 ++--
 android/ipc-tester.c                      |  2 +-
 android/main.c                            |  4 +--
 android/map-client.c                      |  6 ++--
 android/pan.c                             |  8 ++---
 android/sco.c                             |  2 +-
 android/socket.c                          |  6 ++--
 android/tester-a2dp.c                     |  2 +-
 android/tester-avrcp.c                    |  2 +-
 android/tester-gatt.c                     |  2 +-
 android/tester-hdp.c                      |  2 +-
 android/tester-hidhost.c                  |  2 +-
 android/tester-main.c                     |  2 +-
 android/tester-pan.c                      |  2 +-
 attrib/att.c                              |  2 +-
 attrib/gatt.c                             |  4 +--
 attrib/gattrib.c                          |  2 +-
 attrib/gatttool.c                         |  8 ++---
 attrib/interactive.c                      |  4 +--
 attrib/utils.c                            |  8 ++---
 btio/btio.c                               |  8 ++---
 client/mgmt.c                             | 10 +++---
 client/player.c                           |  2 +-
 configure.ac                              | 18 +++++++++++
 emulator/amp.c                            |  4 +--
 emulator/b1ee.c                           |  4 +--
 emulator/btdev.c                          |  4 +--
 emulator/bthost.c                         |  2 +-
 emulator/bthost.h                         |  2 +-
 emulator/hciemu.c                         |  4 +--
 emulator/le.c                             |  4 +--
 emulator/serial.c                         |  4 +--
 emulator/server.c                         |  4 +--
 emulator/smp.c                            |  4 +--
 emulator/vhci.c                           |  4 +--
 lib/bluetooth.c                           |  4 +--
 lib/{ => bluetooth}/bluetooth.h           |  0
 lib/{ => bluetooth}/bnep.h                |  0
 lib/{ => bluetooth}/cmtp.h                |  0
 lib/{ => bluetooth}/hci.h                 |  0
 lib/{ => bluetooth}/hci_lib.h             |  0
 lib/{ => bluetooth}/hidp.h                |  0
 lib/{ => bluetooth}/l2cap.h               |  0
 lib/{ => bluetooth}/rfcomm.h              |  0
 lib/{ => bluetooth}/sco.h                 |  0
 lib/{ => bluetooth}/sdp.h                 |  0
 lib/{ => bluetooth}/sdp_lib.h             |  0
 lib/hci.c                                 |  6 ++--
 lib/sdp.c                                 | 12 +++----
 lib/uuid.c                                |  2 +-
 mesh/bluetooth-mesh.service.in            |  2 +-
 mesh/main.c                               |  2 +-
 mesh/mesh-io-generic.c                    |  2 +-
 mesh/mesh-io-mgmt.c                       |  4 +--
 mesh/mesh-io.c                            |  2 +-
 mesh/mesh-mgmt.c                          |  2 +-
 monitor/a2dp.c                            |  2 +-
 monitor/analyze.c                         |  2 +-
 monitor/att.c                             |  6 ++--
 monitor/avctp.c                           |  2 +-
 monitor/avdtp.c                           |  2 +-
 monitor/bnep.c                            |  2 +-
 monitor/control.c                         |  4 +--
 monitor/hcidump.c                         |  6 ++--
 monitor/intel.c                           |  4 +--
 monitor/l2cap.c                           |  2 +-
 monitor/msft.c                            |  2 +-
 monitor/packet.c                          |  6 ++--
 monitor/rfcomm.c                          |  2 +-
 monitor/sdp.c                             |  2 +-
 obexd/client/bluetooth.c                  |  8 ++---
 obexd/client/map.c                        |  2 +-
 obexd/client/pbap.c                       |  4 +--
 obexd/plugins/bluetooth.c                 |  2 +-
 obexd/plugins/syncevolution.c             |  2 +-
 obexd/src/obex.service.in                 |  2 +-
 obexd/src/org.bluez.obex.service.in       |  2 +-
 peripheral/attach.c                       |  6 ++--
 peripheral/gap.c                          |  2 +-
 peripheral/gatt.c                         |  4 +--
 plugins/admin.c                           |  2 +-
 plugins/autopair.c                        |  4 +--
 plugins/hostname.c                        |  4 +--
 plugins/neard.c                           |  6 ++--
 plugins/policy.c                          |  4 +--
 plugins/sixaxis.c                         |  4 +--
 profiles/audio/a2dp.c                     |  6 ++--
 profiles/audio/avctp.c                    |  6 ++--
 profiles/audio/avdtp.c                    |  6 ++--
 profiles/audio/bap.c                      |  6 ++--
 profiles/audio/bass.c                     |  2 +-
 profiles/audio/control.c                  |  6 ++--
 profiles/audio/csip.c                     |  6 ++--
 profiles/audio/mcp.c                      |  6 ++--
 profiles/audio/media.c                    |  4 +--
 profiles/audio/micp.c                     |  6 ++--
 profiles/audio/sink.c                     |  4 +--
 profiles/audio/source.c                   |  4 +--
 profiles/audio/transport.c                |  4 +--
 profiles/audio/vcp.c                      |  6 ++--
 profiles/battery/bas.c                    |  4 +--
 profiles/battery/battery.c                |  6 ++--
 profiles/cups/hcrp.c                      |  8 ++---
 profiles/cups/main.c                      |  6 ++--
 profiles/cups/sdp.c                       |  6 ++--
 profiles/cups/spp.c                       |  8 ++---
 profiles/deviceinfo/deviceinfo.c          |  4 +--
 profiles/deviceinfo/dis.c                 |  4 +--
 profiles/gap/gas.c                        |  6 ++--
 profiles/health/hdp.c                     |  6 ++--
 profiles/health/hdp_manager.c             |  4 +--
 profiles/health/hdp_util.c                |  6 ++--
 profiles/health/mcap.c                    |  2 +-
 profiles/input/device.c                   |  8 ++---
 profiles/input/hog-lib.c                  |  4 +--
 profiles/input/hog.c                      |  4 +--
 profiles/input/manager.c                  |  6 ++--
 profiles/input/server.c                   |  4 +--
 profiles/midi/midi.c                      |  4 +--
 profiles/network/bnep.c                   |  6 ++--
 profiles/network/connection.c             |  6 ++--
 profiles/network/manager.c                |  6 ++--
 profiles/network/server.c                 |  8 ++---
 profiles/sap/manager.c                    |  4 +--
 profiles/sap/server.c                     |  4 +--
 profiles/scanparam/scan.c                 |  4 +--
 profiles/scanparam/scpp.c                 |  4 +--
 src/adapter.h                             |  4 +--
 src/adv_monitor.c                         |  2 +-
 src/advertising.c                         |  4 +--
 src/agent.c                               |  4 +--
 src/battery.c                             |  2 +-
 src/bluetooth.service.in                  |  2 +-
 src/device.c                              |  6 ++--
 src/eir.c                                 |  6 ++--
 src/eir.h                                 |  2 +-
 src/gatt-client.c                         |  4 +--
 src/gatt-database.c                       |  6 ++--
 src/log.c                                 |  4 +--
 src/main.c                                |  4 +--
 src/oui.c                                 |  2 +-
 src/plugin.c                              |  2 +-
 src/profile.c                             |  6 ++--
 src/rfkill.c                              |  4 +--
 src/sdp-client.c                          |  6 ++--
 src/sdp-xml.c                             |  4 +--
 src/sdpd-database.c                       |  6 ++--
 src/sdpd-request.c                        |  8 ++---
 src/sdpd-server.c                         |  8 ++---
 src/sdpd-service.c                        |  6 ++--
 src/service.c                             |  4 +--
 src/settings.c                            |  2 +-
 src/shared/ad.c                           |  4 +--
 src/shared/ad.h                           |  2 +-
 src/shared/att.c                          |  4 +--
 src/shared/bap.c                          |  2 +-
 src/shared/bass.c                         |  2 +-
 src/shared/btp.c                          |  2 +-
 src/shared/ccp.c                          |  4 +--
 src/shared/csip.c                         |  2 +-
 src/shared/gap.c                          |  2 +-
 src/shared/gatt-client.c                  |  2 +-
 src/shared/gatt-db.c                      |  2 +-
 src/shared/gatt-helpers.c                 |  2 +-
 src/shared/gatt-server.c                  |  2 +-
 src/shared/log.c                          |  4 +--
 src/shared/mcp.c                          |  4 +--
 src/shared/mgmt.c                         |  4 +--
 src/shared/micp.c                         |  2 +-
 src/shared/tester.c                       |  4 +--
 src/shared/util.c                         |  2 +-
 src/shared/vcp.c                          |  2 +-
 src/storage.c                             |  6 ++--
 src/uuid-helper.c                         |  6 ++--
 tools/{hid2hci.rules => 97-hid2hci.rules} |  0
 tools/advtest.c                           |  2 +-
 tools/amptest.c                           |  6 ++--
 tools/avinfo.c                            |  8 ++---
 tools/avtest.c                            | 10 +++---
 tools/bdaddr.c                            |  6 ++--
 tools/bluetooth-logger.service.in         |  2 +-
 tools/bluetooth-player.c                  |  2 +-
 tools/bnep-tester.c                       |  4 +--
 tools/bneptest.c                          |  8 ++---
 tools/btattach.c                          |  6 ++--
 tools/btgatt-client.c                     |  8 ++---
 tools/btgatt-server.c                     |  8 ++---
 tools/btiotest.c                          |  2 +-
 tools/btmon-logger.c                      |  4 +--
 tools/btpclient.c                         |  2 +-
 tools/btpclientctl.c                      |  2 +-
 tools/ciptool.c                           | 14 ++++----
 tools/cltest.c                            |  8 ++---
 tools/hciattach.c                         |  6 ++--
 tools/hciattach_ath3k.c                   |  6 ++--
 tools/hciattach_bcm43xx.c                 |  6 ++--
 tools/hciattach_intel.c                   |  6 ++--
 tools/hciattach_qualcomm.c                |  6 ++--
 tools/hciattach_st.c                      |  2 +-
 tools/hciattach_ti.c                      |  6 ++--
 tools/hciattach_tialt.c                   |  6 ++--
 tools/hciconfig.c                         |  6 ++--
 tools/hcidump.c                           |  4 +--
 tools/hcieventmask.c                      |  6 ++--
 tools/hcisecfilter.c                      |  6 ++--
 tools/hcitool.c                           |  6 ++--
 tools/hwdb.c                              |  2 +-
 tools/ioctl-tester.c                      |  6 ++--
 tools/iso-tester.c                        |  2 +-
 tools/isotest.c                           |  6 ++--
 tools/l2cap-tester.c                      |  4 +--
 tools/l2ping.c                            |  8 ++---
 tools/l2test.c                            |  8 ++---
 tools/mcaptest.c                          |  8 ++---
 tools/mesh-gatt/gatt.c                    |  2 +-
 tools/mesh-tester.c                       |  8 ++---
 tools/mesh/agent.c                        |  2 +-
 tools/meshctl.c                           |  2 +-
 tools/mgmt-tester.c                       |  8 ++---
 tools/oobtest.c                           |  2 +-
 tools/parser/hci.c                        |  4 +--
 tools/parser/l2cap.c                      |  2 +-
 tools/parser/lmp.c                        |  4 +--
 tools/parser/parser.h                     |  2 +-
 tools/rctest.c                            | 12 +++----
 tools/rfcomm-tester.c                     |  4 +--
 tools/rfcomm.c                            |  8 ++---
 tools/sco-tester.c                        |  4 +--
 tools/scotest.c                           |  4 +--
 tools/sdptool.c                           | 10 +++---
 tools/smp-tester.c                        |  4 +--
 tools/test-runner.c                       |  6 ++--
 tools/userchan-tester.c                   |  4 +--
 unit/test-avrcp.c                         |  2 +-
 unit/test-bap.c                           |  2 +-
 unit/test-bass.c                          |  2 +-
 unit/test-eir.c                           |  6 ++--
 unit/test-gatt.c                          |  2 +-
 unit/test-gattrib.c                       |  2 +-
 unit/test-hog.c                           |  2 +-
 unit/test-lib.c                           |  4 +--
 unit/test-mgmt.c                          |  2 +-
 unit/test-micp.c                          |  2 +-
 unit/test-sdp.c                           |  6 ++--
 unit/test-uuid.c                          |  2 +-
 unit/test-vcp.c                           |  2 +-
 263 files changed, 593 insertions(+), 595 deletions(-)
---
base-commit: b55d98e5cc97e4ff8c3980b84f46c84f3b1c1ee3
change-id: 20240214-hook-fixup-f26304b71366

Best regards,
-- 
Emil Velikov <emil.l.velikov@gmail.com>


