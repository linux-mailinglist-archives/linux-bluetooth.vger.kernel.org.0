Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D6E24983D
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 Aug 2020 10:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgHSI2l (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 Aug 2020 04:28:41 -0400
Received: from sender4-op-o11.zoho.com ([136.143.188.11]:17150 "EHLO
        sender4-op-o11.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgHSI2k (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 Aug 2020 04:28:40 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1597825718; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=fW+jHXIGe0SBHygLKqWSni2m7kq8jQYaMF03r5Dl+EPll++VF/9u/QkGzdBS5WXpjxBdG67p+tJMoiDmk+m4alOSM26AK0YWJk1NzNyciprM/o6SfKjQCt8jwh3BpG5XfexKxkogaBe96ba98dzfNddpEf4RUnFnQOb2b7wYbkc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1597825718; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=KRkOzLc/Uwuw5dAitluju1NDAe8XJoRqijty0SThLCc=; 
        b=c44UAskkfBnU3vc5Mb54F3Tp7f/AAgCGw80YAYMLg4kY3nJ7yduhG/Umo2UlaV0xo4mCdLxL8XzWuMnu6I9Ck97VLMStgyrEDqyqUDV+mSedeP0eocO6QTxaaSxOIEedwD95st28JKwf+0B1m9bL1VGZhRCG8wV80MrrfMm1E/Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=dptechnics.com;
        spf=pass  smtp.mailfrom=daan@dptechnics.com;
        dmarc=pass header.from=<daan@dptechnics.com> header.from=<daan@dptechnics.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1597825718;
        s=zoho; d=dptechnics.com; i=daan@dptechnics.com;
        h=From:To:Cc:Message-ID:Subject:Date:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=KRkOzLc/Uwuw5dAitluju1NDAe8XJoRqijty0SThLCc=;
        b=WAuSuyVCidN+GmjgN7yfciZcmyFmKQKbVFhdpDY37lnMkh84wApiyunmhODupX3x
        v4pzaEo6frSgEOzdLszTayQqMPpLQDIjLDRT7KQMzBEErw5EJX6bdfposBNh8nMw88f
        Yg/9Xf6Xx2SJFLe9yyEfE59LcIZD1hqJDBsOtf2g=
Received: from daan-devbox.dptechnics.local (178-116-74-88.access.telenet.be [178.116.74.88]) by mx.zohomail.com
        with SMTPS id 1597825714430753.4998273038578; Wed, 19 Aug 2020 01:28:34 -0700 (PDT)
From:   Daan Pape <daan@dptechnics.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Daan Pape <daan@dptechnics.com>
Message-ID: <20200819082822.64903-1-daan@dptechnics.com>
Subject: [PATCH BlueZ 0/1] Added random address in mesh HCI initialization to prevent error 0x12 when enabling/disabling LE scans
Date:   Wed, 19 Aug 2020 10:28:21 +0200
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

I had compiled bluez for OpenWRT and was running the bluetooth-meshd
daemon with a Fanstel BT680T module which implement the Bluetooth 5.0
core specification.

The daemon did not properly start and failed with error:

LE Scan enable failed (0x12)

This error is described on page 2496 of the Bluetooth Core Specification
Version 5.2 and is caused by the fact that no random address was
initialized. After the valuable input of Brian Gix on my first patch, I
have now prepared this patch.

I have now added a random address intialization after the HCI was reset
in the configure_hci function. The HCI layer is now correctly initialized
and no 0x12 errors are thrown.

This is the first time that I contribute to Bluez so please forgive me
if I made any styling mistake in the patch format. I also did not include
my details in the 'AUTHORS' file just yet as I first wanted to wait
for your reaction. In case the patch is accepted my name can be added
to the 'AUTHORS' file as:

Daan Pape <daan@dptechnics.com>

Please do not hesitate to ask any further questions if neccesary.

Kind regards,
Daan Pape

Daan Pape (1):
  Added random address in mesh HCI initialization to prevent error 0x12
    when enabling/disabling LE scans

 mesh/mesh-io-generic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

--=20
2.20.1


