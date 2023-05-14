Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C01F6701C50
	for <lists+linux-bluetooth@lfdr.de>; Sun, 14 May 2023 10:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233472AbjENIXk (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 14 May 2023 04:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjENIXj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 14 May 2023 04:23:39 -0400
X-Greylist: delayed 450 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 14 May 2023 01:23:37 PDT
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr [80.12.242.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E46CC2695
        for <linux-bluetooth@vger.kernel.org>; Sun, 14 May 2023 01:23:37 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id y6tYpOnp4dpXhy6tZp4n4h; Sun, 14 May 2023 10:16:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
        s=t20230301; t=1684052165;
        bh=4hFFeqPXqTe2K+rdcjFE71gFVWIwUnHzejXdFndsrDo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=r742Qch4D+aLBn51bLBEzRT0W2Ydrxn3ALC7GAZ4Mn6zLXAVmrXZWI6n13U73YyTk
         V0eHc3eYbXn0lKC/kjUZK+uyjGixq40J6wxISll3pXJFRw3mksbpCeGr82gaFQN/u5
         3rYlW/rnSq4LXttCIwtX6prnrav6D1tlzo+Q+zd5eWOT8z4BlZceqvi+gKFMcqrZVv
         5hzWEtJcKGOAA0E+zt1N2m/y0aBFnEt7LoTa8EL3NLJBN68QYX4hMcsABvOb3nHVuP
         QFOa7HltKB+eeY9mr+cYhLZ5fuQOllgtoWH5CFFCCQfuXn5uF0xSA7h4yLqrKNh4n3
         N9a+angtE816w==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 May 2023 10:16:05 +0200
X-ME-IP: 86.243.2.178
Message-ID: <b39161bb-5ebd-89b8-dc25-df05f0304a8f@wanadoo.fr>
Date:   Sun, 14 May 2023 10:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] Bluetooth: btrtl: Add support for RTL8822BS UART
To:     rudi@heitbaum.com
Cc:     alistair@alistair23.me, anarsoul@gmail.com, conor+dt@kernel.org,
        davem@davemloft.net, devicetree@vger.kernel.org,
        edumazet@google.com, jernej.skrabec@gmail.com,
        johan.hedberg@gmail.com, krzysztof.kozlowski+dt@linaro.org,
        kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, luiz.dentz@gmail.com,
        marcel@holtmann.org, netdev@vger.kernel.org, pabeni@redhat.com,
        robh+dt@kernel.org, samuel@sholland.org, wens@csie.org
References: <20230514074731.70614-1-rudi@heitbaum.com>
 <20230514074731.70614-3-rudi@heitbaum.com>
Content-Language: fr
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230514074731.70614-3-rudi@heitbaum.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Le 14/05/2023 à 09:47, Rudi Heitbaum a écrit :
> Add a RTL8822BS UART with hci_ver = 0x07. This is similar to RTL8822CS
> observed on the Tanix TX6 Android set-top box. But the previous
> generation of chip. The RTL8822BS requires the
> BROKEN_LOCAL_EXT_FEATURES_PAGE_2 quirk.
> 
> Signed-off-by: Rudi Heitbaum <rudi-8t6dWLoy+3lWk0Htik3J/w@public.gmane.org>
> ---
>   drivers/bluetooth/btrtl.c  | 12 +++++++++++-
>   drivers/bluetooth/hci_h5.c |  6 ++++++
>   2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
> index 2915c82d719d..b53a4ef88550 100644
> --- a/drivers/bluetooth/btrtl.c
> +++ b/drivers/bluetooth/btrtl.c
> @@ -234,7 +234,15 @@ static const struct id_table ic_id_table[] = {
>   	  .fw_name  = "rtl_bt/rtl8822cu_fw.bin",
>   	  .cfg_name = "rtl_bt/rtl8822cu_config" },
>   
> -	/* 8822B */
> +	/* 8822BS with UART interface */
> +	{ IC_INFO(RTL_ROM_LMP_8822B, 0xb, 0x7, HCI_UART),
> +	  .config_needed = true,
> +	  .has_rom_version = true,
> +	  .has_msft_ext = true,
> +	  .fw_name  = "rtl_bt/rtl8822bs_fw.bin",
> +	  .cfg_name = "rtl_bt/rtl8822bs_config" },
> +
> +	/* 8822BU with USB interface */
>   	{ IC_INFO(RTL_ROM_LMP_8822B, 0xb, 0x7, HCI_USB),
>   	  .config_needed = true,
>   	  .has_rom_version = true,
> @@ -1182,6 +1190,8 @@ void btrtl_set_quirks(struct hci_dev *hdev, struct btrtl_device_info *btrtl_dev)
>   
>   		hci_set_aosp_capable(hdev);
>   		break;
> +	case CHIP_ID_8822B:
> +		set_bit(HCI_QUIRK_BROKEN_LOCAL_EXT_FEATURES_PAGE_2, &hdev->quirks);

break missing?
If it is intentinal, a "fallthrough;" would be more explicit.

just my 2c,

CJ

>   	default:
>   		rtl_dev_dbg(hdev, "Central-peripheral role not enabled.");
>   		rtl_dev_dbg(hdev, "WBS supported not enabled.");
> diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
> index fefc37b98b4a..726b6c7e28b8 100644
> --- a/drivers/bluetooth/hci_h5.c
> +++ b/drivers/bluetooth/hci_h5.c
> @@ -1072,6 +1072,10 @@ static struct h5_vnd rtl_vnd = {
>   	.acpi_gpio_map	= acpi_btrtl_gpios,
>   };
>   
> +static const struct h5_device_data h5_data_rtl8822bs = {
> +	.vnd = &rtl_vnd,
> +};
> +
>   static const struct h5_device_data h5_data_rtl8822cs = {
>   	.vnd = &rtl_vnd,
>   };
> @@ -1100,6 +1104,8 @@ static const struct dev_pm_ops h5_serdev_pm_ops = {
>   
>   static const struct of_device_id rtl_bluetooth_of_match[] = {
>   #ifdef CONFIG_BT_HCIUART_RTL
> +	{ .compatible = "realtek,rtl8822bs-bt",
> +	  .data = (const void *)&h5_data_rtl8822bs },
>   	{ .compatible = "realtek,rtl8822cs-bt",
>   	  .data = (const void *)&h5_data_rtl8822cs },
>   	{ .compatible = "realtek,rtl8723bs-bt",

