Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A0E833DA7D
	for <lists+linux-bluetooth@lfdr.de>; Tue, 16 Mar 2021 18:19:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236059AbhCPRTA (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 16 Mar 2021 13:19:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:43562 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236716AbhCPRSo (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 16 Mar 2021 13:18:44 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: fdanis)
        with ESMTPSA id A497A1F44DEC
From:   =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Danis?= 
        <frederic.danis@collabora.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH Bluez v5 0/4] adapter: Fix discovery trigger for 0 second delay
Date:   Tue, 16 Mar 2021 18:18:32 +0100
Message-Id: <20210316171836.28501-1-frederic.danis@collabora.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

When calling `StartDiscovery` the effective start can take around 10 ms or
up to 700 ms.
g_timeout_add_seconds() call doesn't ensure the time for the first call of
the timer if the delay is less or equal to 1 second.

v2: Fix issue found by CI
v3: Add a wrapper function for g_timeout_add_seconds and replace calls to it in
    src/*, profiles/* and plugins/*
v4: Fix issue found by CI
v5: Fix issue found by CI

Frédéric Danis (4):
  shared/timeout: Add timeout_add_seconds abstraction
  src: Replace calls to g_timeout_add_seconds by timeout_add_seconds
  plugins: Replace calls to g_timeout_add_seconds by timeout_add_seconds
  profiles: Replace calls to g_timeout_add_seconds by
    timeout_add_seconds

 plugins/policy.c              | 91 ++++++++++++++++++-----------------
 profiles/audio/a2dp.c         | 17 ++++---
 profiles/audio/avctp.c        | 44 +++++++++--------
 profiles/audio/avdtp.c        | 61 ++++++++++++-----------
 profiles/audio/avrcp.c        | 13 ++---
 profiles/health/hdp.c         | 16 +++---
 profiles/health/mcap.c        | 21 ++++----
 profiles/input/device.c       | 33 +++++++------
 profiles/network/bnep.c       | 12 +++--
 profiles/sap/server.c         | 13 ++---
 src/adapter.c                 | 90 ++++++++++++++++++----------------
 src/adv_monitor.c             | 14 +++---
 src/advertising.c             | 28 ++++++-----
 src/device.c                  | 60 ++++++++++++-----------
 src/main.c                    |  7 +--
 src/sdp-client.c              | 13 ++---
 src/shared/tester.c           | 16 +++---
 src/shared/timeout-ell.c      |  6 +++
 src/shared/timeout-glib.c     | 27 +++++++++++
 src/shared/timeout-mainloop.c |  6 +++
 src/shared/timeout.h          |  3 ++
 21 files changed, 332 insertions(+), 259 deletions(-)

--
2.18.0
