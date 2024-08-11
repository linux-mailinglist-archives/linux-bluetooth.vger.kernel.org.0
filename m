Return-Path: <linux-bluetooth+bounces-6738-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B49BF94E287
	for <lists+linux-bluetooth@lfdr.de>; Sun, 11 Aug 2024 20:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29F0BB210C0
	for <lists+linux-bluetooth@lfdr.de>; Sun, 11 Aug 2024 18:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2D6158528;
	Sun, 11 Aug 2024 18:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ptP6Q0uf"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9C914B96A
	for <linux-bluetooth@vger.kernel.org>; Sun, 11 Aug 2024 18:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723400243; cv=none; b=iK5DNOHG1unUp9Y58dphPZyxznCumAArjhnZuQxh6FdyEAh7nFZhKs66P54SCQOnwuGUpyQcxlJ3h86mbWcbK/0lbiGvTsfnCchUzuApyf61m4KbijQhqL6IkhocMV5aJFgAtmQv4uH+ulpfyr6qzXGubZdi/+IOP1EbYBDuFDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723400243; c=relaxed/simple;
	bh=QEqX6jTyd8mtDAP045rVWWxtAM7yNW08id9PkOM91fs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UBrHCNtxLwBocadtxtJRPXUmD3D+sw8dvzR00Kz0cGfNpoUNVubuZk0S3jhdnP93+aRdcFk9jWqw3pQPdbnXLDDr1L/gH+XVceU910yS5MtbmRsMAmzjFZ7+RTJJUa8t8wjqCt7C8YEsi+9+To5M2hvKQ9xhwv9QyBZkDiHIgto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ptP6Q0uf; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f189a2a7f8so37622761fa.2
        for <linux-bluetooth@vger.kernel.org>; Sun, 11 Aug 2024 11:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723400239; x=1724005039; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwPrNBUvnU4mbdftoy187GtvdUrZHe6TFCVGlwNgbXc=;
        b=ptP6Q0ufMV5KBIVvEhoH+3oFFr9H7V05gPH/7T43vjvu8l+NXSvqZ545W9wS8Xb19D
         yydqgsX1YqvELQLEJPlOYeIxdHNp3tnkjEpRaJibiHK3eA6g3QYletkD3CRENB+dTQXb
         YPxYXSmnK3LIKhIuwxTLZUlwRjaPILd+K/xHJNiSfDM2bYgfSnNXdjUpn9O26RSER5cO
         ABsEzMiiMMZTN1RmJbXJtrnkVzQoYpXEdS9M4JqX4RumZFLaMk5DsGjoTS2pJbGLM2hk
         pOt6NFMjJKISN2xPWI3if6porTl56zz3IySmoiI1o/AY0BHwxAllQhiuaREBFQda3I9N
         AKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723400239; x=1724005039;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YwPrNBUvnU4mbdftoy187GtvdUrZHe6TFCVGlwNgbXc=;
        b=kzsFhy/Pn0GUUijF55fpgQWXBuGx9PvUaCJ/p9u+xigjBR2L/no8EUGkbsKrzbIAlI
         BNMEn3gw/0lp1c14gMMLVflqV9gv58c3cHvDHQn3O83fg+88EY49P9umpYCSWrQWtwlH
         sKOkhn++UA671WogV05Biy0eKSXnNxWd4xCvDfjTdep9ylim6omhH0P5nowsdgd6WElA
         ukF6RuzG2INkbVM1QabhrpdZQK6ZrSOO5Be2A5QK446aA9u0971WtsSyqO8yMdCua4FD
         X9p2D9tQZIDoTMRf4gjq9MRi6KG+0jcVlI7P3vMcT1ippPHkc/hpUriezXBFFplFkCe2
         icwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkn9uda04Fsxd26uI1GLwcNvV2KGNokMTZW0KLvQoflXASsBJTi9sYU0NY/UgUcrpy2ZFcUaP+vKu+ohOjl0tepRwiLQA23FZN9BzriYMg
X-Gm-Message-State: AOJu0YypU+3bNmg3PCmvH4wHFfmDvH9fG8RkTEEPcOZLUdAQiBtEgonN
	cnhFb/PvHkHN6js9X08TEL+NKXtvU/tS/tX5GtzgrJWzovwNrMtKOTe8nFQpekk=
X-Google-Smtp-Source: AGHT+IGL8dYrPpIhxDmqwnFdq5fwLCKAJWl59JNXZWtvR62sQOT8VXO5t1ROG/0yftq11lxeIELW0Q==
X-Received: by 2002:a2e:88c2:0:b0:2f1:5c89:c875 with SMTP id 38308e7fff4ca-2f1a6c687d4mr43015351fa.26.1723400238328;
        Sun, 11 Aug 2024 11:17:18 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd1a6032c1sm1610593a12.92.2024.08.11.11.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:17:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/6] dt-bindings: add serial-peripheral-props.yaml
