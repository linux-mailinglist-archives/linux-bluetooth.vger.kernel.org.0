Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F916257E4E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 31 Aug 2020 18:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbgHaQLi (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 31 Aug 2020 12:11:38 -0400
Received: from sender4-op-o11.zoho.com ([136.143.188.11]:17166 "EHLO
        sender4-op-o11.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbgHaQLg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 31 Aug 2020 12:11:36 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1598890293; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=O5DzV0rHwHMSbxw19SwOqV/F2ihuZ6Lq5dBgzMGe8XnMO0gsV60f634PCvWPtE82fodWfw9skLt7w+EQG2y3nyi+/ZmbiOtCoYwKm2A/Fiwp1v4fZPPwIHvw8oUnH2QdDMoeeXez2m9N7mRcv4vWlz1I5i9sYUeEHeawImO+xZA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1598890293; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=U7zU+T4UJWebKnXuLS0gsJ3b4OHTI28SbTdILGqbn8s=; 
        b=ewjx1AdUEsPa/21pr6HFo6u7xRTtspiea3In2Ny2OubQvjmh1ssbturyDuylLriR6FTS35m+KfM+soLFWg2mScIHOZ20hOg4lkfSyGx/YxXiaibrLk0R9/L4uGfXJEY0x4v8OJAMSB2avFpfzT28HKU383oDo/Pp0K7NJ4qsx7M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=dptechnics.com;
        spf=pass  smtp.mailfrom=daan@dptechnics.com;
        dmarc=pass header.from=<daan@dptechnics.com> header.from=<daan@dptechnics.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1598890293;
        s=zoho; d=dptechnics.com; i=daan@dptechnics.com;
        h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=U7zU+T4UJWebKnXuLS0gsJ3b4OHTI28SbTdILGqbn8s=;
        b=O+1iS6ZMgdZ+Ea0q6THZjAPrMT2IvDfFgQy2qn2+U1gzyLoHGIlEpaEwJJwQS1z9
        rAHnqRQ2EHSKFkAHYhUT5n8TREaApDnUKx4zXk236FjkKurs73y7eAVegIDMO6LA1sn
        ZpyNJmNAdculwAOfxnqYH16ykAl5zbwkH2UJ9vGc=
Received: from daan-devbox.dptechnics.local (178-116-74-88.access.telenet.be [178.116.74.88]) by mx.zohomail.com
        with SMTPS id 1598890288445151.68956055259991; Mon, 31 Aug 2020 09:11:28 -0700 (PDT)
From:   Daan Pape <daan@dptechnics.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Daan Pape <daan@dptechnics.com>
Message-ID: <20200831161116.15975-1-daan@dptechnics.com>
Subject: [PATCH BlueZ 0/1] Mesh HCI interface init scan interval fixed
Date:   Mon, 31 Aug 2020 18:11:15 +0200
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

The HCI initialization function of bluetooth-meshd was not converting
to the correct byte order when initializing the LE Scan Parameters. This
is now fixed.

Daan Pape (1):
  Mesh HCI interface init scan interval fixed

 AUTHORS                | 1 +
 mesh/mesh-io-generic.c | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

--=20
2.25.1


