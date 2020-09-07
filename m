Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62A8025FD18
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Sep 2020 17:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730180AbgIGP2k (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 7 Sep 2020 11:28:40 -0400
Received: from netrider.rowland.org ([192.131.102.5]:39509 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730115AbgIGPPp (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 7 Sep 2020 11:15:45 -0400
Received: (qmail 763212 invoked by uid 1000); 7 Sep 2020 11:08:58 -0400
Date:   Mon, 7 Sep 2020 11:08:58 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     himadrispandya@gmail.com, dvyukov@google.com,
        linux-usb@vger.kernel.org, perex@perex.cz, tiwai@suse.com,
        stern@rowland.harvard.ed, linux-kernel@vger.kernel.org,
        marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-bluetooth@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 04/11] USB: core: hub.c: use usb_control_msg_send() in
 a few places
Message-ID: <20200907150858.GD762136@rowland.harvard.edu>
References: <20200907145108.3766613-1-gregkh@linuxfoundation.org>
 <20200907145108.3766613-5-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200907145108.3766613-5-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Mon, Sep 07, 2020 at 04:51:01PM +0200, Greg Kroah-Hartman wrote:
> There are a few calls to usb_control_msg() that can be converted to use
> usb_control_msg_send() instead, so do that in order to make the error
> checking a bit simpler and the code smaller.
> 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> v2:
>  - dropped changes to usb_req_set_sel() thanks to review from Alan

> @@ -4056,7 +4035,7 @@ static void usb_enable_link_state(struct usb_hcd *hcd, struct usb_device *udev,
>  	 * associated with the link state we're about to enable.
>  	 */
>  	ret = usb_req_set_sel(udev, state);
> -	if (ret < 0) {
> +	if (ret) {
>  		dev_warn(&udev->dev, "Set SEL for device-initiated %s failed.\n",
>  				usb3_lpm_names[state]);
>  		return;

Did this change survive by mistake?

Actually, it looks like usb_req_set_sel needs to check the value 
returned by usb_control_msg -- a perfect example of the sort of thing 
you were trying to fix in the first place!

Alan Stern
