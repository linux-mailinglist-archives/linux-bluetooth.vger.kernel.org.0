Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9574595B2
	for <lists+linux-bluetooth@lfdr.de>; Mon, 22 Nov 2021 20:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240097AbhKVTp2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 22 Nov 2021 14:45:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234367AbhKVTp1 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 22 Nov 2021 14:45:27 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F9EC061574
        for <linux-bluetooth@vger.kernel.org>; Mon, 22 Nov 2021 11:42:20 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so804281pjb.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 22 Nov 2021 11:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8MjMMiZ1jmjs4HZn/TcZi0919cYJiEGaZB5hFiAws4=;
        b=nTjm6bPmC8oyN7boTO6GcNZpFH1L9iLqzo7YBum+BynYuvLHpHiCGGc19wxFXgdXmj
         KCKv4HsQ3XwxW/6M2scm2kbzq7sUEgy24vn0239iQaRcqo7G6GME67KpYFe0v08RENYI
         C0IFbA5kisB1pUo33An6/xkrbXWSlyjIsa5o+tTpWRRypHKUAiHBMYISnKhu29OvVB5y
         BNbi5vgtzRt/7rTQGA1Zs4yAzoGs694KN4U3LyS9MTDW/l/mwUsCj/yeA/qAyEIAmLNw
         U/vlMSL0G7LqMQDNvBPePBqpNow8iFzYKgSzabsebhb4PzpTjjQh9gs72paBVzcUWEUs
         vLGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u8MjMMiZ1jmjs4HZn/TcZi0919cYJiEGaZB5hFiAws4=;
        b=aFbZcFG3aY4wkHP6IwPDJj+s9qhwWA1KPI2y47s0nj9cQlMSBmWCZLUVyLmUlCOUeA
         Vo8O4znZlG/RcCMbBdZrpVAeCzESe4zMCt15WJPea5A4X9qafHUYNPwaZ65pw8oiUnZf
         lu/n0RswMQ+Lw53EzAssEqclG2HUY6YoLeEZyuZ9dYZZSVdszcW3Oq26PvsV+eBSTHPi
         6F7ZnUoqdOcH94eBBc+XoP8jgPcQhCj6qVHn6jNROh0m+uvg2SnHCBAoybJLfR41e2Pa
         cVFSWOVm1HKMMHijLPxYa8n9IaC2sT344Om32rQqnEauB/GdcV2WotJ1THnb3UG8fmLQ
         7LaQ==
X-Gm-Message-State: AOAM530o0lruo3VMdpb4dr5aG23PZmM4O2h0nl7Nl0akROtSpssuH7JQ
        o+tJ4WlUNtw+Npv08+PISB4lu9al1Hc=
X-Google-Smtp-Source: ABdhPJx2cKU6hYH4VyJXUaaMobRSHBo/2T3SbJn9FGt3hJ6Im7InRWF61JhdKVAJvIaKUU5vtKc7LA==
X-Received: by 2002:a17:90b:4a83:: with SMTP id lp3mr35224165pjb.34.1637610139411;
        Mon, 22 Nov 2021 11:42:19 -0800 (PST)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id y32sm9352355pfa.145.2021.11.22.11.42.18
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 11:42:18 -0800 (PST)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ] uinput: Remove local copy of uinput.h
Date:   Mon, 22 Nov 2021 11:42:18 -0800
Message-Id: <20211122194218.2191284-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

uinput.h is part of kernel uapi nowadays so it can be included directly
from linux/uinput.h which has a compatible definition with 32 bits
systems:

https://github.com/bluez/bluez/issues/84#issuecomment-942155841

Fixes: https://github.com/bluez/bluez/issues/84
---
 android/avctp.c        |   8 +-
 profiles/audio/avctp.c |   6 +-
 src/uinput.h           | 711 -----------------------------------------
 3 files changed, 6 insertions(+), 719 deletions(-)
 delete mode 100644 src/uinput.h

diff --git a/android/avctp.c b/android/avctp.c
index c2ea5f4a2..14ebbc391 100644
--- a/android/avctp.c
+++ b/android/avctp.c
@@ -26,14 +26,12 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <netinet/in.h>
+#include <linux/uinput.h>
 
 #include <glib.h>
 
 #include "lib/sdp.h"
-
 #include "src/log.h"
