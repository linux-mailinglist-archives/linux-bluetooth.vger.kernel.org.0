Return-Path: <linux-bluetooth+bounces-19561-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPLtF2RRpWkc8wUAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19561-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Mar 2026 09:59:16 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE11D51AC
	for <lists+linux-bluetooth@lfdr.de>; Mon, 02 Mar 2026 09:59:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3D670301396D
	for <lists+linux-bluetooth@lfdr.de>; Mon,  2 Mar 2026 08:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4B8538CFED;
	Mon,  2 Mar 2026 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=frederic.danis@collabora.com header.b="TkIqzx0G"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CB638A73E
	for <linux-bluetooth@vger.kernel.org>; Mon,  2 Mar 2026 08:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441953; cv=pass; b=SZd3KZFk8mps4TljbweMMvvU5bJatcVI9zDcZlP9h6lGf7LkdNKN7JK6qrTroHbV9tAh4Ub1Cl8Tu8iwkc7AK8SON5NjfQO2qy6iqikvwOqaTOX6oC8v34Pfg0ILrJS5Noej4rOeFKoal7/QugLfMl2izv6dyBfU4B+n0qBGAC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441953; c=relaxed/simple;
	bh=D1PP/t81EgRbHfOmvI8KGvLBPDKtvJD8ZQC97yV87VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VO3Ul/tVNranUOLxcbA/kiYSj7LCqSKFYlbyjU5CcKKQWcUVNStZVttifAtCBWvS8xxnkT3+tD7IuKcmnwlgBOPfw3RetPyftCFiffNMWTmjmHampWRIh1HkU6tbldvfvkrv7gRPZafyS2WCiSzCbfaUx+j5MKarlkZooj0zae4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=frederic.danis@collabora.com header.b=TkIqzx0G; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1772441941; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=IgVqIiBLIy1xTvTBCo7rNl8YGoV/q/XmpJXNIJoMtCLo/hmiElQbHoy254PU+Y0HRVSHrGgaxQQ4wi9DgbORM69/29XqrnK20UUfMfDhbAQ2RASAnhvfQk8h0UV05Pl2pY2nL7JSNpJJGm5h6buRmew2V/aMYVE/3CqHyCgtwj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772441941; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=HRV7KDShaf4NCqixfXdjL2y278jcSsKNvVi4TdebryI=; 
	b=cJg4COwV4ybTLFzf5zzuCR0mxlMZAAG56Gru8V0nVqd46zB2HNglzI+uqo70ZAxWQcHr6tvGZKVjdVeIf+vrwU+n2w+0tbZwQgaCiSJp/FuqwN4IMBERQ/bLHMAkXAMhUZw8xdi2mgZxKdxGpFc09qXj2b06LnmoWfCoRIvWseE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=frederic.danis@collabora.com;
	dmarc=pass header.from=<frederic.danis@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772441941;
	s=zohomail; d=collabora.com; i=frederic.danis@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=HRV7KDShaf4NCqixfXdjL2y278jcSsKNvVi4TdebryI=;
	b=TkIqzx0GgM/KjVonK39xW/uLNCtlaygBJQe3iLvVU75l0fQk4vF5ZrG994XoxWwd
	49uEb8X5BchGzMrZSogV0flsMsV3ZK1WAEXLY0zcsSM+W9ZMtl7y2KQfNKIo1GvReQ3
	AuX7ziArvy3ED8q9Ojnd6ghFVmDB9RytJXOGZ04w=
Received: by mx.zohomail.com with SMTPS id 1772441938810205.05938613538774;
	Mon, 2 Mar 2026 00:58:58 -0800 (PST)
Message-ID: <bbb4b8ae-2b85-4f43-b136-93454c9e0660@collabora.com>
Date: Mon, 2 Mar 2026 09:58:57 +0100
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH BlueZ 11/15] doc/qualification: gatt-pts: add description
 for GATT/SR/GAN/BV-03-C
To: Christian Eggers <ceggers@arri.de>, linux-bluetooth@vger.kernel.org
References: <20260227160022.21462-1-ceggers@arri.de>
 <20260227160022.21462-12-ceggers@arri.de>
Content-Language: en-US
From: =?UTF-8?Q?Fr=C3=A9d=C3=A9ric_Danis?= <frederic.danis@collabora.com>
In-Reply-To: <20260227160022.21462-12-ceggers@arri.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-19561-lists,linux-bluetooth=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic.danis@collabora.com,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:mid,collabora.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 03AE11D51AC
X-Rspamd-Action: no action

Hi Christian,

On 27/02/2026 16:53, Christian Eggers wrote:
> Same as for GATT/SR/GAN/BV-01-C.
> ---
>   doc/qualification/gatt-pts.rst | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/doc/qualification/gatt-pts.rst b/doc/qualification/gatt-pts.rst
> index 7a2f28257338..e9acba7e7cd0 100644
> --- a/doc/qualification/gatt-pts.rst
> +++ b/doc/qualification/gatt-pts.rst
> @@ -1136,6 +1136,26 @@ for which we know the test passed.
>   |                        |          |         |       |                                                                         |
>   |                        |          |         |       | - [bluetooth]# gatt.write 2                                             |
>   +------------------------+----------+---------+-------+-------------------------------------------------------------------------+
> +| GATT/SR/GAN/BV-03-C    | PASS     |     6.1 | 5.69  | Run 'bluetoothctl':                                                     |
> +|                        |          |         |       |                                                                         |
> +|                        |          |         |       | - [bluetooth]# advertise on                                             |
> +|                        |          |         |       |                                                                         |
> +|                        |          |         |       | - [bluetooth]# gatt.register-service 0xFFFF                             |
> +|                        |          |         |       |                                                                         |
> +|                        |          |         |       |   - *yes* when asked if primary service                                 |
> +|                        |          |         |       |                                                                         |
> +|                        |          |         |       | - [bluetooth]# gatt.register-characteristic 0xAAAA write,notify         |
> +|                        |          |         |       |                                                                         |
> +|                        |          |         |       |   - enter '1' when prompted                                             |
> +|                        |          |         |       |                                                                         |
> +|                        |          |         |       | - [bluetooth]# gatt.register-application                                |
> +|                        |          |         |       |                                                                         |
> +|                        |          |         |       | - [bluetooth]# gatt.select-attribute local 0xAAAA                       |

Shouldn't this be part of a Pre-condition?

> +|                        |          |         |       |                                                                         |
> +|                        |          |         |       | - Wait until PTS prompts for sending a notification                     |

Instead of "- Wait until PTS prompts for sending a notification" you may 
be use "On PTS request to send a notification:"

> +|                        |          |         |       |                                                                         |
> +|                        |          |         |       | - [bluetooth]# gatt.write 2                                             |
> ++------------------------+----------+---------+-------+-------------------------------------------------------------------------+
>   | GATT/SR/GAI/BV-01-C    | PASS     |     6.1 | 5.69  | Run 'bluetoothctl':                                                     |
>   |                        |          |         |       |                                                                         |
>   |                        |          |         |       | - [bluetooth]# gatt.register-service 0xFFFF                             |

-- 
Frédéric Danis
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, United Kingdom
Registered in England & Wales, no. 5513718



