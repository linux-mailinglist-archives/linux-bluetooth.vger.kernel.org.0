Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A30BE6FE8AE
	for <lists+linux-bluetooth@lfdr.de>; Thu, 11 May 2023 02:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235708AbjEKAah (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 10 May 2023 20:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233254AbjEKAag (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 10 May 2023 20:30:36 -0400
Received: from out-14.mta1.migadu.com (out-14.mta1.migadu.com [95.215.58.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0540E10DD
        for <linux-bluetooth@vger.kernel.org>; Wed, 10 May 2023 17:30:34 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ayaya.dev; s=key1;
        t=1683764594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=02JKLSHG1vLTKTxUUXs3wGXxxpnoDhEqlqorGsnIBik=;
        b=KDzLr76UwfQSVneItCVn9XmpqwXrFeJPvMW+KJM7R18+4VMM3HZt7FOXhPlDAs6hAzxLrj
        1AbVSyGtQGX3nZv2NxWA9dMKyjqlObdT4yUqdMXdb4ssEgrX9DbljxVlmAGbgrpelM88vx
        fJLiCaQcdHEh9+fUy1VmoZ34uAKqKBk=
From:   psykose <alice@ayaya.dev>
To:     linux-bluetooth@vger.kernel.org
Cc:     alice@ayaya.dev
Subject: [PATCH BlueZ 3/3] tools/parser: use long long for time_t print
Date:   Thu, 11 May 2023 02:22:52 +0200
Message-Id: <20230511002252.30868-3-alice@ayaya.dev>
In-Reply-To: <20230511002252.30868-1-alice@ayaya.dev>
References: <20230511002252.30868-1-alice@ayaya.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

%lld is guarantted to be a 64-bit int, which we enforce via
-D_TIME_BITS=64.

Signed-off-by: psykose <alice@ayaya.dev>
---
 tools/parser/parser.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/parser/parser.h b/tools/parser/parser.h
index 5f65f1689..1eda4f290 100644
--- a/tools/parser/parser.h
+++ b/tools/parser/parser.h
@@ -120,11 +120,11 @@ static inline void p_indent(int level, struct frame *f)
 				struct tm tm;
 				time_t t = f->ts.tv_sec;
 				localtime_r(&t, &tm);
-				printf("%04d-%02d-%02d %02d:%02d:%02d.%06lu ",
+				printf("%04d-%02d-%02d %02d:%02d:%02d.%06llu ",
 					tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
 					tm.tm_hour, tm.tm_min, tm.tm_sec, f->ts.tv_usec);
 			} else
-				printf("%8lu.%06lu ", f->ts.tv_sec, f->ts.tv_usec);
+				printf("%8lu.%06llu ", f->ts.tv_sec, f->ts.tv_usec);
 		}
 		printf("%c ", (f->in ? '>' : '<'));
 		parser.state = 1;
-- 
2.40.1

