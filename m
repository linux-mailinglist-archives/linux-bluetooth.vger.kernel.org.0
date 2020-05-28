Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB86F1E667C
	for <lists+linux-bluetooth@lfdr.de>; Thu, 28 May 2020 17:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404558AbgE1Poe (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 28 May 2020 11:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404543AbgE1Poa (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 28 May 2020 11:44:30 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1BFC08C5C6
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 May 2020 08:44:29 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d10so13639540pgn.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 28 May 2020 08:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/zE1r9PxY6UEdk2voI36d40mySx5vpu2AZb0S4BiO8M=;
        b=QugMqqM5vaYHQLLhqi3Ot6rcxeRNnN3bQNbPcrS2pY9pHbiZmXZ8Pw3pew58Txfuyq
         0+bY8+ASSBcH0vIsqkD8CvDKKCtDuhauNuodVWRNwHNLra6ZS7jm56vFAu4uPCj5N4Y+
         Dn50iFeFhuEsmKzfWaMrbOzr8q1yJdxtGwZ8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/zE1r9PxY6UEdk2voI36d40mySx5vpu2AZb0S4BiO8M=;
        b=PHDgeZn2Po3h3aBivwXuR/luK5ri1uxTfe387AtcvdoamiGBEjws1hI5PWUObrlf9d
         Y51gHqX4tr6JVuy735bOc5j/iuxMWInSe8O3CFeorQo5zbzni/ZP/Z49XZHYxTSmc9BW
         G98dxAqrLq4ULP45tQehvwNYjcQPR27+D5cSdDR5eHT9nN30Z2Z77jdm1WXTCvzWczkb
         klj+Xo2haRoX3Bn5ZHDoJDCnQtqMro5dFLJHb369O0Vem9NalOkcOpI6H1b4+uTn816s
         hIMb6LY2WNQgbRW9yhDQsqV7CwRomDzvCF90+uRWiRjp0O5MQhLlyj83nKTa/W95AUtl
         yejw==
X-Gm-Message-State: AOAM530nEt3HMexc0T2lZKcdFMcMsOxRUJwPW1hDpreUafZC+qWGQoqZ
        7yOMyHH7tSl4idWbqwsXh4FxFg==
X-Google-Smtp-Source: ABdhPJwOzx2HAvaVw5ElM6KwTbwGOQJAcwFK2lEZW0sisJKqC/Yq5Ydi+qekdg6VyNRK7qI+xGmxpw==
X-Received: by 2002:aa7:855a:: with SMTP id y26mr3704572pfn.281.1590680668994;
        Thu, 28 May 2020 08:44:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id q9sm5018528pff.62.2020.05.28.08.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2020 08:44:28 -0700 (PDT)
Date:   Thu, 28 May 2020 08:44:26 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Zijun Hu <zijuhu@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org,
        rjliao@codeaurora.org
Subject: Re: [PATCH v3] bluetooth: hci_qca: Fix qca6390 enable failure after
 warm reboot
Message-ID: <20200528154426.GJ4525@google.com>
References: <1590546759-27387-1-git-send-email-zijuhu@codeaurora.org>
 <20200527164832.GH4525@google.com>
 <4c5c9fd8-e90c-c7e2-8f21-edad3c3ca7ff@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4c5c9fd8-e90c-c7e2-8f21-edad3c3ca7ff@codeaurora.org>
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, May 28, 2020 at 01:04:25PM +0800, Zijun Hu wrote:
> 
> 
> On 5/28/2020 12:48 AM, Matthias Kaehlcke wrote:
> > Hi Zijun,
> > 
> > On Wed, May 27, 2020 at 10:32:39AM +0800, Zijun Hu wrote:
> >> Warm reboot can not restore qca6390 controller baudrate
> >> to default due to lack of controllable BT_EN pin or power
> >> supply, so fails to download firmware after warm reboot.
> >>
> >> Fixed by sending EDL_SOC_RESET VSC to reset controller
> >> within added device shutdown implementation.
> >>
> >> Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
> >> ---
> >>  drivers/bluetooth/hci_qca.c | 29 +++++++++++++++++++++++++++++
> >>  1 file changed, 29 insertions(+)
> >>
> >> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> >> index e4a6823..4b6f8b6 100644
> >> --- a/drivers/bluetooth/hci_qca.c
> >> +++ b/drivers/bluetooth/hci_qca.c
> >> @@ -1975,6 +1975,34 @@ static void qca_serdev_remove(struct serdev_device *serdev)
> >>  	hci_uart_unregister_device(&qcadev->serdev_hu);
> >>  }
> >>  
> >> +static void qca_serdev_shutdown(struct device *dev)
> >> +{
> >> +	int ret;
> >> +	int timeout = msecs_to_jiffies(CMD_TRANS_TIMEOUT_MS);
> >> +	struct serdev_device *serdev = to_serdev_device(dev);
> >> +	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
> >> +	const u8 ibs_wake_cmd[] = { 0xFD };
> >> +	const u8 edl_reset_soc_cmd[] = { 0x01, 0x00, 0xFC, 0x01, 0x05 };
> >> +
> >> +	if (qcadev->btsoc_type == QCA_QCA6390) {
> >> +		serdev_device_write_flush(serdev);
> >> +		serdev_device_write_buf(serdev,
> >> +				ibs_wake_cmd, sizeof(ibs_wake_cmd));
> >> +		serdev_device_wait_until_sent(serdev, timeout);
> > 
> > Why no check of the return value of serdev_device_write_buf() here,
> > does it make sense to continue if sending the wakeup command failed?
> > 
> i will correct it at v4 patch
> > Couldn't serdev_device_write() be used instead of the _write_buf() +
> > _wait_until_sent() combo?
> > 
> i don't think so, serdev_device_write() is not appropriate at here.
> serdev_device_write_wakeup() should be used to release completion hold
> by serdev_device_write(), however @hci_serdev_client_ops doesn't use
> serdev_device_write_wakeup() to implement its write_wakeup operation.
> we don't want to touch common hci_serdev.c code.

Thanks for the clarification!

> >> +		usleep_range(8000, 10000);
> >> +
> >> +		serdev_device_write_flush(serdev);
> > 
> > I suppose the flush is done because _wait_until_sent() could have timed out.
> > Another reason to use _device_write() (if suitable), since it returns
> > -ETIMEDOUT in that case?
> >
> flush is prefixed at write operation to speed up
> shutdown procedure in case of unexpected data injected
> during waiting for controller wakeup.

hm, wouldn't it be a bug if unexpected data is injected during shutdown? It
seems it would be better to detect such a problem and fix the root cause,
rather than papering over it.

Also, a flush doesn't really guarantee that there is no unexpected data when
serdev_device_write_buf() is called, it could be injected just after returning
from _flush().
