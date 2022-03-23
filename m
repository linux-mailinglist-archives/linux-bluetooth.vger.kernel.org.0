Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09E7A4E5B63
	for <lists+linux-bluetooth@lfdr.de>; Wed, 23 Mar 2022 23:40:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345298AbiCWWlr (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 23 Mar 2022 18:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345305AbiCWWln (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 23 Mar 2022 18:41:43 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86AA4381A4
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Mar 2022 15:40:11 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id mm17-20020a17090b359100b001c6da62a559so7761734pjb.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 23 Mar 2022 15:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=A5mU7ZW/EoX09OtoTGJHt6b6/ozCCsZy6iGJ/CCN76Y=;
        b=ZdfyZGcnWsgdnPJEMGBRArNbpVzBpvqK5UFP+MKhhJvK0OV+0yWVl39/f/Z1SFe3Id
         j9Ijjjh/iRTsgDNZtihSXkPq63AKLBShejG0483n3b6AbGCmcIFg7G13hN+3k/nWUSoO
         xjqFVdcFPhGskgo5uDpz6ziTrpODPnO0DkuHAUOLFYF3p8j3+Wbr1hhH3pBKD8KZoBip
         FR6H1n9GDZzLfewgrWkYj1jLCeI2ry6T08F2hJQzAKXD2NoPJT26Qg12a7rg6u7L/Oyd
         m1izBOYn4QaVxqjPcp14ZxIqKDQIPWhfu/cNAFbChmIE5t59YrkS/QMGPXwmQExEOGde
         39wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A5mU7ZW/EoX09OtoTGJHt6b6/ozCCsZy6iGJ/CCN76Y=;
        b=kfuRy2DkxYx4+4Fv4Q0Jid1T8jKojMeWeeRw55KfIbHv0g9syqpMdARGaIa5tnVI03
         z+QgLDiu6bjblhMd/wubY5TN56ONM+m9eVP4GtO0rApRMwBHTnEIiTJrUfulXo23UE7u
         h/drSEgsk4Omvs5kZIGz+YakJTMkic5PQi+bs9eGuVZ7e08THe82daC4xhmMECIJUPcH
         GmbdVBlaec/uULXwb8eehW8R8PFFEbumL064K8tMGm1DIx+UXxFH2XkH7PMi6l33WnG9
         OPBku3rSuOOqM59KI8zoV+IFAFODoha7Gp5CdVPXQ30YpxSPQmF2hZZG+PhwWi9l56d2
         2c2w==
X-Gm-Message-State: AOAM533Y5yoeC2yKVnX+y1R41ANNMwECjBvVh5bGOgE6hcLq0bur/vHk
        Tthkf/hYM2eW4QDr4J51ekrEYybSTXI=
X-Google-Smtp-Source: ABdhPJwMqYJ/M4IZQF5rMAm0ASFrH0uSHJ5ohYvwORQKJGfQuoRtb/xStXt+nn5ZYCJzKNN3gbADaw==
X-Received: by 2002:a17:902:ce8b:b0:154:42e2:924e with SMTP id f11-20020a170902ce8b00b0015442e2924emr2329795plg.138.1648075210704;
        Wed, 23 Mar 2022 15:40:10 -0700 (PDT)
Received: from lvondent-mobl4.intel.com (c-71-56-157-77.hsd1.or.comcast.net. [71.56.157.77])
        by smtp.gmail.com with ESMTPSA id z14-20020aa7888e000000b004f79f59827asm825109pfe.139.2022.03.23.15.40.10
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 15:40:10 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH BlueZ v4 8/9] att: Rename att_debug and att_verbose to DBG and VERBOSE
Date:   Wed, 23 Mar 2022 15:40:02 -0700
Message-Id: <20220323224003.3736525-9-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323224003.3736525-1-luiz.dentz@gmail.com>
References: <20220323224003.3736525-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

att_debug and att_verbose are macros which are more common to be
used as uppercase, this also change them to use DBG like other parts of
the code.
---
 src/shared/att.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/src/shared/att.c b/src/shared/att.c
index 7344b0c46..f7bef08bc 100644
--- a/src/shared/att.c
+++ b/src/shared/att.c
@@ -307,11 +307,11 @@ static void att_log(struct bt_att *att, uint8_t level, const char *format,
 	va_end(va);
 }
 
-#define att_debug(_att, _format, _arg...) \
+#define DBG(_att, _format, _arg...) \
 	att_log(_att, BT_ATT_DEBUG, "%s:%s() " _format, __FILE__, __func__,\
 		## _arg)
 
-#define att_verbose(_att, _format, _arg...) \
+#define VERBOSE(_att, _format, _arg...) \
 	att_log(_att, BT_ATT_DEBUG_VERBOSE, "%s:%s() " _format, __FILE__, \
 		__func__, ## _arg)
 
@@ -359,7 +359,7 @@ static bool encode_pdu(struct bt_att *att, struct att_send_op *op,
 				sign_cnt, &((uint8_t *) op->pdu)[1 + length])))
 		return true;
 
-	att_debug(att, "ATT unable to generate signature");
+	DBG(att, "ATT unable to generate signature");
 
 fail:
 	free(op->pdu);
@@ -488,7 +488,7 @@ static bool timeout_cb(void *user_data)
 	if (!op)
 		return false;
 
-	att_debug(att, "(chan %p) Operation timed out: 0x%02x", chan,
+	DBG(att, "(chan %p) Operation timed out: 0x%02x", chan,
 						op->opcode);
 
 	if (att->timeout_callback)
@@ -524,11 +524,11 @@ static ssize_t bt_att_chan_write(struct bt_att_chan *chan, uint8_t opcode,
 	iov.iov_base = (void *) pdu;
 	iov.iov_len = len;
 
-	att_verbose(att, "(chan %p) ATT op 0x%02x", chan, opcode);
+	VERBOSE(att, "(chan %p) ATT op 0x%02x", chan, opcode);
 
 	ret = io_send(chan->io, &iov, 1);
 	if (ret < 0) {
-		att_debug(att, "(chan %p) write failed: %s", chan,
+		DBG(att, "(chan %p) write failed: %s", chan,
 						strerror(-ret));
 		return ret;
 	}
@@ -661,12 +661,12 @@ static bool disconnect_cb(struct io *io, void *user_data)
 	len = sizeof(err);
 
 	if (getsockopt(chan->fd, SOL_SOCKET, SO_ERROR, &err, &len) < 0) {
-		att_debug(att, "(chan %p) Failed to obtain disconnect "
+		DBG(att, "(chan %p) Failed to obtain disconnect "
 				"error: %s", chan, strerror(errno));
 		err = 0;
 	}
 
-	att_debug(att, "Channel %p disconnected: %s", chan, strerror(err));
+	DBG(att, "Channel %p disconnected: %s", chan, strerror(err));
 
 	/* Dettach channel */
 	queue_remove(att->chans, chan);
@@ -795,7 +795,7 @@ static bool handle_error_rsp(struct bt_att_chan *chan, uint8_t *pdu,
 		op->timeout_id = 0;
 	}
 
-	att_debug(att, "(chan %p) Retrying operation %p", chan, op);
+	DBG(att, "(chan %p) Retrying operation %p", chan, op);
 
 	chan->pending_req = NULL;
 
@@ -818,7 +818,7 @@ static void handle_rsp(struct bt_att_chan *chan, uint8_t opcode, uint8_t *pdu,
 	 * the bearer.
 	 */
 	if (!op) {
-		att_debug(att, "(chan %p) Received unexpected ATT response",
+		DBG(att, "(chan %p) Received unexpected ATT response",
 								chan);
 		io_shutdown(chan->io);
 		return;
@@ -850,7 +850,7 @@ static void handle_rsp(struct bt_att_chan *chan, uint8_t opcode, uint8_t *pdu,
 	goto done;
 
 fail:
-	att_debug(att, "(chan %p) Failed to handle response PDU; opcode: "
+	DBG(att, "(chan %p) Failed to handle response PDU; opcode: "
 			"0x%02x", chan, opcode);
 
 	rsp_opcode = BT_ATT_OP_ERROR_RSP;
@@ -875,7 +875,7 @@ static void handle_conf(struct bt_att_chan *chan, uint8_t *pdu, ssize_t pdu_len)
 	 * invalid.
 	 */
 	if (!op || pdu_len) {
-		att_debug(att, "(chan %p) Received unexpected/invalid ATT "
+		DBG(att, "(chan %p) Received unexpected/invalid ATT "
 				"confirmation", chan);
 		io_shutdown(chan->io);
 		return;
@@ -949,7 +949,7 @@ static bool handle_signed(struct bt_att *att, uint8_t *pdu, ssize_t pdu_len)
 	return true;
 
 fail:
-	att_debug(att, "ATT failed to verify signature: 0x%02x", opcode);
+	DBG(att, "ATT failed to verify signature: 0x%02x", opcode);
 
 	return false;
 }
@@ -1032,7 +1032,7 @@ static bool can_read_data(struct io *io, void *user_data)
 	if (bytes_read < 0)
 		return false;
 
-	att_verbose(att, "(chan %p) ATT received: %zd", chan, bytes_read);
+	VERBOSE(att, "(chan %p) ATT received: %zd", chan, bytes_read);
 
 	att_hexdump(att, '>', chan->buf, bytes_read);
 
@@ -1047,12 +1047,12 @@ static bool can_read_data(struct io *io, void *user_data)
 	/* Act on the received PDU based on the opcode type */
 	switch (get_op_type(opcode)) {
 	case ATT_OP_TYPE_RSP:
-		att_verbose(att, "(chan %p) ATT response received: 0x%02x",
+		VERBOSE(att, "(chan %p) ATT response received: 0x%02x",
 				chan, opcode);
 		handle_rsp(chan, opcode, pdu + 1, bytes_read - 1);
 		break;
 	case ATT_OP_TYPE_CONF:
-		att_verbose(att, "(chan %p) ATT confirmation received: 0x%02x",
+		VERBOSE(att, "(chan %p) ATT confirmation received: 0x%02x",
 				chan, opcode);
 		handle_conf(chan, pdu + 1, bytes_read - 1);
 		break;
@@ -1063,7 +1063,7 @@ static bool can_read_data(struct io *io, void *user_data)
 		 * promptly notify the upper layer via disconnect handlers.
 		 */
 		if (chan->in_req) {
-			att_debug(att, "(chan %p) Received request while "
+			DBG(att, "(chan %p) Received request while "
 					"another is pending: 0x%02x",
 					chan, opcode);
 			io_shutdown(chan->io);
@@ -1083,7 +1083,7 @@ static bool can_read_data(struct io *io, void *user_data)
 		/* For all other opcodes notify the upper layer of the PDU and
 		 * let them act on it.
 		 */
-		att_debug(att, "(chan %p) ATT PDU received: 0x%02x", chan,
+		DBG(att, "(chan %p) ATT PDU received: 0x%02x", chan,
 							opcode);
 		handle_notify(chan, pdu, bytes_read);
 		break;
@@ -1237,7 +1237,7 @@ static void bt_att_attach_chan(struct bt_att *att, struct bt_att_chan *chan)
 
 	io_set_close_on_destroy(chan->io, att->close_on_unref);
 
-	att_debug(att, "Channel %p attached", chan);
+	DBG(att, "Channel %p attached", chan);
 
 	wakeup_chan_writer(chan, NULL);
 }
-- 
2.35.1

