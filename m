Return-Path: <linux-bluetooth+bounces-18607-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDwDF7lJemkp5AEAu9opvQ
	(envelope-from <linux-bluetooth+bounces-18607-lists+linux-bluetooth=lfdr.de@vger.kernel.org>)
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 18:39:05 +0100
X-Original-To: lists+linux-bluetooth@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8098CA704F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 18:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33323300845F
	for <lists+linux-bluetooth@lfdr.de>; Wed, 28 Jan 2026 17:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD708331A4D;
	Wed, 28 Jan 2026 17:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUe51Tb5"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354B9333434
	for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 17:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769621311; cv=pass; b=jO9PbS/XMB1CdecGKhZo+dW3m9UefykNpE5fYNwp/mUT8SosJ6WSzdmeGAzuO0hmFanfTAza8dJR4LMpXKN6t/UnkxYz+fhcCTEKC0n8aqZjgN+COFt0J9xlkfDfwOy4jhEYDhVwVzmbb/HJVHF/BVsPqzE7nkEvRib66Y+3njY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769621311; c=relaxed/simple;
	bh=sReP2lw8NpDv1Ji0G1OSF9hyOIgG8wk2RcN32VGoNCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+7PPB3L3nZpUcEWks7dCB04+aYgUyCSODfzA9Xqi6vdnmaInOYIzJ/9MUKEdnXhYnBkCyEbEvrmZ0Uhv6GJ+YjCBmKN6BgLVjYjhpqiW9dM8OuhCybT4aOZKv43H5/6bWrSx6rZvD88XAUfb1ZXa/hdLNSn1bePKxOSnwzsZZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUe51Tb5; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79472374371so622057b3.0
        for <linux-bluetooth@vger.kernel.org>; Wed, 28 Jan 2026 09:28:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769621309; cv=none;
        d=google.com; s=arc-20240605;
        b=VTR4vZDdeUODtjoXxemFjHkREgDqPEehS38RxGD9IteGASkBakAHJplapK0prCVaW/
         O2WvYo2iugoxsQgqz/QBKuOgjrq9AsB86m3Cj2r1zm0elLVOjhLH/ZQyDV5otipYL0im
         jWHP6t1XZ+dzUXzqJ3eyMxQ668wA1f05F5o7qexQoy1poax3th3df7c/z52jUtqnZvrE
         ILhIhf3oLUIQBm8zIDL3MNyyI291m3ja9JJQhrUtD/tffo0h2U4QeiSS20acRcaf6AMm
         +8lJbAnTU9O2F+F/hWXlFX5OYQ4oNksOMQLvtwh77bB1CsRyYrzV89S0qENfj6CchvCP
         Nn0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G42JRVu3qsiA3fB7Z6xOAFyMzMqgtqYneFh2pi5QCC8=;
        fh=bocf+UmptUO3P+wkoLclDfAaavtXZ8jWTx/jckueLA0=;
        b=kLUfcs1xx5QsdT9FZ2rGF+6GlRVdyMCWozAyGxXJv9zlpJZoFh2qCfI3ZIsYK34vey
         8itPNogQybEA76hKBi2mOH0htYM7pNdXV0iMjluYvfxiSn3w6DcP7dPJbPFLt1i+j8XZ
         a0bUu6vhbgSqOPCy72wVJmuygiVxRjxrejya6PdOkKS5/ZQbuhFRYQY/RJ22Rgzw+C9c
         NXUiPygYfjUBFLFYyng/LSgAD6cF4ZtqEZQt2D1b9iOq0uG5zvschGqP9Q0lAiV31EQZ
         69kNZiuNgVHxyO+kGf767ul2krzajsaFF2jX/W00ezT6h/mPigkFABruxzs3hizdKSGR
         loLA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769621309; x=1770226109; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G42JRVu3qsiA3fB7Z6xOAFyMzMqgtqYneFh2pi5QCC8=;
        b=EUe51Tb5kxqu4y58t9teMC2rO/UxpH6lXmAihD4jNXvPKnQkaztDDgf8qECrx32WR0
         +Tj0s4ZOIB9IFBNaArX5+RGnisHQxGMwu3Ve8ykDg+18QYYXANFBG+dpp+dMUQtsTqMx
         fy2A+cgFq5rmZ1Z+uGM4zmhC5e63UI5fAFTqHhrGNfS1baUHbxcmUp3u7+kaNy9OuPT6
         JpAHmMV2+FmfUmkTtCwcQlk9Ne4spIY7ChDfnBTbJaK4Cj7NAXrCo2df/vga7t2B5GcE
         MHWd5vu1jwga9MirCS39vXELekqVtYXI5Xq9AfI8mavS1IFcBddBclYgxl6jqsukmYrs
         bx5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769621309; x=1770226109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G42JRVu3qsiA3fB7Z6xOAFyMzMqgtqYneFh2pi5QCC8=;
        b=g9lK5J6vb3BObpzWV4Fi1ocXVnykQvCmLrhoy1lzrpEzU07pPkX2jQ2/v0lMrHitgD
         UpWG9jjGG9+Cu8QYKTGegwMoWJ3gDajqh7033Vei53RniP72MnYAOJiRN3mVWTLqE15C
         4Xp/JkHFUpvd8fNBR5GWX0+R8g1QWQFgUIUe5KSGngBQKhxUb+sFrHq5lyrL+KRKtF08
         LMVG3lB0XcAOVkrD2V2bC7+Qq8NvAfBjL51uFfdG8Mz0xQzr4wtwAqC6rHAYGeBbyDb7
         LhwfpFDf29L1cyDIU+9CJN0CgsmRseElxUQXzOms3wyDfpvxDVtnXqd0kVt8IP88KOwd
         gP5A==
