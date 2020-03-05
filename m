Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF1C17A3BE
	for <lists+linux-bluetooth@lfdr.de>; Thu,  5 Mar 2020 12:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgCELKz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 5 Mar 2020 06:10:55 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:57621 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgCELKz (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 5 Mar 2020 06:10:55 -0500
Received: from marcel-macbook.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id CEBB5CECE9;
        Thu,  5 Mar 2020 12:20:21 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: [BlueZ PATCH v2] Adding definitions for Wide Band Speech
 configuration
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200304203152.111935-1-alainm@chromium.org>
Date:   Thu, 5 Mar 2020 12:10:54 +0100
Cc:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <634EDB16-907F-42B8-A717-826EE334B1D5@holtmann.org>
References: <20200304203152.111935-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change adds the corresponding user space definition for wide band
> speech.
> 
> ---
> 
> lib/mgmt.h | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)

patch has been applied.

However I did change WIDE_BAND to WIDEBAND as mentioned in the other review.

Regards

Marcel

