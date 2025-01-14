Return-Path: <linux-bluetooth+bounces-9704-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B2EA0FFDE
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Jan 2025 05:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AF361887FF7
	for <lists+linux-bluetooth@lfdr.de>; Tue, 14 Jan 2025 04:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C813D233539;
	Tue, 14 Jan 2025 04:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b="PbTC3g2S"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A556E5733A
	for <linux-bluetooth@vger.kernel.org>; Tue, 14 Jan 2025 04:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736827821; cv=none; b=apLa4DyuLqrTj70f7hRLuxxFz7HiQj0NxISigLEi5rQvbZetP+na1fOPHoXRfbRE2O8JyJBi9hOhSLwlgHAMTcnpy9B/p7D1RpadXRosqALEy2nC/UHjIv9qWfCaN9W+4ppA+K9k15RtC1/tbztH8+ph6kV1UGKcMSEhaxje0RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736827821; c=relaxed/simple;
	bh=PgZACnQ821havD91qnvSoVfopLpgxpU46DiDuNvahF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UtorDUC7XupI2DswqpxEy+Y3L2hoqRPRxMK+mO4eKpt775k/u1gG9Gme6mWLZFrLcVe5rig98WgVoovvuDPkd5G69Su6/+ordpd+ggs7UvgVk+dvgjV3AsxS6RStE46gbnMran4F6uZHak4lXk7wpKkniO4OUxFrK8dUaPTMOvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org; spf=pass smtp.mailfrom=kali.org; dkim=pass (2048-bit key) header.d=kali.org header.i=@kali.org header.b=PbTC3g2S; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kali.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kali.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e3a1cfeb711so7513322276.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 13 Jan 2025 20:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google; t=1736827817; x=1737432617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpQAW5W6q1eOeJMunMwzYyOy3zwnSPg/tJEZNw0zLcM=;
        b=PbTC3g2SfEiqpgg9va6mMh6Wkpiymy/1675fBsjSb806OUflpTNUxSjO2iz2/+g4+L
         A1rQtiP9I5jC2ijce3ycXn/3elPDNxNXwm9WpjsAQu5eySZ0KSdUsCPe8HIq9UxnlQDP
         DTbZb9Cl3ipoFyVQzJ/pZewJ5IhPuUG7fdtmSwSavBG3VDas9KA5I7z2RDEHYQ1xLWrb
         63urM5MdBqcGfSHyB5F1no0Z54XPXjIOEoT0Y+YJacpYVGTTRHEhLN5BD12Xp8FP2AOR
         ylN+MVXVSMgafIfdnFH1IROJ/29YGoF7A/Pw3y94V7mPJuLB2qfdpYNXd0/oq6rXxuBj
         dPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736827817; x=1737432617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpQAW5W6q1eOeJMunMwzYyOy3zwnSPg/tJEZNw0zLcM=;
        b=QwDj86BhIFXaaDbSqaQH+PXbdvu6+y3z9Tidq034i4ZZgeeSs0CyNhpat4oMgRCOV9
         SMJvZvjEj+A5Va/fKiw+47d+GtK5C2cCqc5Adb3hZlzmNQ5wPWweAwaAZwdMThEVw6gt
         x+I2zmREtCg1GT06jZ/nqTAaBzZwDJYBnIVKtLO0HL4NBD3IopzD90xrcBfMjBojL5AH
         TPa9Bxd5lYDYA4ku3bW0v6Lg/bxXjCspkm6rhuHQ0Q7zV+u+wlrs2HWMzuhWoleoJa1/
         UCnkzj9KFRL6wv/sNg7LRGs7HJ1Nxb4aVWYPI4hkUSThvcq2PiYYaxw9tqfLLmymx8rl
         A7/w==
X-Forwarded-Encrypted: i=1; AJvYcCVzU/q9kmllaeRBladkXE2Hf+vm3lKqxJYyjJ7j5HHiNjE20E2xU3KZcKphwfU5YxokRceC/RCiyBPz+cV6JGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8gQmWbAJDP2S1dsoXJCrwFYQEje6AAuyW1pQ2+lNWD8BzdC4n
	RzDA5+c3tbdtbWbJtYrJcPnWuuHmCq1cigJYy8YJkd5+Vm8PL0Wyo3FWvU0syBMy28SwxW//r4o
	wX7oSOqkD0ITmDF6brhqDIz5sNrCtnKl0/y/X1Q==
