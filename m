Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F261F29F6C2
	for <lists+linux-bluetooth@lfdr.de>; Thu, 29 Oct 2020 22:23:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgJ2VXu (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 29 Oct 2020 17:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgJ2VXt (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 29 Oct 2020 17:23:49 -0400
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EBDEC0613CF
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Oct 2020 14:23:49 -0700 (PDT)
Received: by mail-pf1-x44a.google.com with SMTP id o128so3173417pfg.1
        for <linux-bluetooth@vger.kernel.org>; Thu, 29 Oct 2020 14:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=YMRzMvgHdkG2Hyh7CFC6R0i7cVj7SNDSbOorZRCr15c=;
        b=EpbRr2t7RrwAWqH9rvDBPBCx0XhhWkG5GC7Y1AT8804j7Mc4icjVPDon8m5v+RJz1l
         BoqxHDzwyHEsmLA8a/vHgzpwxG8HHLSKm0cfMVT95X1sLoCZ/TpySjPHi3nsEFLGbMwG
         e05m30zorkYOiN7cxV+zXJsr7B47CN/KuqG10C8Bo1NqtWMbXB96CNjQzAwcAoYW++f9
         wuc2Oo95BJISTj4c5xlLp3KKPrU3FjEJjW+Eh+xWW5vJuS5Q3MjHBs8RqsM4GRalF04q
         PhOd6avxEAGFfrlpc8NsyWUUQHKt4vnjb1SgeUF2+keh6kWGTpd+bugbWvLAKvzS8b6k
         C0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YMRzMvgHdkG2Hyh7CFC6R0i7cVj7SNDSbOorZRCr15c=;
        b=uj1/puWMn3AhgIWxPDMcIY4Eds5pu2j+f6zZtcUxt+g2p6V839hc2V3leCuLI1VL7h
         4+gSGdmk2HvVyq7OTw76DwP7iBpuG9luZ4exYu0inwUue8p7OcXBxnXmIVez/TZe9/xU
         TR6t2+HDVjjUiLrnOvZJrjvTHHQ/BDutzzNh0KX+n52knJgblcGBb236V6m7EspLnhdG
         QODXinmeuKOZ+Ml9cJC7NlXy6K35bjLT0pZGLqN39HPbjgIi/UOLv/pIvB4f5U/JSu1C
         ZO5cbs3YEkn3qb+EsBN/3XrqYqZ5nV4MKadBB2geKpy8ivAiUzoAxVbZVNLSP4M0BLUM
         AoWA==
X-Gm-Message-State: AOAM530lky65UnSlNbdj3nENEaHh35Oj4o7efGWmF0AxSPksR0CqSVlK
        Akrjy2uzYtCLKJp0BS1EYIMpCg26aamrmb2xPnJA
X-Google-Smtp-Source: ABdhPJxJlJ+fMel00DRi2xcz81kA+btFf8fyOvPNQ4bIrqOo3ODYDStCoazz91NWvhojJLLkG2pEQWKmtgUpuPkZQXFs
Sender: "danielwinkler via sendgmr" 
        <danielwinkler@danielwinkler-linux.mtv.corp.google.com>
X-Received: from danielwinkler-linux.mtv.corp.google.com ([2620:15c:202:201:f693:9fff:fef4:4e59])
 (user=danielwinkler job=sendgmr) by 2002:a17:90a:9313:: with SMTP id
 p19mr1170004pjo.90.1604006629006; Thu, 29 Oct 2020 14:23:49 -0700 (PDT)
Date:   Thu, 29 Oct 2020 14:23:27 -0700
In-Reply-To: <20201029212336.3283410-1-danielwinkler@google.com>
Message-Id: <20201029141832.Bluez.v5.2.If15d3d09724ded2bcc7240d29f6888f2ad12e723@changeid>
Mime-Version: 1.0
References: <20201029212336.3283410-1-danielwinkler@google.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
Subject: [Bluez PATCH v5 02/10] doc/mgmt-api: Add new Advertising MGMT
 interfaces to mgmt-api
From:   Daniel Winkler <danielwinkler@google.com>
To:     luiz.von.dentz@intel.com
Cc:     linux-bluetooth@vger.kernel.org,
        chromeos-bluetooth-upstreaming@chromium.org,
        Daniel Winkler <danielwinkler@google.com>,
        Sonny Sasaka <sonnysasaka@chromium.org>,
        Alain Michaud <alainm@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

This patch adds the following to mgmt-api:
- Add Extended Advertising Parameters Command
- Add Extended Advertising Data Command

Reviewed-by: Sonny Sasaka <sonnysasaka@chromium.org>
Reviewed-by: Alain Michaud <alainm@chromium.org>
---

Changes in v5: None
Changes in v4:
- mgmt-api: moved optional params into 'flags' field
- mgmt-api: added info for new return parameters for max data size

Changes in v3:
- Removed Tx Power Selected MGMT event
- Changed Read Security Info cmd to  Read Controller Capabilities

Changes in v2:
- Removed extra space in Add Extended Advertising Parameters API

 doc/mgmt-api.txt | 217 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 217 insertions(+)

diff --git a/doc/mgmt-api.txt b/doc/mgmt-api.txt
index e7a713824..7c899a8fe 100644
--- a/doc/mgmt-api.txt
+++ b/doc/mgmt-api.txt
@@ -3574,6 +3574,223 @@ Remove Advertisement Monitor Command
 				Busy
 
 
+Add Extended Advertising Parameters Command
+===========================================
+
+	Command Code:		0x0054
+	Controller Index:	<controller id>
+	Command Parameters:	Instance (1 Octet)
+				Flags (4 Octets)
+				Params (2 Octets)
+				Duration (2 Octets)
+				Timeout (2 Octets)
+				MinInterval (4 Octets)
+				MaxInterval (4 Octets)
+				TxPower (1 Octet)
+	Return Parameters:	Instance (1 Octet)
+				TxPower (1 Octet)
+				MaxAdvDataLen (1 Octet)
+				MaxScanRspLen (1 Octet)
+
+	This command is used to configure the parameters for Bluetooth Low
+	Energy advertising instance. This command is expected to be followed
+	by an Add Extended Advertising Data command to complete and enable
+	the advertising instance.
+
+	Added advertising information with this command will not be visible
+	immediately if advertising is enabled via the Set Advertising
+	command. The usage of the Set Advertising command takes precedence
+	over this command. Instance information is stored and will be
+	advertised once advertising via Set Advertising has been disabled.
+
+	The Instance identifier is a value between 1 and the number of
+	supported instances. The value 0 is reserved.
+
+	With the Flags value the type of advertising is controlled and
+	the following flags are defined:
+
+		0	Switch into Connectable mode
+		1	Advertise as Discoverable
+		2	Advertise as Limited Discoverable
+		3	Add Flags field to Adv_Data
+		4	Add TX Power field to Adv_Data
+		5	Add Appearance field to Scan_Rsp
+		6	Add Local Name in Scan_Rsp
+		7	Secondary Channel with LE 1M
+		8	Secondary Channel with LE 2M
+		9	Secondary Channel with LE Coded
+		12	The Duration parameter should be used
+		13	The Timeout parameter should be used
+		14	The Interval parameters should be used
+		15	The Tx Power parameter should be used
+
+	When the connectable flag is set, then the controller will use
+	undirected connectable advertising. The value of the connectable
+	setting can be overwritten this way. This is useful to switch a
+	controller into connectable mode only for LE operation. This is
+	similar to the mode 0x02 from the Set Advertising command.
+
+	When the connectable flag is not set, then the controller will
+	use advertising based on the connectable setting. When using
+	non-connectable or scannable advertising, the controller will
+	be programmed with a non-resolvable random address. When the
+	system is connectable, then the identity address or resolvable
+	private address will be used.
+
+	Using the connectable flag is useful for peripheral mode support
+	where BR/EDR (and/or LE) is controlled by Add Device. This allows
+	making the peripheral connectable without having to interfere
+	with the global connectable setting.
+
+	Secondary channel flags can be used to advertise in secondary
+	channel with the corresponding PHYs. These flag bits are mutually
+	exclusive and setting multiple will result in Invalid Parameter
+	error. Choosing either LE 1M or LE 2M will result in using
+	extended advertising on the primary channel with LE 1M and the
+	respectively LE 1M or LE 2M on the secondary channel. Choosing
+	LE Coded will result in using extended advertising on the primary
+	and secondary channels with LE Coded. Choosing none of these flags
+	will result in legacy advertising.
+
+	To allow future parameters to be optionally extended in this structure,
+	the flags member has been used to specify which of the structure
+	fields were purposefully set by the caller. Unspecified parameters will
+	be given sensible defaults by the kernel before the advertisement is
+	registered.
+
+	The Duration parameter configures the length of an Instance. The
+	value is in seconds. The default is 2 seconds.
+
+	If only one advertising Instance has been added, then the Duration
+	value will be ignored. It only applies for the case where multiple
+	Instances are configured. In that case every Instance will be
+	available for the Duration time and after that it switches to
+	the next one. This is a simple round-robin based approach.
+
+	The Timeout parameter configures the life-time of an Instance. In
+	case the value 0 is used it indicates no expiration time. If a
+	timeout value is provided, then the advertising Instance will be
+	automatically removed when the timeout passes. The value for the
+	timeout is in seconds. Powering down a controller will invalidate
+	all advertising Instances and it is not possible to add a new
+	Instance with a timeout when the controller is powered down.
+
+	When a Timeout is provided, then the Duration subtracts from
+	the actual Timeout value of that Instance. For example an Instance
+	with Timeout of 5 and Duration of 2 will be scheduled exactly 3
+	times, twice with 2 seconds and once with one second. Other
+	Instances have no influence on the Timeout.
+
+	MinInterval and MaxInterval define the minimum and maximum advertising
+	intervals, with units as number of .625ms advertising slots. The Max
+	interval is expected to be greater than or equal to the Min interval,
+	and both must have values in the range [0x000020, 0xFFFFFF]. If either
+	condition is not met, the registration will fail.
+
+	The provided Tx Power parameter will only be used if the controller
+	supports it, which can be determined by the presence of the
+	CanSetTxPower member of the Read Advertising Features command.
+
+	The acceptable range for requested Tx Power is defined in the spec
+	(Version 5.2 | Vol 4, Part E, page 2585) to be [-127, +20] dBm, and the
+	controller will select a power value up to the requested one. The
+	transmission power selected by the controller is not guaranteed
+	to match the requested one, so the reply will contain the power
+	chosen by the controller. If the requested Tx Power is outside
+	the valid range, the registration will fail.
+
+	Re-adding an already existing instance (i.e. issuing the Add Extended
+	Advertising Parameters command with an Instance identifier of an
+	existing instance) will update that instance's configuration. In this
+	case where no new instance is added, no Advertising Added event will
+	be generated. However, if the update of the instance fails, the
+	instance will be removed, and an Advertising Removed event will be
+	generated.
+
+	An instance being added or changed while another instance is
+	being advertised will not be visible immediately but only when
+	the new/changed instance is being scheduled by the round robin
+	advertising algorithm.
+
+	Changes to an instance that is currently being advertised will
+	cancel that instance and switch to the next instance. The changes
+	will be visible the next time the instance is scheduled for
+	advertising. In case a single instance is active, this means
+	that changes will be visible right away.
+
+	The MaxAdvDataLen return parameter indicates how large the data
+	payload can be in the subsequent Add Extended Advertising Data
+	Command, as it accounts for the data required for the selected flags.
+	Similarly, the MaxScanRspLen return parameter indicates how large
+	the scan response can be.
+
+	LE must already be enabled, and the controller must be powered,
+	otherwise a "rejected" status will be returned.
+
+	This command generates a Command Complete event on success or a
+	Command Status event on failure.
+
+	Possible errors:	Failed
+				Rejected
+				Not Supported
+				Invalid Parameters
+				Busy
+
+
+Add Extended Advertising Data Command
+=====================================
+
+	Command Code:		0x0055
+	Controller Index:	<controller id>
+	Command Parameters:	Instance (1 Octet)
+				Advertising Data Length (1 Octet)
+				Scan Response Length (1 Octet)
+				Advertising Data (0-255 Octets)
+				Scan Response (0-255 Octets)
+	Return Parameters:	Instance (1 Octet)
+
+	The Add Extended Advertising Data command is used to update the
+	advertising data of an existing advertising instance known to the
+	kernel. It is expected to be called after an Add Extended Advertising
+	Parameters command, as part of the advertisement registration
+	process.
+
+	If extended advertising is available, this call will initiate HCI
+	commands to set the instance's advertising data, set scan response
+	data, and then enable the instance. If extended advertising is
+	unavailable, the advertising instance structure maintained in kernel
+	will have its advertising data and scan response updated, and the
+	instance will either be scheduled immediately or left in the queue
+	for later advertisement as part of round-robin advertisement rotation
+	in software.
+
+	If Scan_Rsp_Len is zero and the flags defined in Add Extended
+	Advertising Parameters command do not have connectable flag set and
+	the global connectable setting is off, then non-connectable
+	advertising is used. If Scan_Rsp_Len is larger than zero and
+	connectable flag is not set and the global advertising is off,
+	then scannable advertising is used. This small difference is
+	supported to provide less air traffic for devices implementing
+	broadcaster role.
+
+	If the Instance provided does not match a known instance, or if the
+	provided advertising data or scan response are in an unrecognized
+	format, an "Invalid Parameters" status will be returned.
+
+	If a "Set LE" or Advertising command is still in progress, a "Busy"
+	status will be returned.
+
+	If the controller is not powered, a "rejected" status will be returned.
+
+	This command generates a Command Complete event on success or a
+	Command Status event on failure.
+
+	Possible errors:	Failed
+				Rejected
+				Invalid Parameters
+				Busy
+
+
 Command Complete Event
 ======================
 
-- 
2.29.1.341.ge80a0c044ae-goog

