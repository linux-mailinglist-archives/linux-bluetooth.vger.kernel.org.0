Return-Path: <linux-bluetooth+bounces-1791-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC58851E46
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Feb 2024 21:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24F0AB22B46
	for <lists+linux-bluetooth@lfdr.de>; Mon, 12 Feb 2024 20:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED310482C5;
	Mon, 12 Feb 2024 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Satvrb4q"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F8F47A7A
	for <linux-bluetooth@vger.kernel.org>; Mon, 12 Feb 2024 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707768160; cv=none; b=oEr13EHzMACQjCBI9zruWLFQvT96Nm1z6mpo14ctJ4QZBafn5+cNkk8dxPEYrWIJWnO7ybeDxEvFWYICtSpmA7fNdDUIvmgTmnQh8sJnOZMpIai356MfXwWigOndvxaAvZTXzgo5FUciOnh2uCz4nf0oYWOJfzSx+HRfk0saPC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707768160; c=relaxed/simple;
	bh=1OPZ/5XW++En0wH5bNH3Z2ADx3hGwLDcweiaE+aUSsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RpOZPV9DYXQ18s4bjNNyM8TndX2AtEbiXtVrPkCHrFra7aFzb2SkESYTle3zizI3KyiH44fvX0LtEdAepp9k/LR8KqAwShT4arpVeBB/TeHNOxdMrQXFpw6c72BwdBQhQqPLXVc0HVKAu8tCYkSWvEeIhf+7dDlE92fKpR0biOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Satvrb4q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3630C43394;
	Mon, 12 Feb 2024 20:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707768159;
	bh=1OPZ/5XW++En0wH5bNH3Z2ADx3hGwLDcweiaE+aUSsQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Satvrb4qeZuqDCWv9TKlyI9V8yy9G43AYLQMxRDOQrtxE8OzW9mjC7fTeo/G5Xbmx
	 osu+ai5zrcx87ruEL4ouOKp/SXnZw+Z2kwZ4G5581N/6AQD6dV5Fl2DgxrQSoXLoy+
	 mA4Vn4w2dceynSk8f5mgpNU5S13ifSRNlyv5XU7jXxTK0OrotkSa9JqhbWb2BUnvYg
	 cirD3Shn4C1pxMehr6eBCrI8t5QQ7D35PbQW7ux4+z/6P4jQDNgI9jIp/f38Vf4bwm
	 FWkyZ3H7S94EQWHxoWv4LKB06NHCKOtE8YaXa1Rczbgqj7xMOmqF8OJN5J+7i3CMjm
	 RB6QGN2o5cMkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1C7C48BC1;
	Mon, 12 Feb 2024 20:02:39 +0000 (UTC)
From: Emil Velikov via B4 Relay <devnull+emil.l.velikov.gmail.com@kernel.org>
Date: Mon, 12 Feb 2024 20:02:39 +0000
Subject: [PATCH BlueZ v2 03/10] test: consistently use /usr/bin/env python3
 shebang
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240212-disto-patches-v2-3-8bab1bd08f4d@gmail.com>
References: <20240212-disto-patches-v2-0-8bab1bd08f4d@gmail.com>
In-Reply-To: <20240212-disto-patches-v2-0-8bab1bd08f4d@gmail.com>
To: linux-bluetooth@vger.kernel.org
Cc: Emil Velikov <emil.velikov@collabora.com>, 
 Nobuhiro Iwamatsu <iwamatsu@debian.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707768157; l=11465;
 i=emil.l.velikov@gmail.com; s=20230301; h=from:subject:message-id;
 bh=+WWRygO/gm5zKypQF1yrIhTAW2dn4f6SmY7sNODBkm4=;
 b=FRnb+yxWhNF0gUR7wz4at7VzCTwpRqI2fIyju98V++vPxihYK/9YJB55fqzO0QarqCuOVARN5
 Vbu3vmeJpOHAllkpo9wUsOHXV0Xl7pniv7ZpREx26yPcJg23cMf5feE
X-Developer-Key: i=emil.l.velikov@gmail.com; a=ed25519;
 pk=qeUTVTNyI3rcR2CfNNWsloTihgzmtbZo98GdxwZKCkY=
X-Endpoint-Received:
 by B4 Relay for emil.l.velikov@gmail.com/20230301 with auth_id=35
X-Original-From: Emil Velikov <emil.l.velikov@gmail.com>
Reply-To: <emil.l.velikov@gmail.com>

From: Emil Velikov <emil.velikov@collabora.com>

Currently we have a mix of /usr/bin/python, /usr/bin/python3 and
/usr/bin/env python3. Use the latter since is the more common way of
handling this, plus it allows people to override the system python (for
what ever reason).

Inspired by a Debian patch, doing a mass /usr/bin/python{,3} conversion.

Cc: Nobuhiro Iwamatsu <iwamatsu@debian.org>
---
 test/agent.py                | 2 +-
 test/example-adv-monitor     | 2 +-
 test/example-advertisement   | 2 +-
 test/example-endpoint        | 2 +-
 test/example-player          | 2 +-
 test/exchange-business-cards | 2 +-
 test/ftp-client              | 2 +-
 test/get-managed-objects     | 2 +-
 test/get-obex-capabilities   | 2 +-
 test/list-devices            | 2 +-
 test/list-folders            | 2 +-
 test/map-client              | 2 +-
 test/monitor-bluetooth       | 2 +-
 test/opp-client              | 2 +-
 test/pbap-client             | 2 +-
 test/simple-agent            | 2 +-
 test/simple-endpoint         | 2 +-
 test/simple-obex-agent       | 2 +-
 test/simple-player           | 2 +-
 test/test-adapter            | 2 +-
 test/test-device             | 2 +-
 test/test-discovery          | 2 +-
 test/test-gatt-profile       | 2 +-
 test/test-health             | 2 +-
 test/test-health-sink        | 2 +-
 test/test-hfp                | 2 +-
 test/test-manager            | 2 +-
 test/test-nap                | 2 +-
 test/test-network            | 2 +-
 test/test-profile            | 2 +-
 test/test-sap-server         | 2 +-
 31 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/test/agent.py b/test/agent.py
