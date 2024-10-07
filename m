Return-Path: <linux-bluetooth+bounces-7703-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD2E99379E
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Oct 2024 21:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9345E1F2270F
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Oct 2024 19:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3462C1DE3C7;
	Mon,  7 Oct 2024 19:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wcNHDnIB"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6061DD89A
	for <linux-bluetooth@vger.kernel.org>; Mon,  7 Oct 2024 19:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728330561; cv=none; b=cyVOgxw4vct9d7b5PTkcnAJrkaLr8WqdQGyB7nDR9NleWgoTCODCakEupvikcQ7I1KViyY89eFvqc+W8GKnsZLl6zw7bkoUiK3c5GRDfQbKKf32/P9F5NbSe3rJ+3clkQ7prDZ18EOp83v4gyy1b2HmR+MPp+hpze0YWNmprz70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728330561; c=relaxed/simple;
	bh=8Gd7Yh9ugiHZGI075EwyVrZd+y8pLDwH4ULUlmcIRI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ls+MFA/I5mRzUp4jCN69rk83U5mptSbv/zPfr1QED2mGUVcSEF+8Ujx7zEPzI4F8MvLUmffU+6KA4KhWf2eyTD/Dtlmfn9hV0M3lbILBNNNY5qgBoBJzYVxS93m7XOPX3zEhgTX9axTnc2amT77GMFO2mDkaIlwVUQoQtjWKaVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wcNHDnIB; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-37cd1ccaf71so3254736f8f.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 07 Oct 2024 12:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728330558; x=1728935358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5U+djHkbGH9bmYxBFYhi152wGofyCvQbCOoPJ1yEabY=;
        b=wcNHDnIBZYegUJPjyyKDdk9CSwsJ0z7WooKXRj5D7RYo/S68/Ru11X7hn2McJ9/yQZ
         KZa+cJjjNyjFp5cmvgOj5q81zqbxLm4NhYyo974GhG2cK1ki+29tNlvpZY3EcUP7O2nA
         TN+O29YITnBe4YVkgGJaEzVYd3U+Bd5uhiuv2ym2rNzfTW0XvSLO2OfO0vzJe5gZiNgB
         +cVl5tIjS7TPqbp+Y2TUWFOHoFg59RmEPHmCStHFs0s6nAROv/+u4kN7f9VCWd5zHJ4p
         Ufop0U3mzjX+f/+N88aDvUNKXjiCTp2DXQ2yg+BEiG8NTlVTFly0c9jLk8ma2JD00Gsz
         x7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728330558; x=1728935358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5U+djHkbGH9bmYxBFYhi152wGofyCvQbCOoPJ1yEabY=;
        b=tpL0HDHO4VwK4VfK1tSVfS8nSlp7sqigck5LBhMxDjtZwHSxVp6fPPhfSqoxKLIJd4
         GUUdXBmBI2qYu9zSy8wJzGkLbAhnGfMGy1qpmqUPiE06CotAeR51P4J9ifvnMhEHeKZ2
         Z9rZDQetov/gTyTVoASuRSFpp8UN5BdTYhlAgjrzdU/oyv8037nN1+natP0fijewB8Tk
         rNd9nfl/BlJ8jNW0GHpY2LlGJzZguZlGDAA/s0q7x6mf24CMUnM1rZl6zt4g9XRv5LQ2
         S7C9mgkMYZt7llqgL+Ej0ciVX2WPz6Q3+7oauiR/4kNHHJ2yXhoeb0XEu0UntwjNYU8w
         1IUQ==
X-Gm-Message-State: AOJu0YyhVv4x59CZ1LhzlrdmW/VzqAOjTdTu0e/slRDmV73v7Qwxy9Y3
	RmcbIozuHjTL3kdpFkh24WPSwl3MC9Pvw67CmzZBQJFembOYui06oLAaW5VrR55wLAa7+UG3TwY
	PkbhA