Date: Sun, 11 Aug 2024 20:17:03 +0200
Message-Id: <20240811-dt-bindings-serial-peripheral-props-v1-0-1dba258b7492@linaro.org>
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB8AuWYC/x2NQQqAMAwEvyI5G2iLYPUr4kFt1IDUkogI4t+tn
 nbnMLs3KAmTQlvcIHSy8h4z2LKAaR3iQsghMzjjKuOtxXDgyDFwXBQ/d9gw5UgryVdlT4qVbcj
 P3pOrDeSlJDTz9b90/fO8b4n4MnUAAAA=
To: Rob Herring <robh@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Johan Hovold <johan@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Daniel Kaehn <kaehndan@gmail.com>
Cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2242;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=QEqX6jTyd8mtDAP045rVWWxtAM7yNW08id9PkOM91fs=;
 b=kA0DAAoBwTdm5oaLg9cByyZiAGa5ACKhowuFQWEQGWLBZ65ihEcm7sWDm5sILJ0QDnLhNFcNn
 okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJmuQAiAAoJEME3ZuaGi4PXOQQP/Rf3
 0FQ0xAoCgS7Rg5Leu6TCRvJx00s5hvLY/OatLg1j6RJ09EPW4CjZCHUkNAsii1fmw6D36YOIxGn
 yANtN0FjOqIRKi86b/M/Ew+30nEv9+heFkhedxy5+qeKfgB37PVf4e1xJ+YzAjp+GEcCioB4akh
 qF0Q71VKHz8pCuK+0r18ceZ4ltmTvUWDlRPz/U0gIsv/ey/X+AeDwLUJH+/3OurVOzt/l759wH+
 k9vny+3L2RAnKnYCJ78J9h9cZHns7SCJzjLYXahWfyKIHWAhkKq9n1dw4YcBuTBIvMRy5zDRFNx
 YrhPRKGeCtFT3dwngVMuRLm7pzBWJ49NPLnT3oh3olQ+xyW6lx8fSyMRPBbM11cam2MlRbLfQe2
 Ckj4G2tML2zwirNyyxMFh/runDKcakRCwTmx/+1ixutFkxKWHisMKz8hYuR6Tfi/g3PBvYzxhqo
 //11FD/jMibRLb2pdBuj8ZnU4En6gKb4zn3UkXR0d0+dozzXGe6MUwGRrepM2nMAJCsc/ss4G1U
 9nzaAN5EC7bfkVBiTUswgxlr6FLmQCfdZfRP7spBixaxXYXmTc3CHC3oajHfeaTzBIEJhKG4hbH
 QdW7lvHeGcMv43NdDPCaitsgL9WiDAevkhH90YumKd9T+i528h/dtRnT8NFyoZ5LBM2snf73M4y
 2qY7d
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

Add serial-peripheral-props.yaml for devices being connected over
serial/UART.

Maybe the schema should be rather called serial-common-props.yaml? Or
serial-device-common-props.yaml?

Dependencies/merging - Devicetree tree?
=======================================
Entire patchset should be taken via one tree, preferably Rob's
Devicetree because of context/hunk dependencies and dependency on
introduced serial-peripheral-props.yaml file.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      dt-bindings: serial: add missing "additionalProperties" on child nodes
      dt-bindings: serial: add common properties schema for UART children
      dt-bindings: bluetooth: move Bluetooth bindings to dedicated directory
      dt-bindings: gnss: reference serial-peripheral-props.yaml
      dt-bindings: bluetooth: reference serial-peripheral-props.yaml
      ASoC: dt-bindings: serial-midi: reference serial-peripheral-props.yaml

 .../devicetree/bindings/gnss/brcm,bcm4751.yaml     |  1 +
 .../devicetree/bindings/gnss/gnss-common.yaml      |  5 ---
 .../devicetree/bindings/gnss/mediatek.yaml         |  1 +
 .../devicetree/bindings/gnss/sirfstar.yaml         |  1 +
 .../devicetree/bindings/gnss/u-blox,neo-6m.yaml    |  1 +
 .../brcm,bluetooth.yaml}                           | 33 +++++++++--------
 .../marvell,88w8897.yaml}                          |  6 ++--
 .../mediatek,bluetooth.txt}                        |  0
 .../nokia,h4p-bluetooth.txt}                       |  0
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml |  4 +--
 .../realtek,bluetooth.yaml}                        |  5 ++-
 .../bindings/net/{ => bluetooth}/ti,bluetooth.yaml |  5 ++-
 .../bindings/serial/serial-peripheral-props.yaml   | 41 ++++++++++++++++++++++
 .../devicetree/bindings/serial/serial.yaml         | 24 ++-----------
 .../devicetree/bindings/sound/serial-midi.yaml     |  3 ++
 MAINTAINERS                                        |  2 +-
 16 files changed, 80 insertions(+), 52 deletions(-)
---
base-commit: 8626c4826dd708e05ba457c44493d575d75d375c
change-id: 20240811-dt-bindings-serial-peripheral-props-419e8f88e270

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


