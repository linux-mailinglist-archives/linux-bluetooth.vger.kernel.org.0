Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D02181A2EF8
	for <lists+linux-bluetooth@lfdr.de>; Thu,  9 Apr 2020 08:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgDIGFz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 9 Apr 2020 02:05:55 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:60244 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgDIGFz (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 9 Apr 2020 02:05:55 -0400
Received: from localhost.localdomain (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6E1A5CECF2
        for <linux-bluetooth@vger.kernel.org>; Thu,  9 Apr 2020 08:15:29 +0200 (CEST)
From:   Marcel Holtmann <marcel@holtmann.org>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH 0/4] Cleanup patches for LL Privacy work
Date:   Thu,  9 Apr 2020 08:05:46 +0200
Message-Id: <cover.1586412226.git.marcel@holtmann.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

These are are few cleanup patches before the LL Privacy work can
continue.

Marcel Holtmann (4):
  Bluetooth: Sort list of LE features constants
  Bluetooth: Use extra variable to make code more readable
  Bluetooth: Enable LE Enhanced Connection Complete event.
  Bluetooth: Clear HCI_LL_RPA_RESOLUTION flag on reset

 include/net/bluetooth/hci.h      | 5 ++---
 include/net/bluetooth/hci_core.h | 1 +
 net/bluetooth/hci_core.c         | 8 ++++++++
 net/bluetooth/hci_request.c      | 4 +++-
 4 files changed, 14 insertions(+), 4 deletions(-)

-- 
2.25.2

