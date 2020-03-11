Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFDE18129B
	for <lists+linux-bluetooth@lfdr.de>; Wed, 11 Mar 2020 09:07:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbgCKIH4 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 11 Mar 2020 04:07:56 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40911 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726198AbgCKIHz (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 11 Mar 2020 04:07:55 -0400
Received: by mail-pg1-f195.google.com with SMTP id t24so748394pgj.7
        for <linux-bluetooth@vger.kernel.org>; Wed, 11 Mar 2020 01:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2jOVQl5+9J0j8ijQy6FuoHnmXDBHr3rV7a8z23r3KYE=;
        b=MVT1dtM9bnJZkDtuZWfjN8I7qdzjQ2iXDmJ6uGf0y50bEpkeBvV/WIFQFXtwUo+aFB
         xIHX/LeM0P73qLeAhGAD7RMZUgX+kmCIT7y8KCt9bRQ36/gJB8x/2pC89zGi7ys3pQWz
         WvcO9RtFBHzQqmOPBInGD4n4uaCtdu4H9CWrKsE01SjVVQUHIfTJXKOhemWP51yoRYpv
         kTztRJ5gH4cO5NEi4x076SIHx1rs/4mlciTgEePSDvq2ovDSzEYbu978bAtZQwxQ9W2t
         s1MGjc8iiqRw0tgNa9itR5L8ENbI8AeXIkiYB/G8Hu8nbAVl7VgjYaMDwRUFQkfhQHi2
         4lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=2jOVQl5+9J0j8ijQy6FuoHnmXDBHr3rV7a8z23r3KYE=;
        b=L/TWOUk3uGH846x10IUFgQnrr+m5v0GuQZVcokh5EUcvdpnZB9O5vrlS44I8vTE1Qh
         VVWV/mlJF+TG0JnqE3L9unT/ZYbePhkfYD8ZIN0TDc/QEJEzvmA22gZ+XzhZNyu0pm7l
         RA1oqhodsiUI1p/0aICX5YIAISlv4usJoDo16nppyU4sB0fGKqfWx6/kagwwukEa0yip
         jEcZQXXthNicvawClEnuxohqsGXSTN9N9PV0ysvkYUYVFcuDgMiMMtRXzg1ge9GmxgTV
         0OESS4+6Ppey9u9wxDfKeg8nssuJMKYz+NrShsUlUqDBQXXKo41GS4hf9Q/YzjsOhGjw
         2edg==
X-Gm-Message-State: ANhLgQ1FGxa9UKYXR/tpu/wCkWwS3ehvc0NayJ3CFT+MDyQuSyfTy8Ah
        i+54ouhXk/DX8HTgaeCIroQuGAiMkWEQBQ==
X-Google-Smtp-Source: ADFU+vtvbc37kXvKpQDWhLlweOosBMydvv5GB7vel580A/f6Bq/v6kKeNrzmWJ5kMvHCbii0HMYjyg==
X-Received: by 2002:a63:36cd:: with SMTP id d196mr1761213pga.280.1583914074802;
        Wed, 11 Mar 2020 01:07:54 -0700 (PDT)
Received: from localhost ([192.55.54.40])
        by smtp.gmail.com with ESMTPSA id bb13sm4622206pjb.43.2020.03.11.01.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 01:07:54 -0700 (PDT)
Date:   Wed, 11 Mar 2020 10:07:51 +0200
From:   Johan Hedberg <johan.hedberg@gmail.com>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_h5: Switch from BT_ERR to bt_dev_err
 where possible
Message-ID: <20200311080751.GB3293@rboyd-mobl.ger.corp.intel.com>
Mail-Followup-To: Marcel Holtmann <marcel@holtmann.org>,
        linux-bluetooth@vger.kernel.org
References: <20200309215723.442701-1-marcel@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309215723.442701-1-marcel@holtmann.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Marcel,

On Mon, Mar 09, 2020, Marcel Holtmann wrote:
> All HCI device specific error messages shall use bt_dev_err to indicate
> the device name in the message.
> 
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> ---
>  drivers/bluetooth/hci_h5.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Applied to bluetooth-next. Thanks.

Johan
