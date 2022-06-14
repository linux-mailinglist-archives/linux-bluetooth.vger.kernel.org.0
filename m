Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8BE554BCAB
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Jun 2022 23:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiFNVSX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 14 Jun 2022 17:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353559AbiFNVSX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 14 Jun 2022 17:18:23 -0400
Received: from smtp.github.com (out-17.smtp.github.com [192.30.252.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 827134D686
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 Jun 2022 14:18:17 -0700 (PDT)
Received: from github.com (hubbernetes-node-b0a74a3.va3-iad.github.net [10.48.13.28])
        by smtp.github.com (Postfix) with ESMTPA id AC29E5C0216
        for <linux-bluetooth@vger.kernel.org>; Tue, 14 Jun 2022 14:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1655241496;
        bh=41n6yobnZ8GaOY6K/zYB+SBsUR+vL61GTl7a/JwLupE=;
        h=Date:From:To:Subject:From;
        b=IhVe8qOKv5NgDh/MP065G+GCpKVovr8tG/i2YkK4lezn19uKiXlv6Rw8BR3VBG5oh
         qBgQCASqKnEQxJQHcaxyZ+a/Y4DA6XO2WMZHmLMB4iJ8ebnm32yfPCdc/faeEvp5Jy
         kME2xNcXugne2ClvRv/nCmmTrbOcIi4HF9gnT78s=
Date:   Tue, 14 Jun 2022 14:18:16 -0700
From:   Brian Gix <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/12d6fd-5cc085@github.com>
Subject: [bluez/bluez] 3fb4e1: device: Add connectable flag to bearer state
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master=0D
  Home:   https://github.com/bluez/bluez=0D
  Commit: 3fb4e1cca2eaddc413d1ebed9d862084351efdbc=0D
      https://github.com/bluez/bluez/commit/3fb4e1cca2eaddc413d1ebed9d862=
084351efdbc=0D
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>=0D
  Date:   2022-06-13 (Mon, 13 Jun 2022)=0D
=0D
  Changed paths:=0D
    M src/adapter.c=0D
    M src/device.c=0D
    M src/device.h=0D
=0D
  Log Message:=0D
  -----------=0D
  device: Add connectable flag to bearer state=0D
=0D
This adds connectable flag to state so it can be used to detect which is=0D=

the last seen connectable bearer.=0D
=0D
=0D
  Commit: ef14e6eaa7e698d0f62feed3eecd0cae74484d7b=0D
      https://github.com/bluez/bluez/commit/ef14e6eaa7e698d0f62feed3eecd0=
cae74484d7b=0D
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>=0D
  Date:   2022-06-13 (Mon, 13 Jun 2022)=0D
=0D
  Changed paths:=0D
    M monitor/att.c=0D
=0D
  Log Message:=0D
  -----------=0D
  monitor/att: Fix decoding for notifications=0D
=0D
=0D
  Commit: 0da5c68413d6ed3ff8afb3638e0a88914bae7153=0D
      https://github.com/bluez/bluez/commit/0da5c68413d6ed3ff8afb3638e0a8=
8914bae7153=0D
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>=0D
  Date:   2022-06-14 (Tue, 14 Jun 2022)=0D
=0D
  Changed paths:=0D
    M lib/mgmt.h=0D
    M src/advertising.c=0D
=0D
  Log Message:=0D
  -----------=0D
  advertising: Fix attempting to set scan_rsp=0D
=0D
BLUETOOTH CORE SPECIFICATION Version 5.3 | Vol 4, Part E page 2450=0D
=0D
  =E2=80=A2 If extended advertising PDU types are being used (bit 4 =3D 0=
) then:=0D
  The advertisement shall not be both connectable and scannable.=0D
=0D
So instead this attempts to set name as part of Advertising Data rather=0D=

then setting it as Scan Response:=0D
=0D
bluetoothctl> advertise.secondary 2M=0D
bluetoothctl> advertise.name Intel-3=0D
bluetoothctl> advertise on=0D
=0D
< HCI Command: LE Set Extended Advertising Parameters (0x08|0x0036) plen =
25=0D
        Handle: 0x01=0D
        Properties: 0x0001=0D
          Connectable=0D
        Min advertising interval: 1280.000 msec (0x0800)=0D
        Max advertising interval: 1280.000 msec (0x0800)=0D
        Channel map: 37, 38, 39 (0x07)=0D
        Own address type: Public (0x00)=0D
        Peer address type: Public (0x00)=0D
        Peer address: 00:00:00:00:00:00 (OUI 00-00-00)=0D
        Filter policy: Allow Scan Request from Any, Allow Connect Request=
 from Any (0x00)=0D
        TX power: Host has no preference (0x7f)=0D
        Primary PHY: LE 1M (0x01)=0D
        Secondary max skip: 0x00=0D
        Secondary PHY: LE 2M (0x02)=0D
        SID: 0x00=0D
        Scan request notifications: Disabled (0x00)=0D
> HCI Event: Command Complete (0x0e) plen 5=0D
      LE Set Extended Advertising Parameters (0x08|0x0036) ncmd 1=0D
        Status: Success (0x00)=0D
        TX power (selected): 7 dbm (0x07)=0D
< HCI Command: LE Set Extended Advertising Data (0x08|0x0037) plen 4=0D
        Handle: 0x01=0D
        Operation: Complete extended advertising data (0x03)=0D
        Fragment preference: Minimize fragmentation (0x01)=0D
        Data length: 0x00=0D
@ MGMT Event: Command Complete (0x0001) plen 7=0D
      Add Extended Advertising Parameters (0x0054) plen 4=0D
        Status: Success (0x00)=0D
        Instance: 1=0D
        TX power: 7 dbm (0x07)=0D
        Available adv data len: 31=0D
        Available scan rsp data len: 31=0D
> HCI Event: Command Complete (0x0e) plen 4=0D
      LE Set Extended Advertising Data (0x08|0x0037) ncmd 1=0D
        Status: Success (0x00)=0D
@ MGMT Command: Add Extended Advertising Data (0x0055) plen 23=0D
        Instance: 1=0D
        Advertising data length: 12=0D
        Name (complete): Intel-3=0D
        Flags: 0x06=0D
          LE General Discoverable Mode=0D
          BR/EDR Not Supported=0D
        Scan response length: 0=0D
< HCI Command: LE Set Extended Advertising Data (0x08|0x0037) plen 16=0D
        Handle: 0x01=0D
        Operation: Complete extended advertising data (0x03)=0D
        Fragment preference: Minimize fragmentation (0x01)=0D
        Data length: 0x0c=0D
        Name (complete): Intel-3=0D
        Flags: 0x06=0D
          LE General Discoverable Mode=0D
          BR/EDR Not Supported=0D
> HCI Event: Command Complete (0x0e) plen 4=0D
      LE Set Extended Advertising Data (0x08|0x0037) ncmd 1=0D
        Status: Success (0x00)=0D
< HCI Command: LE Set Extended Scan Response Data (0x08|0x0038) plen 4=0D=

        Handle: 0x01=0D
        Operation: Complete scan response data (0x03)=0D
        Fragment preference: Minimize fragmentation (0x01)=0D
        Data length: 0x00=0D
> HCI Event: Command Complete (0x0e) plen 4=0D
      LE Set Extended Scan Response Data (0x08|0x0038) ncmd 1=0D
        Status: Success (0x00)=0D
< HCI Command: LE Set Extended Advertising Enable (0x08|0x0039) plen 6=0D=

        Extended advertising: Enabled (0x01)=0D
        Number of sets: 1 (0x01)=0D
        Entry 0=0D
          Handle: 0x01=0D
          Duration: 0 ms (0x00)=0D
          Max ext adv events: 0=0D
> HCI Event: Command Complete (0x0e) plen 4=0D
      LE Set Extended Advertising Enable (0x08|0x0039) ncmd 2=0D
        Status: Success (0x00)=0D
@ MGMT Event: Command Complete (0x0001) plen 4=0D
      Add Extended Advertising Data (0x0055) plen 1=0D
        Status: Success (0x00)=0D
        Instance: 1=0D
=0D
=0D
  Commit: 5cc08527c0aaeb47305f3637f064efc80d3f85f1=0D
      https://github.com/bluez/bluez/commit/5cc08527c0aaeb47305f3637f064e=
fc80d3f85f1=0D
  Author: Brian Gix <brian.gix@intel.com>=0D
  Date:   2022-06-14 (Tue, 14 Jun 2022)=0D
=0D
  Changed paths:=0D
    M mesh/keyring.c=0D
=0D
  Log Message:=0D
  -----------=0D
  mesh: Fix keyring snprintf usage range checking=0D
=0D
snprintf performs it's own range checking and returns a negative value=0D=

if string construction fails. Not checking the return value throws a=0D
warning at compile time on GCC 12 and later. This patch removes=0D
redundent range chacking and checks all snprintf return values.=0D
=0D
=0D
Compare: https://github.com/bluez/bluez/compare/12d6fd9b9ddc...5cc08527c0=
aa=0D
