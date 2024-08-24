Return-Path: <linux-bluetooth+bounces-6985-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B8495DF8A
	for <lists+linux-bluetooth@lfdr.de>; Sat, 24 Aug 2024 20:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A41F1F21BB3
	for <lists+linux-bluetooth@lfdr.de>; Sat, 24 Aug 2024 18:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2AC6F2F6;
	Sat, 24 Aug 2024 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdZAp0mu"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8257404B;
	Sat, 24 Aug 2024 18:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724523393; cv=none; b=K3vKOmCNPIxcDs+8LLiwO3vibLBf12Vh41ylJjtWI52q5Pg405e0BQQJcyNPI0LmLEUFziSbjDS6u1SJiaPbXh+H7N0zO2vGl6JHtikO55EG5ZbYTjMPOZtqNorEL4A4uuBCoY/dPD6eZOBOVvT0YVfHNcs6C32GGHt+iy+qL8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724523393; c=relaxed/simple;
	bh=9ytLx9PuSk9ct4kLd5fvYaZgBS5ffW9TDdBJrFyrPb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OU+kwOVsAHCrJXEVXv8xMbA3A4WJNneOSKRiDAD2aGnpwIrU1sNxxv1fGIPhZx0YjDHovtN/K6mR49YlXjsfoTNblU10CY2qDInWCvQBw/kW+fwjMbh1heQL/2/7PpzAGrDCaK2gJmMfLnvVd7dYzN+KUxovQu+ue7caPqpD9kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdZAp0mu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E946EC32781;
	Sat, 24 Aug 2024 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724523392;
	bh=9ytLx9PuSk9ct4kLd5fvYaZgBS5ffW9TDdBJrFyrPb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IdZAp0muodSbzBchmhlVAPTpl2qU5kyret+PtNLUNYXrfbba+6fy0J7CR/IcuuKWr
	 Ody/pz0qqdpr700ArvSHcMkzyAKFrdPD+c21JHm5icH3MspHAPJyrBYE0kaAmA4bD9
	 qVPlWtjo5HoB2Kkv2MbwXbVL9CYBxIdfbpgwUxyDGlmElnB2r/I+ndev+NAhAWqtp/
	 nEupfJBIepzmh6cnD6xpTEYG7vzigmi8XS2Grtr+KTI/pdkMJ3GfWeTnIpO5wM/HNG
	 HwiWtzH0bersmVzDUkLTzIfxWcklZX6NkjkxtvBd0wEjZamJ4m9mCr8nwyogG4gU8h
	 87QUQF3I50ZXQ==
Date: Sat, 24 Aug 2024 19:16:24 +0100
From: Simon Horman <horms@kernel.org>
To: Li Zetao <lizetao1@huawei.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, marcel@holtmann.org, johan.hedberg@gmail.com,
	luiz.dentz@gmail.com, idryomov@gmail.com, xiubli@redhat.com,
	dsahern@kernel.org, trondmy@kernel.org, anna@kernel.org,
	chuck.lever@oracle.com, jlayton@kernel.org, neilb@suse.de,
	okorniev@redhat.com, Dai.Ngo@oracle.com, tom@talpey.com,
	jmaloy@redhat.com, ying.xue@windriver.com, linux@treblig.org,
	jacob.e.keller@intel.com, willemb@google.com, kuniyu@amazon.com,
	wuyun.abel@bytedance.com, quic_abchauha@quicinc.com,
	gouhao@uniontech.com, netdev@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net
Subject: Re: [PATCH net-next 5/8] net: remove redundant judgments to simplify
 the code
Message-ID: <20240824181624.GT2164@kernel.org>
References: <20240822133908.1042240-1-lizetao1@huawei.com>
 <20240822133908.1042240-6-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240822133908.1042240-6-lizetao1@huawei.com>

On Thu, Aug 22, 2024 at 09:39:05PM +0800, Li Zetao wrote:
> The res variable has been initialized to 0, and the number of prots
> being used will not exceed MAX_INT, so there is no need to judge
> whether it is greater than 0 before returning.
> 
> Refer to the implementation of sock_inuse_get.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---
>  net/core/sock.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/core/sock.c b/net/core/sock.c
> index bbe4c58470c3..52bfc86a2f37 100644
> --- a/net/core/sock.c
> +++ b/net/core/sock.c
> @@ -3800,7 +3800,7 @@ int sock_prot_inuse_get(struct net *net, struct proto *prot)
>  	for_each_possible_cpu(cpu)
>  		res += per_cpu_ptr(net->core.prot_inuse, cpu)->val[idx];

Are you really sure that val[idx] can never be negative?

>  
> -	return res >= 0 ? res : 0;
> +	return res;
>  }
>  EXPORT_SYMBOL_GPL(sock_prot_inuse_get);
>  
> -- 
> 2.34.1
> 
> 