X-Gm-Message-State: AOJu0YwfG9OPXBZw/gv0x+PfjhOL6O3SeXOe/wK6Ip1SUzfPvRgVym8R
	sZAvlFXSv1KeYnIGSUv6Kjlm+77axAytp5XdJ607hsTAV0kQyclRaYY9lG3t8QawB73OAb554UC
	H54v6iuRTlxY3XPQtaUgR5Dh+m141RfdKsbzp
X-Gm-Gg: AZuq6aJF0uLNCHyPTn9iVpw42TnTeweo7hKDDSTWRIg2Y0dSuj9GS9Os/mY7pM1ofAv
	GcXHppLj2trFPbBYAxSK8b32vdYs8Sh0cyam8gJbgRbJIHYAxqdqHZh3jXJ3ubXzFNijln/SlhY
	iKol2n2qTqVUi7L2lR4DO5lIFzaTrj+zZU9rNFuisGPpPhv4vZxeM4RBJ4RuvbTwBJNsFks2tre
	M/SOvxSkuWF2Fl5C4H9jpi4KLdArxlM7Q+2WbperHK7nNd7vFulnM5STiIcXrTz3YTw6GfYwuwt
	Xv+IbzpDvwC37ZBelglC9H2uEJQlJRdfdAcCHheK1r4rqv5J7+M0OLqj6w==
X-Received: by 2002:a05:690c:829:b0:793:a2fa:b97b with SMTP id
 00721157ae682-7947a8b0af8mr36286237b3.0.1769621309076; Wed, 28 Jan 2026
 09:28:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128153905.163137-1-trivin2024@gmail.com>
In-Reply-To: <20260128153905.163137-1-trivin2024@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 28 Jan 2026 12:28:17 -0500
X-Gm-Features: AZwV_QgvOgeht9U1NontFf8rUJ5zZPURLjgwyFppMAEF-DuxLKiF_aRqtRvnOYU
Message-ID: <CABBYNZKDvgSJYTAyaco6ZVz-HHZUoFz22ZSwDHsfoMD0BZK2dw@mail.gmail.com>
Subject: Re: [PATCH] tools/sdptool: report error when local SDP server is not found
To: Magdalena Trivina Sihotang <trivin2024@gmail.com>
Cc: linux-bluetooth@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-18607-lists,linux-bluetooth=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luizdentz@gmail.com,linux-bluetooth@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-bluetooth];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8098CA704F
X-Rspamd-Action: no action

Hi Magdalena,

On Wed, Jan 28, 2026 at 11:18=E2=80=AFAM Magdalena Trivina Sihotang
<trivin2024@gmail.com> wrote:
>
> From: Magdalena Trivina <trivin2024@gmail.com>
>
> Currently, the sdptool add, setattr and setseq commands do not
> report any error when the local SDP server is unavailable.
>
> Add an explicit error message so users can distinguish between
> successful execution and failure due to a missing local server.
>
> Signed-off-by: Magdalena Trivina Sihotang <trivin2024@gmail.com>
> ---
>  tools/sdptool.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/tools/sdptool.c b/tools/sdptool.c
> index 4e95a18d0..4f4dd41ac 100644
> --- a/tools/sdptool.c
> +++ b/tools/sdptool.c
> @@ -871,8 +871,10 @@ static int cmd_setattr(int argc, char **argv)
>
>         /* Do it */
>         sess =3D sdp_connect(BDADDR_ANY, BDADDR_LOCAL, 0);
> -       if (!sess)
> +       if (!sess) {
> +               printf("No local SDP server!\n");
>                 return -1;
> +       }
>
>         status =3D set_attrib(sess, handle, attrib, argv[2]);
>         sdp_close(sess);
> @@ -1033,8 +1035,10 @@ static int cmd_setseq(int argc, char **argv)
>
>         /* Do it */
>         sess =3D sdp_connect(BDADDR_ANY, BDADDR_LOCAL, 0);
> -       if (!sess)
> +       if (!sess) {
> +               printf("No local SDP server!\n");
>                 return -1;
> +       }
>
>         status =3D set_attribseq(sess, handle, attrib, argc, argv);
>         sdp_close(sess);
> @@ -3692,8 +3696,10 @@ static int add_service(bdaddr_t *bdaddr, svc_info_=
t *si)
>                 return -1;
>
>         sess =3D sdp_connect(&interface, BDADDR_LOCAL, SDP_RETRY_IF_BUSY)=
;
> -       if (!sess)
> +       if (!sess) {
> +               printf("No local SDP server!\n");
>                 return -1;
> +       }
>
>         for (i =3D 0; service[i].name; i++)
>                 if (!strcasecmp(service[i].name, si->name)) {
> --
> 2.34.1

Tools such as sdptool shall be considered deprecated, if you want to
add records please use:

https://github.com/bluez/bluez/blob/master/doc/org.bluez.ProfileManager.rst

--=20
Luiz Augusto von Dentz

