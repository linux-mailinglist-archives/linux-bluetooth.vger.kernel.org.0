Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B507D21DFE6
	for <lists+linux-bluetooth@lfdr.de>; Mon, 13 Jul 2020 20:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgGMSih convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 13 Jul 2020 14:38:37 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:33722 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgGMSih (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 13 Jul 2020 14:38:37 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 6ED94CECCB;
        Mon, 13 Jul 2020 20:48:34 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3] Bluetooth: create CONFIG_BT_DEBUG_FEATURE_FUNC_NAME
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200707195156.885137-1-alainm@chromium.org>
Date:   Mon, 13 Jul 2020 20:38:36 +0200
Cc:     Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
        Archie Pusaka <apusaka@chromium.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <C42E44A6-F222-4881-BC59-8EE1A85688EC@holtmann.org>
References: <20200707195156.885137-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> Creates a CONFIG_BT_DEBUG_FEATURE_FUNC_NAME option to include function names in
> debug statements.
> 
> Unlike other platforms __func__ isn't a string literal so it cannot be
> automatically concatenated by the pre-processor.  As a result, the
> function name is passed as a parameter to the tracing function.  Since
> pr_debug is a function like macro, the normal expansion of BT_PREFIX_PARAM
> does not work as it gets processed within the first parameter as well,
> for this reason, BT_DBG is split into two versions.
> 
> This patch was built tested with all 4 possible combinations of
> CONFIG_BT_DEBUG_FUNC_NAME and CONFIG_BT_FEATURE_DEBUG configurations.

you actually didn’t answer my question last time. Can we just always show the function names with CONFIG_BT_FEATURE_DEBUG and leave it as that.

Regards

Marcel

