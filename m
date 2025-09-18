Return-Path: <linux-bluetooth+bounces-14575-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C037B21475
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Aug 2025 20:33:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15DD5625EB4
	for <lists+linux-bluetooth@lfdr.de>; Mon, 11 Aug 2025 18:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A549C2E2831;
	Mon, 11 Aug 2025 18:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="bIqbfG7t"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79562277026
	for <linux-bluetooth@vger.kernel.org>; Mon, 11 Aug 2025 18:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754937172; cv=pass; b=Wn8Kgz+HrrB1UfJLWedRyO04HL7o1mpgg1cXLwJdvtimAoZpPcy0P6oqI7xCEPiIE6C+kN3tExHTGK9pebFwxbCT7IDor3wqjJDkK8w85QFKp6pfEnQ6aTNzVjkI22BfJw557+Y26hqVEoBV1e3B0QmPTSXhAZ6FIhCLi/gr3Jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754937172; c=relaxed/simple;
	bh=oGWjILMnmNTIAPpoaQ5d7gW9VVdqaoMtJy33UWN8ZNc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JL0QpLSxHvZzhXr2Ko7UO35w8uTYl+XCXmFz93aNX68Y2p/m76eOaHXLtviaaoIxk86Sop4N4DVAr7sOpSY+6D0E+NHJ1IvUqktB+aoK5sQSWB7M1Bfa/gxreZYjn2pEx8W7xGka7qMaYtEmAKHGpDa5252ccVwe0k3eRPr44w0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=bIqbfG7t; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from [192.168.1.195] (unknown [IPv6:2a02:ed04:3581:4::d001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pav@iki.fi)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4c13CZ2mBVz49Q51;
	Mon, 11 Aug 2025 21:32:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1754937162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XBzA6oOvcHnxnHckwzKk+PxMCoOieDMBmvcJcOGz2HA=;
	b=bIqbfG7tuO6bEX5Qhjf4r52hCwkYXlTdZec3ADNT2QF7aM4kfuWE6GORtGTne5OlxzUZ6d
	ig7cUZ14DaM9UtNWT7Ej7zEf/GQJICuLgR+rYiO2keZ7cWKcelHs3P609TIviikx0iW0hK
	ZyXdNk/vNwwH6dx/0uBekyNp+ZxIu0Uht83x7QTpvC2sLnUUs6MbGL4xgOOiShOfMhTqwZ
	F2+IEmUBNK9XtDudNUlBZTXEy6KmatXw2Pcih0vRz6rhX4Als3uUZGwpJiKR4wsyzJQx/y
	/vGLVR2S0xLnldyPciZlbW6vssw9s6LsEPirr7zvRgYIal70jb07MaP7mi/I9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1754937162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XBzA6oOvcHnxnHckwzKk+PxMCoOieDMBmvcJcOGz2HA=;
	b=s3cEkUh4k8IXdExZ7AYKOZXACK+uPZ624FFiNy/CSAWX9OnfrUmir/Mbm+fk1ZWPaWEfg5
	30FMrBPAtL5p6dKV7jHtc4X5ZcQaf50N7v5HZ9NONIoyY7XkueLtm25ZnnwtcB3KwV7hWa
	7WSQhwOYkSwB0YXpU0kj0+qDjFN8pFN/b5pwyvINxr4dMELu/LJOVvzXAo4Gm+nAl7R+dH
	klOpovAoAFq3PO8B71nYgw2vqanP6KcWoRa2ftWAC+VT1ESPL7LKJdG/3EGvbAqTSKMm8x
	uFUWCoxPSerjGSffm13QlupnyV1ts+Eq62kO2b12rIeAyi3jk6GMLZ93dFMgRA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pav@iki.fi smtp.mailfrom=pav@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1754937162; a=rsa-sha256;
	cv=none;
	b=kEuKzj7fZETHUpWfRilKqVf8rU39sPPtjsr6YuvWp+Z2p17U+JMlSlremNcBDLrw/3eIQs
	jONt7HK8gAhCMI7SPoQ2aZhlW/tB32Un+yiTHY+KuYTo9xb1Z4cpYKgDiPICSfEKJmVMeo
	umGNMIaDjIFHM123K40R4PQ5tqjmzRYT4ktiCCQ77ZgfuxU8A0210UZobT/NBkf0s9fMsX
	/KIurc/eybtamf+W5N01IwfIcb3OGkLUXhqDf3khca6aq5vbjj2CoRx+CKFvgnJyoBj/b3
	8VAh788mLW96Ka4De1AAn/GR80/ymcE85ux18kTlv9thsoJFAi41dnZa/5Z0ZA==
Message-ID: <68d65188df23473fc004bcaa492ad861bdcd8625.camel@iki.fi>
Subject: Re: [PATCH BlueZ v2 0/3] Prepare for meson build system
From: Pauli Virtanen <pav@iki.fi>
To: Bastien Nocera <hadess@hadess.net>, linux-bluetooth@vger.kernel.org
Date: Mon, 11 Aug 2025 21:32:41 +0300
In-Reply-To: <20250807155115.1037982-1-hadess@hadess.net>
References: <20250807155115.1037982-1-hadess@hadess.net>
Autocrypt: addr=pav@iki.fi; prefer-encrypt=mutual;
 keydata=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
 bzyGkKh2h8XdrYhtDjw9LmrprPQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

The build seems to break on Fedora 41 VM, although it works on=C2=A0
Fedora 42,

./bootstrap && ./configure && make -j12

lib/bluetooth/bluetooth.c:26:10: fatal error bluetooth.h: No such file or d=
irectory
  26 | #include "bluetooth.h"
     |          ^~~~~~~~~~~~~

Not sure why it's not setting include paths correctly.


to, 2025-08-07 kello 17:50 +0200, Bastien Nocera kirjoitti:
> Changes since v1:
> - Fixed make distcheck
>=20
> Bastien Nocera (3):
>   build: Move library source to lib/bluetooth
>   client: Fix missing strdup/memset declarations
>   mesh: Fix 'buf=E2=80=99 may be used uninitialized warning
>=20
>  .gitignore                       |  1 -
>  Makefile.am                      | 25 ++++++++-----------------
>  attrib/att.c                     |  4 ++--
>  attrib/gatt.c                    |  6 +++---
>  attrib/gattrib.c                 |  4 ++--
>  attrib/gatttool.c                | 10 +++++-----
>  attrib/interactive.c             |  6 +++---
>  attrib/utils.c                   | 10 +++++-----
>  btio/btio.c                      | 10 +++++-----
>  client/assistant.c               |  4 ++--
>  client/display.c                 |  1 +
>  client/mgmt.c                    | 14 +++++++-------
>  client/player.c                  |  6 +++---
>  emulator/b1ee.c                  |  4 ++--
>  emulator/btdev.c                 |  4 ++--
>  emulator/bthost.c                |  2 +-
>  emulator/bthost.h                |  2 +-
>  emulator/hciemu.c                |  4 ++--
>  emulator/le.c                    |  4 ++--
>  emulator/serial.c                |  4 ++--
>  emulator/server.c                |  4 ++--
>  emulator/smp.c                   |  4 ++--
>  emulator/vhci.c                  |  4 ++--
>  lib/{ =3D> bluetooth}/bluetooth.c  |  0
>  lib/{ =3D> bluetooth}/bluetooth.h  |  0
>  lib/{ =3D> bluetooth}/bnep.h       |  0
>  lib/{ =3D> bluetooth}/cmtp.h       |  0
>  lib/{ =3D> bluetooth}/hci.c        |  0
>  lib/{ =3D> bluetooth}/hci.h        |  0
>  lib/{ =3D> bluetooth}/hci_lib.h    |  0
>  lib/{ =3D> bluetooth}/hidp.h       |  0
>  lib/{ =3D> bluetooth}/iso.h        |  0
>  lib/{ =3D> bluetooth}/l2cap.h      |  0
>  lib/{ =3D> bluetooth}/mgmt.h       |  0
>  lib/{ =3D> bluetooth}/rfcomm.h     |  0
>  lib/{ =3D> bluetooth}/sco.h        |  0
>  lib/{ =3D> bluetooth}/sdp.c        |  0
>  lib/{ =3D> bluetooth}/sdp.h        |  0
>  lib/{ =3D> bluetooth}/sdp_lib.h    |  0
>  lib/{ =3D> bluetooth}/uuid.c       |  2 +-
>  lib/{ =3D> bluetooth}/uuid.h       |  0
>  mesh/main.c                      |  4 ++--
>  mesh/mesh-io-generic.c           |  4 ++--
>  mesh/mesh-io-mgmt.c              |  6 +++---
>  mesh/mesh-io.c                   |  4 ++--
>  mesh/mesh-mgmt.c                 |  4 ++--
>  monitor/a2dp.c                   |  2 +-
>  monitor/analyze.c                |  2 +-
>  monitor/att.c                    |  8 ++++----
>  monitor/avctp.c                  |  4 ++--
>  monitor/avdtp.c                  |  2 +-
>  monitor/bnep.c                   |  4 ++--
>  monitor/control.c                |  6 +++---
>  monitor/hcidump.c                |  6 +++---
>  monitor/intel.c                  |  4 ++--
>  monitor/l2cap.c                  |  4 ++--
>  monitor/msft.c                   |  4 ++--
>  monitor/packet.c                 |  8 ++++----
>  monitor/rfcomm.c                 |  4 ++--
>  monitor/sdp.c                    |  4 ++--
>  obexd/client/bluetooth.c         |  8 ++++----
>  obexd/client/map.c               |  2 +-
>  obexd/client/pbap.c              |  4 ++--
>  obexd/plugins/bluetooth.c        |  4 ++--
>  obexd/plugins/syncevolution.c    |  2 +-
>  peripheral/attach.c              |  6 +++---
>  peripheral/gap.c                 |  4 ++--
>  peripheral/gatt.c                |  6 +++---
>  plugins/admin.c                  |  4 ++--
>  plugins/autopair.c               |  4 ++--
>  plugins/hostname.c               |  4 ++--
>  plugins/neard.c                  |  6 +++---
>  plugins/policy.c                 |  8 ++++----
>  plugins/sixaxis.c                |  6 +++---
>  profiles/audio/a2dp.c            |  8 ++++----
>  profiles/audio/asha.c            |  6 +++---
>  profiles/audio/avctp.c           |  8 ++++----
>  profiles/audio/avdtp.c           |  8 ++++----
>  profiles/audio/avrcp.c           |  2 +-
>  profiles/audio/bap.c             | 10 +++++-----
>  profiles/audio/bass.c            |  6 +++---
>  profiles/audio/ccp.c             |  8 ++++----
>  profiles/audio/control.c         |  8 ++++----
>  profiles/audio/csip.c            |  8 ++++----
>  profiles/audio/mcp.c             |  8 ++++----
>  profiles/audio/media.c           |  8 ++++----
>  profiles/audio/micp.c            |  8 ++++----
>  profiles/audio/sink.c            |  4 ++--
>  profiles/audio/source.c          |  4 ++--
>  profiles/audio/transport.c       |  6 +++---
>  profiles/audio/vcp.c             |  8 ++++----
>  profiles/battery/bas.c           |  6 +++---
>  profiles/battery/battery.c       |  8 ++++----
>  profiles/cups/hcrp.c             |  8 ++++----
>  profiles/cups/main.c             |  6 +++---
>  profiles/cups/sdp.c              |  6 +++---
>  profiles/cups/spp.c              |  8 ++++----
>  profiles/deviceinfo/deviceinfo.c |  6 +++---
>  profiles/deviceinfo/dis.c        |  6 +++---
>  profiles/gap/gas.c               |  8 ++++----
>  profiles/health/hdp.c            |  6 +++---
>  profiles/health/hdp_manager.c    |  6 +++---
>  profiles/health/hdp_util.c       |  8 ++++----
>  profiles/health/mcap.c           |  2 +-
>  profiles/input/device.c          | 10 +++++-----
>  profiles/input/hog-lib.c         |  6 +++---
>  profiles/input/hog.c             |  6 +++---
>  profiles/input/manager.c         |  8 ++++----
>  profiles/input/server.c          |  6 +++---
>  profiles/midi/midi.c             |  6 +++---
>  profiles/network/bnep.c          |  8 ++++----
>  profiles/network/connection.c    |  8 ++++----
>  profiles/network/manager.c       |  8 ++++----
>  profiles/network/server.c        | 10 +++++-----
>  profiles/sap/manager.c           |  4 ++--
>  profiles/sap/server.c            |  6 +++---
>  profiles/scanparam/scan.c        |  6 +++---
>  profiles/scanparam/scpp.c        |  6 +++---
>  src/adapter.c                    |  4 ++--
>  src/adapter.h                    |  4 ++--
>  src/adv_monitor.c                |  4 ++--
>  src/advertising.c                |  6 +++---
>  src/agent.c                      |  4 ++--
>  src/battery.c                    |  2 +-
>  src/bearer.c                     |  4 ++--
>  src/device.c                     | 10 +++++-----
>  src/eir.c                        |  6 +++---
>  src/eir.h                        |  4 ++--
>  src/gatt-client.c                |  6 +++---
>  src/gatt-database.c              | 10 +++++-----
>  src/log.c                        |  4 ++--
>  src/main.c                       |  6 +++---
>  src/oui.c                        |  2 +-
>  src/plugin.c                     |  2 +-
>  src/profile.c                    |  8 ++++----
>  src/rfkill.c                     |  4 ++--
>  src/sdp-client.c                 |  6 +++---
>  src/sdp-xml.c                    |  4 ++--
>  src/sdpd-database.c              |  6 +++---
>  src/sdpd-request.c               |  8 ++++----
>  src/sdpd-server.c                |  8 ++++----
>  src/sdpd-service.c               |  6 +++---
>  src/service.c                    |  4 ++--
>  src/settings.c                   |  4 ++--
>  src/shared/ad.c                  |  4 ++--
>  src/shared/ad.h                  |  4 ++--
>  src/shared/asha.c                |  4 ++--
>  src/shared/att.c                 |  6 +++---
>  src/shared/bap.c                 |  4 ++--
>  src/shared/bass.c                |  4 ++--
>  src/shared/btp.c                 |  2 +-
>  src/shared/ccp.c                 |  6 +++---
>  src/shared/csip.c                |  4 ++--
>  src/shared/gap.c                 |  4 ++--
>  src/shared/gatt-client.c         |  4 ++--
>  src/shared/gatt-db.c             |  4 ++--
>  src/shared/gatt-helpers.c        |  4 ++--
>  src/shared/gatt-server.c         |  4 ++--
>  src/shared/log.c                 |  4 ++--
>  src/shared/mcp.c                 |  6 +++---
>  src/shared/mgmt.c                |  6 +++---
>  src/shared/micp.c                |  4 ++--
>  src/shared/tester.c              |  4 ++--
>  src/shared/util.c                |  2 +-
>  src/shared/vcp.c                 |  4 ++--
>  src/storage.c                    |  8 ++++----
>  src/uuid-helper.c                |  6 +++---
>  tools/advtest.c                  |  4 ++--
>  tools/avinfo.c                   |  8 ++++----
>  tools/avtest.c                   | 10 +++++-----
>  tools/bdaddr.c                   |  6 +++---
>  tools/bluetooth-player.c         |  4 ++--
>  tools/bnep-tester.c              |  6 +++---
>  tools/bneptest.c                 |  8 ++++----
>  tools/btattach.c                 |  6 +++---
>  tools/btgatt-client.c            | 10 +++++-----
>  tools/btgatt-server.c            | 10 +++++-----
>  tools/btiotest.c                 |  2 +-
>  tools/btmon-logger.c             |  4 ++--
>  tools/btpclient.c                |  2 +-
>  tools/btpclientctl.c             |  2 +-
>  tools/ciptool.c                  | 14 +++++++-------
>  tools/cltest.c                   |  8 ++++----
>  tools/hciattach.c                |  6 +++---
>  tools/hciattach_ath3k.c          |  6 +++---
>  tools/hciattach_bcm43xx.c        |  6 +++---
>  tools/hciattach_intel.c          |  6 +++---
>  tools/hciattach_qualcomm.c       |  6 +++---
>  tools/hciattach_st.c             |  2 +-
>  tools/hciattach_ti.c             |  6 +++---
>  tools/hciattach_tialt.c          |  6 +++---
>  tools/hciconfig.c                |  6 +++---
>  tools/hcidump.c                  |  4 ++--
>  tools/hcieventmask.c             |  6 +++---
>  tools/hcisecfilter.c             |  6 +++---
>  tools/hcitool.c                  |  6 +++---
>  tools/hwdb.c                     |  2 +-
>  tools/ioctl-tester.c             |  8 ++++----
>  tools/iso-tester.c               |  8 ++++----
>  tools/isotest.c                  | 10 +++++-----
>  tools/l2cap-tester.c             |  6 +++---
>  tools/l2ping.c                   |  8 ++++----
>  tools/l2test.c                   |  8 ++++----
>  tools/mcaptest.c                 |  8 ++++----
>  tools/mesh-gatt/gatt.c           |  4 ++--
>  tools/mesh-tester.c              | 10 +++++-----
>  tools/mesh/agent.c               |  4 ++--
>  tools/meshctl.c                  |  4 ++--
>  tools/mgmt-tester.c              | 10 +++++-----
>  tools/oobtest.c                  |  4 ++--
>  tools/parser/hci.c               |  4 ++--
>  tools/parser/l2cap.c             |  2 +-
>  tools/parser/lmp.c               |  4 ++--
>  tools/parser/parser.h            |  2 +-
>  tools/rctest.c                   | 12 ++++++------
>  tools/rfcomm-tester.c            |  6 +++---
>  tools/rfcomm.c                   |  8 ++++----
>  tools/sco-tester.c               |  6 +++---
>  tools/scotest.c                  |  4 ++--
>  tools/sdptool.c                  | 10 +++++-----
>  tools/smp-tester.c               |  6 +++---
>  tools/test-runner.c              |  6 +++---
>  tools/userchan-tester.c          |  6 +++---
>  unit/avctp.c                     |  2 +-
>  unit/avdtp.c                     |  2 +-
>  unit/avrcp-lib.c                 |  2 +-
>  unit/avrcp.c                     |  6 +++---
>  unit/test-avrcp.c                |  2 +-
>  unit/test-bap.c                  |  4 ++--
>  unit/test-bass.c                 |  4 ++--
>  unit/test-eir.c                  |  6 +++---
>  unit/test-gatt.c                 |  4 ++--
>  unit/test-gattrib.c              |  4 ++--
>  unit/test-hog.c                  |  4 ++--
>  unit/test-lib.c                  |  4 ++--
>  unit/test-mgmt.c                 |  4 ++--
>  unit/test-micp.c                 |  4 ++--
>  unit/test-sdp.c                  |  6 +++---
>  unit/test-uuid.c                 |  4 ++--
>  unit/test-vcp.c                  |  4 ++--
>  240 files changed, 616 insertions(+), 625 deletions(-)
>  rename lib/{ =3D> bluetooth}/bluetooth.c (100%)
>  rename lib/{ =3D> bluetooth}/bluetooth.h (100%)
>  rename lib/{ =3D> bluetooth}/bnep.h (100%)
>  rename lib/{ =3D> bluetooth}/cmtp.h (100%)
>  rename lib/{ =3D> bluetooth}/hci.c (100%)
>  rename lib/{ =3D> bluetooth}/hci.h (100%)
>  rename lib/{ =3D> bluetooth}/hci_lib.h (100%)
>  rename lib/{ =3D> bluetooth}/hidp.h (100%)
>  rename lib/{ =3D> bluetooth}/iso.h (100%)
>  rename lib/{ =3D> bluetooth}/l2cap.h (100%)
>  rename lib/{ =3D> bluetooth}/mgmt.h (100%)
>  rename lib/{ =3D> bluetooth}/rfcomm.h (100%)
>  rename lib/{ =3D> bluetooth}/sco.h (100%)
>  rename lib/{ =3D> bluetooth}/sdp.c (100%)
>  rename lib/{ =3D> bluetooth}/sdp.h (100%)
>  rename lib/{ =3D> bluetooth}/sdp_lib.h (100%)
>  rename lib/{ =3D> bluetooth}/uuid.c (99%)
>  rename lib/{ =3D> bluetooth}/uuid.h (100%)

