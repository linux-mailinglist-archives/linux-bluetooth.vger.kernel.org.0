Return-Path: <linux-bluetooth+bounces-19293-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M8/AH+KnGl8JQQAu9opvQ
	(envelope-from <linux-bluetooth+bounces-19293-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 18:12:31 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1422717A777
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 18:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1979C30508F7
	for <lists+linux-bluetooth@lfdr.de>; Mon, 23 Feb 2026 17:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4872732B99F;
	Mon, 23 Feb 2026 17:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVmyxIq4"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AE632C942
	for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 17:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866574; cv=pass; b=DudpHPEiXOpPF/UK6NoPlWTtccWgjDkqo+qs+C2/69bMTJ9Y5IAFQe2Vd/e0zQvjRiN5y3NqyRfIew9u21FviHFO5nRe/MVc/ZVWEj+yPGL+IWRMWd8sMfT1yy8g8PWdMTrGDZFeEsIRqbmfewLUwQnLQBd2NoSN2BoZfqhQlao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866574; c=relaxed/simple;
	bh=KBKyASkiYAPecNSWI1tSmWEwZel6jFyn1r4aKVQcwqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGn1nYAxfltNbAfblKb1IlnCKuv5U5kxXLfQZodQHS6bI/jGdQe8/nZM7hPGxiaTRZ0xqWUR8Fnu7BQomzqbiUMQeiQhcHogcFV6+95j+DqSqxaQJu94Te168Ti6zc3RixZg6DFRHUbaD2sePpsIR+8UuIh2D/5n46nd4aIzhuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVmyxIq4; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso4369865d50.0
        for <linux-bluetooth@vger.kernel.org>; Mon, 23 Feb 2026 09:09:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771866571; cv=none;
        d=google.com; s=arc-20240605;
        b=faVXJLmueCU5+pgRyiveEwpX4IWe+ETg6xQH9q1HOV9c5NFnqOllvKudXBw7FO+Tmx
         jpntnNt6x+JKyf06zFD13RDkgnTe/E7plWQFuOBf7iiSHH1unrbqzhtzli+wlOX4eQsy
         pe+T2YkUv6AF6oS0/ehCmZSqJXPwZxf7TeqXEVCTzm68SagBmbs+lLsKW9tRJJAZVPMg
         lSETVAGK2ZhtOCAkFPyOE11+DVCtvx4XChPSKFcfe1Ucs5b4NkOJvMFIB1vWB/UP04TD
         kh9zbgLU874+fWqZJ7pda+G5vNFjcX1ezzfA/KujHsYvMtBqA+/iIL/Duy4v+njkg7sX
         L22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=04VXN+RHugn0PukodBzqIaQpJiSnu+2ROrgCLcgAJqE=;
        fh=9gkv1ylc8Kr7SGdXa37vqx4HvMaOCKwNAYgxumIeplk=;
        b=delCMn0lyo28BhDEzgdIeUVi1M2n5vE1I4KB6++pN21QxE/hoLgEGqHF99aBSfJT41
         R8uDYfRcGyKs0jwv4+aLQg135lmZc4RcaktHaTAIKX4rn0/3Pl3LYetMzru+wj8kQbc1
         0ly9KlAGFK6jMQyzI7KODuH25IAIZWcp027VGRfbauumjOuH5VUS7YsyowwSjUwR3rYs
         bOmiHNAsR6i0s/2L3AUlUQXN2EYuBo0lCLV5WA+IDj5cCjZaODtVYwzkQpfP/Uar2J1u
         W3G95gFCuZhk0sZW2jQNbz7WU0WF7dhReti+yesX9CX7PsZHt7I1NglyHjkim/zYsoG/
         ECgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771866571; x=1772471371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04VXN+RHugn0PukodBzqIaQpJiSnu+2ROrgCLcgAJqE=;
        b=TVmyxIq4dIRXMzv2co4QOPH9XLTpY1S9K1CwIfYAMub2FgofhXzXu3xICokti4X1zF
         X8IhbdPFl12Yctnl/YJbOmR2w+2Rz6WQiAOvbUydWdHNbffWVE2H6lmSE9fyPFuaU8/7
         s7fmOD8rq9WqVZtHfGYvCgYwIKi70uErs/doCX4UJKuAdjkdKZEYS0LqoWuepCX0gmRw
         +vjJWuURV0QZhRf1p2igUC3YJA8D3mwHN7UvcD4conUUNzNQDSBk+6c6Hh6qv2FZpPL2
         rSU0Tdv41N3RVcl2brjQmDfJgQ49ga3Np/Qq02+JWvw5ft9OIweXFCMg/H6NXGgGFHep
         ov6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866571; x=1772471371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=04VXN+RHugn0PukodBzqIaQpJiSnu+2ROrgCLcgAJqE=;
        b=i5lt2x5qMsvFIvZB+XDvBWAoaAkkj58xY60SckoGg81BW3IV7KkcF7Ow+dcckivsCr
         rNZCtx4RY97vuYT5Vuqa4ROYCGmUFLPznhxC3kRH+I9yA2Uu1SPBBVqgYfCpaY+PsZ94
         pfmp6w4JUeTbDpR4Qjsy+GuquG4c7yxZhAO4MdePfVSFEioCX2WVtSz+VTsgt5Heqikc
         frBd97qNMlqz1DVkgzLwSKkoKE3hbOE7A79dPf+gufzdJGEAsHs1OBAqMaQ6VFDRYkXc
         fez8hnOux1dPzTPpje7QTm59ukXr+5NcYDaMtPiQeHZwzcAlEKvipl+KHNBTIUkZHGf4
         3vIw==
X-Gm-Message-State: AOJu0Yx1vJZ/A2y5+IS5xNGoAPEXPwJsnLWhen2E2+TlVmeF6rYrgsEA
	SaaHqfYHa0nKqNPYC3YpkKIc96vlYxYL+nrpJi3ekKiH0U4CGipzSBLoyd9SbyTdVdwcC3UnSTc
	NxTI8iRI0hIKQTrHSGoI4NEiW/rkqYdXBkA==
X-Gm-Gg: ATEYQzxV/SPEq4UVFKYzZnjTJBbYntU0VRMjYjyUKnNMC4qFk/2J104h2xmM/uYwlmq
	EmIV1ejAp+WDrD2HZTr7nNdcMdmt5pBpwLOdIrnnbjMlVPIV0dJK6N7f6aIXjK33Rs3IPmk1VNi
	hAqSOC7DeCTpceaY34Q3zEwU0iAYaf7JeosUUK6bAsj1R9ZDvEIP3od/67cEsjlMy0h0fbEDCkm
	lDODjy5NJD9rfof5orlBGTahP0CnD88Bb4X1rygJuk0JAL192qUXgupzOjQz4fC3Lk5bxhSwwe1
	S2BKZ5paixt1dicRMVJ03eYt1Ij+NG7E3JZhrt5GEa1lT1KodGXAm61AQ9dJy2Op+k2dOULnlRV
	QNzcm
X-Received: by 2002:a53:e01c:0:b0:64a:dd3c:2d05 with SMTP id
 956f58d0204a3-64c78c10535mr5568298d50.54.1771866570819; Mon, 23 Feb 2026
 09:09:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223172104.167471-1-kiran.k@intel.com> <20260223172104.167471-2-kiran.k@intel.com>
In-Reply-To: <20260223172104.167471-2-kiran.k@intel.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 23 Feb 2026 12:09:19 -0500
X-Gm-Features: AaiRm53NEIIhULtT7_gn4Oh_h5bj6QnkiarjcMk8YmdMB1LGHxzB_cPjhzGz2DQ
Message-ID: <CABBYNZK5SHfiTNivJP4fKeLbRQOAyeY-cGcofrpJCWcCi2WUZA@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] Bluetooth: btintel: Replace CNVi id with hardware variant
To: Kiran K <kiran.k@intel.com>
Cc: linux-bluetooth@vger.kernel.org, ravishankar.srivatsa@intel.com, 
	chandrashekar.devegowda@intel.com, chethan.tumkur.narayan@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-19293-lists,linux-bluetooth=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 1422717A777
