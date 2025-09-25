Return-Path: <linux-bluetooth+bounces-15499-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC83B9F489
	for <lists+linux-bluetooth@lfdr.de>; Thu, 25 Sep 2025 14:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 009FC7B9FFE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 25 Sep 2025 12:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA071194A73;
	Thu, 25 Sep 2025 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="wX2sVrxu"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C8713BC3F
	for <linux-bluetooth@vger.kernel.org>; Thu, 25 Sep 2025 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758803877; cv=none; b=rYzfwlNYMKSIy7Yi8fdfj1e/3JaxTXYGZ2yzz/yq4IhEFPjtKWrcleix7H8Lld9SU+NnApPWaHPI8/cXSswEsGOT3KC7ZoVWs5B80zJ504AhKtYQIRDwY0g0QinpMrdbyZx+MIl18ORuwiMu626uC87RnXtpTk69to/ZjAuzYrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758803877; c=relaxed/simple;
	bh=sKcOPTxnCJ5a4uUqyFcDkFbORkBcdmjDCZ5NAf7dLyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3YsiWGgy/eHb2hHUo9sOnU5ok5Xb6Dm+/6c5WpqADtWUqn3vQEM4qdpWByThf7Qyp/+mhCdO6AYjMa1yOVWAxhzNMHT9Qw12Hx2eSKLZ1rXdqUl3pEMshyqCfCW6HTYzDaUnDk/GTbSPjufRksqcVdPHNHv+w3gQo4mzjMX5xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=wX2sVrxu; arc=none smtp.client-ip=44.202.169.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id 1iJfvt63Lv7241lEKvrpZG; Thu, 25 Sep 2025 12:37:48 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id 1lEIvwHzH0HUD1lEIvaOYT; Thu, 25 Sep 2025 12:37:46 +0000
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=68d5379a
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=TDP2S4RWD7HzL5QBIXWMeQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=n6cUM9N_SOF4ly-ecgYA:9 a=QEXdDO2ut3YA:10 a=xYX6OU9JNrHFPr8prv8u:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jHQEQP6ZDcTVOhUjzvTyaPCqzaUVdzFlGtFP2wFxfNw=; b=wX2sVrxudqIgwgpYFfECf9gNBn
	b6lrLbgF43by0ZF23koUMsxB99bIXyy+VYpGG86IgUkI/4tdEkll8bJWtmbgMpEMYTUg8kMKklChU
	6jdE7Fug5TwxiF2UZ0RMhbDUvU8LRqSEJLxehPiqHJ8519ItDFJRHbCx354gGYLfxaHjqKRrJu/L2
	qI/4f5BdOb4j7G1wGT9Iw0k+RdUtha4PLgvhxTnVMWtG+J59LSFjqNGmXtplhEhrAivjkSPRek8bO
	YAbiC4oqx6Ia7C0lgJx0Xu5Up1xKGkPo5Ut+sayd9aNc/aowxGIM05Dw/lDbMTQXkibwPt8GjPnfm
	MSW6ktNw==;
Received: from [83.214.222.209] (port=59262 helo=[192.168.1.104])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1v1lEH-00000002lYu-2Gu8;
	Thu, 25 Sep 2025 07:37:45 -0500
Message-ID: <8497d3e4-fa7f-436c-9e94-b669c7be73f1@embeddedor.com>
Date: Thu, 25 Sep 2025 14:37:39 +0200
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2][next] Bluetooth: Avoid a couple dozen
 -Wflex-array-member-not-at-end warnings
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <aMAZ7wIeT1sDZ4_V@kspp>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <aMAZ7wIeT1sDZ4_V@kspp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 83.214.222.209
X-Source-L: No
X-Exim-ID: 1v1lEH-00000002lYu-2Gu8
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.104]) [83.214.222.209]:59262
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLmhbrIgNlFCyZTXnnWEGeZFYMYU9EOAvvXAy37q9RdSbwJsAh2l1XwJ6jU1ESfX4rswEEDfDh7OXke4iDFtxi/7a7WSy+4hp4XiebvXz56RLQ5eWngc
 U381hdLpGI+rwzheF0s7KZsnxLXE75dtLIPw7Ya0aPXwIvs66DOz35x3ZguMETNApJCl6BXvzyl6J7y0TJ9IpVLw1qDlWe9jPvKSb94SFhkfs+isG2ItOtCS

Hi all,

Friendly ping: who can take this, please? :)

Thanks!
-Gustavo

On 9/9/25 14:13, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the __struct_group() helper to fix 31 instances of the following
> type of warnings:
> 
> 30 net/bluetooth/mgmt_config.c:16:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 1 net/bluetooth/mgmt_config.c:22:33: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> Changes in v2:
>   - Use __struct_group() instead of TRAILING_OVERLAP().
> 
> v1:
>   - Link: https://lore.kernel.org/linux-hardening/aLSCu8U62Hve7Dau@kspp/
> 
>   include/net/bluetooth/mgmt.h | 9 +++++++--
>   net/bluetooth/mgmt_config.c  | 4 ++--
>   2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/include/net/bluetooth/mgmt.h b/include/net/bluetooth/mgmt.h
> index 3575cd16049a..74edea06985b 100644
> --- a/include/net/bluetooth/mgmt.h
> +++ b/include/net/bluetooth/mgmt.h
> @@ -53,10 +53,15 @@ struct mgmt_hdr {
>   } __packed;
>   
>   struct mgmt_tlv {
> -	__le16 type;
> -	__u8   length;
> +	/* New members MUST be added within the __struct_group() macro below. */
> +	__struct_group(mgmt_tlv_hdr, __hdr, __packed,
> +		__le16 type;
> +		__u8   length;
> +	);
>   	__u8   value[];
>   } __packed;
> +static_assert(offsetof(struct mgmt_tlv, value) == sizeof(struct mgmt_tlv_hdr),
> +	      "struct member likely outside of __struct_group()");
>   
>   struct mgmt_addr_info {
>   	bdaddr_t	bdaddr;
> diff --git a/net/bluetooth/mgmt_config.c b/net/bluetooth/mgmt_config.c
> index 6ef701c27da4..c4063d200c0a 100644
> --- a/net/bluetooth/mgmt_config.c
> +++ b/net/bluetooth/mgmt_config.c
> @@ -13,13 +13,13 @@
>   
>   #define HDEV_PARAM_U16(_param_name_) \
>   	struct {\
> -		struct mgmt_tlv entry; \
> +		struct mgmt_tlv_hdr entry; \
>   		__le16 value; \
>   	} __packed _param_name_
>   
>   #define HDEV_PARAM_U8(_param_name_) \
>   	struct {\
> -		struct mgmt_tlv entry; \
> +		struct mgmt_tlv_hdr entry; \
>   		__u8 value; \
>   	} __packed _param_name_
>   


