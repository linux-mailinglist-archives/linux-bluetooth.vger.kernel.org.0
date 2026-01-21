Return-Path: <linux-bluetooth+bounces-18283-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKYJKNdGcGnXXAAAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18283-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 04:24:07 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0809050611
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 04:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC4794EF920
	for <lists+linux-bluetooth@lfdr.de>; Wed, 21 Jan 2026 03:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99413590B7;
	Wed, 21 Jan 2026 03:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=github.com header.i=@github.com header.b="l3Zh3sgu"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-17.smtp.github.com (out-17.smtp.github.com [192.30.252.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9862329E43
	for <linux-bluetooth@vger.kernel.org>; Wed, 21 Jan 2026 03:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.30.252.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768965836; cv=none; b=HftbKnJOgcrrbUKRTwmnpH4db4L9CDTb1AJreJ73K6a4GyFkUGqBbY8O6QyX3arLq7Pa4/V+ObnETPXdeQFu14g09AbCkZJ70mFnJnDHsZb/EGYOghpg//1zWBnnyrSIUo3PIfY9WSx31JKw8rvS4c+30BI9VXX196DHyRLk6xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768965836; c=relaxed/simple;
	bh=efdcELqGZNU8OjUQAnNfTiinbpsgSlUg05gPO406S7Y=;
	h=Date:From:To:Message-ID:Subject:Mime-Version:Content-Type; b=ME19O/BbJU3AOQjB6kMQ69ZmqSXeuXZaGxTvcKTL27yu+PX47/GREEyMM8D9HVHk531h6Z0dmzdKUlflnAbSXDoWfTx0JV90mMlsL4uqP4Shqd4d+XIqj2qUMffb1aOa+x6uissEHIvhRBwosUEVS6YlMcn0hLhxZmnX4B50pkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com; spf=pass smtp.mailfrom=github.com; dkim=pass (1024-bit key) header.d=github.com header.i=@github.com header.b=l3Zh3sgu; arc=none smtp.client-ip=192.30.252.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=github.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=github.com
Received: from github.com (hubbernetes-node-a43ab28.va3-iad.github.net [10.48.15.38])
	by smtp.github.com (Postfix) with ESMTPA id 1DE044E05F0
	for <linux-bluetooth@vger.kernel.org>; Tue, 20 Jan 2026 19:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=github.com;
	s=pf2023; t=1768965834;
	bh=Y3rDEWAYG/4hPUxhQnWT6d/ReCMRuvlpx1oIJCQhzMg=;
	h=Date:From:To:Subject:List-Unsubscribe:From;
	b=l3Zh3sguqjvJ4n7PnupWPGwj2+UPPMtBx25cYDd3L4k6O/BhA1zMM838x/SUjyD+u
	 srIYV2OpQjw80k/5B0YpeDx5jBcL9F2OALJOanUC5R7dEEoalWr/UeQZ5fK8oGGCOX
	 bpZTWxVhBDVYJYyG9I2OdrHr+iVjjEh11AM+06ag=
Date: Tue, 20 Jan 2026 19:23:54 -0800
From: "github-actions[bot]" <noreply@github.com>
To: linux-bluetooth@vger.kernel.org
Message-ID: <bluez/bluez/push/refs/heads/1044931/000000-7e5b9a@github.com>
Subject: [bluez/bluez] 7e5b9a: bap: reduce ISO sync timeout to 3.6 secs
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
X-Spamd-Result: default: False [2.24 / 15.00];
	DMARC_POLICY_REJECT(2.00)[github.com : No valid SPF,reject];
	R_DKIM_REJECT(1.00)[github.com:s=pf2023];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[github.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-18283-lists,linux-bluetooth=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[noreply@github.com,linux-bluetooth@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,amlogic.com:email]
X-Rspamd-Queue-Id: 0809050611
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

  Branch: refs/heads/1044931
  Home:   https://github.com/bluez/bluez
  Commit: 7e5b9a0f6e6e793a356cf50f892a1746d31f510d
      https://github.com/bluez/bluez/commit/7e5b9a0f6e6e793a356cf50f892a1746d31f510d
  Author: Yang Li <yang.li@amlogic.com>
  Date:   2026-01-21 (Wed, 21 Jan 2026)

  Changed paths:
    M lib/bluetooth/bluetooth.h

  Log Message:
  -----------
  bap: reduce ISO sync timeout to 3.6 secs

The ISO sync timeout was previously set to 20 seconds,
which is too long for PA sync. This could leave the userspace
flow pending for an extended period of time.

Signed-off-by: Yang Li <yang.li@amlogic.com>



To unsubscribe from these emails, change your notification settings at https://github.com/bluez/bluez/settings/notifications

