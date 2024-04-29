Return-Path: <linux-bluetooth+bounces-4158-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A2A8B60F1
	for <lists+linux-bluetooth@lfdr.de>; Mon, 29 Apr 2024 20:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AADC91F2201E
	for <lists+linux-bluetooth@lfdr.de>; Mon, 29 Apr 2024 18:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE0312881E;
	Mon, 29 Apr 2024 18:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nl6h1rwq"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76108127E24
	for <linux-bluetooth@vger.kernel.org>; Mon, 29 Apr 2024 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714414574; cv=none; b=Gux4DZn9QvNwJwTrPaKgyvE5khsF5zbP7pEySZKmxeU7r/exM1SDyuMsh/crXt9ml6aH+9pWNlWQ2M4JkiA24cJYrfqYCxInW+Ng1vkGvVVifP/VOpvpcmL0NDNmbydh2nnXfV0gWhowGj2pFGmS1DQ/lHKyo/Fm9WHtFJ2bd2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714414574; c=relaxed/simple;
	bh=WcXW/buP9MAu0vMBF5Js5v7YGSUnlUAbpElCKfwLszc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIGX5nUMtPzNse0xblwLBgvRmMBFanCltxzVtZGZhOrxV6dyRKtZRKBX0kD76rZjoEpb0y7g6pd8MOZN6oRzOhMlInpKIHp1MdrYP6Fe+yOOBTSoFYNYzsQqGeYe+yWepDDT7YLzZLDgMTyifZ+toWQfUHtXzpcR+WxKS0GW150=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nl6h1rwq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1e3ff14f249so36684745ad.1
        for <linux-bluetooth@vger.kernel.org>; Mon, 29 Apr 2024 11:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714414573; x=1715019373; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OnZ1vLukMpdqrqD0r/VM8L5RpjpCprM81qtpwZ8cNP0=;
        b=nl6h1rwq3iLZfIjRmHtoR1qqzAcLmll+mg0FsLNREaFSsDODhKtJ7QFSou821XFhTx
         OwNqRW5epiElYi7zNZ6RXxyKWoEfuS6Jn/axupB5fxPOrAOloqoE+RNH+MLLTTkFpT8w
         K8IvudBhrFEfLYsEn1LZqQ0j+KDmDoDBBPRfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714414573; x=1715019373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnZ1vLukMpdqrqD0r/VM8L5RpjpCprM81qtpwZ8cNP0=;
        b=PmmGf3nHzwvNc0uWKYO504tejOfbSG+052ieF3C+9ZedLR+82IbKHU5dteN8PA7lNv
         DWcxYEgT+6Zt/kNQF0DGgwju/q6FliPevgOU6UJnO6PmPdfEBTdF7BTxH6u+iPGBS3/S
         0zKUft5rOQbUwXFRSPvwIqbCmFVOaQymRRKC3deXGW8UB1OPD9StQVPTUmuLPN2Mw6f/
         Ho+pDlvDdCkEKxLFSq9wWeJfAEj/lf67SoXki1WUbkeHK+z5xcEz/GYD3+hQPXekGlRS
         MGhVkPieRiFjmHiLCpDlPdxgdWuizzJREkMN/oHM3w2ZrCy96puyJtvIc+Mx5oMuE//q
         Wm7g==
X-Forwarded-Encrypted: i=1; AJvYcCVOx28VZ4j36NyYX/4wdYNcwndCmg47pecP+ngftiV0x6DHmtmYDJ0ynMNc5ZMPGtcuCV9n55YS4VTapDJ2DuOqvutd/enPE6nyRVh30Z6M
X-Gm-Message-State: AOJu0Ywi5xhXAN21vhKxKjWmxD7csgHrY9MPY0HN+K8shMyVQXLlX/Rg
	E5mrzP6IhEwTxUS7UiveBIblG8iI+PyZokE8uS/o+CPpDQz7ulgIZaZHfWtlNQ==
