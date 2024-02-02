Return-Path: <linux-bluetooth+bounces-1563-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A454846759
	for <lists+linux-bluetooth@lfdr.de>; Fri,  2 Feb 2024 06:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21CBA2882C7
	for <lists+linux-bluetooth@lfdr.de>; Fri,  2 Feb 2024 05:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9513A12E6C;
	Fri,  2 Feb 2024 05:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opSWBFDt"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BC4FBEC
	for <linux-bluetooth@vger.kernel.org>; Fri,  2 Feb 2024 05:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706850004; cv=none; b=pcdK848IOiC7AeHZCLgWfqv44dbYizgCZf3hpy6pnLPJza69gYkjkyPkTdVZLCJ7bKYYkkM8R9V6FhXI8MwakR8W66UNqtseGdUuLrme51Ui96++Lu+00uU3NuwMeXXpYMeIQkLpbMUi2+KYWoBJYLWCmhAnVm8y1vzi+BImmZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706850004; c=relaxed/simple;
	bh=T0vX24nqgl24t4u6EombPf+txX+ZVMgh8DtpD2yzVfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1d4daJ4E1QCCOFvVtR/Pnkujq6FT2+zsawKtI0xEmV3pQ5hz/fAvK99vNPUSOs+xouUavWFOOXXPnb8KLuxkBHphIptP3bg+VPQekpHutFXG8gSrBF6voiEbFhQHzoyHvFrQELG/t2wHvchmSR8ag/S1XKghdmRfRrmy02eWLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opSWBFDt; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-60406dba03cso19138217b3.0
        for <linux-bluetooth@vger.kernel.org>; Thu, 01 Feb 2024 21:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706850000; x=1707454800; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s6NYU5KnPvZkgWi9fKvh/OHPOr3orCLc/qXQ8woqnRk=;
        b=opSWBFDtSH6ke68Zws2NIUBcKOgzlxWnDKtjilihxUUnh19L28eGu0RY6zSu3FxhX1
         rItVQg9h4s/tmsX51e6I1runr4dBA6zgHYBGzyhb58sHv2ZLvqokJwdy9EglkCmDEZP9
         5M8rN+M1OoVJKeX8Uo0MKOSyUiDn1w3MZfAqiPyuXpF0VloTk3xZkSdGqek7kMLcWebl
         5ReacydB1gxlzufMDPi4ilbLQ3SYTbNTPb42iNGxdFRcgoqmj53zvwN1xYWMEwky8p0g
         rk8tWyMFlB70r1oPAdjC4rbdAWwCjy/TQZo8F1lbNNRQoQ1dNc2zAHgGFC8kY7ygsjA5
         u1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706850000; x=1707454800;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6NYU5KnPvZkgWi9fKvh/OHPOr3orCLc/qXQ8woqnRk=;
        b=M/Wbi/58slB2TIIAxDywRTN4pYbfu8PMbWjdZMjQn+jYbuqMJD/bCAdwMI+u4uoHZz
         9VvLC1KdEd9kdgUAKtYCp0/SuXRwgp1ZTQHpitmRyDmL+aNHseI4Ni3b6twkzEwFQtY3
         eHJjK3aGhtEkhT2gFmIve4Olnun0sGyy2c2Fj7QCPrj2BIymZPssFac1ePo+1W6cXUZi
         Zg7xi4O9g/vIiDumic++iBHlY04UVQHOFvmnxpBIxGIYt0I2Oi+VrtdNPZE8sVvunqaJ
         0KNfuDcyi0qEOj36kAs78KPzW2THMWwa0sYuHez4eaP2HJSNlO35/EarDWQaKvJuIt5e
         OQNw==
X-Gm-Message-State: AOJu0YxGj9cx5QupMwxWsEZy1L67nYn5fBBL0tyAhG7DAG+8fTYQ/cRd
	YEbIfWyx79r+pqj51m+Ytgqe13LFtSwP7ES7uqs1Yfhz8kH3VO+LQmOqzsPV1DyRLLHZypHfJQc
	YRMClReklrKWkw+6ofilwGzWZ1twJRbdLBNuxfQ==
X-Google-Smtp-Source: AGHT+IGgcDBuCrhKdd/clnrw04i+udx8hzsr1sxGtEBgtlqYM3KgmrIxBa/QVvTKlH6vHlUbS+d50enNsyuWZMfn21k=
X-Received: by 2002:a81:520e:0:b0:602:ce22:7079 with SMTP id
 g14-20020a81520e000000b00602ce227079mr4382152ywb.41.1706849999780; Thu, 01
 Feb 2024 20:59:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240201155532.49707-1-brgl@bgdev.pl> <20240201155532.49707-3-brgl@bgdev.pl>
 <5lirm5mnf7yqbripue5nyqu6ej54sx4rtmgmyqjrqanabsriyp@2pjiv5xbmxpk>
