Return-Path: <linux-bluetooth+bounces-9428-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 969AE9F6010
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Dec 2024 09:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBA8816C92B
	for <lists+linux-bluetooth@lfdr.de>; Wed, 18 Dec 2024 08:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5576E17E46E;
	Wed, 18 Dec 2024 08:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F6k8uQw/"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F12155303;
	Wed, 18 Dec 2024 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734510207; cv=none; b=STs9cg7Rc0ObYKtjvGDeFMh5TQlhzdYCA43/6EsoIZ6M77goxbJvZ/fpUL3MgdDYPaVZn2PzNzIUGAc/nfUpad97otXw6/FhRlfmMHoMXDF5+t5UDcDP4DoDKe3ZQyRldXPgXoXoUvYKaGyWtpD4WITC5ru/izQolGg8dJNV1pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734510207; c=relaxed/simple;
	bh=ph/0W8omgEAtWlWkYgHwoIANyY0laHftBeKehS1TLFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nawk2qBxSdd4aVSchpiCygkOxTXLfIexuCJnEX5vKb1WDu76+4Kz81yiFVO+A6MzuGgoFsOoDCMl/KGNmoay4aUok+8C+UvxzThDAf2x5CcEaBEw0wUl+xLYbOfSqe6J9lxrzeH9UgMXFXJpA+HSdfG8AAlmMZf8KgAl01870Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F6k8uQw/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI85fx7008854;
	Wed, 18 Dec 2024 08:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FRUGo2gNadzNeoMgpCJnve4JmJ+pqxC1Zhk3rBgHLYc=; b=F6k8uQw/zBeKQx/I
	fJMcSM5R4EoVvN9m05QNcu4vY9dwbKmTxr1BJLpiwR+08oHXfkTsP++p8X5/1tvQ
	N6X9kA1X6YQxWQ9AEhVzKBoYvhwgXrLV3iRDBB91wW2LeBF95dpqQsGr8zmiigLz
	NlQXIuST90Mz95e/cGC/Aa8CDZvd285T0ivKR+dY7io/uZ3RcGDXKUJ6iEMeumi2
	p/SN5SQt6oZBRHEw4eFJXPsU/rUEba2IfciFw+8UVqZAt1cpI/+AlpuTUx6LKcQu
	WHOdnnNGkciUiOO1YydtJrs0Lzl5tr8JytSTD8JbDJ+8/frN79LqSlFP0o950+h3
	BOAKmg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ktk2g1am-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 08:23:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BI8N1jV010757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 08:23:01 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 00:22:57 -0800
Message-ID: <d776ec24-75d3-44b8-bdf3-f7b1c221ecc2@quicinc.com>
Date: Wed, 18 Dec 2024 16:22:53 +0800
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: hci_sync: Fix disconnect complete event
 timeout issue
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg
	<johan.hedberg@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, <linux-bluetooth@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jiaymao@quicinc.com>, <quic_shuaz@quicinc.com>,
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20241216080758.3450976-1-quic_chejiang@quicinc.com>
 <CABBYNZLRdu_f9eNEapPp5mNqgcUE0jby5VPpaMaArY_FjyjB8Q@mail.gmail.com>
 <CABBYNZKPu20vHx3DMGXVobR_5t-WUgt-KX41+tA1Lrz+aDFY-Q@mail.gmail.com>
 <bb9505d6-e8ae-47dc-a1e0-6d1974dc12ac@quicinc.com>
 <CABBYNZJuic=HfeF1-ybuKELCOEOYk9OWtvqXC4vyrnnZLUp7RQ@mail.gmail.com>
 <ae3a0f6d-c844-4874-acf4-03a4f9cf3a24@quicinc.com>
 <CABBYNZJcHvVYBUmS6AeA6OGnV8n1EKh5JxB8aLqP9OBqA-amyg@mail.gmail.com>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <CABBYNZJcHvVYBUmS6AeA6OGnV8n1EKh5JxB8aLqP9OBqA-amyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JVRoFAHm-vvzHNP5KkMDlyWypoWFins7
X-Proofpoint-ORIG-GUID: JVRoFAHm-vvzHNP5KkMDlyWypoWFins7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180066

