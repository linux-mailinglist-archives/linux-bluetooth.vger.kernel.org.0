Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAC4FEFA93
	for <lists+linux-bluetooth@lfdr.de>; Tue,  5 Nov 2019 11:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388175AbfKEKNK (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 5 Nov 2019 05:13:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:40578 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387832AbfKEKNK (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 5 Nov 2019 05:13:10 -0500
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1961F21929;
        Tue,  5 Nov 2019 10:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572948789;
        bh=EkFkzMw/9Q7TmseCjgj4zggdTDwYFvDKTbwOc9WSrrs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=huX++/6ld4+kzCEovk5TNI25d6Y7ZwmKcSiqHq0C3aq0lczH3A2WFkTPtIGOPYMHX
         YUBgihd44UMBnXiRZQslpZ2GYIE3zMWZel0TsiM8XlAcCOz3wgqPDYG7+FyonKaNz4
         15Md/fEU+jyT4CvadT9+ekOEnTWr+9gdRIbDSX3Y=
Date:   Tue, 5 Nov 2019 11:13:06 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Hugo Grostabussiat <bonstra@bonstra.fr.eu.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chen-Yu Tsai <wens@csie.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: net: bluetooth: add DT binding for
 Realtek controllers
Message-ID: <20191105101306.GA3876@gilmour.lan>
References: <20191030224333.70241-1-bonstra@bonstra.fr.eu.org>
 <20191030224333.70241-2-bonstra@bonstra.fr.eu.org>
 <20191101080256.gjc4tacltehro3iw@hendrix>
 <6C5CE71F-37F2-4C8A-9D94-1BC75937B478@holtmann.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6C5CE71F-37F2-4C8A-9D94-1BC75937B478@holtmann.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Mon, Nov 04, 2019 at 03:20:59PM +0100, Marcel Holtmann wrote:
> >> The rtl_bt driver already supports some Realtek controllers on ACPI
> >> platforms.
> >> This commit adds bindings for DT-only platforms.
> >>
> >> Signed-off-by: Hugo Grostabussiat <bonstra@bonstra.fr.eu.org>
> >> ---
> >> .../bindings/net/realtek-bluetooth.txt        | 25 +++++++++++++++++++
> >> 1 file changed, 25 insertions(+)
> >> create mode 100644 Documentation/devicetree/bindings/net/realtek-bluet=
ooth.txt
> >
> > You should write that binding using a YAML description. Free-form
> > device tree bindings are more or less deprecated now.
>
> unless we change all the Bluetooth descriptions, I prefer we keep it the =
=E2=80=9Cold=E2=80=9D way.

FWIW, this is a warning in checkpatch now.

Maxime
