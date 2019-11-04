Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99DCDEE20F
	for <lists+linux-bluetooth@lfdr.de>; Mon,  4 Nov 2019 15:21:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbfKDOVB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 4 Nov 2019 09:21:01 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:49005 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbfKDOVB (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 4 Nov 2019 09:21:01 -0500
Received: from marcel-macbook.fritz.box (p4FEFC197.dip0.t-ipconnect.de [79.239.193.151])
        by mail.holtmann.org (Postfix) with ESMTPSA id 52BD1CECD7;
        Mon,  4 Nov 2019 15:30:03 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH v2 1/3] dt-bindings: net: bluetooth: add DT binding for
 Realtek controllers
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191101080256.gjc4tacltehro3iw@hendrix>
Date:   Mon, 4 Nov 2019 15:20:59 +0100
Cc:     Hugo Grostabussiat <bonstra@bonstra.fr.eu.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <6C5CE71F-37F2-4C8A-9D94-1BC75937B478@holtmann.org>
References: <20191030224333.70241-1-bonstra@bonstra.fr.eu.org>
 <20191030224333.70241-2-bonstra@bonstra.fr.eu.org>
 <20191101080256.gjc4tacltehro3iw@hendrix>
To:     Maxime Ripard <mripard@kernel.org>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Hugo,

>> The rtl_bt driver already supports some Realtek controllers on ACPI
>> platforms.
>> This commit adds bindings for DT-only platforms.
>> 
>> Signed-off-by: Hugo Grostabussiat <bonstra@bonstra.fr.eu.org>
>> ---
>> .../bindings/net/realtek-bluetooth.txt        | 25 +++++++++++++++++++
>> 1 file changed, 25 insertions(+)
>> create mode 100644 Documentation/devicetree/bindings/net/realtek-bluetooth.txt
> 
> You should write that binding using a YAML description. Free-form
> device tree bindings are more or less deprecated now.

unless we change all the Bluetooth descriptions, I prefer we keep it the “old” way.

> IIRC, that has been discussed before and the standard "model" property
> was to be preferred.

This one should really get an ACK from Rob.

Regards

Marcel