X-Google-Smtp-Source: AGHT+IFHuanPGgh9O4MDAeEUubDx/pf+02lBFuayRPoTqeON76gFZdZ04TBnnFcYIylPNzk4FROTQQ==
X-Received: by 2002:a17:903:1c8:b0:1e4:320b:4311 with SMTP id e8-20020a17090301c800b001e4320b4311mr562818plh.34.1714414572641;
        Mon, 29 Apr 2024 11:16:12 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u17-20020a17090341d100b001eb3d459143sm5154929ple.48.2024.04.29.11.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 11:16:11 -0700 (PDT)
Date: Mon, 29 Apr 2024 11:16:11 -0700
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2][next] Bluetooth: hci_conn, hci_sync: Use
 __counted_by() in multiple structs and avoid -Wfamnae warnings
Message-ID: <202404291110.6159F7EA5@keescook>
References: <ZiwwPmCvU25YzWek@neat>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZiwwPmCvU25YzWek@neat>

On Fri, Apr 26, 2024 at 04:52:46PM -0600, Gustavo A. R. Silva wrote:
> Prepare for the coming implementation by GCC and Clang of the
> __counted_by attribute. Flexible array members annotated with
> __counted_by can have their accesses bounds-checked at run-time
> via CONFIG_UBSAN_BOUNDS (for array indexing) and CONFIG_FORTIFY_SOURCE
> (for strcpy/memcpy-family functions).
> 
> Also, -Wflex-array-member-not-at-end is coming in GCC-14, and we are
> getting ready to enable it globally.
> 
> So, use the `DEFINE_FLEX()` helper for multiple on-stack definitions
> of a flexible structure where the size of the flexible-array member
> is known at compile-time, and refactor the rest of the code,
> accordingly.
> 
> Notice that, due to the use of `__counted_by()` in `struct
> hci_cp_le_create_cis`, the for loop in function `hci_cs_le_create_cis()`
> had to be modified. Once the index `i`, through which `cp->cis[i]` is
> accessed, falls in the interval [0, cp->num_cis), `cp->num_cis` cannot
> be decremented all the way down to zero while accessing `cp->cis[]`:
> 
> net/bluetooth/hci_event.c:4310:
> 4310    for (i = 0; cp->num_cis; cp->num_cis--, i++) {
>                 ...
> 4314            handle = __le16_to_cpu(cp->cis[i].cis_handle);
> 
> otherwise, only half (one iteration before `cp->num_cis == i`) or half
> plus one (one iteration before `cp->num_cis < i`) of the items in the
> array will be accessed before running into an out-of-bounds issue. So,
> in order to avoid this, set `cp->num_cis` to zero just after the for
> loop.
> 
> Also, make use of `aux_num_cis` variable to update `cmd->num_cis` after
> a `list_for_each_entry_rcu()` loop.
> 
> With these changes, fix the following warnings:
> net/bluetooth/hci_sync.c:1239:56: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> net/bluetooth/hci_sync.c:1415:51: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> net/bluetooth/hci_sync.c:1731:51: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> net/bluetooth/hci_sync.c:6497:45: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Link: https://github.com/KSPP/linux/issues/202
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> Changes in v2:
>  - Update `cmd->num_cis` after `list_for_each_entry_rcu()` loop.
> 
> v1:
>  - Link: https://lore.kernel.org/linux-hardening/ZiwqqZCa7PK9bzCX@neat/
> 
>  include/net/bluetooth/hci.h |  8 ++--
>  net/bluetooth/hci_event.c   |  3 +-
>  net/bluetooth/hci_sync.c    | 84 +++++++++++++++----------------------
>  3 files changed, 40 insertions(+), 55 deletions(-)
> 
> diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
> index fe23e862921d..c4c6b8810701 100644
> --- a/include/net/bluetooth/hci.h
> +++ b/include/net/bluetooth/hci.h
> @@ -2026,7 +2026,7 @@ struct hci_cp_le_set_ext_adv_data {
>  	__u8  operation;
>  	__u8  frag_pref;
>  	__u8  length;
> -	__u8  data[];
> +	__u8  data[] __counted_by(length);
>  } __packed;

I noticed some of the other structs here aren't flexible arrays, so it
made me go take a look at these ones. I see that the only user of struct
hci_cp_le_set_ext_adv_data uses a fixed-size array:

        struct {
                struct hci_cp_le_set_ext_adv_data cp;
                u8 data[HCI_MAX_EXT_AD_LENGTH];
        } pdu;

Let's just change this from a flex array to a fixed-size array?

>  
>  #define HCI_OP_LE_SET_EXT_SCAN_RSP_DATA		0x2038
> @@ -2035,7 +2035,7 @@ struct hci_cp_le_set_ext_scan_rsp_data {
>  	__u8  operation;
>  	__u8  frag_pref;
>  	__u8  length;
> -	__u8  data[];
> +	__u8  data[] __counted_by(length);
>  } __packed;

Same for this one:

        struct {
                struct hci_cp_le_set_ext_scan_rsp_data cp;
                u8 data[HCI_MAX_EXT_AD_LENGTH];
        } pdu;

>  
>  #define HCI_OP_LE_SET_EXT_ADV_ENABLE		0x2039
> @@ -2061,7 +2061,7 @@ struct hci_cp_le_set_per_adv_data {
>  	__u8  handle;
>  	__u8  operation;
>  	__u8  length;
> -	__u8  data[];
> +	__u8  data[] __counted_by(length);
>  } __packed;

And this one. :P

        struct {
                struct hci_cp_le_set_per_adv_data cp;
                u8 data[HCI_MAX_PER_AD_LENGTH];
        } pdu;

>  
>  #define HCI_OP_LE_SET_PER_ADV_ENABLE		0x2040
> @@ -2162,7 +2162,7 @@ struct hci_cis {
>  
>  struct hci_cp_le_create_cis {
>  	__u8    num_cis;
> -	struct hci_cis cis[];
> +	struct hci_cis cis[] __counted_by(num_cis);
>  } __packed;

This one isn't as obvious, so I'd say keep your changes for this one.

>  
>  #define HCI_OP_LE_REMOVE_CIG			0x2065
> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
> index 9a38e155537e..9a7ca084302e 100644
> --- a/net/bluetooth/hci_event.c
> +++ b/net/bluetooth/hci_event.c
> @@ -4307,7 +4307,7 @@ static void hci_cs_le_create_cis(struct hci_dev *hdev, u8 status)
>  	hci_dev_lock(hdev);
>  
>  	/* Remove connection if command failed */
> -	for (i = 0; cp->num_cis; cp->num_cis--, i++) {
> +	for (i = 0; i < cp->num_cis; i++) {
>  		struct hci_conn *conn;
>  		u16 handle;
>  
> @@ -4323,6 +4323,7 @@ static void hci_cs_le_create_cis(struct hci_dev *hdev, u8 status)
>  			hci_conn_del(conn);
>  		}
>  	}
> +	cp->num_cis = 0;

Yeah, this loop never leaves early, and if it did, it processing the
array forward, so having num_cis reduced during the loop iteration
doesn't make sense. What you have looks right to me!


>  
>  	if (pending)
>  		hci_le_create_cis_pending(hdev);
> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
> index 9092b4d59545..6e15594d3565 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -1235,31 +1235,27 @@ int hci_setup_ext_adv_instance_sync(struct hci_dev *hdev, u8 instance)
>  
>  static int hci_set_ext_scan_rsp_data_sync(struct hci_dev *hdev, u8 instance)
>  {
> -	struct {
> -		struct hci_cp_le_set_ext_scan_rsp_data cp;
> -		u8 data[HCI_MAX_EXT_AD_LENGTH];
> -	} pdu;
> +	DEFINE_FLEX(struct hci_cp_le_set_ext_scan_rsp_data, pdu, data, length,
> +		    HCI_MAX_EXT_AD_LENGTH);
>  	u8 len;
>  	struct adv_info *adv = NULL;
>  	int err;
>  
> -	memset(&pdu, 0, sizeof(pdu));

These become much easier, just:

	struct hci_cp_le_set_ext_scan_rsp_data cp = { };

etc...


-- 
Kees Cook

