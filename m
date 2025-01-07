Return-Path: <linux-bluetooth+bounces-9592-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E1AA0485E
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jan 2025 18:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5A3E3A120D
	for <lists+linux-bluetooth@lfdr.de>; Tue,  7 Jan 2025 17:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E86518C03B;
	Tue,  7 Jan 2025 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3fpNx8t"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEF317B50A
	for <linux-bluetooth@vger.kernel.org>; Tue,  7 Jan 2025 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271349; cv=none; b=roPmo+iX31KJTkn9vZXCWqwJ+tREoCRgGMJi5j79gaRIHM/shTjqeDogWjx7bxbNXxxtk1xKwDj7/8iQlKdonY0y+9pAWudXNmOcvnLuatnQM0OeBiI9rzRrKdYcyJ/hSCBYlB8+vDiHNbopXH9PYJFw+bCZbR2OfZ9dCBjCzLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271349; c=relaxed/simple;
	bh=9IkE6ktWQe9uiqvjbwhE/gBVeU38/6KZep9/kzsQL4I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iJI8yzWJeHZp4zvmN+RYRsX/BmZZ2TiZJ1kYAw4pVSZenWA0z9BdXlHgQgsciUmvH61cwFMJFDP43thHAAceheqzDeDqPW4tV3AnTkGJpTLi+zdW3nKPdpJPyNvFR2Lyp/+YgrHdagQi2cju+91NbfFoZeOFMVjZ+UspzdFJ9QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3fpNx8t; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afed12283eso10200549137.1
        for <linux-bluetooth@vger.kernel.org>; Tue, 07 Jan 2025 09:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736271345; x=1736876145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3MoQVtnH/GXYhaphkuRD1tiY2NdEWAkclZxlJfFTSsw=;
        b=U3fpNx8tWVxKS9YDBgIVUDQ+caagv5WlNSTnLyPsh5XubFzStm+IQR+Bw1DiAIXuKy
         ilY6TJDByud+RUPh2HB1OgleXoaZxpT7KetfHP35LpH/Hc6yg71cZA0uXIY9wcusmwww
         0SAgD5fdfWLUF0qsiAz0XZu8cgNkwXeqCFUTcBk+J4EAzzTMJDcYuYLUYJpR+kMugEVr
         UUTKoZLZcnSV3RbIX+zHWzl3+VPywI/R30AgFG6fbuI/N8xHPM6lbSwX743KoGBT2NZa
         ptf7bF5/fa/RYfpngbtijLVGGo0QsuChDv3qkyXCvbrHzdJyKDB5TPMK5R8mBqQWSpIH
         ajiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271345; x=1736876145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3MoQVtnH/GXYhaphkuRD1tiY2NdEWAkclZxlJfFTSsw=;
        b=MEEZSRH54DeWN33yc1XPcC+RBWgG+18mKgg8cftTdEtXmaDexRz9rAs+JznrYP3Y03
         Xs5JhGdM7xmJ8ZtA+2e9tFACwTwINP6ZN2J1mbWP+fullPJtBLTrqY5bb5VndJwLA66z
         PkoLWTP2p0drYM2IBbATm7ov4NsfrY/MM2WTcyIml/cM4IdxakC94eoRMtxKLLC4PuYg
         VHTr4CpBVgE6RZKpuJg4RZMerxTIUNh0hUbQ8HZhVLj779anGsW2p+qMvZNgM2rzdUXT
         dZRjIGfawEL6gEjxRWVehNT3C28NpALEHI+YARlIw3AqaBMRv3xnxE90YIPJdsJx3rgg
         0KEw==
X-Gm-Message-State: AOJu0YzrQZ7dILx+Tdt26qgWyVKDSIlKTQPUAb4kCPrX8kcsIih922N1
	DEpW66UQ1AgiUs3/raFR3X7HIr6FrIv30jYAHlaOE15r7rzp9m6GQwpHkw==
X-Gm-Gg: ASbGnctbzCuXrGC++kiSO6MTbLWMTegi/YVNMzHDqNQo0ziHVJbB+ZS8gpjUA5hpuln
	q+u2niwUU/nhjhkHAX1AYan2TSqxOeVvuK14Y+n+Fk0gBgHAYaeR/lx5rTkpRTBOfIVDgq1kq7m
	Y5oyQWCpRsiWhmlYn8WRNeE17n9Cv/2eSSxRdna+U3+6gTUiwpKpZ+sw2JGEWEqKhsdfFmO9EHL
	LFJtjl5LyBUfKETVBZEzPF+VW438Pj7JFYM6N9tLD/ZJY+WnZr1MbwmnlNZCqVtYkn2PQZiijjk
	VEI+s5tzbZ/Bw/wxuu3/esyBJsBV
X-Google-Smtp-Source: AGHT+IHuzII+NWQ0EkZkKTZ0Gwlc0gDFSjdRQvmMuoI0kvUqViaHubtEVuW/t8u2B2Mo+zb+IGYG6A==
X-Received: by 2002:a05:6102:160c:b0:4b2:adce:bcfe with SMTP id ada2fe7eead31-4b3d0e67683mr44667137.22.1736271345021;
        Tue, 07 Jan 2025 09:35:45 -0800 (PST)
Received: from lvondent-mobl5.. (syn-107-146-107-067.res.spectrum.com. [107.146.107.67])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad575fasm8002481241.29.2025.01.07.09.35.43
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 09:35:44 -0800 (PST)
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To: linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v1] monitor: Make BTSNOOP_PRIORITY_DEBUG the default
Date: Tue,  7 Jan 2025 12:35:42 -0500
Message-ID: <20250107173542.1449444-1-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This makes BTSNOOP_PRIORITY_DEBUG the default so it captures debug logs
from the likes of bluetoothd which is very handy when debugging problems
as otherwise the logs have to entered separately making it hard to
figure out the ordering of the messages.
---
 monitor/packet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/packet.c b/monitor/packet.c
index 3e5b3f5e1f26..2eb50896b55b 100644
--- a/monitor/packet.c
+++ b/monitor/packet.c
@@ -101,7 +101,7 @@
 #define UNKNOWN_MANUFACTURER 0xffff
 
 static time_t time_offset = ((time_t) -1);
-static int priority_level = BTSNOOP_PRIORITY_INFO;
+static int priority_level = BTSNOOP_PRIORITY_DEBUG;
 static unsigned long filter_mask = 0;
 static bool index_filter = false;
 static uint16_t index_current = 0;
-- 
2.47.1


