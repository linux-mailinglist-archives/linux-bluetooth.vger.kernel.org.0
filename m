Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1C023F7CF
	for <lists+linux-bluetooth@lfdr.de>; Sat,  8 Aug 2020 15:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgHHNXj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 8 Aug 2020 09:23:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:53570 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbgHHNXj (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 8 Aug 2020 09:23:39 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6E3320723
        for <linux-bluetooth@vger.kernel.org>; Sat,  8 Aug 2020 13:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596893018;
        bh=Ht92/zWPb+n/nHPB7VAzZcrJ3VqkXZ4XRHUJcfGEaAI=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=Fn5+AH4XkLjLehSp+4wDh1sQNBpshp+jOZrXxfhEUSpZ/6tvWS5Dc8LcmxtA1CvDD
         eYDEdAD5lhP9BOVnLM3jIBio17uQ3T1RlxbfW4HgUAG6VcG8134MMY1324JlFpovCV
         lIHQkaL1mrDIAfsUgTpwsyMzeqK7pQdeY/77ASVU=
Received: by pali.im (Postfix)
        id 05E13688; Sat,  8 Aug 2020 15:23:37 +0200 (CEST)
Date:   Sat, 8 Aug 2020 15:23:36 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH] avinfo: Print more A/V capabilities
Message-ID: <20200808132336.opzyojwsyj2txgbp@pali>
References: <20200512165112.24006-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200512165112.24006-1-pali@kernel.org>
User-Agent: NeoMutt/20180716
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello! I would like to remind also this patch:

On Tuesday 12 May 2020 18:51:12 Pali Rohár wrote:
> ---
>  tools/avinfo.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/avinfo.c b/tools/avinfo.c
> index e45b50918..576981a5e 100644
> --- a/tools/avinfo.c
> +++ b/tools/avinfo.c
> @@ -65,6 +65,7 @@
>  #define AVDTP_HEADER_COMPRESSION	0x05
>  #define AVDTP_MULTIPLEXING		0x06
>  #define AVDTP_MEDIA_CODEC		0x07
> +#define AVDTP_DELAY_REPORTING		0x08
>  
>  /* SEP types definitions */
>  #define AVDTP_SEP_TYPE_SOURCE		0x00
> @@ -696,13 +697,33 @@ static void print_caps(void *data, int size)
>  
>  		switch (cap->category) {
>  		case AVDTP_MEDIA_TRANSPORT:
> +			printf("\tMedia Transport: Supported\n");
> +			break;
>  		case AVDTP_REPORTING:
> +			printf("\tReporting: Supported\n");
> +			break;
> +		case AVDTP_DELAY_REPORTING:
> +			printf("\tDelay Reporting: Supported\n");
> +			break;
>  		case AVDTP_RECOVERY:
> +		case AVDTP_HEADER_COMPRESSION:
>  		case AVDTP_MULTIPLEXING:
> -			/* FIXME: Add proper functions */
> -			break;
>  		default:
> -			printf("\tUnknown category: %d\n", cap->category);
> +			switch (cap->category) {
> +			case AVDTP_RECOVERY:
> +				printf("\tRecovery:\n");
> +				break;
> +			case AVDTP_HEADER_COMPRESSION:
> +				printf("\tHeader compression:\n");
> +				break;
> +			case AVDTP_MULTIPLEXING:
> +				printf("\tMultiplexing:\n");
> +				break;
> +			default:
> +				printf("\tUnknown category: %d\n", cap->category);
> +				break;
> +			}
> +			/* FIXME: Add proper functions */
>  			printf("\t\tData:");
>  			for (i = 0; i < cap->length; ++i)
>  				printf(" 0x%.02x",
> -- 
> 2.20.1
> 