X-Gm-Gg: ASbGnctwfJNS13Np2dF7afCIG7Q2aA8UvD1LL7SUI4EroUWPUJ6+WfCHhaoI0ljK30e
	HDk7PI+ty+5CHGQMlwWNfsMs4Uq1u78hPF6ODdwE=
X-Google-Smtp-Source: AGHT+IHCeN1OqSNyfpwvgLbMXzKY0s1C+MMCFUl8tg+k7mKXodKkqk20Pyg87hyIPkWnM+ZdQ+1JXLR6bDZ53cEiLYo=
X-Received: by 2002:a05:690c:620c:b0:6ef:7dde:bdef with SMTP id
 00721157ae682-6f531240a04mr185997377b3.23.1736827816984; Mon, 13 Jan 2025
 20:10:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-wcn6855_fix-v3-1-eeb8b0e19ef4@quicinc.com>
In-Reply-To: <20250113-wcn6855_fix-v3-1-eeb8b0e19ef4@quicinc.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Mon, 13 Jan 2025 22:10:02 -0600
X-Gm-Features: AbW1kvYxKCoyq4xBZQUOsXW03R_0Xsj1y3vzkWzE77ZbEIl-L-nu7qSK9ncMtU4
Message-ID: <CAKXuJqiJZTF-rdDp+1hkV597_Y4h1RSBOCiYJuupmdA8J=-SpA@mail.gmail.com>
Subject: Re: [PATCH v3] Bluetooth: qca: Fix poor RF performance for WCN6855
To: Zijun Hu <zijun_hu@icloud.com>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bjorn Andersson <bjorande@quicinc.com>, "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>, 
	Cheng Jiang <quic_chejiang@quicinc.com>, Johan Hovold <johan@kernel.org>, 
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zijun,

On Mon, Jan 13, 2025 at 8:43=E2=80=AFAM Zijun Hu <zijun_hu@icloud.com> wrot=
e:
>
> From: Zijun Hu <quic_zijuhu@quicinc.com>
>
> For WCN6855, board ID specific NVM needs to be downloaded once board ID
> is available, but the default NVM is always downloaded currently.
>
> The wrong NVM causes poor RF performance, and effects user experience
> for several types of laptop with WCN6855 on the market.
>
> Fix by downloading board ID specific NVM if board ID is available.
>
> Fixes: 095327fede00 ("Bluetooth: hci_qca: Add support for QTI Bluetooth c=
hip wcn6855")
> Cc: stable@vger.kernel.org # 6.4
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
> Changes in v3:
> - Rework over tip of bluetooth-next tree.
> - Remove both Reviewed-by and Tested-by tags.
> - Link to v2: https://lore.kernel.org/r/20241116-x13s_wcn6855_fix-v2-1-c0=
8c298d5fbf@quicinc.com
>
> Changes in v2:
> - Correct subject and commit message
> - Temporarily add nvm fallback logic to speed up backport.
> - Add fix/stable tags as suggested by Luiz and Johan
> - Link to v1: https://lore.kernel.org/r/20241113-x13s_wcn6855_fix-v1-1-15=
af0aa2549c@quicinc.com
> ---
>  drivers/bluetooth/btqca.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
> index a6b53d1f23dbd4666b93e10635f5f154f38d80a5..cdf09d9a9ad27c080f27c5fe8=
d61d76085e1fd2c 100644
> --- a/drivers/bluetooth/btqca.c
> +++ b/drivers/bluetooth/btqca.c
> @@ -909,8 +909,9 @@ int qca_uart_setup(struct hci_dev *hdev, uint8_t baud=
rate,
>                                  "qca/msnv%02x.bin", rom_ver);
>                         break;
>                 case QCA_WCN6855:
> -                       snprintf(config.fwname, sizeof(config.fwname),
> -                                "qca/hpnv%02x.bin", rom_ver);
> +                       qca_read_fw_board_id(hdev, &boardid);
> +                       qca_get_nvm_name_by_board(config.fwname, sizeof(c=
onfig.fwname),
> +                                                 "hpnv", soc_type, ver, =
rom_ver, boardid);
>                         break;
>                 case QCA_WCN7850:
>                         qca_get_nvm_name_by_board(config.fwname, sizeof(c=
onfig.fwname),
>
> ---
> base-commit: a723753d039fd9a6c5998340ac65f4d9e2966ba8
> change-id: 20250113-wcn6855_fix-036ca2fa5559
>
> Best regards,
> --
> Zijun Hu <quic_zijuhu@quicinc.com>
>

Tested on my X13s and working great here, thank you for this!
Tested-by: Steev Klimaszewski <steev@kali.org> #Thinkpad X13s

