Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 408F717460C
	for <lists+linux-bluetooth@lfdr.de>; Sat, 29 Feb 2020 11:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgB2KKx (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sat, 29 Feb 2020 05:10:53 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:45610 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbgB2KKx (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sat, 29 Feb 2020 05:10:53 -0500
Received: by mail-oi1-f174.google.com with SMTP id v19so5425324oic.12
        for <linux-bluetooth@vger.kernel.org>; Sat, 29 Feb 2020 02:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=jP8OxWxaQkmAMcRo+puFYl5A+Q7X0BEWO/BCn5sqSL0=;
        b=gg2OBZg3RS53kHD5CdJfw1kjNIZYgVhVry3r4t5L743CJo+p38KVNAxG27NZOeBZGt
         b2sy2v5L1jL21VecVpm0DDoNfuyyienuhYgVrHhfhIAGMRBXEujN3X55nOPz493EI2E5
         3KkBtg7pzeIve6J49LfnyhhqRZlcSejUcgvwvSwKXLweQkUBM6SZSgZN1M4qjiykQVGz
         j+RMxiZCUufK1ukj4Fujf6YLyM0y9ncLysCfif1fOd493VhPi8g4DJfSz113EUB/LNFb
         xACf6NOPBCp4Jnv0n9C+ec9wwwibcb0PCU8xwg1erRLsLTeO9vMkYLCoU6iU7L6RyXN4
         Brng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=jP8OxWxaQkmAMcRo+puFYl5A+Q7X0BEWO/BCn5sqSL0=;
        b=C6YtTCFf0/SMkLVHSWcXlUJFXTuVDMszAf3tVqJ4Gli424CkqnId3et+fkfKNnqjgF
         +t8NDgnFifEr6WGgHSpSjB3yilKcOCCjgr7aOMoQvKRNmXcnuOzgOTmmimHIhUnHq/ro
         3zu9je2LPl6ebyWgYUyAUvrpotQ2bVlkCPj79eiODnZdO/ytvSnsngFMyQz/c0wfzTJJ
         fYtRjUHtyVt11U4tDQ8Qbi4cq2GDAjOgdOZ35+5RhFHdUcKDG2buYd9ahTmBkWAeMiPh
         r86YcvHphT2yGoPg4t7aFTCoI/b/0CsW/2kfeLC8usQlIC+M2WzBmRRnPk5B6CtSPWS5
         ZlLw==
X-Gm-Message-State: APjAAAX4OReGFyz7JIFY5A+bbYOR76xGqGngEZQmTZJFrq5dK3G6NQUg
        ZBhpA+l/5uf4/kA/LPO4O2rIxGqEUd8bCT+1Zfvp3g==
X-Google-Smtp-Source: APXvYqxvG4i7hx0ZvfcwjTXD4xAPjZFOwpt8t/ruU8BzgE+bVcHjyV9VpTKqXKx5HeQuk+c8/wVSOxKyVql8sV60zQM=
X-Received: by 2002:aca:4e02:: with SMTP id c2mr6055452oib.142.1582971050861;
 Sat, 29 Feb 2020 02:10:50 -0800 (PST)
MIME-Version: 1.0
From:   Emil Lenngren <emil.lenngren@gmail.com>
Date:   Sat, 29 Feb 2020 11:10:40 +0100
Message-ID: <CAO1O6sdGJeAKTHBVyDSUa7-Hp_ULYmfOHJEbb6=-B6xuPHvffQ@mail.gmail.com>
Subject: Get negotiated ATT MTU?
To:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi. I have a feature request that the negotiated ATT MTU should be
exposed as a property in the org.bluez.Device1 interface.

For some applications it's good to know or required how much data that
can be written / read / notified in each packet, and it's not always
desired or possible to use AcquireNotify / AcquireWrite.

/Emil
