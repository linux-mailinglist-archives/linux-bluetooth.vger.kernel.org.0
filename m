Return-Path: <linux-bluetooth+bounces-2337-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 468CE87485C
	for <lists+linux-bluetooth@lfdr.de>; Thu,  7 Mar 2024 07:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC3B91F21B7F
	for <lists+linux-bluetooth@lfdr.de>; Thu,  7 Mar 2024 06:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974A11CD2D;
	Thu,  7 Mar 2024 06:55:08 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C881F
	for <linux-bluetooth@vger.kernel.org>; Thu,  7 Mar 2024 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709794508; cv=none; b=EACt79bmBtmQBbkkbwrQpWjrQ2WflaAdBzPY2UFUiY0vtD1h7m2NC/IblmpG22KlKC91CDmy8A8C4s8Eq085yk3I2YJx1byMi6cdo4A5ZjONrDEaUNSDbAjsHwtw2GdELGgFIRCvw8NEcbBPHvnfk6vmNgCNK7gi8eFjsh8naNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709794508; c=relaxed/simple;
	bh=g4l1qXC4AM6lzz3uALlZd/88uXwdRhe0nKEvsKTtBd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=FMpnzUHhdvpO4KGfSAsVxb3dkWdxwY+8uwj95d4DL4oyjbQGWcmeFt7paUHzVghTTDJzioGOVfdCfn3ePbumR8k56BQ/sup5kdlxF8XWRu1R5MZw6A81UUPeDU5dYU+yj00/AIHGrwUCrkUYMY0JnaGQHMdWDBZTeMmrgPv3kTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.224] (ip5f5aeb84.dynamic.kabel-deutschland.de [95.90.235.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0138F61E5FE06;
	Thu,  7 Mar 2024 07:54:58 +0100 (CET)
Message-ID: <73663dc0-2567-468f-ba60-53fa43fc5329@molgen.mpg.de>
Date: Thu, 7 Mar 2024 07:54:54 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH BlueZ v2 2/2] test-bap: Add STR sink tests
Content-Language: en-US
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
References: <20240306230440.3983598-1-luiz.dentz@gmail.com>
 <20240306230440.3983598-2-luiz.dentz@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240306230440.3983598-2-luiz.dentz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Luiz,


Am 07.03.24 um 00:04 schrieb Luiz Augusto von Dentz:
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> 
> 4.10.1 Unicast Client Streaming – 1 Unicast Server, 1 Stream, 1 CIS –
> LC3 (Page 80)
> 
>   Test Purpose:
>   Verify that a Unicast Client IUT can stream audio data over one unicast
>   Audio Stream to or from a Unicast Server.
> 
>   Pass verdict:
>   If the IUT is in the Audio Sink role, the IUT receives SDUs with a zero or
>   more length that contains LC3-encoded data formatted using the LC3 Media
>   Packet format (defined in [3] Section 4.2).
> 
> Test Summary
> ------------

[…]

Very nice.

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

