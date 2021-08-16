Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35F473EDA44
	for <lists+linux-bluetooth@lfdr.de>; Mon, 16 Aug 2021 17:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237169AbhHPP4U (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 16 Aug 2021 11:56:20 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:54892 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237474AbhHPPzq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 16 Aug 2021 11:55:46 -0400
Received: from smtpclient.apple (p5b3d23f8.dip0.t-ipconnect.de [91.61.35.248])
        by mail.holtmann.org (Postfix) with ESMTPSA id 8041CCECC8;
        Mon, 16 Aug 2021 17:55:13 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v4 1/2] Bluetooth: Fix handling of LE Enhanced Connection
 Complete
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210811232016.757154-1-luiz.dentz@gmail.com>
Date:   Mon, 16 Aug 2021 17:55:13 +0200
Cc:     linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C5BED646-C6E3-4CF2-AF07-D8D56A3087B1@holtmann.org>
References: <20210811232016.757154-1-luiz.dentz@gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

> LE Enhanced Connection Complete contains the Local RPA used in the
> connection which must be used when set otherwise there could problems
> when pairing since the address used by the remote stack could be the
> Local RPA:
> 
> BLUETOOTH CORE SPECIFICATION Version 5.2 | Vol 4, Part E
> page 2396
> 
>  'Resolvable Private Address being used by the local device for this
>  connection. This is only valid when the Own_Address_Type (from the
>  HCI_LE_Create_Connection, HCI_LE_Set_Advertising_Parameters,
>  HCI_LE_Set_Extended_Advertising_Parameters, or
>  HCI_LE_Extended_Create_Connection commands) is set to 0x02 or
>  0x03, and the Controller generated a resolvable private address for the
>  local device using a non-zero local IRK. For other Own_Address_Type
>  values, the Controller shall return all zeros.'
> 
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
> net/bluetooth/hci_event.c | 93 ++++++++++++++++++++++++++-------------
> 1 file changed, 62 insertions(+), 31 deletions(-)

patch has been applied to bluetooth-next tree.

Regards

Marcel