X-Rspamd-Action: no action

Hi Kiran,

On Mon, Feb 23, 2026 at 12:05=E2=80=AFPM Kiran K <kiran.k@intel.com> wrote:
>
> Use hardware variant instead of CNVi to send dsbr command.

I guess by this you mean to say that is what the firmware expects, right?

>
> Signed-off-by: Kiran K <kiran.k@intel.com>
> ---
>  drivers/bluetooth/btintel.c | 18 +++++++++---------
>  drivers/bluetooth/btintel.h |  7 +++++++
>  2 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
> index 5999be2efef8..2547b590f87a 100644
> --- a/drivers/bluetooth/btintel.c
> +++ b/drivers/bluetooth/btintel.c
> @@ -2813,31 +2813,31 @@ static int btintel_set_dsbr(struct hci_dev *hdev,=
 struct intel_version_tlv *ver)
>
>         struct btintel_dsbr_cmd cmd;
>         struct sk_buff *skb;
> -       u32 dsbr, cnvi;
> -       u8 status;
> +       u32 dsbr;
> +       u8 status, hw_variant;
>         int err;
>
> -       cnvi =3D ver->cnvi_top & 0xfff;
> +       hw_variant =3D INTEL_HW_VARIANT(ver->cnvi_bt);
>         /* DSBR command needs to be sent for,
>          * 1. BlazarI or BlazarIW + B0 step product in IML image.
>          * 2. Gale Peak2 or BlazarU in OP image.
>          * 3. Scorpious Peak in IML image.
>          */
>
> -       switch (cnvi) {
> -       case BTINTEL_CNVI_BLAZARI:
> -       case BTINTEL_CNVI_BLAZARIW:
> +       switch (hw_variant) {
> +       case BTINTEL_HWID_BZRI:
> +       case BTINTEL_HWID_BZRIW:
>                 if (ver->img_type =3D=3D BTINTEL_IMG_IML &&
>                     INTEL_CNVX_TOP_STEP(ver->cnvi_top) =3D=3D 0x01)
>                         break;
>                 return 0;
> -       case BTINTEL_CNVI_GAP:
> -       case BTINTEL_CNVI_BLAZARU:
> +       case BTINTEL_HWID_GAP:
> +       case BTINTEL_HWID_BZRU:
>                 if (ver->img_type =3D=3D BTINTEL_IMG_OP &&
>                     hdev->bus =3D=3D HCI_USB)
>                         break;
>                 return 0;
> -       case BTINTEL_CNVI_SCP:
> +       case BTINTEL_HWID_SCP:
>                 if (ver->img_type =3D=3D BTINTEL_IMG_IML)
>                         break;
>                 return 0;
> diff --git a/drivers/bluetooth/btintel.h b/drivers/bluetooth/btintel.h
> index 431998049e68..21c9a6c9eb9e 100644
> --- a/drivers/bluetooth/btintel.h
> +++ b/drivers/bluetooth/btintel.h
> @@ -69,6 +69,13 @@ struct intel_tlv {
>
>  #define BTINTEL_FWID_MAXLEN 64
>
> +/* Hardware ID */
> +#define BTINTEL_HWID_GAP       0x1c
> +#define BTINTEL_HWID_BZRI      0x1e
> +#define BTINTEL_HWID_BZRU      0x1d
> +#define BTINTEL_HWID_SCP       0x1f
> +#define BTINTEL_HWID_BZRIW     0x22
> +
>  struct intel_version_tlv {
>         u32     cnvi_top;
>         u32     cnvr_top;
> --
> 2.43.0
>
>


--=20
Luiz Augusto von Dentz

