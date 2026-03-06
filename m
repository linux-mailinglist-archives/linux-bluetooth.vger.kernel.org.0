Return-Path: <linux-bluetooth+bounces-19896-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONf3B+cyq2n2agEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19896-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 21:02:47 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 620162275B1
	for <lists+linux-bluetooth@lfdr.de>; Fri, 06 Mar 2026 21:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0AC30303F57F
	for <lists+linux-bluetooth@lfdr.de>; Fri,  6 Mar 2026 20:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97DA2F3C22;
	Fri,  6 Mar 2026 20:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sytU4DOj"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F8C2F83CB
	for <linux-bluetooth@vger.kernel.org>; Fri,  6 Mar 2026 20:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772827361; cv=none; b=T7vYWK20X0tovVGZuaAKwOrMKrzeUVTptQEXh5gGnEG7jOxidSFBLG8aWJO8KjiD/wIDrQUSBJeQl4nk+4FVH8DoWZR/vISuqfJjBWu8ydbn4zdLJFlutl6IZqf2MeqfG/GccdIavn9Zy3NKeHwwgcMYoVRXoPRUYwoCk8u/dCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772827361; c=relaxed/simple;
	bh=iuQBRoAInptpj2rBp9N6A83haFDkCkW+KXImlw/TI/Y=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=qLCIYzFnMHUIpD2/oP94VmQHQOONlnavNg+VtwyDXU07wCKCtEsGEd8LfimeFkFjn1LoqhSs+NpOlOo6fer9nghtKQMYEZTmcYaQCseNHChl5HM7y9ew49Rs7YpsoIhPtFw0A45SDfgX1ozaFwuE3TLe43PswDd1Rca0xwT4gYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sytU4DOj; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <d8e569ac-dea9-456b-b607-ebcd18232467@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772827357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ehuz2hZ1lha1svBE81Eso1DuVFQQVU2cffUT2QB70+8=;
	b=sytU4DOjXLcoTBfU+awJR1+O674okrCSuVZpCSr0t3i06BUxmGRmTdN3bKJ8ezsmr+E2IK
	tPTI9GYLwLwqMbh2u/+zeW10BU17PHr+vJM5sw1c3qtLQxbitWRow4aE4DA//CUQDJnelT
	RuNkh3jnSq8isallwSmHxA8zQ5Vs498=
Date: Fri, 6 Mar 2026 12:02:33 -0800
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: MT7922 Remote Wakeup support advertised, but disabled by default
To: linux-bluetooth@vger.kernel.org, linux-mediatek@vger.kernel.org
Cc: sean.wang@mediatek.com, chris.lu@mediatek.com, luolian@huaqin.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 620162275B1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19896-lists,linux-bluetooth=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[linux.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matthew.schwartz@linux.dev,linux-bluetooth@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.940];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:dkim,linux.dev:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

I have a MediaTek MT7922 combo WiFi/BT adapter (Foxconn 0489:e0d9) in a Lenovo 83N0 handheld gaming device. The USB Bluetooth function advertises Remote Wakeup in its configuration descriptor:

$ lsusb -v -d 0489:e0d9 | grep -A2 "bmAttributes.*0xe0"
     bmAttributes         0xe0
      Self Powered
      Remote Wakeup

however, power/wakeup in sysfs defaults to "disabled". If I write "enabled" to the property in "/sys/bus/usb/.../power/wakeup" for the btusb device, then wake over Bluetooth seems to work for paired Bluetooth controllers like a Sony DualSense or an Xbox Elite Series 2.

Is USB Remote Wakeup actually supported on MT7922? If so, is there a reason it defaults to disabled rather than enabled? This is a gaming device so maybe it only makes sense to enable on some specific DMI matches, especially if there are power concerns, but I'm just trying to get an understanding of the situation first.

Thanks,
Matt

