Return-Path: <linux-bluetooth+bounces-18613-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBCSGu5nemmB5gEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18613-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 20:47:58 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A1EA83F7
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 20:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CAB203007239
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 19:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0826D31A54E;
	Wed, 28 Jan 2026 19:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+9BgYXS"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA8C23D281
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 19:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769629670; cv=none; b=OQXrjeWT7Y+YxP94qgvOBXxUBwZkEud/tvgHPEOAKwk3VwbhK8t6g+W+vrkASVU2s9aJzpoqlXF1xDpDSXkUgvOlfA3u3igK9OkIzHrGJSrklmUDHSEKd2cZidYhIrRVAT+hQYKJ62nsNax1dt4nRqFR+b0JOzN4XBb185ikFPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769629670; c=relaxed/simple;
	bh=foDUUqCwkbhtQxiD23/w5M+55ZnO2AoGNenJQbj+Hjc=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=aMWLci4OBzGLZf9YEm2umgGcpGatlA0xYZMErcEpCcIRHn83M1FXqqR140LE1r/kgW5Ns//bgHQqbTMIjQ8F/p5a+81Xx7ZgPN9gXigQZiK6KohnIfDfbAlsL55V5cYgtz4oHLhh0ZgOk/MwD2lK0RQ1Xxvg6JYMbTzOXz/r/NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+9BgYXS; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-88a288811a4so2106506d6.3
        for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 11:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769629668; x=1770234468; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GYPzbfkREN+V/P/m9qISTWxmYavzoSWEchyGrhf66R8=;
        b=a+9BgYXS5EK37bSkmQtPBsQRNzqvdykKimpb6cDQ1vaq12lOwyBC1uG7k3DPQysHB9
         FPILUq+ylC9eAidGBCZbCv68lmAsIPUNLnIr9bPSsobzUNHTXyLQUV7rz3gdAhPZubdd
         aRqyvqlSdAwotdwAiimrf+Q3NhH8qNULk27b/m1UILKu7ywWCOMcpXT6p+9vIS7EAGyQ
         VRA37Qv+aTC1+aPHc9pmKVx37AubpQN0BfY040675UO1GK80bE4SoUQ2KTmJt3HCUVng
         +PW2kdbBFFtnv2yoj2BoqlCW6mwE+KtC0QLDQvrlKryDof5rn+c1kxiCV/4sK+7mvG8N
         gKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769629668; x=1770234468;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYPzbfkREN+V/P/m9qISTWxmYavzoSWEchyGrhf66R8=;
        b=uDDR40n8KzuxIpW1/95aeOlwEwAMWi0dOK+kj8TwadsqwHaOwQJvV1cBqpD7WgJNBG
         jm4ERkB6m/hiDB6hnQDQ6iUgBHtQhbByuw+huBfbwadNcQsGWcXnKpP2Ii8yXVF5YqPZ
         ztN9CArDPSQ5TpOfqyt1ev73rkeq2LNy7Xuqwa6lmwwmxw/qUnMerT9Wx7FrehOG5bhD
         mI5AXlhRjWiIoBlPhtt+PhxmrGXrs7xZP5H9JAhEk8NOXoXZKTdak49Ly53WSxnBSiLi
         Rroa3b6Y3nimP4H0Vb+RVUydHHkp7V6BRDpT+ZSByvyef/pSD3Lm2IrFHL0F40yDY9XK
         /luw==
X-Gm-Message-State: AOJu0YwN82BOFWHttEUeAqGRwIrG/uwMUxLrn73a3VjMyEa+jNst0MCd
	1ikB2fJn8ZY3Jcnr4iLQH9T9cX1rwfEacC+ZYMpNSlYp7x0+baCK3+jBNeNdqIgMXto=
X-Gm-Gg: AZuq6aLPfUGgkLAy2wnf3uBSFJA9GGRCi+5XhuLPlb5v1+6vHRCmiVHbwNm61XKP1ja
	6hyKij+7JLnnTPdO0ocy+iwXEuqbr2+F9x0QniaIrtNywj8p3t8qs1eteZeTUYgLw0XmRx/SDy8
	4q45HWWsOKjdmxrGAIyeNRXCmXcZKzofNah2Lf8gMhfxTtrJmYu7Zg/DW678SxAt8Xmpl6mMJDe
	HzgGWpIOEQMsd4vy9Dm2gIubeDXsTY6dE8H1oEdg6xRi8rSiIaqL/7A3N6y/CryERHY9aQlnycm
	6f8b6+z3b0WJeUQPjWEYAuCVKdR19MjhNMswd8mciY6X2chr8sXizUkNayi87I32KDxi1/jZwv8
	QNTKysdX04aj3RwgisXVnga871O17dSaP6UIdLr+NL4wts9og6j+uSfz+rE8GI+W4K01kXJ38Yl
	s4+y/AIQBLbVyVVIKCH56qaZ0UTNf5
X-Received: by 2002:a05:6214:2527:b0:890:2507:a1c0 with SMTP id 6a1803df08f44-894cc93ecb5mr90112476d6.60.1769629668066;
        Wed, 28 Jan 2026 11:47:48 -0800 (PST)
Received: from [172.17.0.2] ([172.183.91.161])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d375b62asm25013626d6.41.2026.01.28.11.47.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 11:47:47 -0800 (PST)
Message-ID: <697a67e3.050a0220.333aae.de42@mx.google.com>
Date: Wed, 28 Jan 2026 11:47:47 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============1760286411926617057=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, luiz.dentz@gmail.com
Subject: RE: [BlueZ,v1,1/2] build: Remove SAP support
In-Reply-To: <20260128183454.545066-1-luiz.dentz@gmail.com>
References: <20260128183454.545066-1-luiz.dentz@gmail.com>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-18613-lists,linux-bluetooth=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mx.google.com:mid]
X-Rspamd-Queue-Id: 86A1EA83F7
X-Rspamd-Action: no action

--===============1760286411926617057==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1048215

---Test result---

Test Summary:
CheckPatch                    PENDING   0.30 seconds
GitLint                       PENDING   0.42 seconds
BuildEll                      PASS      18.42 seconds
BluezMake                     PASS      671.10 seconds
MakeCheck                     PASS      18.27 seconds
MakeDistcheck                 PASS      225.67 seconds
CheckValgrind                 PASS      285.01 seconds
CheckSmatch                   PASS      317.99 seconds
bluezmakeextell               PASS      169.86 seconds
IncrementalBuild              PENDING   0.32 seconds
ScanBuild                     PASS      950.88 seconds

Details
##############################
Test: CheckPatch - PENDING
Desc: Run checkpatch.pl script
Output:

##############################
Test: GitLint - PENDING
Desc: Run gitlint
Output:

##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============1760286411926617057==--

