Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E85751F7894
	for <lists+linux-bluetooth@lfdr.de>; Fri, 12 Jun 2020 15:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgFLNMH (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 12 Jun 2020 09:12:07 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:54231 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbgFLNMH (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 12 Jun 2020 09:12:07 -0400
Received: from marcel-macbook.fritz.box (ip-109-41-64-170.web.vodafone.de [109.41.64.170])
        by mail.holtmann.org (Postfix) with ESMTPSA id 83766CED04;
        Fri, 12 Jun 2020 15:21:54 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v1] bluetooth:using 8bits for the hci cmsg state flags
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200611142610.18125-1-alainm@chromium.org>
Date:   Fri, 12 Jun 2020 15:12:04 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <1DD72F8B-B887-4616-AD6D-D97C58B0DF32@holtmann.org>
References: <20200611142610.18125-1-alainm@chromium.org>
To:     Alain Michaud <alainm@chromium.org>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Alain,

> This change implements suggestions from the code review of the sco cmsg
> state flag patch.
> 
> Signed-off-by: Alain Michaud <alainm@chromium.org>
> ---
> 
> include/net/bluetooth/hci_sock.h | 4 ++--
> net/bluetooth/hci_sock.c         | 4 ++--
> 2 files changed, 4 insertions(+), 4 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

