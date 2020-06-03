Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 496381ED51E
	for <lists+linux-bluetooth@lfdr.de>; Wed,  3 Jun 2020 19:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgFCRkd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 3 Jun 2020 13:40:33 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:40578 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbgFCRkc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 3 Jun 2020 13:40:32 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 93F99CED2C;
        Wed,  3 Jun 2020 19:50:19 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Should we disable ERTM as default?
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CAPHZWUe9sLt8jsD57i3=PQxMfjODP7dUYLBm2qpSXFdgd9cvAQ@mail.gmail.com>
Date:   Wed, 3 Jun 2020 19:40:31 +0200
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>,
        ChromeOS BT Qualification <chromeos-bt-qual@google.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <64A824C9-7C3C-4B08-8A9E-827121C4786D@holtmann.org>
References: <CAPHZWUe9sLt8jsD57i3=PQxMfjODP7dUYLBm2qpSXFdgd9cvAQ@mail.gmail.com>
To:     Yun-hao Chung <howardchung@google.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Yun-hao,

> When I ran the following tests in PTS qualification on Chrome OS, I
> couldn’t pass all of them because they all failed to create an AVDTP
> connection with channel type as ‘Streaming’ or ‘Enhanced
> Retransmission’.
> 
> - MPS/AG-SRC-TG/HFAV/CLH/SD/BV-03-I
> - MPS/AG-SRC-TG/HFAV/CLH/SD/BV-04-I
> - MPS/AG-SRC-TG/HFAV/CLH/SD/BV-05-I
> - MPS/AG-SRC-TG/HFAV/CLH/SD/BV-06-I
> 
> It looks like bluez doesn’t want to change its mode even though it
> claims it supports them. Our question is do we still want to enable
> this feature as default?

I am a bit confused. So when you use the disable_ertm kernel parameters, these test pass? But ERTM is mandatory for AVRCP 1.3 and later.

Are we sure that MPS test cases are correct? I mean, we never required ERTM for HFP since that is based on RFCOMM and ERTM is useless for RFCOMM.

Regards

Marcel