Hi Luiz,

On 12/17/2024 11:13 PM, Luiz Augusto von Dentz wrote:
> Hi Cheng,
> 
> On Tue, Dec 17, 2024 at 12:51 AM Cheng Jiang (IOE)
> <quic_chejiang@quicinc.com> wrote:
>>
>> Hi Luiz,
>>
>> On 12/17/2024 11:15 AM, Luiz Augusto von Dentz wrote:
>>> Hi Cheng,
>>>
>>> On Mon, Dec 16, 2024 at 9:49 PM Cheng Jiang (IOE)
>>> <quic_chejiang@quicinc.com> wrote:
>>>>
>>>> Hi Luiz,
>>>>
>>>> On 12/16/2024 10:42 PM, Luiz Augusto von Dentz wrote:
>>>>> Hi Cheng,
>>>>>
>>>>> On Mon, Dec 16, 2024 at 9:32 AM Luiz Augusto von Dentz
>>>>> <luiz.dentz@gmail.com> wrote:
>>>>>>
>>>>>> Hi Cheng,
>>>>>>
>>>>>> On Mon, Dec 16, 2024 at 3:08 AM Cheng Jiang <quic_chejiang@quicinc.com> wrote:
>>>>>>>
>>>>>>> Sometimes, the remote device doesn't acknowledge the LL_TERMINATE_IND
>>>>>>> in time, requiring the controller to wait for the supervision timeout,
>>>>>>> which may exceed 2 seconds. In the current implementation, the
>>>>>>> HCI_EV_DISCONN_COMPLETE event is ignored if it arrives late, since
>>>>>>> the hci_abort_conn_sync has cleaned up the connection after 2 seconds.
>>>>>>> This causes the mgmt to get stuck, resulting in bluetoothd waiting
>>>>>>> indefinitely for the mgmt response to the disconnect. To recover,
>>>>>>> restarting bluetoothd is necessary.
>>>>>>>
>>>>>>> bluetoothctl log like this:
>>>>>>> [Designer Mouse]# disconnect D9:B5:6C:F2:51:91
>>>>>>> Attempting to disconnect from D9:B5:6C:F2:51:91
>>>>>>> [Designer Mouse]#
>>>>>>> [Designer Mouse]# power off
>>>>>>> [Designer Mouse]#
>>>>>>> Failed to set power off: org.freedesktop.DBus.Error.NoReply.
>>>>>>>
>>>>>>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>>>>>>> ---
>>>>>>>  include/net/bluetooth/hci_core.h |  2 ++
>>>>>>>  net/bluetooth/hci_conn.c         |  9 +++++++++
>>>>>>>  net/bluetooth/hci_event.c        |  9 +++++++++
>>>>>>>  net/bluetooth/hci_sync.c         | 18 ++++++++++++++++++
>>>>>>>  4 files changed, 38 insertions(+)
>>>>>>>
>>>>>>> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
>>>>>>> index 734cd50cd..2ab079dcf 100644
>>>>>>> --- a/include/net/bluetooth/hci_core.h
>>>>>>> +++ b/include/net/bluetooth/hci_core.h
>>>>>>> @@ -753,6 +753,8 @@ struct hci_conn {
>>>>>>>
>>>>>>>         struct bt_codec codec;
>>>>>>>
>>>>>>> +       struct completion disc_ev_comp;
>>>>>>> +
>>>>>>>         void (*connect_cfm_cb)  (struct hci_conn *conn, u8 status);
>>>>>>>         void (*security_cfm_cb) (struct hci_conn *conn, u8 status);
>>>>>>>         void (*disconn_cfm_cb)  (struct hci_conn *conn, u8 reason);
>>>>>>> diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
>>>>>>> index d097e308a..e0244e191 100644
>>>>>>> --- a/net/bluetooth/hci_conn.c
>>>>>>> +++ b/net/bluetooth/hci_conn.c
>>>>>>> @@ -1028,6 +1028,15 @@ static struct hci_conn *__hci_conn_add(struct hci_dev *hdev, int type, bdaddr_t
>>>>>>>
>>>>>>>         hci_conn_init_sysfs(conn);
>>>>>>>
>>>>>>> +       /* This disc_ev_comp is inited when we send a disconnect request to
>>>>>>> +        * the remote device but fail to receive the disconnect complete
>>>>>>> +        * event within the expected time (2 seconds). This occurs because
>>>>>>> +        * the remote device doesn't ack the terminate indication, forcing
>>>>>>> +        * the controller to wait for the supervision timeout.
>>>>>>> +        */
>>>>>>> +       init_completion(&conn->disc_ev_comp);
>>>>>>> +       complete(&conn->disc_ev_comp);
>>>>>>> +
>>>>>>>         return conn;
>>>>>>>  }
>>>>>>>
>>>>>>> diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
>>>>>>> index 2cc7a9306..60ecb2b18 100644
>>>>>>> --- a/net/bluetooth/hci_event.c
>>>>>>> +++ b/net/bluetooth/hci_event.c
>>>>>>> @@ -3366,6 +3366,15 @@ static void hci_disconn_complete_evt(struct hci_dev *hdev, void *data,
>>>>>>>         if (!conn)
>>>>>>>                 goto unlock;
>>>>>>>
>>>>>>> +       /* Wake up disc_ev_comp here is ok. Since we hold the hdev lock
>>>>>>> +        * hci_abort_conn_sync will wait hdev lock release to continue.
>>>>>>> +        */
>>>>>>> +       if (!completion_done(&conn->disc_ev_comp)) {
>>>>>>> +               complete(&conn->disc_ev_comp);
>>>>>>> +               /* Add some delay for hci_abort_conn_sync to handle the complete */
>>>>>>> +               usleep_range(100, 1000);
>>>>>>> +       }
>>>>>>> +
>>>>>>>         if (ev->status) {
>>>>>>>                 mgmt_disconnect_failed(hdev, &conn->dst, conn->type,
>>>>>>>                                        conn->dst_type, ev->status);
>>>>>>> diff --git a/net/bluetooth/hci_sync.c b/net/bluetooth/hci_sync.c
>>>>>>> index 0badec712..783d04b57 100644
>>>>>>> --- a/net/bluetooth/hci_sync.c
>>>>>>> +++ b/net/bluetooth/hci_sync.c
>>>>>>> @@ -5590,6 +5590,24 @@ int hci_abort_conn_sync(struct hci_dev *hdev, struct hci_conn *conn, u8 reason)
>>>>>>>                 break;
>>>>>>>         }
>>>>>>>
>>>>>>> +       /* Check whether the connection is successfully disconnected.
>>>>>>> +        * Sometimes the remote device doesn't acknowledge the
>>>>>>> +        * LL_TERMINATE_IND in time, requiring the controller to wait
>>>>>>> +        * for the supervision timeout, which may exceed 2 seconds. In
>>>>>>> +        * this case, we need to wait for the HCI_EV_DISCONN_COMPLETE
>>>>>>> +        * event before cleaning up the connection.
>>>>>>> +        */
>>>>>>> +       if (err == -ETIMEDOUT) {
>>>>>>> +               u32 idle_delay = msecs_to_jiffies(10 * conn->le_supv_timeout);
>>>>>>> +
>>>>>>> +               reinit_completion(&conn->disc_ev_comp);
>>>>>>> +               if (!wait_for_completion_timeout(&conn->disc_ev_comp, idle_delay)) {
>>>>>>> +                       bt_dev_warn(hdev, "Failed to get complete");
>>>>>>> +                       mgmt_disconnect_failed(hdev, &conn->dst, conn->type,
>>>>>>> +                                              conn->dst_type, conn->abort_reason);
>>>>>>> +               }
>>>>>>> +       }
>>>>>>
>>>>>> Why don't we just set the supervision timeout as timeout then? If we
>>>>>> will have to wait for it anyway just change hci_disconnect_sync to use
>>>>>> 10 * conn->le_supv_timeout as timeout instead.
>>>>>>
>>>> hci_disconnect_sync uses __hci_cmd_sync_status_sk to wait for the
>>>> HCI_EV_DISCONN_COMPLETE event, which will send the command in hci_cmd_work.
>>>> In hci_cmd_work, it will start a timer with HCI_CMD_TIMEOUT(2s) to wait
>>>> for the event. So even in hci_disconnect_sync we can set the timeout to
>>>> supervision timeout, hci_disconnect_sync still timeout after 2s.
>>>
>>> Wait, why are you talking about HCI_CMD_TIMEOUT when I told you to use
>>> the supervision timeout instead? If it still timeout after to 2
>>> seconds then there is something still forcing HCI_CMD_TIMEOUT which
>>> shouldn't happen.
>>>
>> Since the lower layer (hci_cmd_work) has set the timeout to HCI_CMD_TIMEOUT, so
>> even the upper layer set to a larger timeout value, like supervision timeout,
>> it still get the timeout after HCI_CMD_TIMEOUT. The timeout flow is:
>> hci_disconnect_sync -> __hci_cmd_sync_sk(wait_event_interruptible_timeout) ->
>> hci_cmd_work -> hci_cmd_timeout -> hci_cmd_sync_cancel_sync -> wake up the
>> wait_event_interruptible_timeout in __hci_cmd_sync_sk -> hci_disconnect_sync timeout.
>>
>> So even if we set a large timeout value in hci_disconnect_sync, it doesn't work
>> since it's waked up by other event, not the real timeout.
>>
>> What's more, in the hci_disconnect_sync, if the reason it not power_off, it waits
>> for the disconnect complete event rather than command status event. According to
>> BT core spec, disconnect complete event has to wait for remote's ack or wait until
>> supervision timeout. It's a valid case that the disconnect complete event taking
>> more than 2s.
> 
> You seems to be confusing the role of 2 different timers:
> 
>     err = wait_event_interruptible_timeout(hdev->req_wait_q,
>                            hdev->req_status != HCI_REQ_PEND,
>                            timeout);
> 
> and
> 
>             queue_delayed_work(hdev->workqueue, &hdev->cmd_timer,
>                        HCI_CMD_TIMEOUT);
> 
> The former waits for a specific event, while the later waits for
> handle_cmd_cnt_and_timer, each can have a distinct timeout as in the
> code bellow:
> 
>     return __hci_cmd_sync_status_sk(hdev, HCI_OP_LE_EXT_CREATE_CONN,
>                     plen, data,
>                     HCI_EV_LE_ENHANCED_CONN_COMPLETE,
>                     conn->conn_timeout, NULL);
> 
> The reason there are 2 timers is that we need to track the number of
> commands outstanding in the controller, and no you can't delay Command
> Status:
> 
> When the Controller receives the HCI_Disconnect command, it _shall_ send the
> HCI_Command_Status event to the Host.
> 
> So even if HCI_Disconnection_Complete is delayed the following shall
> still work provided the HCI_Command_Status is still being generated
> accordingly:
> 
> index 0badec7120ab..0ab607fb6433 100644
> --- a/net/bluetooth/hci_sync.c
> +++ b/net/bluetooth/hci_sync.c
> @@ -5444,7 +5444,7 @@ static int hci_disconnect_sync(struct hci_dev
> *hdev, struct hci_conn *conn,
>                 return __hci_cmd_sync_status_sk(hdev, HCI_OP_DISCONNECT,
>                                                 sizeof(cp), &cp,
>                                                 HCI_EV_DISCONN_COMPLETE,
> -                                               HCI_CMD_TIMEOUT, NULL);
> +                                               conn->disc_timeout, NULL);
> 
>         return __hci_cmd_sync_status(hdev, HCI_OP_DISCONNECT, sizeof(cp), &cp,
>                                      HCI_CMD_TIMEOUT);
> 
> Then we need to adjust conn->disc_timeout according to supervision
> timeout, that said it appears disc_timeout is actually acting as idle
> timeout, so perhaps we need a separate field, also it doesn't look
> like we track the supervision timeout for non-LE links.
> 
Yes, you are right. I mixed up the two timers. Thank you for the detail
explanation. 
I just found you have fixed this issue by 227a0cdf4a028a73dc256d0f5144b4808d718893.
Link: https://github.com/bluez/bluez/issues/932

We are using an old codebase. Sorry for this. 

BTW, do you think we should change the timeout value here? Set the timeout value 
based on the link type.  

@@ -5419,6 +5419,7 @@ static int hci_disconnect_sync(struct hci_dev *hdev, struct hci_conn *conn,
                               u8 reason)
 {
        struct hci_cp_disconnect cp;
+       u32 disc_timeout;

        if (test_bit(HCI_CONN_BIG_CREATED, &conn->flags)) {
                /* This is a BIS connection, hci_conn_del will
@@ -5440,11 +5441,18 @@ static int hci_disconnect_sync(struct hci_dev *hdev, struct hci_conn *conn,
         * used when suspending or powering off, where we don't want to wait
         * for the peer's response.
         */
-       if (reason != HCI_ERROR_REMOTE_POWER_OFF)
+
+       if (reason != HCI_ERROR_REMOTE_POWER_OFF) {
+               if (conn->type == LE_LINK)
+                       disc_timeout = msecs_to_jiffies(10 * conn->le_supv_timeout);
+               else
+                       disc_timeout = conn->disc_timeout;
+
                return __hci_cmd_sync_status_sk(hdev, HCI_OP_DISCONNECT,
                                                sizeof(cp), &cp,
                                                HCI_EV_DISCONN_COMPLETE,
-                                               HCI_CMD_TIMEOUT, NULL);
+                                               disc_timeout, NULL);
+       }


>>>>>> That said, we really need to fix bluetoothd if it is not able to be
>>>>>> cleaned up if SET_POWERED command fails, but it looks like it is
>>>>>> handling errors correctly so it sounds like something else is at play.
>>>>>
>>>> The issue arises after a 2-second timeout of hci_disconnect_sync. During
>>>> hci_abort_conn_sync, the connection is cleaned up by hci_conn_failed.
>>>> after supervision timeout, the disconnect complete event arrives, but
>>>> it returns at line 3370 since the connection has already been removed.
>>>> As a result, bluetoothd does not send the mgmt event for MGMT_OP_DISCONNECT
>>>> to the application layer (bluetoothctl), causing bluetoothctl to get stuck
>>>> and unable to perform other mgmt commands.
>>>
>>> The command shall have completed regardless if disconnect complete has
>>> been received or not, the is the whole point of having a timeout, so
>>> this makes no sense to me, or you are not describing what is happening
>>> here. Also there is no MGMT_OP_DISCONNECT pending, it is
>>> MGMT_OP_SET_POWERED, if you are talking about the DISCONNECTED event
>>> that is a totally different thing and perhaps that is the source of
>>> the problem because if we do cleanup hci_conn even in case the command
>>> fails/times out then we should be generating a disconnected event as
>>> well.
>>>
>> Here is the flow describe the issue. For normal case:
>> ┌───────────┐          ┌──────────┐           ┌──────┐           ┌──────────┐           ┌──────┐
>> │bluetootctl│          │bluetoothd│           │kernel│           │controller│           │remote│
>> └─────┬─────┘          └─────┬────┘           └───┬──┘           └─────┬────┘           └───┬──┘
>>       │   disconnect cmd     │                    │                    │                    │
>>       │─────────────────────>│                    │                    │                    │
>>       │                      │                    │                    │                    │
>>       │                      │    MGMT_OP         │                    │                    │
>>       │                      │    _DISCONNECT     │                    │                    │
>>       │                      │───────────────────>│                    │                    │
>>       │                      │                    │                    │                    │
>>       │                      │                    │  HCI_Disconnect    │                    │
>>       │                      │                    │───────────────────>│                    │
>>       │                      │                    │                    │                    │
>>       │                      │                    │                    │   LL_TERMINATE     │
>>       │                      │                    │                    │   _IND             │
>>       │                      │                    │                    │───────────────────>│
>>       │                      │                    │                    │                    │
>>       │                      │                    │                    │        ACK         │
>>       │                      │                    │                    │<───────────────────│
>>       │                      │                    │                    │                    │
>>       │                      │                    │   Disc_Comp_Evt    │                    │
>>       │                      │                    │<───────────────────│                    │
>>       │                      │                    │                    │                    │
>>       │                      │   MGMT Response    │                    │                    │
>>       │                      │<───────────────────│                    │                    │
>>       │                      │                    │                    │                    │
>>       │      disc succ       │                    │                    │                    │
>>       │<─────────────────────│                    │                    │                    │
>> ┌─────┴─────┐          ┌─────┴────┐           ┌───┴──┐           ┌─────┴────┐           ┌───┴──┐
>> │bluetootctl│          │bluetoothd│           │kernel│           │controller│           │remote│
>> └───────────┘          └──────────┘           └──────┘           └──────────┘           └──────┘
>>
>>
>> The failure case like this:
>>
>> ┌───────────┐          ┌──────────┐           ┌──────┐            ┌──────────┐           ┌──────┐
>> │bluetootctl│          │bluetoothd│           │kernel│            │controller│           │remote│
>> └─────┬─────┘          └─────┬────┘           └───┬──┘            └─────┬────┘           └───┬──┘
>>       │     disconnect       │                    │                     │                    │
>>       │     cmd              │                    │                     │                    │
>>       │─────────────────────>│                    │                     │                    │
>>       │                      │                    │                     │                    │
>>       │                      │    MGMT_OP_        │                     │                    │
>>       │                      │    DISCONNECT      │                     │                    │
>>       │                      │───────────────────>│                     │                    │
>>       │                      │                    │                     │                    │
>>       │                      │                   ┌┴┐     HCI_           │                    │
>>       │                      │                   │ │     Disconnect     │                    │
>>       │                      │                   │ │ ──────────────────>│                    │
>>       │                      │                   │ │                    │                    │
>>       │                      │                   │ │                    │  LL_TERMINATE     ┌┴┐
>>       │                      │                   │ │                    │  _IND             │ │
>>       │                      │                   │ │                    │─────────────────> │ │
>>       │                      │                   │ │                    │                   │ │
>>       │                      │                   │ │ 2s                 │                   │ │
>>       │                      │                   │ │                    │                   │ │
>>       │                      │                   │ │                    │                   │ │ More
>>       │                      │                   │ │                    │                   │ │ than
>>       │                      │                   │ │                    │                   │ │ 2s
>>       │                      │                   │ │                    │                   │ │
>>       │                      │                   │ │                    │                   │ │
>>       │                      │                   │ │                    │                   │ │
>>       │                      │                   └┬┘                    │                   │ │
>>       │                      │                    │────┐                │                   │ │
>>       │                      │                    │    │ hci_disconnect │                   │ │
>>       │                      │                    │<───┘ sync timeout,  │                   │ │
>>       │                      │                    │      del 'con' by   │                   │ │
>>       │                      │                    │      hci_conn_failed│                   │ │
>>       │                      │                    │                     │                   └┬┘
>>       │                      │                    │                     │        ACK         │
>>       │                      │                    │                     │<───────────────────│
>>       │                      │                    │                     │                    │
>>       │                      │                    │   Disc_Comp_Evt     │                    │
>>       │                      │                    │<────────────────────│                    │
>>       │                      │                    │                     │                    │
>>       │                      │                    │────┐                │                    │
>>       │                     \│/                   │    │ ignore the     │                    │
>>       │                      X                    │<───┘ event since    │                    │
>>       │                     /│\                   │      'con' has been │                    │
>>       │                      │     MGMT           │      deleted        │                    │
>>       │                      │     Response       │                     │                    │
>>       │                      │<─ ─ ─ ─ ─ ─ ─ ─ ─ ─│                     │                    │
>> ┌─────┴─────┐          ┌─────┴────┐           ┌───┴──┐            ┌─────┴────┐           ┌───┴──┐
>> │bluetootctl│          │bluetoothd│           │kernel│            │controller│           │remote│
>> └───────────┘          └──────────┘           └──────┘            └──────────┘           └──────┘
>>
>>
>> So in the failure case, the bluetoothd is blocked by waiting the mgmt response from kernel. From
>> our test, bluetoothd can't accept any command related to mgmt from bluetothctl.
>>
>>>>
>>>> 3355 static void hci_disconn_complete_evt(struct hci_dev *hdev, void *data,
>>>> 3356              struct sk_buff *skb)
>>>> 3357 {
>>>> 3358   struct hci_ev_disconn_complete *ev = data;
>>>> 3359   u8 reason;
>>>> 3360   struct hci_conn_params *params;
>>>> 3361   struct hci_conn *conn;
>>>> 3362   bool mgmt_connected;
>>>> 3363
>>>> 3364   bt_dev_dbg(hdev, "status 0x%2.2x", ev->status);
>>>> 3365
>>>> 3366   hci_dev_lock(hdev);
>>>> 3367
>>>> 3368   conn = hci_conn_hash_lookup_handle(hdev, __le16_to_cpu(ev->handle));
>>>> 3369   if (!conn)
>>>> 3370     goto unlock;
>>>> 3371
>>>> 3372   if (ev->status) {
>>>> 3373     mgmt_disconnect_failed(hdev, &conn->dst, conn->type,
>>>> 3374                conn->dst_type, ev->status);
>>>> 3375     goto unlock;
>>>> 3376   }
>>>> 3377
>>>> 3378   conn->state = BT_CLOSED;
>>>> 3379
>>>> 3380   mgmt_connected = test_and_clear_bit(HCI_CONN_MGMT_CONNECTED, &conn->flags);
>>>> 3381
>>>>
>>>>> I double checked this and apparently this could no longer fail:
>>>>>
>>>>> +               /* Disregard possible errors since hci_conn_del shall have been
>>>>> +                * called even in case of errors had occurred since it would
>>>>> +                * then cause hci_conn_failed to be called which calls
>>>>> +                * hci_conn_del internally.
>>>>> +                */
>>>>> +               hci_abort_conn_sync(hdev, conn, reason);
>>>>>
>>>>> So it will clean up the hci_conn no matter what is the timeout, so
>>>>> either you don't have this change or it is not working for some
>>>>> reason.
>>>>>
>>>> The issue is mgmt command is not repsonsed by bluetoothd, then the bluetootlctl is
>>>> blocked. It does not happen during the power off stage. It happened when disconnect
>>>> a BLE device, but the disconnect complete event sent from controller to host 2s later.
>>>> Then it causes the mgmt in bluetoothctl is blocked as decribed as above.
>>>
>>> There is a difference about a MGMT command, initiated by bluetoothd,
>>> versus a MGMT event initiated by the kernel, so the daemon is not
>>> blocked it just don't get a disconnection event, which is different
>>> than a command complete.
>>>
>>> What is the command sequence that you use to reproduce the problem?
>> Here is the command log:
>> [CHG] Controller 8C:FD:F0:21:81:87 Pairable: yes
>> [bluetooth]# power on
>> Changing power on succeeded
>> [bluetooth]# connect CF:90:67:3C:7A:56
>> Attempting to connect to CF:90:67:3C:7A:56
>> [CHG] Device CF:90:67:3C:7A:56 Connected: yes
>> Connection successful
>> [CHG] Device CF:90:67:3C:7A:56 ServicesResolved: yes
>> [Designer Mouse]#
>> [Designer Mouse]# disconnect D9:B5:6C:F2:51:91
>> Attempting to disconnect from D9:B5:6C:F2:51:91 ## no disconnection success response
>> [Designer Mouse]#
>> [Designer Mouse]# power off
>> [Designer Mouse]#
>> Failed to set power off: org.freedesktop.DBus.Error.NoReply
>>
>> To easily reproduce this issue, we use a firmware which always send the disconnect
>> complete event more than 2s. Then the issue occurred 100%.
>>
>> Actually, the root cause is the hci_disconnect_sync doesn't handle this case since it
>> relies on __hci_cmd_sync_status_sk, which maximum timeout value is constrained to 2s.
>>
>>>
>>>>>>>         hci_dev_lock(hdev);
>>>>>>>
>>>>>>>         /* Check if the connection has been cleaned up concurrently */
>>>>>>>
>>>>>>> base-commit: e25c8d66f6786300b680866c0e0139981273feba
>>>>>>> --
>>>>>>> 2.34.1
>>>>>>>
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Luiz Augusto von Dentz
>>>>>
>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 
> 