In-Reply-To: <5lirm5mnf7yqbripue5nyqu6ej54sx4rtmgmyqjrqanabsriyp@2pjiv5xbmxpk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 2 Feb 2024 06:59:48 +0200
Message-ID: <CAA8EJpp=gYhx6XKHNzyR5n8i7vg-MJXN5XJp4CPKZMYS5GBHvw@mail.gmail.com>
Subject: Re: [RFC 2/9] arm64: dts: qcom: qrb5165-rb5: model the PMU of the QCA6391
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Abel Vesa <abel.vesa@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pci@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Feb 2024 at 06:34, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Thu, Feb 01, 2024 at 04:55:25PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add a node for the PMU module of the QCA6391 present on the RB5 board.
> > Assign its LDO power outputs to the existing Bluetooth module. Add a
> > node for the PCIe port to sm8250.dtsi and define the WLAN node on it in
> > the board's .dts and also make it consume the power outputs of the PMU.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 128 +++++++++++++++++++++--
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi     |  10 ++
> >  2 files changed, 127 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > index cd0db4f31d4a..fab5bebafbad 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> > @@ -108,6 +108,87 @@ lt9611_3v3: lt9611-3v3 {
> >               regulator-always-on;
> >       };
> >
> > +     qca6390_pmu: pmu@0 {
> > +             compatible = "qcom,qca6390-pmu";
> > +
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> > +
> > +             vddaon-supply = <&vreg_s6a_0p95>;
> > +             vddpmu-supply = <&vreg_s2f_0p95>;
> > +             vddrfa1-supply = <&vreg_s2f_0p95>;
> > +             vddrfa2-supply = <&vreg_s8c_1p3>;
> > +             vddrfa3-supply = <&vreg_s5a_1p9>;
> > +             vddpcie1-supply = <&vreg_s8c_1p3>;
> > +             vddpcie2-supply = <&vreg_s5a_1p9>;
> > +             vddio-supply = <&vreg_s4a_1p8>;
> > +
> > +             wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
> > +             bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> > +
> > +             regulators {
> > +                     vreg_pmu_rfa_cmn: ldo0 {
> > +                             regulator-name = "vreg_pmu_rfa_cmn";
> > +                             regulator-min-microvolt = <760000>;
> > +                             regulator-max-microvolt = <840000>;
>
> I'm still not convinced that the PMU has a set of LDOs, and looking at
> your implementation you neither register these with the regulator
> framework, nor provide any means of controlling the state or voltage of
> these "regulators".

Please take a look at the description of VDD08_PMU_RFA_CMN and
VDD_PMU_AON_I pins in the spec (80-WL522-1, page 25). I'm not sure if
I'm allowed to quote it, so I won't. But the spec clearly describes
VDD_PMU_AON_I as 0.95V LDO input and VDD08_PMU_RFA_CMN as 0.8 LDO
output generated using that input. I think this proves that the
on-chip PMU has actual LDOs.

I must admit, I find this representation very verbose, but on the
other hand Bartosz is right, it represents actual hardware. Maybe we
can drop some of the properties of corresponding regulator blocks, as
we don't actually need them and they are internal properties of the
hardware.

>
> [..]
> >
> >  &uart6 {
> > @@ -1311,17 +1418,16 @@ &uart6 {
> >       bluetooth {
> >               compatible = "qcom,qca6390-bt";
> >
> > -             pinctrl-names = "default";
> > -             pinctrl-0 = <&bt_en_state>;
> > -
> > -             enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> > -
> > -             vddio-supply = <&vreg_s4a_1p8>;
> > -             vddpmu-supply = <&vreg_s2f_0p95>;
> > -             vddaon-supply = <&vreg_s6a_0p95>;
> > -             vddrfa0p9-supply = <&vreg_s2f_0p95>;
> > -             vddrfa1p3-supply = <&vreg_s8c_1p3>;
> > -             vddrfa1p9-supply = <&vreg_s5a_1p9>;
> > +             vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> > +             vddaon-supply = <&vreg_pmu_aon_0p59>;
> > +             vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> > +             vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> > +             vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
> > +             vddrfa0-supply = <&vreg_pmu_rfa_0p8>;
> > +             vddrfa1-supply = <&vreg_pmu_rfa_1p2>;
> > +             vddrfa2-supply = <&vreg_pmu_rfa_1p7>;
> > +             vddpcie0-supply = <&vreg_pmu_pcie_0p9>;
> > +             vddpcie1-supply = <&vreg_pmu_pcie_1p8>;
>
> As I asked before, why does bluetooth suddenly care about PCIe supplies?

Power sequencing in the same spec describes that PCIe voltages should
be up even if only BT is being brought up. PMU itself handles
distributing voltages according to the actual load needs.

>
> Regards,
> Bjorn
>
> >       };
> >  };
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 4d849e98bf9b..7cd21d4e7278 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -2203,6 +2203,16 @@ pcie0: pcie@1c00000 {
> >                       dma-coherent;
> >
> >                       status = "disabled";
> > +
> > +                     pcieport0: pcie@0 {
> > +                             device_type = "pci";
> > +                             reg = <0x0 0x0 0x0 0x0 0x0>;
> > +                             #address-cells = <3>;
> > +                             #size-cells = <2>;
> > +                             ranges;
> > +
> > +                             bus-range = <0x01 0xff>;
> > +                     };
> >               };
> >
> >               pcie0_phy: phy@1c06000 {
> > --
> > 2.40.1
> >
>


-- 
With best wishes
Dmitry