index 57a74183d..450fb20a3 100755
--- a/test/agent.py
+++ b/test/agent.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 import sys
diff --git a/test/example-adv-monitor b/test/example-adv-monitor
index a405fc7b0..09888a973 100644
--- a/test/example-adv-monitor
+++ b/test/example-adv-monitor
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 import argparse
diff --git a/test/example-advertisement b/test/example-advertisement
index 5f022ee67..910701220 100755
--- a/test/example-advertisement
+++ b/test/example-advertisement
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import print_function
diff --git a/test/example-endpoint b/test/example-endpoint
index 16651c683..cb5ac2ae9 100644
--- a/test/example-endpoint
+++ b/test/example-endpoint
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/example-player b/test/example-player
index 167460bad..9d56b4a13 100644
--- a/test/example-player
+++ b/test/example-player
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import print_function
diff --git a/test/exchange-business-cards b/test/exchange-business-cards
index 9a3aa29fb..12d513362 100755
--- a/test/exchange-business-cards
+++ b/test/exchange-business-cards
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 import sys
diff --git a/test/ftp-client b/test/ftp-client
index ef756ab2b..e37c027f4 100755
--- a/test/ftp-client
+++ b/test/ftp-client
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/get-managed-objects b/test/get-managed-objects
index 5125ee524..7ad359db4 100755
--- a/test/get-managed-objects
+++ b/test/get-managed-objects
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/get-obex-capabilities b/test/get-obex-capabilities
index a7980a442..25a996e18 100755
--- a/test/get-obex-capabilities
+++ b/test/get-obex-capabilities
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 import sys
diff --git a/test/list-devices b/test/list-devices
index 618d2867b..a24c31c7d 100755
--- a/test/list-devices
+++ b/test/list-devices
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/list-folders b/test/list-folders
index b4e3f100b..414bb367b 100755
--- a/test/list-folders
+++ b/test/list-folders
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 import sys
diff --git a/test/map-client b/test/map-client
index f44f512bd..b7369b068 100755
--- a/test/map-client
+++ b/test/map-client
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/monitor-bluetooth b/test/monitor-bluetooth
index 99f3c857c..347c91ac3 100755
--- a/test/monitor-bluetooth
+++ b/test/monitor-bluetooth
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/opp-client b/test/opp-client
index 4f00a41c0..deb02c77c 100755
--- a/test/opp-client
+++ b/test/opp-client
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/pbap-client b/test/pbap-client
index e6cafdd30..6dada4a11 100755
--- a/test/pbap-client
+++ b/test/pbap-client
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/simple-agent b/test/simple-agent
index 4fdaff1eb..09437eb22 100755
--- a/test/simple-agent
+++ b/test/simple-agent
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/simple-endpoint b/test/simple-endpoint
index 463f124d1..eace4286d 100755
--- a/test/simple-endpoint
+++ b/test/simple-endpoint
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/simple-obex-agent b/test/simple-obex-agent
index 064f6d30b..65807bff3 100755
--- a/test/simple-obex-agent
+++ b/test/simple-obex-agent
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/simple-player b/test/simple-player
index 7bad3d14f..190e047e2 100755
--- a/test/simple-player
+++ b/test/simple-player
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import print_function
diff --git a/test/test-adapter b/test/test-adapter
index c56ba9577..27aff27b5 100755
--- a/test/test-adapter
+++ b/test/test-adapter
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/test-device b/test/test-device
index c840f0565..8b1eb86d1 100755
--- a/test/test-device
+++ b/test/test-device
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/test-discovery b/test/test-discovery
index 54fc51403..6959e7be9 100755
--- a/test/test-discovery
+++ b/test/test-discovery
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/test-gatt-profile b/test/test-gatt-profile
index a973ae14e..64ff3e5f9 100755
--- a/test/test-gatt-profile
+++ b/test/test-gatt-profile
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/test-health b/test/test-health
index 3e16c415d..f26def906 100755
--- a/test/test-health
+++ b/test/test-health
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/test-health-sink b/test/test-health-sink
index 13b9a6b04..fcdc58e3d 100755
--- a/test/test-health-sink
+++ b/test/test-health-sink
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/test-hfp b/test/test-hfp
index 11e328e54..e1edac0aa 100755
--- a/test/test-hfp
+++ b/test/test-hfp
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/test-manager b/test/test-manager
index 3fa7205a0..a93819e27 100755
--- a/test/test-manager
+++ b/test/test-manager
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/test-nap b/test/test-nap
index d5c757b79..76cde74d4 100755
--- a/test/test-nap
+++ b/test/test-nap
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/test-network b/test/test-network
index acc7dff65..67be86106 100755
--- a/test/test-network
+++ b/test/test-network
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/test-profile b/test/test-profile
index af1e23f76..7d92f390e 100755
--- a/test/test-profile
+++ b/test/test-profile
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals
diff --git a/test/test-sap-server b/test/test-sap-server
index ddb1efe9b..161a4bfec 100755
--- a/test/test-sap-server
+++ b/test/test-sap-server
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 # SPDX-License-Identifier: LGPL-2.1-or-later
 
 from __future__ import absolute_import, print_function, unicode_literals

-- 
2.43.0


