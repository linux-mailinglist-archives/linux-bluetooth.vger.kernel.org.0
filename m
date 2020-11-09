Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C202ABC94
	for <lists+linux-bluetooth@lfdr.de>; Mon,  9 Nov 2020 14:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730963AbgKINjC (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 9 Nov 2020 08:39:02 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:54298 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730137AbgKINBr (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 9 Nov 2020 08:01:47 -0500
Received: from marcel-macbook.fritz.box (p4fefcf0f.dip0.t-ipconnect.de [79.239.207.15])
        by mail.holtmann.org (Postfix) with ESMTPSA id 50F57CECC6;
        Mon,  9 Nov 2020 14:08:52 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH BlueZ] doc/coding-style: Allow spaces after tabs for
 indenting wrapped lines
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CAO271mkmWKLssFeohZhBQvyiJL6TJxeJjkr4f5tycS2kLqACeg@mail.gmail.com>
Date:   Mon, 9 Nov 2020 14:01:43 +0100
Cc:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <EC1B842F-DAD2-45F9-A46F-6137084ACCA1@holtmann.org>
References: <20200916232924.129991-1-sonnysasaka@chromium.org>
 <ED6A96A4-A97A-423B-9E62-80BDA3A07164@holtmann.org>
 <CAO271mkmWKLssFeohZhBQvyiJL6TJxeJjkr4f5tycS2kLqACeg@mail.gmail.com>
To:     Sonny Sasaka <sonnysasaka@chromium.org>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sonny,

> Could you share the reason behind the "only tab for indentation" rule
> for userspace code? I find that it is hard to format the code and it'd
> be good if we adopt the kernel space style indentation as well which
> increases readability and ease of code formatting.

the coding style in BlueZ userspace is the original coding style that we
also keep in other projects like ConnMan, oFono, iwd, ELL etc. So I have no
interest in changing it.

Kernel patches use different coding style than userspace and that is fine.

Regards

Marcel

