Return-Path: <linux-bluetooth+bounces-19135-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOPFATb5lGktJgIAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19135-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 00:26:46 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E68B151E9D
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Feb 2026 00:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0509D302AD07
	for <lists+linux-bluetooth@lfdr.de>; Tue, 17 Feb 2026 23:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866AC296BA9;
	Tue, 17 Feb 2026 23:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jv3qlsLX"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14EFA29CB24
	for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 23:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771370686; cv=none; b=j/jF857+2Z8XMRTX+S23ndJO9+zTL137jlx2PDu3Xmidt46dr+I/atSqrcblAV54QpYFDjDuf7Eq0RUAr5+Dzs2ru88Wvul+IX6UK4M+AYNva1KVbBL6gQK2CEvy5P8F5hcu13GAdBE5TQZDt3kG1PSMYWWWkxojE1/eeS8A1Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771370686; c=relaxed/simple;
	bh=qFMf+mziCdpEWTSdomD3yZqGggy4ejdeumjAvUnERFs=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Subject:
	 In-Reply-To:References; b=FklHQCIS5lrgSxlCCKQVgepHAam/JPhwnLhJDM3eg1eX06SqMiGCc4J4hEf1MTS/AHSblrpsYFOcbjmc2fveQrrwcjsKnlxkjNX6LA9LautggAcpTOsFTD+wdVKmzfM6cuKEbxov8EDNPAqoRPqFmm74XdwIY0R7S/1j+dlVGeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jv3qlsLX; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-1275750cf9cso621403c88.0
        for <linux-bluetooth@vger.kernel.org>; Tue, 17 Feb 2026 15:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771370684; x=1771975484; darn=vger.kernel.org;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zsw1vzZfhUOdar8iT3xiqrsWUcdwgn65K4rPjzPfjTY=;
        b=Jv3qlsLXS/oA4aj9I11qjuiNBk+WAYAP221JJ5IEW2XLeEHgE7UWgfaucM0qZSbJv6
         EJ9ezTZkzZePe0wyxWZtGo8z24FjKWRxN2poSJpxbrDnNs+T+X8XMFQ5ss+ZS4d+OWio
         58D9oVNcHdy/FHE30i7cfNWZ9pSIMyJ5oP9hH+DCUwT2GaNhcuLfwmoXX45TYUNTWFpp
         bLpF9ZOyUpy/xxVKhimQWFyPVK0EQEkATL1pirrLaW9lF1gccjchsgsMTs4iZkjZqtq+
         I3eKeEh6tpZRNeh4WV7LfiCcoFHPmksaLnFmShTJ4S2x5pDQPKe+OO672NJ2uSKk5A5A
         Gguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771370684; x=1771975484;
        h=reply-to:references:in-reply-to:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsw1vzZfhUOdar8iT3xiqrsWUcdwgn65K4rPjzPfjTY=;
        b=FT+uJeQ4j9opqDUVgXbTFTaD8lEH9X1QWZXYjyIf1hgXVRgSOYnB93LnEJY5VJhSjj
         cHaWt5gMPuv7G3pDOCRqbAw4U61irnGh/FZGqeFGA3dlnqBGz6NW4G3azzhuO3GrCTIo
         F6Jafz+JpnU9o+Mboz5xQHEsYYutHGkMoI0M0ulU5tMFIrixbgaPNCg07YzZq6VhsWAZ
         nwhXj96G+HDA38jfSPpChFPnLn0BnVRpiM7rEYtP4+7blifUS0huXaOOrvxV+87CkK1K
         ZdYjGdDE1KCcUXSHEWBp1cN+EGiiVEe76aFCBQhdtffvyO2Fp6dpechJ+bHi41buBqYV
         q2gA==
X-Gm-Message-State: AOJu0YytlkxESrtMjJJU4Yqpy0fGZaap7KESc89zIh6VvnkfwOJnYWYd
	cWyzGdwcx9f0hSZ9ViVddLZrfMkypc6vkUybEpaWDZTMfUGwtEdlJmW5dd/WACvN
