Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 642EB620957
	for <lists+linux-bluetooth@lfdr.de>; Tue,  8 Nov 2022 07:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233251AbiKHGLJ (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 8 Nov 2022 01:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233098AbiKHGLI (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 8 Nov 2022 01:11:08 -0500
Received: from gw.atmark-techno.com (gw.atmark-techno.com [13.115.124.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E653FB8D
        for <linux-bluetooth@vger.kernel.org>; Mon,  7 Nov 2022 22:11:06 -0800 (PST)
Received: from gw.atmark-techno.com (localhost [127.0.0.1])
        by gw.atmark-techno.com (Postfix) with ESMTP id 2AC4B6013A
        for <linux-bluetooth@vger.kernel.org>; Tue,  8 Nov 2022 14:55:47 +0900 (JST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
        by gw.atmark-techno.com (Postfix) with ESMTPS id 803DF6013A
        for <linux-bluetooth@vger.kernel.org>; Tue,  8 Nov 2022 14:55:45 +0900 (JST)
Received: by mail-pj1-f69.google.com with SMTP id bt19-20020a17090af01300b00213c7cd1083so5695823pjb.8
        for <linux-bluetooth@vger.kernel.org>; Mon, 07 Nov 2022 21:55:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scjidRPc4iGIvCmBatKCX2F1Tnu8QI+jfRrfWYL73ZU=;
        b=TeSYAZbTKMNQzT5EDbbvRO1gCnBsVzoGmeFeXYCa7FEmQ4C905GuKXVq575Fa8RK8x
         vZCPLCol2VZK9joqCebnVzvBFI9ATmNoZqcc7In0+HTtIC6LNaiGPWrcJb0AmMwn0Hz+
         FjdmtMMeb6al5qmNxyV/upwFr0YNI6xC53iH0cy5yRowahm2vlXun5szV+1HNRewblEP
         SEKNGXb+SWSmTw9qQZyqzK1Rn4eyvLle78xFbZS2H6jLKHYMqhhbP7MiwhT5nB3QdLQ1
         daYQrxsIJkUD8n2cOW8LqNK5voemJ+KOELMt74a+qu74aIFnjDWFR1T2rB2kdAEo7nFV
         2kIA==
X-Gm-Message-State: ACrzQf1VNOSt0MVAc8uStYeUWnHTUVizUhE3cul7aw/cyOBTMA3Kt5RF
        8Z5NxxRTr/lzHjQ904oBHtbUMjFbl0uUIdISfGNmWB68ChhDCbTzu612kQzJ60POR8xzCpFOKj0
        COlB92OZx29Hc2IUfbr0OwrPqzyNpVNkr
X-Received: by 2002:a17:902:e493:b0:186:9de4:a7cd with SMTP id i19-20020a170902e49300b001869de4a7cdmr54287980ple.66.1667886944494;
        Mon, 07 Nov 2022 21:55:44 -0800 (PST)
X-Google-Smtp-Source: AMsMyM55peqthT9o/HMP9yprkCEHGzsFlZtK9QZTvy+tMTjniQD8mY+dN503GnNnk/R9botVWPvRlA==
X-Received: by 2002:a17:902:e493:b0:186:9de4:a7cd with SMTP id i19-20020a170902e49300b001869de4a7cdmr54287964ple.66.1667886944191;
        Mon, 07 Nov 2022 21:55:44 -0800 (PST)
Received: from pc-zest.atmarktech (178.101.200.35.bc.googleusercontent.com. [35.200.101.178])
        by smtp.gmail.com with ESMTPSA id m12-20020a17090ab78c00b002132f3e71c6sm5185182pjr.52.2022.11.07.21.55.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Nov 2022 21:55:43 -0800 (PST)
Received: from martinet by pc-zest.atmarktech with local (Exim 4.96)
        (envelope-from <martinet@pc-zest>)
        id 1osHaI-0098Ix-2j;
        Tue, 08 Nov 2022 14:55:42 +0900
From:   Dominique Martinet <dominique.martinet@atmark-techno.com>
To:     Marcel Holtmann <marcel@holtmann.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Johan Hedberg <johan.hedberg@gmail.com>
Cc:     netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S . Miller" <davem@davemloft.net>, mizo@atmark-techno.com,
        Dominique Martinet <dominique.martinet@atmark-techno.com>
Subject: [RFC PATCH 0/2] Add serdev support for hci h4
Date:   Tue,  8 Nov 2022 14:55:29 +0900
Message-Id: <20221108055531.2176793-1-dominique.martinet@atmark-techno.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hello,


A couple of questions with this patch (hence status as RFC), first for
the dt bindings part:
 - I have no idea what to do with the compatible name.
I am not affiliated with nxp (except as a customer), so I'm not entierly
comfortable just adding a new property in the nxp, namespace.
The h4 protocol is very generic and I'd think a name such as
'hci-h4,generic' make more sense as other boards would be able to
benefit from it without extra modifications... But that doesn't seem to
be how things are done with dt bindings, so can I just add an arbitrary
name?
 - I've set Marcel (who maintains the hci_h4 driver) as maintainer of
he dt-bindings unilaterally without asking him for lack of a better
idea: Marcel, are you ok with that? My first idea was making it myself
but I don't really feel competent for this.

Second for the driver itself:
 - I've just monkeyed the simplest serdev support I could come up with
and it appears to work (I'm trying to replace the following command:
btattach -B /dev/ttymxc0 -S 3000000 -P h4); perhaps there are other
settings you'd want?
I've also tried suspend and with no handler it appears to work with
an idle controller, but I'd assume we might want some pm handling at
some point if possible... Right now this is no worse than btattach,
but unlike btattach it's not easy to restart (unbind/bind the driver?)
so that might come up sooner or later; will be happy to look then.


I confirmed this works with the following dts fragment over
imx8mp.dtsi, on a board with the AW-XM458 NXP wireless+BT module.

--8<------
&uart1 {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_uart1>;
        assigned-clocks = <&clk IMX8MP_CLK_UART1>;
        assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
        status = "okay";
        fsl,dte-mode = <1>;
        fsl,uart-has-rtscts;

        bluetooth {
                compatible = "nxp,aw-xm458-bt";
                max-speed = <3000000>;
        };
};

&iomuxc {
        pinctrl_uart1: uart1grp {
                fsl,pins = <
                        MX8MP_IOMUXC_UART1_RXD__UART1_DTE_TX    0x140
                        MX8MP_IOMUXC_UART1_TXD__UART1_DTE_RX    0x140
                        MX8MP_IOMUXC_UART3_RXD__UART1_DTE_RTS   0x140
                        MX8MP_IOMUXC_UART3_TXD__UART1_DTE_CTS   0x140
                >;
        };
}
--8<------


Dominique Martinet (2):
  dt-bindings: net: h4-bluetooth: add new bindings for hci_h4
  bluetooth/hci_h4: add serdev support

 .../devicetree/bindings/net/h4-bluetooth.yaml | 49 ++++++++++++++
 drivers/bluetooth/Kconfig                     |  1 +
 drivers/bluetooth/hci_h4.c                    | 64 +++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/h4-bluetooth.yaml

-- 
2.35.1


