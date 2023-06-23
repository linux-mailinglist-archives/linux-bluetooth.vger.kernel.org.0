Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61A9773ACD8
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Jun 2023 01:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbjFVXDJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 22 Jun 2023 19:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjFVXDH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 22 Jun 2023 19:03:07 -0400
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5821BE7
        for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jun 2023 16:03:07 -0700 (PDT)
Received: from github.com (hubbernetes-node-f04abb1.va3-iad.github.net [10.48.15.64])
        by smtp.github.com (Postfix) with ESMTPA id 7472641135
        for <linux-bluetooth@vger.kernel.org>; Thu, 22 Jun 2023 16:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2023; t=1687474986;
        bh=mAvrtK8Mb6Tx5/88hPmkCJR1OYA1NtRZAENNCXPGi8g=;
        h=Date:From:To:Subject:From;
        b=BQm6tz+ClVqLm1xej2Ok4SYNZvcgFDHJDGwwkTE470mU/lIylNZpAGpi1hWzC1+XS
         9NO+LMg85LvVD8wvg/77ZTE4DMfxK3W85Vk/qCv+hkySf2s51gw/261G4NTmL7NOjh
         +4BHOgqrmftDJv3BDNZCv6nEoIXN21/c7hNtbXew=
Date:   Thu, 22 Jun 2023 16:03:06 -0700
From:   Luiz Augusto von Dentz <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/37042c-97a07d@github.com>
Subject: [bluez/bluez] 97a07d: btdev: Fix LE CIS Established Event
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: 97a07d8485a3235cbefe9e78c5e596faf5c6be31
      https://github.com/bluez/bluez/commit/97a07d8485a3235cbefe9e78c5e59=
6faf5c6be31
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2023-06-22 (Thu, 22 Jun 2023)

  Changed paths:
    M emulator/btdev.c

  Log Message:
  -----------
  btdev: Fix LE CIS Established Event

LE CIS Established Event Transport Latency shall follow the formula from
the spec:

 BLUETOOTH CORE SPECIFICATION Version 5.3 | Vol 6, Part G
 page 3050:

 Transport_Latency_C_To_P =3D CIG_Sync_Delay + FT_C_To_P =C3=97
 ISO_Interval - SDU_Interval_C_To_P
 Transport_Latency_P_To_C =3D CIG_Sync_Delay + FT_P_To_C =C3=97
 ISO_Interval - SDU_Interval_P_To_C


