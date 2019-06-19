Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6E644BC9A
	for <lists+linux-bluetooth@lfdr.de>; Wed, 19 Jun 2019 17:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729202AbfFSPPc (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 19 Jun 2019 11:15:32 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:39302 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbfFSPPc (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 19 Jun 2019 11:15:32 -0400
Received: by mail-ua1-f49.google.com with SMTP id j8so10214813uan.6
        for <linux-bluetooth@vger.kernel.org>; Wed, 19 Jun 2019 08:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=HMa7oS0CmDrrKygTGF/ZlkmorzP0NmH2st8gqoaLAIo=;
        b=Ic1qMLi+OJMk15kAmxKU+lNtdZgMwrRNRWM/BUET1ayI5/61ZAnAKMcJA3+fgIg7jf
         tHzSUXLCSmi3MXCBQaUbAto1MXESJwZ3Y4FG0s6acZEonpUz1AJySbxsg0F9DfAk2T/3
         kC2dXnAP2pX8YTm9HiSDqHgCM/C1ST1nsoQieELjcMC3g0PIh73+VtBqPv0t++47NTu6
         wZvvqBfZ4OGlPLQsnf7E6RvJJBxajy2FQJDVzs+6wsod2pbj9B0GCL6cFj0M3EYTpLuw
         du7X1/h23kGoWBJ08ukfAhII0TyT8ZMwrIXP0yKWJgoz7pOmWuwxJIZGyiKD6py8S6ER
         EBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=HMa7oS0CmDrrKygTGF/ZlkmorzP0NmH2st8gqoaLAIo=;
        b=cRD1nSzf8kAEBSuUMZK1pAKgpWEJ7rDq8cHbnYl8iZEh79nPI6RNyNFS/kQPG38x1y
         38vmTwp0uMQUTUrz4ltpkXfCGxivcOsI2dmENshXU9m6HvLj2cUOuLGjkJuX7t4ygL2c
         GzGQfFQPSHFzCQDJ1pWLKbxqwwHZUTUdUgEEh+BM9IZAiYAlZAPRBTyz4VZQRLQ7YT7G
         yKXRxV42I8tIPjwwoSJpfGDdfVzhwoxSPMd5NGVNkqDK390s++j6xGDpsZj3ie40JwSW
         gx2V/FuVp5rl5ixpW//If9VIZQZKKBXqn6YHsEOTRZJzQncAIMk1ugQvMTYIkTiMHrgG
         vTUg==
X-Gm-Message-State: APjAAAUcy4U0PjU+Crek1awUo4H4ieLYBs8F30LAUnCRLsRvmiquUGrm
        8GDdTu1AP4ikFhCq1Oqk5CEqaYiHf/B9EN0HDu659XfO4ts=
X-Google-Smtp-Source: APXvYqxdTvJ6/9EFivxTdqSAPV7xX5r7p7ujFFYXrAf7hWmDiQjUvlfGhrBSREDeNjTuzcrlKTqe2K4vzv9jv5CjJzQ=
X-Received: by 2002:a67:7cd0:: with SMTP id x199mr59742434vsc.233.1560957330309;
 Wed, 19 Jun 2019 08:15:30 -0700 (PDT)
MIME-Version: 1.0
From:   Brice Waegenire <brice.wge@gmail.com>
Date:   Wed, 19 Jun 2019 17:15:18 +0200
Message-ID: <CAL5NfX2J1+obt-TaM8U1Fpd2V7g54ME_JsoX6OyjtKajoxTDPQ@mail.gmail.com>
Subject: 
To:     linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

subscribe linux-bluetooth
