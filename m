Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF8D273264
	for <lists+linux-bluetooth@lfdr.de>; Mon, 21 Sep 2020 21:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbgIUTFU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 21 Sep 2020 15:05:20 -0400
Received: from mga02.intel.com ([134.134.136.20]:53059 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726810AbgIUTFT (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 21 Sep 2020 15:05:19 -0400
IronPort-SDR: 2sSX7VGrehh5yxl/BO9AQ5o3IrEssrnR/HPyh0neVGKsInIJqCqTOWQQnFj207CPfmMva7j+Ax
 gS42HcgrW3gQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="148118703"
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; 
   d="scan'208";a="148118703"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 12:05:14 -0700
IronPort-SDR: M2K0K9LzQiCBPVPFb8ikd8P3XuLjwWbuWREv3T2JDa/r61cN3R/V7YlwnF/bfeG1ZLktnDtwwE
 8hg0/Wws7lWA==
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; 
   d="scan'208";a="485625679"
Received: from han1-mobl3.jf.intel.com ([10.254.86.223])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2020 12:05:14 -0700
From:   tedd.an@linux.intel.com
To:     linux-bluetooth@vger.kernel.org
Cc:     Tedd Ho-Jeong An <tedd.an@intel.com>
Subject: [BlueZ V4 RESEND 08/20] lib: Add SPDX License Identifier
Date:   Mon, 21 Sep 2020 12:00:28 -0700
Message-Id: <20200921190040.45309-9-tedd.an@linux.intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200921190040.45309-1-tedd.an@linux.intel.com>
References: <20200921190040.45309-1-tedd.an@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Tedd Ho-Jeong An <tedd.an@intel.com>

This patch adds SPDX License Identifier and removes the license text.

-------------------------------------
       License            COUNT
-------------------------------------
 GPL-2.0-or-later     :     18
 GPL-2.0-only         :      1

License: GPL-2.0-or-later
   lib/sco.h
   lib/sdp.c
   lib/a2mp.h
   lib/uuid.h
   lib/bluetooth.h
   lib/hidp.h
   lib/rfcomm.h
   lib/hci.c
   lib/sdp.h
   lib/sdp_lib.h
   lib/bluetooth.c
   lib/mgmt.h
   lib/hci.h
   lib/uuid.c
   lib/l2cap.h
   lib/bnep.h
   lib/hci_lib.h
   lib/cmtp.h

License: GPL-2.0-only
   lib/amp.h
---
 lib/a2mp.h      | 15 +--------------
 lib/amp.h       | 10 +---------
 lib/bluetooth.c | 15 +--------------
 lib/bluetooth.h | 15 +--------------
 lib/bnep.h      | 15 +--------------
 lib/cmtp.h      | 15 +--------------
 lib/hci.c       | 15 +--------------
 lib/hci.h       | 15 +--------------
 lib/hci_lib.h   | 15 +--------------
 lib/hidp.h      | 15 +--------------
 lib/l2cap.h     | 15 +--------------
 lib/mgmt.h      | 15 +--------------
 lib/rfcomm.h    | 15 +--------------
 lib/sco.h       | 15 +--------------
 lib/sdp.c       | 15 +--------------
 lib/sdp.h       | 15 +--------------
 lib/sdp_lib.h   | 15 +--------------
 lib/uuid.c      | 15 +--------------
 lib/uuid.h      | 15 +--------------
 19 files changed, 19 insertions(+), 261 deletions(-)

diff --git a/lib/a2mp.h b/lib/a2mp.h
index da937d133..556b342f7 100644
--- a/lib/a2mp.h
+++ b/lib/a2mp.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -5,20 +6,6 @@
  *  Copyright (C) 2012  Intel Corporation. All rights reserved.
  *  Copyright (c) 2012  Code Aurora Forum. All rights reserved.
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __A2MP_H
diff --git a/lib/amp.h b/lib/amp.h
index 27aab1de0..8acb5ab40 100644
--- a/lib/amp.h
+++ b/lib/amp.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  *
  *	BlueZ - Bluetooth protocol stack for Linux
@@ -5,15 +6,6 @@
  *	Copyright (C) 2010-2011 Code Aurora Forum.  All rights reserved.
  *	Copyright (C) 2012 Intel Corporation.
  *
- *	This program is free software; you can redistribute it and/or modify
- *	it under the terms of the GNU General Public License version 2 and
- *	only version 2 as published by the Free Software Foundation.
- *
- *	This program is distributed in the hope that it will be useful,
- *	but WITHOUT ANY WARRANTY; without even the implied warranty of
- *	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *	GNU General Public License for more details.
- *
  */
 
 #ifndef __AMP_H
diff --git a/lib/bluetooth.c b/lib/bluetooth.c
index 5a8b57f25..0aecb50e1 100644
--- a/lib/bluetooth.c
+++ b/lib/bluetooth.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -7,20 +8,6 @@
  *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifdef HAVE_CONFIG_H
diff --git a/lib/bluetooth.h b/lib/bluetooth.h
index 4a52ecb78..1619f5f08 100644
--- a/lib/bluetooth.h
+++ b/lib/bluetooth.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -7,20 +8,6 @@
  *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __BLUETOOTH_H
diff --git a/lib/bnep.h b/lib/bnep.h
index e7c2c87cf..a0d39058c 100644
--- a/lib/bnep.h
+++ b/lib/bnep.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -6,20 +7,6 @@
  *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __BNEP_H
diff --git a/lib/cmtp.h b/lib/cmtp.h
index ce937bd0d..7ba8bfc3b 100644
--- a/lib/cmtp.h
+++ b/lib/cmtp.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -5,20 +6,6 @@
  *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __CMTP_H
diff --git a/lib/hci.c b/lib/hci.c
index 9960c4490..4bd33f241 100644
--- a/lib/hci.c
+++ b/lib/hci.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -7,20 +8,6 @@
  *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifdef HAVE_CONFIG_H
diff --git a/lib/hci.h b/lib/hci.h
index 232d5bd9e..0ca20421a 100644
--- a/lib/hci.h
+++ b/lib/hci.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -7,20 +8,6 @@
  *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __HCI_H
diff --git a/lib/hci_lib.h b/lib/hci_lib.h
index 55aeb1760..6b1a548b5 100644
--- a/lib/hci_lib.h
+++ b/lib/hci_lib.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -7,20 +8,6 @@
  *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __HCI_LIB_H
diff --git a/lib/hidp.h b/lib/hidp.h
index c5e6a7808..da42a1b9e 100644
--- a/lib/hidp.h
+++ b/lib/hidp.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -5,20 +6,6 @@
  *  Copyright (C) 2003-2010  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __HIDP_H
diff --git a/lib/l2cap.h b/lib/l2cap.h
index 5ce94c4ee..9197800df 100644
--- a/lib/l2cap.h
+++ b/lib/l2cap.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -8,20 +9,6 @@
  *  Copyright (c) 2012       Code Aurora Forum. All rights reserved.
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __L2CAP_H
diff --git a/lib/mgmt.h b/lib/mgmt.h
index 46d894ae9..6aa0f5f88 100644
--- a/lib/mgmt.h
+++ b/lib/mgmt.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *  BlueZ - Bluetooth protocol stack for Linux
  *
@@ -5,20 +6,6 @@
  *  Copyright (C) 2010  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __packed
diff --git a/lib/rfcomm.h b/lib/rfcomm.h
index ad6c0e1c3..0347ddc36 100644
--- a/lib/rfcomm.h
+++ b/lib/rfcomm.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -6,20 +7,6 @@
  *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __RFCOMM_H
diff --git a/lib/sco.h b/lib/sco.h
index 75336a50e..307d81f81 100644
--- a/lib/sco.h
+++ b/lib/sco.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -6,20 +7,6 @@
  *  Copyright (C) 2002-2010  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __SCO_H
diff --git a/lib/sdp.c b/lib/sdp.c
index 84311eda1..532039a23 100644
--- a/lib/sdp.c
+++ b/lib/sdp.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -8,20 +9,6 @@
  *  Copyright (C) 2002-2003  Stephen Crane <steve.crane@rococosoft.com>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifdef HAVE_CONFIG_H
diff --git a/lib/sdp.h b/lib/sdp.h
index f586eb5eb..6f05d4321 100644
--- a/lib/sdp.h
+++ b/lib/sdp.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -8,20 +9,6 @@
  *  Copyright (C) 2002-2003  Stephen Crane <steve.crane@rococosoft.com>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __SDP_H
diff --git a/lib/sdp_lib.h b/lib/sdp_lib.h
index 3ded3934c..22776b678 100644
--- a/lib/sdp_lib.h
+++ b/lib/sdp_lib.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -8,20 +9,6 @@
  *  Copyright (C) 2002-2003  Stephen Crane <steve.crane@rococosoft.com>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __SDP_LIB_H
diff --git a/lib/uuid.c b/lib/uuid.c
index d4c7002f5..a09321dc6 100644
--- a/lib/uuid.c
+++ b/lib/uuid.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -6,20 +7,6 @@
  *  Copyright (C) 2011  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifdef HAVE_CONFIG_H
diff --git a/lib/uuid.h b/lib/uuid.h
index c7e6269f1..1a4029b68 100644
--- a/lib/uuid.h
+++ b/lib/uuid.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *
  *  BlueZ - Bluetooth protocol stack for Linux
@@ -6,20 +7,6 @@
  *  Copyright (C) 2011  Marcel Holtmann <marcel@holtmann.org>
  *
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  You should have received a copy of the GNU General Public License
- *  along with this program; if not, write to the Free Software
- *  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
- *
  */
 
 #ifndef __BLUETOOTH_UUID_H
-- 
2.25.4

