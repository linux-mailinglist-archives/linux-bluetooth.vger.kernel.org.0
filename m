Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11D084F421
	for <lists+linux-bluetooth@lfdr.de>; Sat, 22 Jun 2019 09:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfFVHKj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 22 Jun 2019 03:10:39 -0400
Received: from mga02.intel.com ([134.134.136.20]:64344 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726083AbfFVHKj (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 22 Jun 2019 03:10:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Jun 2019 00:10:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,403,1557212400"; 
   d="scan'208";a="336044899"
Received: from spoorthi-h97m-d3h.iind.intel.com ([10.223.96.21])
  by orsmga005.jf.intel.com with ESMTP; 22 Jun 2019 00:10:36 -0700
From:   spoorthix.k@intel.com
To:     spoorthix.k@intel.com
Cc:     linux-bluetooth@vger.kernel.org
Subject: [PATCH] LE Privacy implementation
Date:   Sat, 22 Jun 2019 12:50:13 +0530
Message-Id: <1561188013-10289-1-git-send-email-spoorthix.k@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1561108901-9475-1-git-send-email-spoorthix.k@intel.com>
References: <1561108901-9475-1-git-send-email-spoorthix.k@intel.com>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Spoorthi Ravishankar Koppad <spoorthix.k@intel.com>

As per Core specification 5.0, Vol 2, Part E, Section 7.8.38,
following code changes implements LE add device to Resolving List.

This is Gentle Reminder mail to know the updates of the above mentioned patch, for Link layer privacy.
