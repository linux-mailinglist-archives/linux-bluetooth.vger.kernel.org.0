Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 076EA193309
	for <lists+linux-bluetooth@lfdr.de>; Wed, 25 Mar 2020 22:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbgCYVvd convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 25 Mar 2020 17:51:33 -0400
Received: from smtpemea1.avnet.com ([193.34.102.163]:15110 "EHLO
        smtpemea1.avnet.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgCYVvd (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 25 Mar 2020 17:51:33 -0400
Received: from depoiy0mx16emp3.emea.avnet.com (Not Verified[172.23.112.136]) by smtpemea1.avnet.com with Trustwave SEG (v8,2,4,11170) (using TLS: TLSv1.2, AES256-GCM-SHA384)
        id <B5e7bd2540000>; Wed, 25 Mar 2020 22:51:16 +0100
Received: from depoiy0mx16ems2.EMEA.AVNET.COM (172.23.112.131) by
 depoiy0mx16emp3.emea.avnet.com (172.23.112.136) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Wed, 25 Mar 2020 22:51:15 +0100
Received: from depoiy0mx16ems2.EMEA.AVNET.COM ([fe80::ec40:99d5:cf9e:6171]) by
 depoiy0mx16ems2.emea.avnet.com ([fe80::ec40:99d5:cf9e:6171%9]) with mapi id
 15.01.1913.007; Wed, 25 Mar 2020 22:51:15 +0100
From:   "Staude, Oliver (Avnet Silica)" <Oliver.Staude@avnet.eu>
To:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Is there a minimum Kernel Version to use BLE Coded PHY?
Thread-Topic: Is there a minimum Kernel Version to use BLE Coded PHY?
Thread-Index: AdYC628u6IOI/7S+RYi19Lv3ogDXqg==
Date:   Wed, 25 Mar 2020 21:51:15 +0000
Message-ID: <af340b907dca4043a40b05f1b9d28d7a@avnet.eu>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.23.112.212]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=e6Z4tph/ c=1 sm=1 tr=0 a=zA+5O3+X1HsNEZOyVyW7zw==:117 a=xqWC_Br6kY4A:10 a=Ushzl3fgtdAA:10 a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10 a=1oJP67jkp3AA:10 a=SS2py6AdgQ4A:10 a=cU6kfCkelfAA:10 a=ZZnuYtJkoWoA:10 a=n1qitD2PK_ncAblPwjAA:9 a=CjuIK1q_8ugA:10
X-SEG-SpamProfiler-Score: 0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Bluetooth Team,

are there any dependencies in BlueZ on Linux Kernel modules to enable the BLE Coded PHY (Long Range) feature?
If yes, which is the minimum Kernel Version that has to be used?

I want to use it for a project under Raspbian Stretch  (so Kernel V4.14xx) interfacing to a Nordic nRF52840 Controller 
interfacing via HCI_USB implemnted under ZephyrOS.

Hope you can provide the wanted information.

Thanks in advance and kind regards

Oliver Staude
Senior Field Application Engineer
AVNET Silica
Germany
We continuously commit to comply with the applicable data protection laws and ensure fair and transparent processing of your personal data. 
Please read our privacy statement including an information notice and data protection policy for detailed information on our website.
