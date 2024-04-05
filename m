Return-Path: <linux-bluetooth+bounces-3274-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E5899B9D
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Apr 2024 13:09:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2A0628532D
	for <lists+linux-bluetooth@lfdr.de>; Fri,  5 Apr 2024 11:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8695A16C42B;
	Fri,  5 Apr 2024 11:09:23 +0000 (UTC)
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1906418659;
	Fri,  5 Apr 2024 11:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712315363; cv=none; b=kACOV9D7o6G7nbIZSWNvBNDt+hYLCOoH5Pgfs8ns43eNJpauOdTv6yRvDmzPWlpBOqkjRVuv29c94IA3lvDINt8zoAM0FmgZ4DXcbg6TSj6RdV30bI7wqCloHx3BkVYlvMZMUFUxtKTQvMsEB6I98xz4CqrWCsA9ojVNPvsMWtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712315363; c=relaxed/simple;
	bh=ESeSoNeCb8mfh1I/r9IN0SjNu/lelsYFtU5MpoV5r3w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJQGQzD+Lq/tuTHGfkKnSbBHfFWUBl8M1kGmtjR3YEHj2CN1oAwEFCGMmsj3I8DnLiMpMfVf1pBr91GVI89HLznmPz5DpAji8h9cKC+az08T0YkRH5dzfCb40+AXgt0mHaAviE+ZQncx56c1jFmQABI9wJ6SnEyIc+qGJKdlTOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.224] (ip5f5aedf1.dynamic.kabel-deutschland.de [95.90.237.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 84D5161E5FE01;
	Fri,  5 Apr 2024 13:08:54 +0200 (CEST)
Message-ID: <234da60a-709f-4430-b594-386b7c2b65f5@molgen.mpg.de>
Date: Fri, 5 Apr 2024 13:08:52 +0200
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net/socket: the length value of the input socket option
 parameter is too small
To: Edward Adam Davis <eadavis@qq.com>
Cc: syzbot+d4ecae01a53fd9b42e7d@syzkaller.appspotmail.com,
 johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, luiz.dentz@gmail.com, marcel@holtmann.org,
 syzkaller-bugs@googlegroups.com
References: <000000000000b9b20e061553f06e@google.com>
 <tencent_7A77E9664E3C953694964A37444AF474AF09@qq.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <tencent_7A77E9664E3C953694964A37444AF474AF09@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Edward,


Thank you very much for looking into this and sending a patch. Should 
you resent, I’d make the summary about the change and not the issue. Maybe:

net/socket: Ensure length of input socket option param >= sizeof(int)


Kind regards,

Paul

