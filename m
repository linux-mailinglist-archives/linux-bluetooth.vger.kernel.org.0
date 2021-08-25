Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388303F7AF1
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Aug 2021 18:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232606AbhHYQwr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 Aug 2021 12:52:47 -0400
Received: from vern.gendns.com ([98.142.107.122]:36502 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229791AbhHYQwr (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 Aug 2021 12:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7fyuXHhY2+Pw+Tm9J6AbhvkKGLC+kylcUbFbwLzUBhI=; b=f8FfYny3Lva5KeyKF4GlwQ4xaX
        7K9xEwnxEPBi6F9daEHSenJ10SxVVyF6ezJveuQFmQhESQubVJWZdX7nifqvKF59WSzYxIqreQfD6
        R+3ErKOfWUlAQjjcvHZb2W+U3F/YGIdxL5lQfS0Z84O+GXifiqWzcybncGSs4r5fs01PFfxG+W93M
        I5fQaT5Zw3AKITsDRqEY0Q0zUXDQCXx/lMaAyjqxP7kDWxLH3S91erT90COW0eimz1RW6mNQ/vTXB
        t2dBdE5gBAGc5+37Na1CxpcbpAJH5c5cfM2pPYvgo2pjFKguWIxTrVXeL45YW8guOyjNvRjOLoFtE
        o6dFCFEA==;
Received: from [2600:1700:4830:1658::fb2] (port=60238 helo=freyr.lechnology.com)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <david@lechnology.com>)
        id 1mIw7x-0006LP-VT; Wed, 25 Aug 2021 12:51:58 -0400
From:   David Lechner <david@lechnology.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     David Lechner <david@lechnology.com>
Subject: [PATCH BlueZ v2 0/2] device: fix advertising data UUIDs ignored when Cache = yes
Date:   Wed, 25 Aug 2021 11:51:23 -0500
Message-Id: <20210825165125.2675544-1-david@lechnology.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When [GATT] Cache = yes is set in configuration BlueZ does not use
cached UUIDs for the list of service UUIDs. However, it doesn't clear
the in-memory list of UUIDs received from advertising data, so when
a device is scanned, connected and disconnected, the internal state
still reflects that the UUIDs from the advertising data have already
been handled. device_add_eir_uuids() ignored the UUIDs from the
advertising data because both dev->le_state.svc_resolved == true and
dev->eir_uuids still contains the UUIDs from the previous scan session.

v2 changes:
* split into two patches
* always clear eir_uuids list on disconnect
* move le_state.svc_resolved = false to gatt_cache_cleanup()

Issue: https://github.com/bluez/bluez/issues/192

David Lechner (2):
  device: clear eir_uuids list on disconnect
  device: set le_state.svc_resolved = false in gatt_cache_cleanup()

 src/device.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.25.1