X-Gm-Gg: AZuq6aIvSIQRrOhg+C2QRni83USgUxEq9ycs9j7zlC1l/yJv+aNAIwE/YYPEodzGOtg
	YLJ30gDRi6Z7RNo6HQroXaiAXQXs3iLPQF35MCTRMRqQbJx5+J95P3KqYRGkLdhKMr7DXQxMzJg
	4QfglRMSG+8GyHSGU7HaPTKqziwvOQVMuvrLpvd2dO3CJNwUAa8eDGPTqQzqo/iz7zYQCaid0o6
	KGOckgZbsoNdbng6MQxn0xruRl6e47KlFXdeegY3DVkp6YGTLjGJezUjpaHiqr9Nm+s1NQZW8SV
	RfFeDyEs/qrVxDKb8BYFdvzyRj4is0bWDm1GgIQlg+X2pfWwoXziADCQTDuU7kJsGDZyPG8iLIt
	nE9sdXIABzcjX4z0QD4CRmbsbM3CLAiHdbE4qsm7RIpaLSKReLjidLqseyLLPXOSdyV4qVthOgC
	5gosYGincO8EorfQ+rlaQPdd6dctfmVQ==
X-Received: by 2002:a05:7022:4596:b0:124:65f7:2c2e with SMTP id a92af1059eb24-127398443b8mr5256804c88.43.1771370683687;
        Tue, 17 Feb 2026 15:24:43 -0800 (PST)
Received: from [172.17.0.2] ([52.159.245.150])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742cba118sm19974730c88.12.2026.02.17.15.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 15:24:43 -0800 (PST)
Message-ID: <6994f8bb.050a0220.2c150d.3e24@mx.google.com>
Date: Tue, 17 Feb 2026 15:24:43 -0800 (PST)
Content-Type: multipart/mixed; boundary="===============4280980059956734544=="
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: bluez.test.bot@gmail.com
To: linux-bluetooth@vger.kernel.org, larsch@belunktum.dk
Subject: RE: [BlueZ] shared/shell: Fix bt_shell_printf in non-interactive mode
In-Reply-To: <20260217222954.432676-1-larsch@belunktum.dk>
References: <20260217222954.432676-1-larsch@belunktum.dk>
Reply-To: linux-bluetooth@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	CTYPE_MIXED_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-19135-lists,linux-bluetooth=lfdr.de];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NEQ_ENVFROM(0.00)[blueztestbot@gmail.com,linux-bluetooth@vger.kernel.org];
	HAS_REPLYTO(0.00)[linux-bluetooth@vger.kernel.org];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mx.google.com:mid,vger.kernel.org:replyto,checkpatch.pl:url]
X-Rspamd-Queue-Id: 5E68B151E9D
X-Rspamd-Action: no action

--===============4280980059956734544==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

This is automated email and please do not reply to this email!

Dear submitter,

Thank you for submitting the patches to the linux bluetooth mailing list.
This is a CI test results with your patch series:
PW Link:https://patchwork.kernel.org/project/bluetooth/list/?series=1055023

---Test result---

Test Summary:
CheckPatch                    PENDING   0.34 seconds
GitLint                       PENDING   0.43 seconds
BuildEll                      PASS      21.31 seconds
BluezMake                     PASS      657.91 seconds
MakeCheck                     PASS      18.63 seconds
MakeDistcheck                 PASS      247.63 seconds
CheckValgrind                 PASS      303.17 seconds
CheckSmatch                   WARNING   367.42 seconds
bluezmakeextell               PASS      185.72 seconds
IncrementalBuild              PENDING   0.38 seconds
ScanBuild                     PASS      1038.52 seconds

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
Test: CheckSmatch - WARNING
Desc: Run smatch tool with source
Output:
src/shared/shell.c: note: in included file (through /usr/include/readline/readline.h):src/shared/shell.c: note: in included file (through /usr/include/readline/readline.h):src/shared/shell.c: note: in included file (through /usr/include/readline/readline.h):
##############################
Test: IncrementalBuild - PENDING
Desc: Incremental build with the patches in the series
Output:



---
Regards,
Linux Bluetooth


--===============4280980059956734544==--

