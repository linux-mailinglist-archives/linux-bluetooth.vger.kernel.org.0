Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDFF61EE84F
	for <lists+linux-bluetooth@lfdr.de>; Thu,  4 Jun 2020 18:09:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729629AbgFDQJg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 4 Jun 2020 12:09:36 -0400
Received: from mxout03.lancloud.ru ([89.108.73.187]:42232 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbgFDQJg (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 4 Jun 2020 12:09:36 -0400
X-Greylist: delayed 408 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Jun 2020 12:09:36 EDT
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 29EE920A0AC8
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
From:   Denis Grigorev <d.grigorev@omprussia.ru>
To:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: [PATCH BlueZ v2] gobex: Fix segfault caused by interrupted transfer
Thread-Topic: [PATCH BlueZ v2] gobex: Fix segfault caused by interrupted
 transfer
Thread-Index: AQHWOomWDqk6p3HDGEKlsiUiOxQmOg==
Date:   Thu, 4 Jun 2020 16:02:46 +0000
Message-ID: <674bf480e2064b2f2a687d14e43db237a1288a57.camel@omprussia.ru>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.11.133]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org


