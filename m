Return-Path: <linux-bluetooth+bounces-5561-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2449180EF
	for <lists+linux-bluetooth@lfdr.de>; Wed, 26 Jun 2024 14:26:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610931F22DB9
	for <lists+linux-bluetooth@lfdr.de>; Wed, 26 Jun 2024 12:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F6B181BAA;
	Wed, 26 Jun 2024 12:26:30 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9198B15FA71
	for <linux-bluetooth@vger.kernel.org>; Wed, 26 Jun 2024 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719404790; cv=none; b=kSbS0GZHx5MElQKwQfQvQjDd5ATbR+6K7ZMnuesdtor6L6R1DeFeh7i6dUqZ7Kjjn0JcXT2v5fjirZGdh72w0VRrN9sFKT/hrxMXcyZJxZrHXyNHX/8IskjLzJHPaoAwY9IObrge9S851gskK+/t5aiCmL+pK8OC2MYSdBU/5MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719404790; c=relaxed/simple;
	bh=O4eRPR5v/ccrHHvwPALhm0ME1IheVvmRQBJN2ZxnJnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgYZxVyKbykNBJG4SVIDlMDm1CH03RjphW3Mc/pD7Dp9Ke3oZvEr7W+5VSNNkXmHYzqDfWqrCVP/XBlwyM1AKEd0/jRQfLOrKHKTSZx2tXge2muHPdZHzZlgpngh9XKTuzKAu1gZR7ZbbP/pd3/Bxe4uiexTcgXM7P2WyZAa1Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 434FD61E5FE07;
	Wed, 26 Jun 2024 14:26:10 +0200 (CEST)
Message-ID: <390bb99a-55ce-4a97-b268-93ce62bedbac@molgen.mpg.de>
Date: Wed, 26 Jun 2024 14:26:09 +0200
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Bluetooth: btintel: Allow lowering of drive strength
 of BRI
To: Kiran K <kiran.k@intel.com>
Cc: ravishankar.srivatsa@intel.com, chethan.tumkur.narayan@intel.com,
 chandrashekar.devegowda@intel.com, vijay.satija@intel.com,
 linux-bluetooth@vger.kernel.org
References: <20240626092801.2343844-1-kiran.k@intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240626092801.2343844-1-kiran.k@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Kiran,


Thank you for the patch.

Am 26.06.24 um 11:28 schrieb Kiran K:
> BRI (Bluetooth Radio Interface) traffic from CNVr to CNVi was found
> causing cross talk step errors to WiFi. As a workaround, driver needs to
> reduce the drive strength of BRI. During *setup*, driver reads the drive
> strength value from efi variable and passes it to the controller via vendor
> specific command with opcode 0xfc0a.

I am still surprised this is done via an EFI variable. Could you please 
add a reference to section in the UEFI(?) specification? Hopefully that 
explains who is supposed to set the variable.

[…]


Kind regards,

Paul

