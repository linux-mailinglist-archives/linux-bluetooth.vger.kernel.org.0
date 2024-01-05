Return-Path: <linux-bluetooth+bounces-929-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A65A825B72
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jan 2024 21:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF614B23FBB
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Jan 2024 20:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572A636093;
	Fri,  5 Jan 2024 20:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b="WDPIIF9M"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-21.smtp.github.com (out-21.smtp.github.com [192.30.252.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A530E35F1E
	for <linux-bluetooth@vger.kernel.org>; Fri,  5 Jan 2024 20:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-085222f.ac4-iad.github.net [10.52.156.31])
	by smtp.github.com (Postfix) with ESMTPA id A7868700817
	for <linux-bluetooth@vger.kernel.org>; Fri,  5 Jan 2024 12:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1704485695;
	bh=pcatFn3yRQg4SxAtY6WLtu6rngbbu7w46ICh+6QjOJs=;
	h=Date:From:To:Subject:From;
	b=WDPIIF9MU3sna4bqEiY9ohlU5cT9nv3MVGwPYmd4OPSxVAVB1XfX7T63MttgOOUVD
	 pIReOgGsed1kwq3nWH9zMOAygAKu1KwVP1YoKSXzGL6FuzL/vDVLzWcGoHbhWWiJbR
	 SKrt9/VdXt/ybB1+xhH5e8r+f6Dutd8AW/yuRKgA=
Date: Fri, 05 Jan 2024 12:14:55 -0800
From: Luiz Augusto von Dentz <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/master/1c321b-c85546@github.com>
Subject: [bluez/bluez] c85546: client/player: Adjust the SDU size based on the
 nu...
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
X-GitHub-Recipient-Address: linux-bluetooth@vger.kernel.org
X-Auto-Response-Suppress: All

  Branch: refs/heads/master
  Home:   https://github.com/bluez/bluez
  Commit: c85546cba715afee020e61bd0a44499e618d0371
      https://github.com/bluez/bluez/commit/c85546cba715afee020e61bd0a44499e618d0371
  Author: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
  Date:   2024-01-04 (Thu, 04 Jan 2024)

  Changed paths:
    M client/player.c

  Log Message:
  -----------
  client/player: Adjust the SDU size based on the number of locations

If there are multiple locations, aka. multiplexing, being selected then
that should be accounted properly on the SDU size since the presets only
account for just 1 channel.

Fixes: https://github.com/bluez/bluez/issues/662



