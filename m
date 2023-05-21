Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E86B70AE8E
	for <lists+linux-bluetooth@lfdr.de>; Sun, 21 May 2023 17:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjEUP1r (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 21 May 2023 11:27:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbjEUP1p (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 21 May 2023 11:27:45 -0400
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6001D1
        for <linux-bluetooth@vger.kernel.org>; Sun, 21 May 2023 08:27:43 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 3B008240101
        for <linux-bluetooth@vger.kernel.org>; Sun, 21 May 2023 17:27:41 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4QPPbJ55M7z9rxF;
        Sun, 21 May 2023 17:27:40 +0200 (CEST)
From:   Pauli Virtanen <pav@iki.fi>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pauli Virtanen <pav@iki.fi>
Subject: [PATCH BlueZ 2/5] shared/tester: retain test failure status
Date:   Sun, 21 May 2023 15:27:35 +0000
Message-Id: <f490bf6fe5b7d3610b26b2fc005440c8bcd8933d.1684682575.git.pav@iki.fi>
In-Reply-To: <024df2d86c14fc811701ba27bfa576476bc9c0d6.1684682575.git.pav@iki.fi>
References: <024df2d86c14fc811701ba27bfa576476bc9c0d6.1684682575.git.pav@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

If a test has called tester_test_failed, consider the test failed, even
if the test also called tester_test_passed/abort.

This avoids reporting success for misbehaving tests that call the
status report functions multiple times.
---
 src/shared/tester.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/shared/tester.c b/src/shared/tester.c
index 34f807556..a1ee5b687 100644
--- a/src/shared/tester.c
+++ b/src/shared/tester.c
@@ -622,6 +622,9 @@ static void test_result(enum test_result result)
 		test->timeout_id = 0;
 	}
 
+	if (test->result == TEST_RESULT_FAILED)
+		result = TEST_RESULT_FAILED;
+
 	test->result = result;
 	switch (result) {
 	case TEST_RESULT_PASSED:
-- 
2.40.1