X-Google-Smtp-Source: AGHT+IGcAcEr2n2rg8KXWEoPTFoKO80/Kp6//QIp86lKGKaEhpv3dW0YGd+GSZ54auwEKCkehsqIKA==
X-Received: by 2002:a5d:410a:0:b0:374:c4c2:5ad5 with SMTP id ffacd0b85a97d-37d29316b33mr536273f8f.27.1728330558237;
        Mon, 07 Oct 2024 12:49:18 -0700 (PDT)
Received: from localhost (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1690f34asm6400754f8f.3.2024.10.07.12.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 12:49:17 -0700 (PDT)
Date: Mon, 7 Oct 2024 19:49:15 +0000
From: Aleksei Vetrov <vvvvvv@google.com>
To: Andrej Shadura <andrew.shadura@collabora.co.uk>
Cc: linux-bluetooth@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev,
	kernel@collabora.com, George Burgess <gbiv@chromium.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: Fix type of len in
 rfcomm_sock_{bind,getsockopt_old}()
Message-ID: <ZwQ7OzSSWZHM4XqS@google.com>
References: <20241002141217.663070-1-andrew.shadura@collabora.co.uk>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002141217.663070-1-andrew.shadura@collabora.co.uk>

Hi Andrej,

On Wed, Oct 02, 2024 at 04:12:17PM +0200, Andrej Shadura wrote:
> Change the type of len to size_t in both rfcomm_sock_bind and
> rfcomm_sock_getsockopt_old and replace min_t() with min().

rfcomm_sock_bind doesn't use copy_to_user, are you sure it has the same
issue?

> @@ -328,14 +328,15 @@ static int rfcomm_sock_bind(struct socket *sock, struct sockaddr *addr, int addr
>  {
>  	struct sockaddr_rc sa;
>  	struct sock *sk = sock->sk;
> -	int len, err = 0;
> +	int err = 0;
> +	size_t len;
>  
>  	if (!addr || addr_len < offsetofend(struct sockaddr, sa_family) ||
>  	    addr->sa_family != AF_BLUETOOTH)
>  		return -EINVAL;
>  
>  	memset(&sa, 0, sizeof(sa));
> -	len = min_t(unsigned int, sizeof(sa), addr_len);
> +	len = min(sizeof(sa), addr_len);
>  	memcpy(&sa, addr, len);
>  
>  	BT_DBG("sk %p %pMR", sk, &sa.rc_bdaddr);

This change produces a compilation error around min expression, as
"kernel test robot" notices below. And I think rfcomm_sock_bind
shouldn't be touched at all, it doesn't use copy_to_user and doesn't
produce compile errors with latest Clang.

> @@ -729,7 +730,8 @@ static int rfcomm_sock_getsockopt_old(struct socket *sock, int optname, char __u
>  	struct sock *l2cap_sk;
>  	struct l2cap_conn *conn;
>  	struct rfcomm_conninfo cinfo;
> -	int len, err = 0;
> +	int err = 0;
> +	size_t len;
>  	u32 opt;
>  
>  	BT_DBG("sk %p", sk);
> @@ -783,7 +785,7 @@ static int rfcomm_sock_getsockopt_old(struct socket *sock, int optname, char __u
>  		cinfo.hci_handle = conn->hcon->handle;
>  		memcpy(cinfo.dev_class, conn->hcon->dev_class, 3);
>  
> -		len = min_t(unsigned int, len, sizeof(cinfo));
> +		len = min(len, sizeof(cinfo));
>  		if (copy_to_user(optval, (char *) &cinfo, len))
>  			err = -EFAULT;
>  

This looks ok. But there is the same pattern in rfcomm_sock_getsockopt
(without old prefix) and it also uses copy_to_user and produces compile
error with latest Clang.

Could you remove rfcomm_sock_bind patch and apply it to
rfcomm_sock_getsockopt instead? Or I can send my version of the patch:
we've encountered the same compile errors in rfcomm_sock_getsockopt and
rfcomm_sock_getsockopt_old after updating Clang and would like to get it
fixed.

