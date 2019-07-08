Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0139D626C4
	for <lists+linux-bluetooth@lfdr.de>; Mon,  8 Jul 2019 19:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390300AbfGHRAT (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 8 Jul 2019 13:00:19 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:44802 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726318AbfGHRAS (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 8 Jul 2019 13:00:18 -0400
Received: by mail-oi1-f171.google.com with SMTP id e189so13092402oib.11
        for <linux-bluetooth@vger.kernel.org>; Mon, 08 Jul 2019 10:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Y20c+NhrqTftkOZRrUjxnev73HvogtPS+RzgOAj5pLg=;
        b=oJRZOrSvI7o3uh4rOkqPUlGu+3Jzf1Aajn+2xBXcOAACQ53/26dnpNg5zfmEMLVfV0
         qqTTmL6HoJ6625TU9thoJVFZcCt4lpzXmEB2ZG4Wb5DBPFVpcIKdV9bcRZ2LhamTaHv2
         QbbLaUBMt/LwwWBRTTRTc+z8CrA2NPTVqlIiiQzT97EugMXohLCY1TJqyUBrx/BskRqi
         vTYXHz9MHPT2bEG6CFGPgnpfKKH02XF1tgdjbt5FgcjsCtmbvovx2FgJ1R77FOrkKrCv
         bR/df+jO8P2KUWr7w5BGa18vXA3fkL3Vt3wT4nxmMlYzpte2UamD7Hdm1CP+1bkA7aPJ
         7lgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Y20c+NhrqTftkOZRrUjxnev73HvogtPS+RzgOAj5pLg=;
        b=GvT0gndU8TkVKLDaRR3njEjrqsqpW1BtqtwrNWk35WHM0jjxuzCDIpbm/gmEzwyUvB
         PXpqE5nO+Fx3KFaqqfpHSSy0MB80iP/zA+61EFc1OhTi8LSF4m0Lk5DROoyJJVIalFpB
         68QV3N2Epft7XCG2mKuewuHGy4MHwzggt308glIktrE6YVTgf6vXgUOvZPS84vdKYkUL
         jxE3LvWR/+0ZQ+1Y5q5zJHXDS5OxB2HZS5hD4s1gQ04OJ0L4aC8xEZ+pmi6OwFe2sXKY
         TVa2vAadrmz9aPGJ+em1Dcqti31CSqV8ViBSEnTNubazdIipbLfC0pZ3QEVKIfKiA4Zb
         t6sA==
X-Gm-Message-State: APjAAAUIeUPfdkAoU37FHiDrDcKTAkbUTly1Dd30JU2MCx0XY3V1IgPi
        RrK3Kmkn3h7OJhEX+Ov+Cg0khgpL6p3+2yXITpTtsA==
X-Google-Smtp-Source: APXvYqyIR7C33nlfrNcOgjqz71Wg5KsWShlGtL0aYpraqIqQxLVniDDzWhPXHVAKctsDnokqRkb79wZ/Ty/EmDejahc=
X-Received: by 2002:aca:51ce:: with SMTP id f197mr3358173oib.33.1562605216892;
 Mon, 08 Jul 2019 10:00:16 -0700 (PDT)
MIME-Version: 1.0
From:   Edward Fung <jjsheepman@gmail.com>
Date:   Mon, 8 Jul 2019 10:00:05 -0700
Message-ID: <CAK_dC=N1qN-OqM=fCTWmX=jmjntiGoTAchwJAbGWeC6nx9kk9g@mail.gmail.com>
Subject: Setting up GATT server using bluetoothctl tool
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello team,

I'm able to set up a few service/characteristic combinations with the
latest bluetoothctl tool using the following commands:

register-service
register-characteristic
register-application

I was just wondering if there is a way to define GATT-based service
for use only over the BR/EDR transport or LE transport using the
bluetoothctl tool or any Bluez utility tool? Can anyone shed some
light on this? Thanks.

Edward
