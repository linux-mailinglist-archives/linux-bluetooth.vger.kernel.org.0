Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5923C507F03
	for <lists+linux-bluetooth@lfdr.de>; Wed, 20 Apr 2022 04:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353224AbiDTCqz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 19 Apr 2022 22:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348743AbiDTCqy (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 19 Apr 2022 22:46:54 -0400
Received: from smtp.github.com (out-18.smtp.github.com [192.30.252.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5721838189
        for <linux-bluetooth@vger.kernel.org>; Tue, 19 Apr 2022 19:44:08 -0700 (PDT)
Received: from github.com (hubbernetes-node-364c5f9.va3-iad.github.net [10.48.125.69])
        by smtp.github.com (Postfix) with ESMTPA id A4EBA3407F7
        for <linux-bluetooth@vger.kernel.org>; Tue, 19 Apr 2022 19:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
        s=pf2014; t=1650422647;
        bh=sk9q7Fj88a65LSRsWBh+CsfCyQOSR2zlhxPdhEdqnwM=;
        h=Date:From:To:Subject:From;
        b=voEoK1ydKmF0oiJKj+cmXsoBxfsPqvNp6AVYDsgK+s8NmxG8BN2GiiqLrnWgxOgfS
         F4EEHbtGijiwKDQXJlT+itOKNLB3o9hBlQ5jjbciSjFglXDLHMpCsoJxByUs5mwcV6
         Qe/JixkiKq5QVX+tOfLd96effO7XoVGjMQjT7I4o=
Date:   Tue, 19 Apr 2022 19:44:07 -0700
From:   Diego Rondini <noreply@github.com>
To:     linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/b2db8f-a1939b@github.com>
Subject: [bluez/bluez] edc69d: bluetooth.service: Set StateDirectoryMode
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: edc69d253445fdb5c1562713c160b4731260cc07
      https://github.com/bluez/bluez/commit/edc69d253445fdb5c1562713c160b4731260cc07
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-04-19 (Tue, 19 Apr 2022)

  Changed paths:
    M src/bluetooth.service.in

  Log Message:
  -----------
  bluetooth.service: Set StateDirectoryMode

This sets StateDirectoryMode to 0700 as it is the current mode used for
creating files inside the storage and it is different than the default
systemd uses which is 0755:

[1] https://www.freedesktop.org/software/systemd/man/systemd.exec.html#RuntimeDirectoryMode=


  Commit: 00cfb36e20e3c35db2150e7d0351ad7b8442e2d8
      https://github.com/bluez/bluez/commit/00cfb36e20e3c35db2150e7d0351ad7b8442e2d8
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-04-19 (Tue, 19 Apr 2022)

  Changed paths:
    M src/bluetooth.service.in

  Log Message:
  -----------
  bluetooth.service: Set ConfigurationDirectoryMode

This sets ConfigurationDirectoryMode to 0555 to really enforce the
ConfigurationDirectory to be read-only [1].

[1] https://github.com/bluez/bluez/issues/329#issuecomment-1102459104


  Commit: 832b594a25051b11345c3491dd20958c22278dfe
      https://github.com/bluez/bluez/commit/832b594a25051b11345c3491dd20958c22278dfe
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2022-04-19 (Tue, 19 Apr 2022)

  Changed paths:
    M doc/settings-storage.txt

  Log Message:
  -----------
  settings-storage: Document use of StateDirectory

This documents the use of StateDirecory environment variable which
overwrites the default storage diretory when set.


  Commit: a1939bd51e0faba9a8550eea2590d99cb63a33c1
      https://github.com/bluez/bluez/commit/a1939bd51e0faba9a8550eea2590d99cb63a33c1
  Author: Diego Rondini <diego.rondini@kynetics.com>
  Date:   2022-04-19 (Tue, 19 Apr 2022)

  Changed paths:
    M test/list-devices
    M test/map-client
    M test/monitor-bluetooth
    M test/test-adapter
    M test/test-device
    M test/test-discovery
    M test/test-health
    M test/test-health-sink

  Log Message:
  -----------
  test: changes for Python3

Remove some leftover usage of Python2 code. In particular replace
iteritems() with items() to fix the following error:

AttributeError: 'dbus.Dictionary' object has no attribute 'iteritems'


Compare: https://github.com/bluez/bluez/compare/b2db8f0e3a69...a1939bd51e0f
