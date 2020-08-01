Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B4F235060
	for <lists+linux-bluetooth@lfdr.de>; Sat,  1 Aug 2020 06:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725290AbgHAE2K (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 1 Aug 2020 00:28:10 -0400
Received: from hoster906.com ([192.252.156.27]:36526 "EHLO hoster906.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725280AbgHAE2K (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 1 Aug 2020 00:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=mnmoran.org; h=from
        :subject:to:message-id:date:mime-version:content-type
        :content-transfer-encoding; s=dkim; bh=tUGC/4kqFAdss6ER3xbfTPwiA
        cVcsdUrk59/+z2PlcU=; b=dY5w/VzYvSnQkHZI1akXMfBuOA8lT5V1qKBp1pkrd
        vTe3KZKmaMyoL3EByFGrKfurm0an+Aw9b9c3o3/Q1cH6fGhHbXGIE+Gi92gkW4S0
        8BYCWcktbYh7Jx/rK7misudK6Xhzq8W44RNFYTuu4phkfrpM+rlLqEmAjr+yGIz7
        BQ=
Received: (qmail 30737 invoked by uid 503); 1 Aug 2020 04:28:08 -0000
Received: from unknown (HELO ?192.168.254.79?) (pop-before-smtp@162.39.210.203)
  by hoster906.com with ESMTPA; 1 Aug 2020 04:28:08 -0000
From:   "Michael N. Moran" <mike@mnmoran.org>
Subject: [PATCH BlueZ 0/1] mesh: Add strings for SIG Model IDs.
To:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Message-ID: <bc557704-e59c-d83b-9d5a-698ef37b23a9@mnmoran.org>
Date:   Sat, 1 Aug 2020 00:28:03 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

My first BlueZ patch.

This patch adds a utility function returning a string
describing a SIG Model ID and uses this function
for in the mesh-cfgclient in the list-nodes command
output and in the display of received composition data.

The strings were taken directly from the Bluetooth Mesh Profile
and Mesh Model specifications.

Michael N. Moran (1):
   Add strings for SIG Model IDs.

  tools/mesh/cfgcli.c |  3 ++-
  tools/mesh/remote.c |  5 ++--
  tools/mesh/util.c   | 64 
+++++++++++++++++++++++++++++++++++++++++++++
  tools/mesh/util.h   |  1 +
  4 files changed, 70 insertions(+), 3 deletions(-)

-- 
2.26.2

