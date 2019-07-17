Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B39C06B6C3
	for <lists+linux-bluetooth@lfdr.de>; Wed, 17 Jul 2019 08:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbfGQGiO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 17 Jul 2019 02:38:14 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:55947 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQGiO (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 17 Jul 2019 02:38:14 -0400
X-Originating-IP: 78.226.103.102
Received: from [192.168.1.49] (bra49-1-78-226-103-102.fbx.proxad.net [78.226.103.102])
        (Authenticated sender: thierry.didi@tidiwi.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 0358E40002
        for <linux-bluetooth@vger.kernel.org>; Wed, 17 Jul 2019 06:38:12 +0000 (UTC)
To:     linux-bluetooth@vger.kernel.org
From:   Thierry Didi <thierry.didi@tidiwi.com>
Subject: Adaptative Frequency Hopping support in linux BLE Stack
Message-ID: <7da5c3ec-8b76-84ca-69d7-c9ecbb7b9791@tidiwi.com>
Date:   Wed, 17 Jul 2019 08:38:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: fr
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Dear All,

I am trying to understand if BLE Adaptative Frequency Hopping is 
supported by the linux BLE Stack (this does not seem to be the case for 
all BLE stack ...).

If it is supported by the stack, does it depend on the BLE SOC used (it 
looks like Cypress Soc supports it while it looks like some TI Stack 
don't) ?

Many thanks

Thierry


