Return-Path: <linux-bluetooth+bounces-18276-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIq+Mm4GcGmUUgAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18276-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 23:49:18 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F6D4D3E2
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 23:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DAD1BAE3868
	for <lists+linux-bluetooth@lfdr.de>; Tue, 20 Jan 2026 22:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CCE47AF60;
	Tue, 20 Jan 2026 22:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEOH9Yjf"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A72298CD7
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 22:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768948042; cv=none; b=IgbDkBNm+zhnIoytM6uq7kQdBKUqoEQIXgDcsHpTh0ntb9mfos5WweiBmBBNakW4O3eXaz7Lr1z4T7wVUQqGxb1r820pTd8oU5ffdVAQKadfuvJg6oOnfZimvBlylkF38/qJf+Xic0YlcN/gMYZI5/u5T/CGZEZ7BLDPyFOPFjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768948042; c=relaxed/simple;
	bh=w75EsTL0YGeLeWfpIcIPpdk63q9ml/wIFv2OcnHt3Q0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NqPG3FSdk8l7Igbg/EO6JBxjb3JQ8iu+I4D9H8N+bNQ4M8tWubsScpBBhOsNOj+RpiVJLDCaN/VSme0CXHpeKxFiuKyU0n+jXPS1OSqZiZqTSx0RHjJiOvcECSA8qUK5dnrlsBbc8/ZSKbgfAGmuMZiKC25bnBUGsBUGuTsf5Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEOH9Yjf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E80CDC19421
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 22:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768948040;
	bh=w75EsTL0YGeLeWfpIcIPpdk63q9ml/wIFv2OcnHt3Q0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UEOH9YjfdCW9sn9sL1anpOw7uuap+LN87LEalwVTbzB12Swu/kFjfKeEKQIRWUTGD
	 gp8I5RxLp5lcOksjtCW2CcEqHo0m78bkLo7is8TwY+Gxg2v7t9vfH7D2O0d0ZKFKph
	 GwNd6lmBGKomYLBM2s/BtYptzRmD1lrtZCgW8oEIi3Hc9+kf1FewJf42oLwA5sa2HR
	 +djSn0zIyfuQtsM8aAkk0uTF6hcybRY92FpWbwjzBoTnyy6H52/H/T9prPgD2Z2P5Y
	 88zutSnG0eK7srqik+HpsfwglOT3NOmckFYmxNCKdpoov8z5vYrnLr4+BuYVvJO/AB
	 XR+wtxD8lBZJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DB682C41612; Tue, 20 Jan 2026 22:27:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-bluetooth@vger.kernel.org
Subject: [Bug 220986] MediaTek MT7925 Bluetooth adapter (USB 13d3:3596) fails
 to initialize - reports as unsupported hardware variant 0x7902
Date: Tue, 20 Jan 2026 22:27:20 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Bluetooth
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aamolodc@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: linux-bluetooth@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220986-62941-x5yOn28WIq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220986-62941@https.bugzilla.kernel.org/>
References: <bug-220986-62941@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18276-lists,linux-bluetooth=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-bluetooth@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 74F6D4D3E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D220986

Alex (aamolodc@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|DUPLICATE                   |---

--- Comment #2 from Alex (aamolodc@gmail.com) ---
I respectfully request this bug be reopened as it represents a different is=
sue
than bug #220682.

## Key Difference

**Bug #220682 (USB ID 0489:e111):**
- Bluetooth worked initially after boot
- Stopped working after GNOME login (timing-sensitive)
- Fixed by libmtp/libgphoto2 blacklist updates

**This bug #220986 (USB ID 13d3:3596):**
- Bluetooth NEVER initializes, even at boot
- Fails before GNOME login occurs
- NOT fixed by libmtp/libgphoto2 updates

## Testing Completed (2026-01-21)

I have installed the corrected package updates:
- libmtp-1.1.22-2.fc43.x86_64 (includes 13d3:3596 blacklist)
- libgphoto2-2.5.33-1.fc43.x86_64 (includes 13d3:3596 blacklist)

Performed full cold boot procedure:
1. Complete shutdown (not reboot)
2. Unplugged power for 30+ seconds
3. Booted directly to Linux (no Windows boot first)

## Current Status

Bluetooth still fails with identical error:

```
[   19.247336] Bluetooth: hci0: Opcode 0x0c03 failed: -110
```

System details:
- USB device detected: Bus 001 Device 003: ID 13d3:3596 IMC Networks
Wireless_Device
- btusb driver binds correctly to interfaces 0 and 1
- hci0 device created in /sys/class/bluetooth/
- Firmware exists: /lib/firmware/mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr=
.bin
- HCI_Reset command times out (error -110 =3D ETIMEDOUT)
- Chip does not respond to any HCI commands
- No firmware loading attempted (fails before that stage)

## Root Cause Analysis

The libmtp/libgphoto2 fix resolved the USB ID conflict, but a **second,
independent issue remains**: the btusb driver cannot communicate with the
MT7925 chip at the hardware level. The chip does not respond to HCI_Reset or
any other HCI commands.

This is a kernel driver initialization bug, not a userspace library conflic=
t.

## Evidence This Is Different

1. **Timing:** Bug #220682 worked until login; this bug fails immediately at
boot
2. **No gvfs interaction:** Bluetooth fails before any GNOME services start
3. **Package updates don't help:** libmtp/libgphoto2 blacklists are install=
ed
but issue persists
4. **Cold boot doesn't help:** Full power cycle completed, issue remains
5. **Hardware works:** Device functions correctly in Windows 11

## Request

Please reopen this bug as a separate kernel driver issue. The USB ID confli=
ct
fix (bug #220682) is necessary but not sufficient to resolve this bug.

System: Fedora 43, Kernel 6.18.5-200.fc43.x86_64
Hardware: MediaTek MT7925 (USB ID 13d3:3596, AzureWave 6040 subsystem)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=

