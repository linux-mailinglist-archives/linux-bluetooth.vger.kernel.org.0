Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C73DC4F41F
	for <lists+linux-bluetooth@lfdr.de>; Sat, 22 Jun 2019 09:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfFVHDo (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 22 Jun 2019 03:03:44 -0400
Received: from mga17.intel.com ([192.55.52.151]:27028 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbfFVHDo (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 22 Jun 2019 03:03:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jun 2019 00:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,403,1557212400"; 
   d="scan'208";a="244202492"
Received: from spoorthi-h97m-d3h.iind.intel.com ([10.223.96.21])
  by orsmga001.jf.intel.com with ESMTP; 22 Jun 2019 00:03:42 -0700
From:   spoorthix.k@intel.com
To:     marcel@holtmann.org
Cc:     linux-bluetooth@vger.kernel.org, spoorthix.k@intel.com
Subject: [PATCH] v7 Add support for LE ping feature
Date:   Sat, 22 Jun 2019 12:43:17 +0530
Message-Id: <1561187597-10225-1-git-send-email-spoorthix.k@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <E76A1D30-87DF-4A83-B9AD-C7DCC193EB6C@holtmann.org>
References: <E76A1D30-87DF-4A83-B9AD-C7DCC193EB6C@holtmann.org>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Spoorthi Ravishankar Koppad <spoorthix.k@intel.com>

Changes made to add HCI Write Authenticated Payload timeout
command for LE Ping feature.
As per the Core Specification 5.0 Volume 2 Part E Section 7.3.94,
the following code changes implements
HCI Write Authenticated Payload timeout command for LE Ping feature.

This email is a Gentle Reminder for the LE Ping implementation, Please let me know the updates ASAP.
