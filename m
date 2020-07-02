Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB11212475
	for <lists+linux-bluetooth@lfdr.de>; Thu,  2 Jul 2020 15:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbgGBNVr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 2 Jul 2020 09:21:47 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:54975 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726560AbgGBNVq (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 2 Jul 2020 09:21:46 -0400
Received: from marcel-macpro.fritz.box (p5b3d2638.dip0.t-ipconnect.de [91.61.38.56])
        by mail.holtmann.org (Postfix) with ESMTPSA id 932ABCED12;
        Thu,  2 Jul 2020 15:31:40 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 8/8] Bluetooth: Add support to enable LL PRIVACY using
 set_privacy
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20200701100432.28038-9-sathish.narasimman@intel.com>
Date:   Thu, 2 Jul 2020 15:21:45 +0200
Cc:     linux-bluetooth <linux-bluetooth@vger.kernel.org>,
        Sathish Narasimman <sathish.narasimman@intel.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <10FB84C9-79E7-48F9-88A5-B10FB67CB585@holtmann.org>
References: <20200701100432.28038-1-sathish.narasimman@intel.com>
 <20200701100432.28038-9-sathish.narasimman@intel.com>
To:     Sathish Narasimman <nsathish41@gmail.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Sathish,

> Enable LL Privacy using mgmt set_privacy command. The privacy
> value 0x03 is used here to enable LL Privacy.
> Still to use LL Privacy controller support is must.

that is not what I meant. And it is also misleading since Set Privacy is enabling RPA usage and not RPA resolution. So what I meant was using the Set Experimental Features mgmt command to enable usage of RPA resolution in the controller.

Regards

Marcel

