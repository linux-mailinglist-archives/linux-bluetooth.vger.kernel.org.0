Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1909939D2C6
	for <lists+linux-bluetooth@lfdr.de>; Mon,  7 Jun 2021 03:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbhFGCAZ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 6 Jun 2021 22:00:25 -0400
Received: from mail-qv1-f51.google.com ([209.85.219.51]:34627 "EHLO
        mail-qv1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhFGCAX (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 6 Jun 2021 22:00:23 -0400
Received: by mail-qv1-f51.google.com with SMTP id hf3so2188704qvb.1
        for <linux-bluetooth@vger.kernel.org>; Sun, 06 Jun 2021 18:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=TZ3fbnw0dHyN2xr2hVf1US2R/f4ZBnSgB3Om3hO5kzM=;
        b=XBSVSwWXpPtjEUtBqXEq8hXfwj5G71J5kVoBs+BOMjKhcuNxDhAdpK8ACgpYXWFQZ4
         jHPUMBWOSewYIgKEmGQMmawRj1P6BFvvW+giKp+S+j3Rz+H4TLtbE5XbzqgqOr+fVAoA
         8mjzf+/iGHjafbvj0aHpJ1s2rMucz1gy5nCCM0yLhJgH3S/a5vbzoAZOpV6zvEdn0L91
         LkEHw29dRGFt1mujet0usF3wUjBqY/O6AQVScklCtHxliiIZDhBtPvHRjTFLZYVPbroL
         WLYNBBk2g2flDrC1gB7wGga1xKQAShwAat2zxVKxZRNM16Ho/g6iNx7c4McIxsel+8SR
         ++1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=TZ3fbnw0dHyN2xr2hVf1US2R/f4ZBnSgB3Om3hO5kzM=;
        b=lOQeV2j/D6dMtvNGFqP2Qxr6xCkgQeLjS/MpiRlNfItnw4nTTwx1h4zYTR28F5SIQC
         5Su0aGaX3j3xC0Xn2wK+lcYw9Isk8sdLuXOkn03Fdg53VdHopmfal8prqBzEzU6K1vE4
         gAK41OQqQzynCS3gStpdOg6vsX3tf57usOpA+S8werIEBUziZGEvRhBLeH8g3wgm+Nm9
         pJiZ33TfO1ocsYlgDiMLwOQS+XhSpQ8mV+al34CnWH2VQkJWpf6cwyj+tqTEWJqw5YUv
         WIMjNV2THVwp1QWxVdYIFqtsoKNjy4Jbu83S6TBvRfWbgSpsAw24QNJy9I4TdEs+jAXD
         4pMQ==
X-Gm-Message-State: AOAM530MVbshDBCmosYgu/EAOb8wiPtUz7KcTxQzQUyN73hpO3Lp82ZS
        StjAgqHCSj9No7Qaxa1OpaoZgtjtGkMIy8xXwYZyAoy99OUj+Q==
X-Google-Smtp-Source: ABdhPJyiOFVmY95j7NmpR5NqQftb7fu6ZoJeGHZtf533T9c8dA+ZN31vhxEz288RIVdUcEKA6blKaF7e1rX0QzZshtc=
X-Received: by 2002:a05:6214:848:: with SMTP id dg8mr15907615qvb.2.1623031036499;
 Sun, 06 Jun 2021 18:57:16 -0700 (PDT)
MIME-Version: 1.0
From:   "jonsmirl@gmail.com" <jonsmirl@gmail.com>
Date:   Sun, 6 Jun 2021 21:57:05 -0400
Message-ID: <CAKON4OyOnKBOECYBSqDDQ+iX-UxH6Q3t=CXcm62CMuH2nmpRfw@mail.gmail.com>
Subject: Bluetooth 6lowpan and kernel lockdown
To:     BlueZ development <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

6lowpan_enable and 6lowpan_control parameters are exposed via debugfs.
Since Ubuntu has turned on kernel lockdown by default I can't access
debugfs anymore.  If I want to turn on 6lowpan_enable in Ubuntu my
only solution is to turn off secure boot. I've done that and it works,
but could these parameters be reworked so as to not require turning
off secure boot in order to enable bluetooth 6lowpan?

-- 
Jon Smirl
jonsmirl@gmail.com
