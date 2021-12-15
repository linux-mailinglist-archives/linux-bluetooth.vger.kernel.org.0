Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FE2475DF2
	for <lists+linux-bluetooth@lfdr.de>; Wed, 15 Dec 2021 17:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245035AbhLOQzq (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 15 Dec 2021 11:55:46 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:13613 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231931AbhLOQzp (ORCPT <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 15 Dec 2021 11:55:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1639587345; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=sTdtQQP6OdTSK5qoXkTe64XNcig82CVmEynE7iICHV0=;
 b=NsilYe1EwCB1W1Xqr7NQYulJc9bFA/xZucmbSp3EvqepwZnWJy9lHCw46JpeCSLF3wPGv+pH
 j7MuiTYTH64iC9520hbn9ilsB75EEulr3/Oq2NKvDiVnSVA6Zt82whKZ5gyVeGoNpwVDS/Nn
 8zqdsz62jkC38s3QgU/gMMvaZYE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI2MTA3ZSIsICJsaW51eC1ibHVldG9vdGhAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 61ba1e0f3553c354bed17cfc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 15 Dec 2021 16:55:43
 GMT
Sender: bgodavar=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B987EC4338F; Wed, 15 Dec 2021 16:55:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33172C4360D;
        Wed, 15 Dec 2021 16:55:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 15 Dec 2021 22:25:41 +0530
From:   bgodavar@codeaurora.org
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org,
        mcchou@chromium.org, saluvala@codeaurora.org,
        Balakrishna Godavarthi <bgodavar@codeauroa.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7280: Add bluetooth node on SC7280
In-Reply-To: <Ya90KTLlwFlaIWRE@google.com>
References: <1638857623-32379-1-git-send-email-bgodavar@codeaurora.org>
 <Ya90KTLlwFlaIWRE@google.com>
Message-ID: <fa8d54f11be8f16d02f12dbc754d1da1@codeaurora.org>
X-Sender: bgodavar@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Matthias,

On 2021-12-07 20:18, Matthias Kaehlcke wrote:
> On Tue, Dec 07, 2021 at 11:43:43AM +0530, Balakrishna Godavarthi wrote:
> 
>> Subject: arm64: dts: qcom: sc7280: Add bluetooth node on SC7280
> 
> nit: the node is added to the IDP boards, not sc7280 in general
> 
[Bala]: will update it.

>> From: Balakrishna Godavarthi <bgodavar@codeauroa.org>
>> 
>> Add bluetooth SoC WCN6750 node for SC7280 IDP boards.
>> 
>> Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
>> ---
>> v3:
>>   * Addressed reviewers comments
> 
> that's not overly useful, instead you should describe what changed
> 
>>   * Added pin config for sw_ctrl line.
>> v2:
>>   * merged two patches into one
>>   * Removed unused comments
>>   * Removed pinmux & pin conf.
>>   * Addressed reviewers comments
>> 
>> v1: initial patch
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dts  |  4 ++++
>>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 37 
>> ++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/qcom/sc7280-idp2.dts |  4 ++++
>>  3 files changed, 45 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 9b991ba..19bd228 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -56,6 +56,10 @@
>>  	};
>>  };
>> 
>> +&bluetooth {
>> +	vddio-supply = <&vreg_l19b_1p8>;
>> +};
>> +
>>  &ipa {
>>  	status = "okay";
>>  	modem-init;
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index d623d71..b8b00dc 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -14,6 +14,11 @@
>>  #include "pmk8350.dtsi"
>> 
>>  / {
>> +	aliases {
>> +		bluetooth0 = &bluetooth;
>> +		serial1 = &uart7;
>> +	};
>> +
>>  	gpio-keys {
>>  		compatible = "gpio-keys";
>>  		label = "gpio-keys";
>> @@ -422,6 +427,23 @@
>>  				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
>>  	pinctrl-names = "default", "sleep";
>>  	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, 
>> <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
>> +
>> +	bluetooth: bluetooth {
>> +		compatible = "qcom,wcn6750-bt";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&bt_en>, <&swctrl_gpio>;
>> +		enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
>> +		swctrl-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
>> +		vddaon-supply = <&vreg_s7b_0p9>;
>> +		vddbtcxmx-supply = <&vreg_s7b_0p9>;
>> +		vddrfacmn-supply = <&vreg_s7b_0p9>;
>> +		vddrfa0p8-supply = <&vreg_s7b_0p9>;
>> +		vddrfa1p7-supply = <&vreg_s1b_1p8>;
>> +		vddrfa1p2-supply = <&vreg_s8b_1p2>;
>> +		vddrfa2p2-supply = <&vreg_s1c_2p2>;
>> +		vddasd-supply = <&vreg_l11c_2p8>;
>> +		max-speed = <3200000>;
>> +	};
>>  };
>> 
>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> @@ -491,6 +513,14 @@
>>  };
>> 
>>  &tlmm {
>> +	bt_en: bt-en {
>> +		pins = "gpio85";
>> +		function = "gpio";
>> +		drive-strength = <2>;
> 
> is it really necessary to specify the drive strength?
> 
> Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml:
> 
>   drive-strength:
>     enum: [2, 4, 6, 8, 10, 12, 14, 16]
>     default: 2
> 
> The default is 2, so it shouldn't be needed.
> 
[Bala]: will update it.
>> +		output-low;
>> +		bias-disable;
>> +	};
>> +
>>  	nvme_pwren: nvme-pwren {
>>  		function = "gpio";
>>  	};
>> @@ -554,6 +584,13 @@
>>  		 */
>>  		bias-pull-up;
>>  	};
>> +
>> +	swctrl_gpio: swctrl-gpio {
> 
> The 'gpio' suffix isn't really useful.
> 
> I suggest to use the signal name from the schematics "mos-sw-ctrl" or
> call it "bt-sw-ctrl". If you use the schematic name then this should
> be also done for the enable pin.
[Bala]: will update it.
