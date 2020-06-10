Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9B71F5881
	for <lists+linux-bluetooth@lfdr.de>; Wed, 10 Jun 2020 18:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730449AbgFJQC3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 Jun 2020 12:02:29 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:53394 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726754AbgFJQC2 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 Jun 2020 12:02:28 -0400
Received: from marcel-macbook.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 1F909CECE7;
        Wed, 10 Jun 2020 18:12:17 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v1 1/3] mgmt: read/set system parameter definitions
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CALWDO_W4vnn-X-YYJ1AjvYMgoK+aDqY3gxKZOWqMw5x0C0y1Cg@mail.gmail.com>
Date:   Wed, 10 Jun 2020 18:02:27 +0200
Cc:     Alain Michaud <alainm@chromium.org>,
        BlueZ <linux-bluetooth@vger.kernel.org>,
        Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
        Yu Liu <yudiliu@google.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <950EAD0D-EFF1-45EC-8F4C-BEDFAF43C4B2@holtmann.org>
References: <20200609140351.153833-1-alainm@chromium.org>
 <20200609140351.153833-2-alainm@chromium.org>
 <F728221B-1F3D-421C-9164-BF6D3C9F6A41@holtmann.org>
 <CALWDO_W4vnn-X-YYJ1AjvYMgoK+aDqY3gxKZOWqMw5x0C0y1Cg@mail.gmail.com>
To:     Alain Michaud <alainmichaud@google.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> Since this has already been committed in user space, could we agree to
> keep it as is?  The alternative is that we'd need to re-patch all the
> userspace implementation through a seperate patch.  Up to you.

we can fix this up easily. And I can do that if needed.

> I won't have time to implement the runtime config ones in the next few
> weeks, feel free to post it separately, or I can get to it in July.

That is fine, then I will add it for you. It would be just great if you can review it though.

Regards

Marcel

