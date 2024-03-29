Return-Path: <linux-bluetooth+bounces-2946-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13F89189A
	for <lists+linux-bluetooth@lfdr.de>; Fri, 29 Mar 2024 13:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 099061F23177
	for <lists+linux-bluetooth@lfdr.de>; Fri, 29 Mar 2024 12:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DF986130;
	Fri, 29 Mar 2024 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="O7Fi0g/C"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD2D33CD0
	for <linux-bluetooth@vger.kernel.org>; Fri, 29 Mar 2024 12:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711714950; cv=none; b=Qki2P8VSbG2XQJtCyutciCXbq2OKCDA6t7wg0/G9wbydnNlK8/b0vFT6e/ZvfVXmJ9YwPkPB3FypXoXNDM0fqb23gQxEJ0fMClKpO06Go2pPfY/671CbpiD64MlmxZHX8LGs0ey+3HrB+bpdnvQToQN6R2o3KbBhsb04A3x1zQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711714950; c=relaxed/simple;
	bh=leo+Yi4AfSnMVg8mcM4Xju1MFqd5FSUEovb4t8XjI+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FbdqctJPyp6cmM1IS76vK+SW4Rq5N6ifCdOwn3LURT/9Nn5qjtJFOpYJTc4lRCasV+P6gfY3TJ5ibEISnmaCQ2OY16fZPqzvqn5Mjg/epimTPzbyYS6DibZmzCRzEOTE2zIhA89IYuOAcFlmCcL5L7eNGwc+Qg3MaD4pKeeW5qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=O7Fi0g/C; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d4979cd8c8so19047941fa.0
        for <linux-bluetooth@vger.kernel.org>; Fri, 29 Mar 2024 05:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711714946; x=1712319746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdH2/uZDyLmBSFlZ529ZdmMTMc2xJjXR5We9XRvPLc8=;
        b=O7Fi0g/C5yTqgLj7PJ0zyXIg+iImbY+SKVFGN4a9Zq5xCNky6TjQyYrzlUaERurNpf
         7LwKDBDW9EciAYhebOlUrfpp7gkwdxw3ffcHgzjAsYvU5YXkkSuF6xm7T7Dgu9iSQ5kl
         +qqXXyD8PAwdjUTX/VSPOgkEthVy/fYMcmg7/Pdkk27h8K4cpeyzmcdoVIWAeGJYcA4p
         vgxV5p/AfEY+VZYpyf4uBNc2jICO/cR9owEcZUd+mnQwV27PeBiF08/M0whYSW9XQNrn
         V/j9jsc5tyhLkFsz1U2crr4Z9BGHhaJ+fjWQ7temGRIJI9xLKbhip75WdFHFUSwGtyRq
         rj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711714946; x=1712319746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdH2/uZDyLmBSFlZ529ZdmMTMc2xJjXR5We9XRvPLc8=;
        b=xVoPaUY/VNnvjCxUiCbb9QJssRwIKtW1drUDjhlLXCsJASKiTDWyRCATmjuexdXElF
         Hdvt/LeX2KshK/qLFxBiA6+toVpLRANV0xivgvvkCvXO//+pHeuxu+C+siKY56gAvg5F
         F7D3o05Hy9aCWBTBlhgZHJXrrUHhMcBX8oTaZeI/8LPmWPeE0way8JmXsf/l4fYYbOIp
         RJmx/cXiv5HbgcfMpaQINVr2/HxJuFUY2O3ZXUcZPmeqInFWwwzoZcKGRWjNwWspT9ZG
         0UoQH9erl8i+jgiDNF9cjlZVOXwIvYz3tDozJZHePoK0+mwfiamwrYs/hogah66r2cX5
         LjMA==
X-Forwarded-Encrypted: i=1; AJvYcCVHngsWb1UqR9GEghUcdFzMND+iLt+bM0VLlQ4WxRiwENYPXJDWQjxwbZdVYBz8N14/n7AiIzs7ITCtb0smSgNq3azuBxBXA3BlQ8hELqcg
X-Gm-Message-State: AOJu0YzVij+HES7O6gavgw5KtN8f0Co9IirRIX6UjjAJIrPD3DjUb6Q6
	ZcEQd3NA/iheaps3ooQKP1Cr2EUhEO3CYGMRkMRyxj0KeuaOwIdo56p+HWRKXAmmxukWbDLvIde
	mlGJiWk1Ncwy7+LaGJKqPdzSNbuz3bs3AZoKGBA==
X-Google-Smtp-Source: AGHT+IE+HnSCJL2quawa1K1lMrp38Nm79TgJqcEd/z4x+7H7IfVDrdpUOVuBJN0I2Fw0lOyMRLNfqEQZZUdPpNwT2ZM=
X-Received: by 2002:a2e:8350:0:b0:2d3:5480:92aa with SMTP id
 l16-20020a2e8350000000b002d3548092aamr644831ljh.25.1711714946358; Fri, 29 Mar
 2024 05:22:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240327-module-owner-virtio-v1-0-0feffab77d99@linaro.org>
 <20240327-module-owner-virtio-v1-9-0feffab77d99@linaro.org>
 <CAMRc=McY6PJj7fmLkNv07ogcYq=8fUb2o6w2uA1=D9cbzyoRoA@mail.gmail.com> <1303b572-719e-410d-a11a-3f17a5bb3b63@linaro.org>
In-Reply-To: <1303b572-719e-410d-a11a-3f17a5bb3b63@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 29 Mar 2024 13:22:15 +0100
Message-ID: <CAMRc=Mfeez9kXkkVxdmUk5dy=L=rbnYkYujO6jSCT5WAyUw2HA@mail.gmail.com>
Subject: Re: [PATCH 09/22] gpio: virtio: drop owner assignment
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Olivia Mackall <olivia@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Amit Shah <amit@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gonglei <arei.gonglei@huawei.com>, 
	"David S. Miller" <davem@davemloft.net>, Viresh Kumar <vireshk@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Jean-Philippe Brucker <jean-philippe@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Alexander Graf <graf@amazon.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Van Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, 
	Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Kalle Valo <kvalo@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Anton Yakovlev <anton.yakovlev@opensynergy.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, virtualization@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, 
	netdev@vger.kernel.org, v9fs@lists.linux.dev, kvm@vger.kernel.org, 
	linux-wireless@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 12:35=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 29/03/2024 11:27, Bartosz Golaszewski wrote:
> > On Wed, Mar 27, 2024 at 1:45=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> virtio core already sets the .owner, so driver does not need to.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>
> >> ---
> >>
> >> Depends on the first patch.
> >> ---
> >>  drivers/gpio/gpio-virtio.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
> >> index fcc5e8c08973..9fae8e396c58 100644
> >> --- a/drivers/gpio/gpio-virtio.c
> >> +++ b/drivers/gpio/gpio-virtio.c
> >> @@ -653,7 +653,6 @@ static struct virtio_driver virtio_gpio_driver =3D=
 {
> >>         .remove                 =3D virtio_gpio_remove,
> >>         .driver                 =3D {
> >>                 .name           =3D KBUILD_MODNAME,
> >> -               .owner          =3D THIS_MODULE,
> >>         },
> >>  };
> >>  module_virtio_driver(virtio_gpio_driver);
> >>
> >> --
> >> 2.34.1
> >>
> >
> > Applied, thanks!
>
> I expressed dependency in two places: cover letter and this patch.
> Please drop it, because without dependency this won't work. Patch could
> go with the dependency and with your ack or next cycle.
>
> Best regards,
> Krzysztof
>

Dropped, and:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

