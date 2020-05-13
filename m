Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B2F1D0A7A
	for <lists+linux-bluetooth@lfdr.de>; Wed, 13 May 2020 10:05:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730240AbgEMIEz (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 13 May 2020 04:04:55 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:39658 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgEMIEz (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 13 May 2020 04:04:55 -0400
Received: from [192.168.1.91] (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id 07F8ECED09;
        Wed, 13 May 2020 10:14:34 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v1] Bluetooth: L2CAP: add support for waiting
 disconnection resp
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200414160758.v1.1.Idab9dcdc7da549ed1fd5c66341fb8baffaee8d10@changeid>
Date:   Wed, 13 May 2020 10:04:21 +0200
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Archie Pusaka <apusaka@chromium.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <0B6777C3-DF32-40C0-86DF-127F93D1A7DA@holtmann.org>
References: <20200414160758.v1.1.Idab9dcdc7da549ed1fd5c66341fb8baffaee8d10@changeid>
To:     Archie Pusaka <apusaka@google.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Archie,

> Whenever we disconnect a L2CAP connection, we would immediately
> report a disconnection event (EPOLLHUP) to the upper layer, without
> waiting for the response of the other device.
> 
> This patch offers an option to wait until we receive a disconnection
> response before reporting disconnection event, by using the "how"
> parameter in l2cap_sock_shutdown(). Therefore, upper layer can opt
> to wait for disconnection response by shutdown(sock, SHUT_WR).
> 
> This can be used to enforce proper disconnection order in HID,
> where the disconnection of the interrupt channel must be complete
> before attempting to disconnect the control channel.
> 
> Signed-off-by: Archie Pusaka <apusaka@chromium.org>
> ---
> 
> net/bluetooth/l2cap_sock.c | 30 +++++++++++++++++++++++-------
> 1 file changed, 23 insertions(+), 7 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

