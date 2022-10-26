Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F3DA60DA00
	for <lists+linux-bluetooth@lfdr.de>; Wed, 26 Oct 2022 05:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbiJZDmO (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 25 Oct 2022 23:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbiJZDmN (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 25 Oct 2022 23:42:13 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37C258DE3
        for <linux-bluetooth@vger.kernel.org>; Tue, 25 Oct 2022 20:42:12 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29Q2uomH024910;
        Wed, 26 Oct 2022 03:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cw6RNpuTO4BA6ETgN4ZjPeHemBKnEVyZbg59gFCSU+0=;
 b=HHcLTpw1KPrKYl4SJ01p8KoT8P4ta+Ywhbg3iieluCmKaj6FpAsoWqhnYpuUgal1e06A
 bgMWSe9/XJKYQaplIJnhuMPkm5pUKfvEdeMT1Kyg4aCSuMDU6WQl+kk/b/nunETJvY8p
 zG9tF5Pd0p3q9m+ph307HurkkH4VCu2/FGyXBxjTXVjh6s+1QiqrkRmDF4zcVJFTa4c+
 uJar8hcejKU2fgQJIst9mWLWFwEjnYw9+lJG1UNPZA6uEn6Z2mcPnQkF1Uv3P8asO/sA
 uVFHu5sX5NR64isAgo87Yzd+5O0zYC+Izfojv3i7dhuh6bajPZvQX9YgrUzOymKkqVeM Hw== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kevbr83kn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Oct 2022 03:41:52 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29Q3fpiw022698
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 26 Oct 2022 03:41:52 GMT
Received: from [10.253.33.29] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 25 Oct
 2022 20:41:50 -0700
Message-ID: <e88e7e6a-53bd-e621-08ea-d264bbd8665e@quicinc.com>
Date:   Wed, 26 Oct 2022 11:41:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Regression] Cambridge Silicon Radio, Ltd Bluetooth Dongle
 unusable again with kernel 6.0
Content-Language: en-US
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jack <ostroffjh@users.sourceforge.net>
CC:     <linux-bluetooth@vger.kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>
References: <ab082d3c-9ba6-b1bd-a895-65ea58cec926@molgen.mpg.de>
 <O224FXKX.42565NIW.L5YD2R5Q@C37RPHFZ.QBNZTYLX.ESJXSIHV>
 <CABBYNZKWc13qGDOyhPZ9wZcTaK+Wg0LUycsKX58w7wEjTaGS=A@mail.gmail.com>
From:   quic_zijuhu <quic_zijuhu@quicinc.com>
In-Reply-To: <CABBYNZKWc13qGDOyhPZ9wZcTaK+Wg0LUycsKX58w7wEjTaGS=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lw4SHITeVDbNFSjkgZBJeiW6YE8qvwwB
X-Proofpoint-GUID: lw4SHITeVDbNFSjkgZBJeiW6YE8qvwwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_15,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1011 malwarescore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 adultscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210260018
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On 10/26/2022 3:38 AM, Luiz Augusto von Dentz wrote:
> Hi Zijun,
> 
> On Tue, Oct 25, 2022 at 11:08 AM Jack <ostroffjh@users.sourceforge.net> wrote:
>>
>> On 2022.10.25 03:02, Paul Menzel wrote:
>>> Thank you for your work on this driver.
>>>
>>> Am 24.10.22 um 23:11 schrieb Jack:
>>>> Cheap USB BT dongles that are bad clones of CSR  "ID 0a12:0001
>>>> Cambridge Silicon Radio, Ltd Bluetooth Dongle (HCI mode)" have had
>>>> historic problems, due to various bad behaviors.  See [Bug 60824]
>>>> [PATCH][regression] Cambridge Silicon Radio, Ltd Bluetooth Dongle
>>>> unusable (https://bugzilla.kernel.org/show_bug.cgi) for more details
>>>> and background.  The patch in that bug was initially mainlined in
>>>> 5.9, and underwent several revisions since then.  It has continued
>>>> to work through all of the 5.19 series, but it does not work with
>>>> any of the 6.0 kernels.
>>>>
>>>> I have made three unsuccessful attempts to git bisect using vanilla
>>>> sources.  All settled on totally irrelevant commits.  These have all
>>>> used v6.0-rc1 and v5.19 as the starting bad and good commits.
>>>
>> Before receiving your reply, I made another start at bisect
>>
>> # bad: [5030a9a03f0107f645772450bcba521b2ec19a51] dt-bindings: net:
>> fsl,fec: Add nvmem-cells / nvmem-cell-names properties
>> # good: [8a958732818bc27f7da4d41ecf2c5c99d9aa8b0e] tls: rx: factor out
>> device darg update
>> git bisect start '5030a9a03f0107f645772450bcba521b2ec19a51'
>> '8a958732818bc27f7da4d41ecf2c5c99d9aa8b0e'
>> # good: [7ca433dc6dedb2ec98dfc943f6db0c9b8996ed11] Merge tag
>> 'net-5.19-rc8' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
>> git bisect good 7ca433dc6dedb2ec98dfc943f6db0c9b8996ed11
>> # bad: [e168f690087735ad12604ee6ee2db1b93e323072] Bluetooth: btusb:
>> Remove HCI_QUIRK_BROKEN_ERR_DATA_REPORTING for fake CSR
>> git bisect bad e168f690087735ad12604ee6ee2db1b93e323072
>> # good: [5fb859f79f4f49d9df16bac2b3a84a6fa3aaccf1] net: ipa: initialize
>> ring indexes to 0
>> git bisect good 5fb859f79f4f49d9df16bac2b3a84a6fa3aaccf1
>> # good: [ec2ea5e06c67f85c6541a74b661722a176be086f] net: ipa: list
>> supported IPA versions in the Makefile
>> git bisect good ec2ea5e06c67f85c6541a74b661722a176be086f
>> # good: [df332800a914e9fd97b83aa63832979227fd8a8d] Bluetooth:
>> btmtksdio: Add in-band wakeup support
>> git bisect good df332800a914e9fd97b83aa63832979227fd8a8d
>> # good: [6f43f6169a8229bb6ddbf483d3be760d48c4cdd1] Bluetooth: clean up
>> error pointer checking
>> git bisect good 6f43f6169a8229bb6ddbf483d3be760d48c4cdd1
>> # good: [46459cb6d4e63066e227a496ae8af35ba8c0b23b] Bluetooth: hci_bcm:
>> Increase host baudrate for CYW55572 in autobaud mode
>> git bisect good 46459cb6d4e63066e227a496ae8af35ba8c0b23b
>> # good: [0feb8af0275d196a29e321bedc15319673923cb6] Bluetooth: hci_sync:
>> Correct hci_set_event_mask_page_2_sync() event mask
>> git bisect good 0feb8af0275d196a29e321bedc15319673923cb6
>> # bad: [1172c59f451f524a14bac5e7b047781883dfe441] Bluetooth: btusb:
>> Remove HCI_QUIRK_BROKEN_ERR_DATA_REPORTING for QCA
>> git bisect bad 1172c59f451f524a14bac5e7b047781883dfe441
>> # bad: [766ae2422b4312a73510ebee9266bc23b466fbbb] Bluetooth: hci_sync:
>> Check LMP feature bit instead of quirk
>> git bisect bad 766ae2422b4312a73510ebee9266bc23b466fbbb
>> # first bad commit: [766ae2422b4312a73510ebee9266bc23b466fbbb]
>> Bluetooth: hci_sync: Check LMP feature bit instead of quirk
>>
>> And 766ae2422b4312a73510ebee9266bc23b466fbbb does make sense as a
>> likely culprit.
> 
> Looks like we will need to reintroduce the quirk then since it appears
> the LMP feature bit is probably set in those controllers but the
> command doesn't work.
> 
no, that issue is not caused by my change
it is below HCI command error which is not related the quirk HCI_QUIRK_BROKEN_ERR_DATA_REPORTING

< HCI Command: Set Event Filter (0x03|0x0005) plen 1                                                                                                     #23 [hci0] 5.316838
        Type: Clear All Filters (0x00)
> HCI Event: Command Complete (0x0e) plen 4                                    
>                                                                          #24
> [hci0] 5.319751

      Set Event Filter (0x03|0x0005) ncmd 1
        Status: Invalid HCI Command Parameters (0x12)
= Close Index: 00:1A:7D:xx:xx:xx

