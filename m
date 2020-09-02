Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6055825AD6F
	for <lists+linux-bluetooth@lfdr.de>; Wed,  2 Sep 2020 16:41:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgIBOkX (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 2 Sep 2020 10:40:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:33680 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726654AbgIBOkR (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 2 Sep 2020 10:40:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 760A4B1AE;
        Wed,  2 Sep 2020 14:40:15 +0000 (UTC)
Date:   Wed, 02 Sep 2020 16:40:14 +0200
Message-ID: <s5hblio9r8x.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     himadrispandya@gmail.com, dvyukov@google.com,
        linux-usb@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
        stern@rowland.harvard.ed, linux-kernel@vger.kernel.org,
        marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 09/10] sound: hiface: move to use usb_control_msg_send()
In-Reply-To: <20200902110115.1994491-13-gregkh@linuxfoundation.org>
References: <20200902110115.1994491-1-gregkh@linuxfoundation.org>
        <20200902110115.1994491-13-gregkh@linuxfoundation.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Wed, 02 Sep 2020 13:01:14 +0200,
Greg Kroah-Hartman wrote:
> 
> The usb_control_msg_send() call can return an error if a "short" write
> happens, so move the driver over to using that call instead.
> 
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: alsa-devel@alsa-project.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi

> ---
>  sound/usb/hiface/pcm.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/sound/usb/hiface/pcm.c b/sound/usb/hiface/pcm.c
> index a148caa5f48e..f9c924e3964e 100644
> --- a/sound/usb/hiface/pcm.c
> +++ b/sound/usb/hiface/pcm.c
> @@ -156,16 +156,14 @@ static int hiface_pcm_set_rate(struct pcm_runtime *rt, unsigned int rate)
>  	 * This control message doesn't have any ack from the
>  	 * other side
>  	 */
> -	ret = usb_control_msg(device, usb_sndctrlpipe(device, 0),
> -			      HIFACE_SET_RATE_REQUEST,
> -			      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
> -			      rate_value, 0, NULL, 0, 100);
> -	if (ret < 0) {
> +	ret = usb_control_msg_send(device, 0,
> +				   HIFACE_SET_RATE_REQUEST,
> +				   USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
> +				   rate_value, 0, NULL, 0, 100);
> +	if (ret)
>  		dev_err(&device->dev, "Error setting samplerate %d.\n", rate);
> -		return ret;
> -	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static struct pcm_substream *hiface_pcm_get_substream(struct snd_pcm_substream
> -- 
> 2.28.0
> 
