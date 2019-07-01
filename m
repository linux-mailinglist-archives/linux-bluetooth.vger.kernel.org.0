Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6E4225872
	for <lists+linux-bluetooth@lfdr.de>; Tue, 21 May 2019 21:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfEUTqD (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 21 May 2019 15:46:03 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33261 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbfEUTqD (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 21 May 2019 15:46:03 -0400
Received: by mail-pl1-f194.google.com with SMTP id g21so854037plq.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 21 May 2019 12:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lyXh2Bb2d9vjZwPG8os8xjTMOsIMYKTtLXK80D2Apf0=;
        b=fw5gIjLJvlJAYHrD854Ke0JnpyHVVy0N7xYc+nEjGEzsrBwkCNj0Lb+R9q8ifyazXp
         ItsR12w7AYH+xnlejHn1aQKMTvP87aY4g1ti6nafELgXkX5sFecNO14vrpyi5b0htUrV
         fOxfYHpf9MLWky9BOxyMVZ92S1I3xE91lCt7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lyXh2Bb2d9vjZwPG8os8xjTMOsIMYKTtLXK80D2Apf0=;
        b=qTvZkMBQSbR9qBevLkJ3SIe8B8lEt4mJ2g6PCO/j62hXHDExJwGBuDIAoRAVVgfnjj
         l916/PK3e/JsSWG0x2418d4QU9JpxIZJdnstFe7bw2ASi/AlfrxD/Hzy7ldqwhzKkF+/
         cCEjPMU+TiybQ+JpVMbKLgTq3LUJG6VX4lSRHdameCDYlGCzdYiEE5tffa23tpwYstV+
         u+m/kpJXw3ZIM9yjSQzNDtynj4RXiqrPcntQ6Pvkap6rMTYAGOoZKWu2QDgTysn9h668
         AyPtGrXE8D4az8z81on2ClyRmE7TbTPQ47hsSQbfNbBlc5eFfguUOTnFegvbyDAkjMV5
         uDmQ==
X-Gm-Message-State: APjAAAUrAyNPDEWgGzmB83E8hPb74cU/6gv7XgOtg0U9dJxNdd/Ndz4p
        dnLF65aBpOm+BFwUu3T0+lQYHg==
X-Google-Smtp-Source: APXvYqyStfrCj0r842nGnfm4OalgeT8c2Jdohtw5CB3fLZ1V3cwsjW4Nv7mqrX+HMliweGfKciYahQ==
X-Received: by 2002:a17:902:8f8d:: with SMTP id z13mr17922307plo.166.1558467962156;
        Tue, 21 May 2019 12:46:02 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:75a:3f6e:21d:9374])
        by smtp.gmail.com with ESMTPSA id u11sm23604007pfh.130.2019.05.21.12.46.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2019 12:46:01 -0700 (PDT)
Date:   Tue, 21 May 2019 12:46:00 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>,
        Harish Bandi <c-hbandi@codeaurora.org>,
        Rocky Liao <rjliao@codeaurora.org>
Subject: Re: [PATCH v3 2/2] Bluetooth: hci_qca: wcn3990: Drop baudrate change
 vendor event
Message-ID: <20190521194600.GI40515@google.com>
References: <20190429232131.183049-1-mka@chromium.org>
 <20190429232131.183049-2-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190429232131.183049-2-mka@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Mon, Apr 29, 2019 at 04:21:31PM -0700, Matthias Kaehlcke wrote:
> Firmware download to the WCN3990 often fails with a 'TLV response size
> mismatch' error:
> 
> [  133.064659] Bluetooth: hci0: setting up wcn3990
> [  133.489150] Bluetooth: hci0: QCA controller version 0x02140201
> [  133.495245] Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
> [  133.507214] Bluetooth: hci0: QCA TLV response size mismatch
> [  133.513265] Bluetooth: hci0: QCA Failed to download patch (-84)
> 
> This is caused by a vendor event that corresponds to an earlier command
> to change the baudrate. The event is not processed in the context of the
> baudrate change and is later interpreted as response to the firmware
> download command (which is also a vendor command), but the driver detects
> that the event doesn't have the expected amount of associated data.
> 
> More details:
> 
> For the WCN3990 the vendor command for a baudrate change isn't sent as
> synchronous HCI command, because the controller sends the corresponding
> vendor event with the new baudrate. The event is received and decoded
> after the baudrate change of the host port.
> 
> Identify the 'unused' event when it is received and don't add it to
> the queue of RX frames.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---

Harish Bandi <c-hbandi@codeaurora.org> privately reported to me that
he sees frame reassembly errors with this patch and WCN3998. He
didn't provide any more details yet, so at this point we only know
that there appears to be some difference between WCN3990 and WCN3998
wrt firmware download.

For now let's limit this fix to WCN3990. We can revisit WCN3998 later
if it is confirmed that it has the same problem.