-#include "src/uinput.h"
-
 #include "avctp.h"
 
 /*
@@ -259,7 +257,7 @@ static gboolean avctp_passthrough_rsp(struct avctp *session, uint8_t code,
 
 static int send_event(int fd, uint16_t type, uint16_t code, int32_t value)
 {
-	struct uinput_event event;
+	struct input_event event;
 	int err;
 
 	memset(&event, 0, sizeof(event));
@@ -1012,7 +1010,7 @@ failed:
 
 static int uinput_create(const char *name)
 {
-	struct uinput_dev dev;
+	struct uinput_user_dev dev;
 	int fd, err, i;
 
 	fd = open("/dev/uinput", O_RDWR);
diff --git a/profiles/audio/avctp.c b/profiles/audio/avctp.c
index 72509edec..9113b5ddc 100644
--- a/profiles/audio/avctp.c
+++ b/profiles/audio/avctp.c
@@ -25,6 +25,7 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 #include <netinet/in.h>
+#include <linux/uinput.h>
 
 #include <glib.h>
 
@@ -38,7 +39,6 @@
 #include "src/device.h"
 #include "src/log.h"
 #include "src/error.h"
-#include "src/uinput.h"
 #include "src/shared/timeout.h"
 
 #include "avctp.h"
@@ -302,7 +302,7 @@ static gboolean avctp_passthrough_rsp(struct avctp *session, uint8_t code,
 
 static int send_event(int fd, uint16_t type, uint16_t code, int32_t value)
 {
-	struct uinput_event event;
+	struct input_event event;
 
 	memset(&event, 0, sizeof(event));
 	event.type	= type;
@@ -1156,7 +1156,7 @@ failed:
 static int uinput_create(struct btd_device *device, const char *name,
 			 const char *suffix)
 {
-	struct uinput_dev dev;
+	struct uinput_user_dev dev;
 	int fd, err, i;
 	char src[18];
 
diff --git a/src/uinput.h b/src/uinput.h
deleted file mode 100644
index 75d791bc6..000000000
--- a/src/uinput.h
+++ /dev/null
@@ -1,711 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *
- *  BlueZ - Bluetooth protocol stack for Linux
- *
- *  Copyright (C) 2003-2010  Marcel Holtmann <marcel@holtmann.org>
- *
- *
- */
-
-#ifndef __UINPUT_H
-#define __UINPUT_H
-
-#ifdef __cplusplus
-extern "C" {
-#endif
-
-#include <stdint.h>
-#include <sys/time.h>
-#include <sys/ioctl.h>
-
-/* Events */
-
-#define EV_SYN			0x00
-#define EV_KEY			0x01
-#define EV_REL			0x02
-#define EV_ABS			0x03
-#define EV_MSC			0x04
-#define EV_LED			0x11
-#define EV_SND			0x12
-#define EV_REP			0x14
-#define EV_FF			0x15
-#define EV_PWR			0x16
-#define EV_FF_STATUS		0x17
-#define EV_MAX			0x1f
-
-/* Synchronization events */
-
-#define SYN_REPORT		0
-#define SYN_CONFIG		1
-
-/*
- * Keys and buttons
- *
- * Most of the keys/buttons are modelled after USB HUT 1.12
- * (see http://www.usb.org/developers/hidpage).
- * Abbreviations in the comments:
- * AC - Application Control
- * AL - Application Launch Button
- * SC - System Control
- */
-
-#define KEY_RESERVED		0
-#define KEY_ESC			1
-#define KEY_1			2
-#define KEY_2			3
-#define KEY_3			4
-#define KEY_4			5
-#define KEY_5			6
-#define KEY_6			7
-#define KEY_7			8
-#define KEY_8			9
-#define KEY_9			10
-#define KEY_0			11
-#define KEY_MINUS		12
-#define KEY_EQUAL		13
-#define KEY_BACKSPACE		14
-#define KEY_TAB			15
-#define KEY_Q			16
-#define KEY_W			17
-#define KEY_E			18
-#define KEY_R			19
-#define KEY_T			20
-#define KEY_Y			21
-#define KEY_U			22
-#define KEY_I			23
-#define KEY_O			24
-#define KEY_P			25
-#define KEY_LEFTBRACE		26
-#define KEY_RIGHTBRACE		27
-#define KEY_ENTER		28
-#define KEY_LEFTCTRL		29
-#define KEY_A			30
-#define KEY_S			31
-#define KEY_D			32
-#define KEY_F			33
-#define KEY_G			34
-#define KEY_H			35
-#define KEY_J			36
-#define KEY_K			37
-#define KEY_L			38
-#define KEY_SEMICOLON		39
-#define KEY_APOSTROPHE		40
-#define KEY_GRAVE		41
-#define KEY_LEFTSHIFT		42
-#define KEY_BACKSLASH		43
-#define KEY_Z			44
-#define KEY_X			45
-#define KEY_C			46
-#define KEY_V			47
-#define KEY_B			48
-#define KEY_N			49
-#define KEY_M			50
-#define KEY_COMMA		51
-#define KEY_DOT			52
-#define KEY_SLASH		53
-#define KEY_RIGHTSHIFT		54
-#define KEY_KPASTERISK		55
-#define KEY_LEFTALT		56
-#define KEY_SPACE		57
-#define KEY_CAPSLOCK		58
-#define KEY_F1			59
-#define KEY_F2			60
-#define KEY_F3			61
-#define KEY_F4			62
-#define KEY_F5			63
-#define KEY_F6			64
-#define KEY_F7			65
-#define KEY_F8			66
-#define KEY_F9			67
-#define KEY_F10			68
-#define KEY_NUMLOCK		69
-#define KEY_SCROLLLOCK		70
-#define KEY_KP7			71
-#define KEY_KP8			72
-#define KEY_KP9			73
-#define KEY_KPMINUS		74
-#define KEY_KP4			75
-#define KEY_KP5			76
-#define KEY_KP6			77
-#define KEY_KPPLUS		78
-#define KEY_KP1			79
-#define KEY_KP2			80
-#define KEY_KP3			81
-#define KEY_KP0			82
-#define KEY_KPDOT		83
-
-#define KEY_ZENKAKUHANKAKU	85
-#define KEY_102ND		86
-#define KEY_F11			87
-#define KEY_F12			88
-#define KEY_RO			89
-#define KEY_KATAKANA		90
-#define KEY_HIRAGANA		91
-#define KEY_HENKAN		92
-#define KEY_KATAKANAHIRAGANA	93
-#define KEY_MUHENKAN		94
-#define KEY_KPJPCOMMA		95
-#define KEY_KPENTER		96
-#define KEY_RIGHTCTRL		97
-#define KEY_KPSLASH		98
-#define KEY_SYSRQ		99
-#define KEY_RIGHTALT		100
-#define KEY_LINEFEED		101
-#define KEY_HOME		102
-#define KEY_UP			103
-#define KEY_PAGEUP		104
-#define KEY_LEFT		105
-#define KEY_RIGHT		106
-#define KEY_END			107
-#define KEY_DOWN		108
-#define KEY_PAGEDOWN		109
-#define KEY_INSERT		110
-#define KEY_DELETE		111
-#define KEY_MACRO		112
-#define KEY_MUTE		113
-#define KEY_VOLUMEDOWN		114
-#define KEY_VOLUMEUP		115
-#define KEY_POWER		116	/* SC System Power Down */
-#define KEY_KPEQUAL		117
-#define KEY_KPPLUSMINUS		118
-#define KEY_PAUSE		119
-
-#define KEY_KPCOMMA		121
-#define KEY_HANGEUL		122
-#define KEY_HANGUEL		KEY_HANGEUL
-#define KEY_HANJA		123
-#define KEY_YEN			124
-#define KEY_LEFTMETA		125
-#define KEY_RIGHTMETA		126
-#define KEY_COMPOSE		127
-
-#define KEY_STOP		128	/* AC Stop */
-#define KEY_AGAIN		129
-#define KEY_PROPS		130	/* AC Properties */
-#define KEY_UNDO		131	/* AC Undo */
-#define KEY_FRONT		132
-#define KEY_COPY		133	/* AC Copy */
-#define KEY_OPEN		134	/* AC Open */
-#define KEY_PASTE		135	/* AC Paste */
-#define KEY_FIND		136	/* AC Search */
-#define KEY_CUT			137	/* AC Cut */
-#define KEY_HELP		138	/* AL Integrated Help Center */
-#define KEY_MENU		139	/* Menu (show menu) */
-#define KEY_CALC		140	/* AL Calculator */
-#define KEY_SETUP		141
-#define KEY_SLEEP		142	/* SC System Sleep */
-#define KEY_WAKEUP		143	/* System Wake Up */
-#define KEY_FILE		144	/* AL Local Machine Browser */
-#define KEY_SENDFILE		145
-#define KEY_DELETEFILE		146
-#define KEY_XFER		147
-#define KEY_PROG1		148
-#define KEY_PROG2		149
-#define KEY_WWW			150	/* AL Internet Browser */
-#define KEY_MSDOS		151
-#define KEY_COFFEE		152	/* AL Terminal Lock/Screensaver */
-#define KEY_SCREENLOCK		KEY_COFFEE
-#define KEY_DIRECTION		153
-#define KEY_CYCLEWINDOWS	154
-#define KEY_MAIL		155
-#define KEY_BOOKMARKS		156	/* AC Bookmarks */
-#define KEY_COMPUTER		157
-#define KEY_BACK		158	/* AC Back */
-#define KEY_FORWARD		159	/* AC Forward */
-#define KEY_CLOSECD		160
-#define KEY_EJECTCD		161
-#define KEY_EJECTCLOSECD	162
-#define KEY_NEXTSONG		163
-#define KEY_PLAYPAUSE		164
-#define KEY_PREVIOUSSONG	165
-#define KEY_STOPCD		166
-#define KEY_RECORD		167
-#define KEY_REWIND		168
-#define KEY_PHONE		169	/* Media Select Telephone */
-#define KEY_ISO			170
-#define KEY_CONFIG		171	/* AL Consumer Control Configuration */
-#define KEY_HOMEPAGE		172	/* AC Home */
-#define KEY_REFRESH		173	/* AC Refresh */
-#define KEY_EXIT		174	/* AC Exit */
-#define KEY_MOVE		175
-#define KEY_EDIT		176
-#define KEY_SCROLLUP		177
-#define KEY_SCROLLDOWN		178
-#define KEY_KPLEFTPAREN		179
-#define KEY_KPRIGHTPAREN	180
-#define KEY_NEW			181	/* AC New */
-#define KEY_REDO		182	/* AC Redo/Repeat */
-
-#define KEY_F13			183
-#define KEY_F14			184
-#define KEY_F15			185
-#define KEY_F16			186
-#define KEY_F17			187
-#define KEY_F18			188
-#define KEY_F19			189
-#define KEY_F20			190
-#define KEY_F21			191
-#define KEY_F22			192
-#define KEY_F23			193
-#define KEY_F24			194
-
-#define KEY_PLAYCD		200
-#define KEY_PAUSECD		201
-#define KEY_PROG3		202
-#define KEY_PROG4		203
-#define KEY_SUSPEND		205
-#define KEY_CLOSE		206	/* AC Close */
-#define KEY_PLAY		207
-#define KEY_FASTFORWARD		208
-#define KEY_BASSBOOST		209
-#define KEY_PRINT		210	/* AC Print */
-#define KEY_HP			211
-#define KEY_CAMERA		212
-#define KEY_SOUND		213
-#define KEY_QUESTION		214
-#define KEY_EMAIL		215
-#define KEY_CHAT		216
-#define KEY_SEARCH		217
-#define KEY_CONNECT		218
-#define KEY_FINANCE		219	/* AL Checkbook/Finance */
-#define KEY_SPORT		220
-#define KEY_SHOP		221
-#define KEY_ALTERASE		222
-#define KEY_CANCEL		223	/* AC Cancel */
-#define KEY_BRIGHTNESSDOWN	224
-#define KEY_BRIGHTNESSUP	225
-#define KEY_MEDIA		226
-
-#define KEY_SWITCHVIDEOMODE	227	/* Cycle between available video
-					   outputs (Monitor/LCD/TV-out/etc) */
-#define KEY_KBDILLUMTOGGLE	228
-#define KEY_KBDILLUMDOWN	229
-#define KEY_KBDILLUMUP		230
-
-#define KEY_SEND		231	/* AC Send */
-#define KEY_REPLY		232	/* AC Reply */
-#define KEY_FORWARDMAIL		233	/* AC Forward Msg */
-#define KEY_SAVE		234	/* AC Save */
-#define KEY_DOCUMENTS		235
-
-#define KEY_BATTERY		236
-
-#define KEY_BLUETOOTH		237
-#define KEY_WLAN		238
-#define KEY_UWB			239
-
-#define KEY_UNKNOWN		240
-
-#define KEY_VIDEO_NEXT		241	/* drive next video source */
-#define KEY_VIDEO_PREV		242	/* drive previous video source */
-#define KEY_BRIGHTNESS_CYCLE	243	/* brightness up, after max is min */
-#define KEY_BRIGHTNESS_ZERO	244	/* brightness off, use ambient */
-#define KEY_DISPLAY_OFF		245	/* display device to off state */
-
-#define KEY_WIMAX		246
-
-/* Range 248 - 255 is reserved for special needs of AT keyboard driver */
-
-#define BTN_MISC		0x100
-#define BTN_0			0x100
-#define BTN_1			0x101
-#define BTN_2			0x102
-#define BTN_3			0x103
-#define BTN_4			0x104
-#define BTN_5			0x105
-#define BTN_6			0x106
-#define BTN_7			0x107
-#define BTN_8			0x108
-#define BTN_9			0x109
-
-#define BTN_MOUSE		0x110
-#define BTN_LEFT		0x110
-#define BTN_RIGHT		0x111
-#define BTN_MIDDLE		0x112
-#define BTN_SIDE		0x113
-#define BTN_EXTRA		0x114
-#define BTN_FORWARD		0x115
-#define BTN_BACK		0x116
-#define BTN_TASK		0x117
-
-#define BTN_JOYSTICK		0x120
-#define BTN_TRIGGER		0x120
-#define BTN_THUMB		0x121
-#define BTN_THUMB2		0x122
-#define BTN_TOP			0x123
-#define BTN_TOP2		0x124
-#define BTN_PINKIE		0x125
-#define BTN_BASE		0x126
-#define BTN_BASE2		0x127
-#define BTN_BASE3		0x128
-#define BTN_BASE4		0x129
-#define BTN_BASE5		0x12a
-#define BTN_BASE6		0x12b
-#define BTN_DEAD		0x12f
-
-#define BTN_GAMEPAD		0x130
-#define BTN_A			0x130
-#define BTN_B			0x131
-#define BTN_C			0x132
-#define BTN_X			0x133
-#define BTN_Y			0x134
-#define BTN_Z			0x135
-#define BTN_TL			0x136
-#define BTN_TR			0x137
-#define BTN_TL2			0x138
-#define BTN_TR2			0x139
-#define BTN_SELECT		0x13a
-#define BTN_START		0x13b
-#define BTN_MODE		0x13c
-#define BTN_THUMBL		0x13d
-#define BTN_THUMBR		0x13e
-
-#define BTN_DIGI		0x140
-#define BTN_TOOL_PEN		0x140
-#define BTN_TOOL_RUBBER		0x141
-#define BTN_TOOL_BRUSH		0x142
-#define BTN_TOOL_PENCIL		0x143
-#define BTN_TOOL_AIRBRUSH	0x144
-#define BTN_TOOL_FINGER		0x145
-#define BTN_TOOL_MOUSE		0x146
-#define BTN_TOOL_LENS		0x147
-#define BTN_TOUCH		0x14a
-#define BTN_STYLUS		0x14b
-#define BTN_STYLUS2		0x14c
-#define BTN_TOOL_DOUBLETAP	0x14d
-#define BTN_TOOL_TRIPLETAP	0x14e
-
-#define BTN_WHEEL		0x150
-#define BTN_GEAR_DOWN		0x150
-#define BTN_GEAR_UP		0x151
-
-#define KEY_OK			0x160
-#define KEY_SELECT		0x161
-#define KEY_GOTO		0x162
-#define KEY_CLEAR		0x163
-#define KEY_POWER2		0x164
-#define KEY_OPTION		0x165
-#define KEY_INFO		0x166	/* AL OEM Features/Tips/Tutorial */
-#define KEY_TIME		0x167
-#define KEY_VENDOR		0x168
-#define KEY_ARCHIVE		0x169
-#define KEY_PROGRAM		0x16a	/* Media Select Program Guide */
-#define KEY_CHANNEL		0x16b
-#define KEY_FAVORITES		0x16c
-#define KEY_EPG			0x16d
-#define KEY_PVR			0x16e	/* Media Select Home */
-#define KEY_MHP			0x16f
-#define KEY_LANGUAGE		0x170
-#define KEY_TITLE		0x171
-#define KEY_SUBTITLE		0x172
-#define KEY_ANGLE		0x173
-#define KEY_ZOOM		0x174
-#define KEY_MODE		0x175
-#define KEY_KEYBOARD		0x176
-#define KEY_SCREEN		0x177
-#define KEY_PC			0x178	/* Media Select Computer */
-#define KEY_TV			0x179	/* Media Select TV */
-#define KEY_TV2			0x17a	/* Media Select Cable */
-#define KEY_VCR			0x17b	/* Media Select VCR */
-#define KEY_VCR2		0x17c	/* VCR Plus */
-#define KEY_SAT			0x17d	/* Media Select Satellite */
-#define KEY_SAT2		0x17e
-#define KEY_CD			0x17f	/* Media Select CD */
-#define KEY_TAPE		0x180	/* Media Select Tape */
-#define KEY_RADIO		0x181
-#define KEY_TUNER		0x182	/* Media Select Tuner */
-#define KEY_PLAYER		0x183
-#define KEY_TEXT		0x184
-#define KEY_DVD			0x185	/* Media Select DVD */
-#define KEY_AUX			0x186
-#define KEY_MP3			0x187
-#define KEY_AUDIO		0x188
-#define KEY_VIDEO		0x189
-#define KEY_DIRECTORY		0x18a
-#define KEY_LIST		0x18b
-#define KEY_MEMO		0x18c	/* Media Select Messages */
-#define KEY_CALENDAR		0x18d
-#define KEY_RED			0x18e
-#define KEY_GREEN		0x18f
-#define KEY_YELLOW		0x190
-#define KEY_BLUE		0x191
-#define KEY_CHANNELUP		0x192	/* Channel Increment */
-#define KEY_CHANNELDOWN		0x193	/* Channel Decrement */
-#define KEY_FIRST		0x194
-#define KEY_LAST		0x195	/* Recall Last */
-#define KEY_AB			0x196
-#define KEY_NEXT		0x197
-#define KEY_RESTART		0x198
-#define KEY_SLOW		0x199
-#define KEY_SHUFFLE		0x19a
-#define KEY_BREAK		0x19b
-#define KEY_PREVIOUS		0x19c
-#define KEY_DIGITS		0x19d
-#define KEY_TEEN		0x19e
-#define KEY_TWEN		0x19f
-#define KEY_VIDEOPHONE		0x1a0	/* Media Select Video Phone */
-#define KEY_GAMES		0x1a1	/* Media Select Games */
-#define KEY_ZOOMIN		0x1a2	/* AC Zoom In */
-#define KEY_ZOOMOUT		0x1a3	/* AC Zoom Out */
-#define KEY_ZOOMRESET		0x1a4	/* AC Zoom */
-#define KEY_WORDPROCESSOR	0x1a5	/* AL Word Processor */
-#define KEY_EDITOR		0x1a6	/* AL Text Editor */
-#define KEY_SPREADSHEET		0x1a7	/* AL Spreadsheet */
-#define KEY_GRAPHICSEDITOR	0x1a8	/* AL Graphics Editor */
-#define KEY_PRESENTATION	0x1a9	/* AL Presentation App */
-#define KEY_DATABASE		0x1aa	/* AL Database App */
-#define KEY_NEWS		0x1ab	/* AL Newsreader */
-#define KEY_VOICEMAIL		0x1ac	/* AL Voicemail */
-#define KEY_ADDRESSBOOK		0x1ad	/* AL Contacts/Address Book */
-#define KEY_MESSENGER		0x1ae	/* AL Instant Messaging */
-#define KEY_DISPLAYTOGGLE	0x1af	/* Turn display (LCD) on and off */
-#define KEY_SPELLCHECK		0x1b0   /* AL Spell Check */
-#define KEY_LOGOFF		0x1b1   /* AL Logoff */
-
-#define KEY_DOLLAR		0x1b2
-#define KEY_EURO		0x1b3
-
-#define KEY_FRAMEBACK		0x1b4	/* Consumer - transport controls */
-#define KEY_FRAMEFORWARD	0x1b5
-#define KEY_CONTEXT_MENU	0x1b6	/* GenDesc - system context menu */
-#define KEY_MEDIA_REPEAT	0x1b7	/* Consumer - transport control */
-
-#define KEY_DEL_EOL		0x1c0
-#define KEY_DEL_EOS		0x1c1
-#define KEY_INS_LINE		0x1c2
-#define KEY_DEL_LINE		0x1c3
-
-#define KEY_FN			0x1d0
-#define KEY_FN_ESC		0x1d1
-#define KEY_FN_F1		0x1d2
-#define KEY_FN_F2		0x1d3
-#define KEY_FN_F3		0x1d4
-#define KEY_FN_F4		0x1d5
-#define KEY_FN_F5		0x1d6
-#define KEY_FN_F6		0x1d7
-#define KEY_FN_F7		0x1d8
-#define KEY_FN_F8		0x1d9
-#define KEY_FN_F9		0x1da
-#define KEY_FN_F10		0x1db
-#define KEY_FN_F11		0x1dc
-#define KEY_FN_F12		0x1dd
-#define KEY_FN_1		0x1de
-#define KEY_FN_2		0x1df
-#define KEY_FN_D		0x1e0
-#define KEY_FN_E		0x1e1
-#define KEY_FN_F		0x1e2
-#define KEY_FN_S		0x1e3
-#define KEY_FN_B		0x1e4
-
-#define KEY_BRL_DOT1		0x1f1
-#define KEY_BRL_DOT2		0x1f2
-#define KEY_BRL_DOT3		0x1f3
-#define KEY_BRL_DOT4		0x1f4
-#define KEY_BRL_DOT5		0x1f5
-#define KEY_BRL_DOT6		0x1f6
-#define KEY_BRL_DOT7		0x1f7
-#define KEY_BRL_DOT8		0x1f8
-#define KEY_BRL_DOT9		0x1f9
-#define KEY_BRL_DOT10		0x1fa
-
-/* We avoid low common keys in module aliases so they don't get huge. */
-#define KEY_MIN_INTERESTING	KEY_MUTE
-#define KEY_MAX			0x1ff
-#define KEY_CNT			(KEY_MAX+1)
-
-/*
- * Relative axes
- */
-
-#define REL_X			0x00
-#define REL_Y			0x01
-#define REL_Z			0x02
-#define REL_RX			0x03
-#define REL_RY			0x04
-#define REL_RZ			0x05
-#define REL_HWHEEL		0x06
-#define REL_DIAL		0x07
-#define REL_WHEEL		0x08
-#define REL_MISC		0x09
-#define REL_MAX			0x0f
-#define REL_CNT			(REL_MAX+1)
-
-/*
- * Absolute axes
- */
-
-#define ABS_X			0x00
-#define ABS_Y			0x01
-#define ABS_Z			0x02
-#define ABS_RX			0x03
-#define ABS_RY			0x04
-#define ABS_RZ			0x05
-#define ABS_THROTTLE		0x06
-#define ABS_RUDDER		0x07
-#define ABS_WHEEL		0x08
-#define ABS_GAS			0x09
-#define ABS_BRAKE		0x0a
-#define ABS_HAT0X		0x10
-#define ABS_HAT0Y		0x11
-#define ABS_HAT1X		0x12
-#define ABS_HAT1Y		0x13
-#define ABS_HAT2X		0x14
-#define ABS_HAT2Y		0x15
-#define ABS_HAT3X		0x16
-#define ABS_HAT3Y		0x17
-#define ABS_PRESSURE		0x18
-#define ABS_DISTANCE		0x19
-#define ABS_TILT_X		0x1a
-#define ABS_TILT_Y		0x1b
-#define ABS_TOOL_WIDTH		0x1c
-#define ABS_VOLUME		0x20
-#define ABS_MISC		0x28
-#define ABS_MAX			0x3f
-#define ABS_CNT			(ABS_MAX+1)
-
-/*
- * Switch events
- */
-
-#define SW_LID			0x00  /* set = lid shut */
-#define SW_TABLET_MODE		0x01  /* set = tablet mode */
-#define SW_HEADPHONE_INSERT	0x02  /* set = inserted */
-#define SW_RFKILL_ALL		0x03  /* rfkill master switch, type "any"
-					 set = radio enabled */
-#define SW_RADIO		SW_RFKILL_ALL	/* deprecated */
-#define SW_MICROPHONE_INSERT	0x04  /* set = inserted */
-#define SW_DOCK			0x05  /* set = plugged into dock */
-#define SW_MAX			0x0f
-#define SW_CNT			(SW_MAX+1)
-
-/*
- * Misc events
- */
-
-#define MSC_SERIAL		0x00
-#define MSC_PULSELED		0x01
-#define MSC_GESTURE		0x02
-#define MSC_RAW			0x03
-#define MSC_SCAN		0x04
-#define MSC_MAX			0x07
-#define MSC_CNT			(MSC_MAX+1)
-
-/*
- * LEDs
- */
-
-#define LED_NUML		0x00
-#define LED_CAPSL		0x01
-#define LED_SCROLLL		0x02
-#define LED_COMPOSE		0x03
-#define LED_KANA		0x04
-#define LED_SLEEP		0x05
-#define LED_SUSPEND		0x06
-#define LED_MUTE		0x07
-#define LED_MISC		0x08
-#define LED_MAIL		0x09
-#define LED_CHARGING		0x0a
-#define LED_MAX			0x0f
-#define LED_CNT			(LED_MAX+1)
-
-/*
- * Autorepeat values
- */
-
-#define REP_DELAY		0x00
-#define REP_PERIOD		0x01
-#define REP_MAX			0x01
-
-/*
- * Sounds
- */
-
-#define SND_CLICK		0x00
-#define SND_BELL		0x01
-#define SND_TONE		0x02
-#define SND_MAX			0x07
-#define SND_CNT			(SND_MAX+1)
-
-/*
- * IDs.
- */
-
-#define ID_BUS			0
-#define ID_VENDOR		1
-#define ID_PRODUCT		2
-#define ID_VERSION		3
-
-#define BUS_PCI			0x01
-#define BUS_ISAPNP		0x02
-#define BUS_USB			0x03
-#define BUS_HIL			0x04
-#define BUS_BLUETOOTH		0x05
-#define BUS_VIRTUAL		0x06
-
-#define BUS_ISA			0x10
-#define BUS_I8042		0x11
-#define BUS_XTKBD		0x12
-#define BUS_RS232		0x13
-#define BUS_GAMEPORT		0x14
-#define BUS_PARPORT		0x15
-#define BUS_AMIGA		0x16
-#define BUS_ADB			0x17
-#define BUS_I2C			0x18
-#define BUS_HOST		0x19
-#define BUS_GSC			0x1A
-#define BUS_ATARI		0x1B
-
-/* User input interface */
-
-#define UINPUT_IOCTL_BASE	'U'
-
-#define UI_DEV_CREATE		_IO(UINPUT_IOCTL_BASE, 1)
-#define UI_DEV_DESTROY		_IO(UINPUT_IOCTL_BASE, 2)
-
-#define UI_SET_EVBIT		_IOW(UINPUT_IOCTL_BASE, 100, int)
-#define UI_SET_KEYBIT		_IOW(UINPUT_IOCTL_BASE, 101, int)
-#define UI_SET_RELBIT		_IOW(UINPUT_IOCTL_BASE, 102, int)
-#define UI_SET_ABSBIT		_IOW(UINPUT_IOCTL_BASE, 103, int)
-#define UI_SET_MSCBIT		_IOW(UINPUT_IOCTL_BASE, 104, int)
-#define UI_SET_LEDBIT		_IOW(UINPUT_IOCTL_BASE, 105, int)
-#define UI_SET_SNDBIT		_IOW(UINPUT_IOCTL_BASE, 106, int)
-#define UI_SET_FFBIT		_IOW(UINPUT_IOCTL_BASE, 107, int)
-#define UI_SET_PHYS		_IOW(UINPUT_IOCTL_BASE, 108, char*)
-#define UI_SET_SWBIT		_IOW(UINPUT_IOCTL_BASE, 109, int)
-
-#ifndef NBITS
-#define NBITS(x) ((((x) - 1) / (sizeof(long) * 8)) + 1)
-#endif
-
-#define UINPUT_MAX_NAME_SIZE	80
-
-struct uinput_id {
-	uint16_t bustype;
-	uint16_t vendor;
-	uint16_t product;
-	uint16_t version;
-};
-
-struct uinput_dev {
-	char name[UINPUT_MAX_NAME_SIZE];
-	struct uinput_id id;
-	int ff_effects_max;
-	int absmax[ABS_MAX + 1];
-	int absmin[ABS_MAX + 1];
-	int absfuzz[ABS_MAX + 1];
-	int absflat[ABS_MAX + 1];
-};
-
-struct uinput_event {
-	struct timeval time;
-	uint16_t type;
-	uint16_t code;
-	int32_t value;
-};
-
-#ifdef __cplusplus
-}
-#endif
-
-#endif /* __UINPUT_H */
-- 
2.33.1

