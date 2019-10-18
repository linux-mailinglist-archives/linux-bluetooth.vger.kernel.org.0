Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A92BBDCD3F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 18 Oct 2019 20:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505622AbfJRSDm (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 18 Oct 2019 14:03:42 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41925 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbfJRSDm (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 18 Oct 2019 14:03:42 -0400
Received: by mail-pf1-f195.google.com with SMTP id q7so4339890pfh.8
        for <linux-bluetooth@vger.kernel.org>; Fri, 18 Oct 2019 11:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8/ZS+906/9FcfZAV3qaij45dj3UK3E6lm1Y4pz31ip8=;
        b=daWXD1nygLkP7A5y9K7cowvo3WWYzDRQR4UTxSWALIoMmSexkvrCrGbeludebonnvR
         lSrvphIFIfHSlvohBF/QW0GdN/0BsjuoIvIcxsQuANTT4o9vsQRiUUtH812PSNUysuQE
         qTp+cenvmSFjrNCkI12Nt/5rIi7qyfyNrhRto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8/ZS+906/9FcfZAV3qaij45dj3UK3E6lm1Y4pz31ip8=;
        b=kUA58OLFIRPUKXabboKgb+LKx2LWKwIAaQPYsXV7j32CnE5LOnjCXYHjBOzLXISYid
         sShLfbCqEKnfycgqPPuZ2yvujL4TAnYcSUpEEB9TDQzXOXaWXKiwIRzFtGH6kbaQ+oIv
         7cw70miE6WehWAys73y1J1PVLgpwjLvLz5Tl1ZsdqDDqgmLSq8B/ciDWXyi3ib7SngWb
         nhqEdxXntHSN0AE7wff+ROOn63bMw3Khj24ZmMh58Xs71Qt79vL9ALGTKSlYBJb61jVN
         Dim0Sw+sHL54wK++JZKde/2ZVl3T5QzwdjBcZrNHMpkZe/ZrUYxs1y1D8MeCfkbjiqZB
         3QmA==
X-Gm-Message-State: APjAAAWxGJKMIrvyWpl/lMX43qNHJMjKhXqS3G551rnGWEWBuSdyebnl
        LErc8qgtK5XgeAGUk1bHfCf8BA==
X-Google-Smtp-Source: APXvYqzPFGfktG3Py1x/vmEI6cC7z8QO39KHafDjtPfHiiUUnrPmfUmcK6PTAQJBIhon1QiV/qEFuA==
X-Received: by 2002:a63:c901:: with SMTP id o1mr11394460pgg.66.1571421821320;
        Fri, 18 Oct 2019 11:03:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id y66sm7424489pgy.23.2019.10.18.11.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Oct 2019 11:03:40 -0700 (PDT)
Date:   Fri, 18 Oct 2019 11:03:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        c-hbandi@codeaurora.org, bgodavar@codeaurora.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_qca: Add delay for wcn3990 stability
Message-ID: <20191018180339.GQ87296@google.com>
References: <20191017212955.6266-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191017212955.6266-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Thu, Oct 17, 2019 at 02:29:55PM -0700, Jeffrey Hugo wrote:
> On the msm8998 mtp, the response to the baudrate change command is never
> received.  On the Lenovo Miix 630, the response to the baudrate change
> command is corrupted - "Frame reassembly failed (-84)".
> 
> Adding a 50ms delay before re-enabling flow to receive the baudrate change
> command response from the wcn3990 addesses both issues, and allows
> bluetooth to become functional.

From my earlier debugging on sdm845 I don't think this is what happens.
The problem is that the wcn3990 sends the response to the baudrate change
command using the new baudrate, while the UART on the SoC still operates
with the prior speed (for details see 2faa3f15fa2f ("Bluetooth: hci_qca:
wcn3990: Drop baudrate change vendor event"))

IIRC the 50ms delay causes the HCI core to discard the received data,
which is why the "Frame reassembly failed" message disappears, not
because the response was received. In theory commit 78e8fa2972e5
("Bluetooth: hci_qca: Deassert RTS while baudrate change command")
should have fixed those messages, do you know if CTS/RTS are connected
on the Bluetooth UART of the Lenovo Miix 630?
