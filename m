Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 067E7148C57
	for <lists+linux-bluetooth@lfdr.de>; Fri, 24 Jan 2020 17:39:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388983AbgAXQjk convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 24 Jan 2020 11:39:40 -0500
Received: from coyote.holtmann.net ([212.227.132.17]:58202 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387687AbgAXQjk (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 24 Jan 2020 11:39:40 -0500
Received: from marcel-macpro.fritz.box (p4FEFC5A7.dip0.t-ipconnect.de [79.239.197.167])
        by mail.holtmann.org (Postfix) with ESMTPSA id F2712CED10;
        Fri, 24 Jan 2020 17:48:57 +0100 (CET)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH 2/2] Bluetooth: L2CAP: Add initial code for Enhanced
 Credit Based Mode
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <CABBYNZJEphsTt4U_ruunQS_7hAdLVO2NsZeT8swMRA7127nAGA@mail.gmail.com>
Date:   Fri, 24 Jan 2020 17:39:38 +0100
Cc:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <EB03C334-FCEA-40E4-9E03-84D08DE993B7@holtmann.org>
References: <20200116212743.21016-1-luiz.dentz@gmail.com>
 <20200116212743.21016-2-luiz.dentz@gmail.com>
 <845FE55B-5172-4A4D-8A0F-2C971A084B8A@holtmann.org>
 <CABBYNZJEphsTt4U_ruunQS_7hAdLVO2NsZeT8swMRA7127nAGA@mail.gmail.com>
To:     Luiz Augusto von Dentz <luiz.dentz@gmail.com>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Hi Luiz,

>>> This adds the initial code for Enhanced Credit Based Mode which
>>> introduces a new socket mode called L2CAP_MODE_EXT_FLOWCTL, which for
>>> the most part work the same as L2CAP_MODE_LE_FLOWCTL but uses different
>>> PDUs to setup the connections and also works over BR/EDR.
>>> 
>>> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>>> ---
>>> include/net/bluetooth/l2cap.h |   4 +
>>> net/bluetooth/l2cap_core.c    | 510 +++++++++++++++++++++++++++++++++-
>>> net/bluetooth/l2cap_sock.c    |  39 +--
>>> 3 files changed, 521 insertions(+), 32 deletions(-)
>>> 
>>> diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
>>> index b9ea88cfd2d2..11ae4c93354b 100644
>>> --- a/include/net/bluetooth/l2cap.h
>>> +++ b/include/net/bluetooth/l2cap.h
>>> @@ -295,6 +295,8 @@ struct l2cap_conn_rsp {
>>> #define L2CAP_CR_LE_ENCRYPTION                0x0008
>>> #define L2CAP_CR_LE_INVALID_SCID      0x0009
>>> #define L2CAP_CR_LE_SCID_IN_USE               0X000A
>>> +#define L2CAP_CR_LE_UNACCEPT_PARAMS  0X000B
>>> +#define L2CAP_CR_LE_INVALID_PARAMS   0X000C
>>> 
>>> /* connect/create channel status */
>>> #define L2CAP_CS_NO_INFO      0x0000
>>> @@ -964,6 +966,7 @@ void l2cap_cleanup_sockets(void);
>>> bool l2cap_is_socket(struct socket *sock);
>>> 
>>> void __l2cap_le_connect_rsp_defer(struct l2cap_chan *chan);
>>> +void __l2cap_ecred_conn_rsp_defer(struct l2cap_chan *chan);
>>> void __l2cap_connect_rsp_defer(struct l2cap_chan *chan);
>>> 
>>> int l2cap_add_psm(struct l2cap_chan *chan, bdaddr_t *src, __le16 psm);
>>> @@ -973,6 +976,7 @@ struct l2cap_chan *l2cap_chan_create(void);
>>> void l2cap_chan_close(struct l2cap_chan *chan, int reason);
>>> int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
>>>                     bdaddr_t *dst, u8 dst_type);
>>> +int l2cap_chan_reconfigure(struct l2cap_chan *chan, __u16 mtu);
>>> int l2cap_chan_send(struct l2cap_chan *chan, struct msghdr *msg, size_t len);
>>> void l2cap_chan_busy(struct l2cap_chan *chan, int busy);
>>> int l2cap_chan_check_security(struct l2cap_chan *chan, bool initiator);
>>> diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
>>> index 195459a1e53e..a528526cffac 100644
>>> --- a/net/bluetooth/l2cap_core.c
>>> +++ b/net/bluetooth/l2cap_core.c
>>> @@ -532,6 +532,17 @@ static void l2cap_le_flowctl_init(struct l2cap_chan *chan, u16 tx_credits)
>>>      skb_queue_head_init(&chan->tx_q);
>>> }
>>> 
>>> +static void l2cap_ecred_init(struct l2cap_chan *chan, u16 tx_credits)
>>> +{
>>> +     l2cap_le_flowctl_init(chan, tx_credits);
>>> +
>>> +     /* L2CAP implementations shall support a minimum MPS of 64 octets */
>>> +     if (chan->mps < L2CAP_ECRED_MIN_MPS) {
>>> +             chan->mps = L2CAP_ECRED_MIN_MPS;
>>> +             chan->rx_credits = (chan->imtu / chan->mps) + 1;
>>> +     }
>>> +}
>>> +
>>> void __l2cap_chan_add(struct l2cap_conn *conn, struct l2cap_chan *chan)
>>> {
>>>      BT_DBG("conn %p, psm 0x%2.2x, dcid 0x%4.4x", conn,
>>> @@ -638,6 +649,7 @@ void l2cap_chan_del(struct l2cap_chan *chan, int err)
>>>              break;
>>> 
>>>      case L2CAP_MODE_LE_FLOWCTL:
>>> +     case L2CAP_MODE_EXT_FLOWCTL:
>>>              skb_queue_purge(&chan->tx_q);
>>>              break;
>>> 
>>> @@ -1260,6 +1272,17 @@ static void l2cap_move_done(struct l2cap_chan *chan)
>>>      }
>>> }
>>> 
>>> +static bool l2cap_mode_ready(struct l2cap_chan *chan)
>>> +{
>>> +     switch (chan->mode) {
>>> +     case L2CAP_MODE_LE_FLOWCTL:
>>> +     case L2CAP_MODE_EXT_FLOWCTL:
>>> +             return chan->tx_credits ? true : false;
>>> +     }
>>> +
>>> +     return true;
>>> +}
>>> +
>>> static void l2cap_chan_ready(struct l2cap_chan *chan)
>>> {
>>>      /* The channel may have already been flagged as connected in
>>> @@ -1273,7 +1296,7 @@ static void l2cap_chan_ready(struct l2cap_chan *chan)
>>>      chan->conf_state = 0;
>>>      __clear_chan_timer(chan);
>>> 
>>> -     if (chan->mode == L2CAP_MODE_LE_FLOWCTL && !chan->tx_credits)
>>> +     if (!l2cap_mode_ready(chan))
>>>              chan->ops->suspend(chan);
>> 
>>        switch (chan->mode) {
>>        case ..
>>        case ..
>>                if (!chan->tx_credits)
>>                        chan->ops->suspend(chan);
>>                break;
>>        }
>> 
>>> 
>>>      chan->state = BT_CONNECTED;
>>> @@ -1306,6 +1329,31 @@ static void l2cap_le_connect(struct l2cap_chan *chan)
>>>                     sizeof(req), &req);
>>> }
>>> 
>>> +static void l2cap_ecred_connect(struct l2cap_chan *chan)
>>> +{
>>> +     struct l2cap_conn *conn = chan->conn;
>>> +     struct {
>>> +             struct l2cap_ecred_conn_req req;
>>> +             __le16 scid;
>>> +     } __packed pdu;
>>> +
>>> +     if (test_and_set_bit(FLAG_ECRED_CONN_REQ_SENT, &chan->flags))
>>> +             return;
>>> +
>>> +     l2cap_ecred_init(chan, 0);
>>> +
>>> +     pdu.req.psm     = chan->psm;
>>> +     pdu.req.mtu     = cpu_to_le16(chan->imtu);
>>> +     pdu.req.mps     = cpu_to_le16(chan->mps);
>>> +     pdu.req.credits = cpu_to_le16(chan->rx_credits);
>>> +     pdu.scid        = cpu_to_le16(chan->scid);
>>> +
>>> +     chan->ident = l2cap_get_ident(conn);
>>> +
>>> +     l2cap_send_cmd(conn, chan->ident, L2CAP_ECRED_CONN_REQ,
>>> +                    sizeof(pdu), &pdu);
>>> +}
>>> +
>>> static void l2cap_le_start(struct l2cap_chan *chan)
>>> {
>>>      struct l2cap_conn *conn = chan->conn;
>>> @@ -1318,8 +1366,12 @@ static void l2cap_le_start(struct l2cap_chan *chan)
>>>              return;
>>>      }
>>> 
>>> -     if (chan->state == BT_CONNECT)
>>> -             l2cap_le_connect(chan);
>>> +     if (chan->state == BT_CONNECT) {
>>> +             if (chan->mode == L2CAP_MODE_EXT_FLOWCTL)
>>> +                     l2cap_ecred_connect(chan);
>>> +             else
>>> +                     l2cap_le_connect(chan);
>>> +     }
>>> }
>>> 
>>> static void l2cap_start_connection(struct l2cap_chan *chan)
>>> @@ -2505,6 +2557,7 @@ int l2cap_chan_send(struct l2cap_chan *chan, struct msghdr *msg, size_t len)
>>> 
>>>      switch (chan->mode) {
>>>      case L2CAP_MODE_LE_FLOWCTL:
>>> +     case L2CAP_MODE_EXT_FLOWCTL:
>>>              /* Check outgoing MTU */
>>>              if (len > chan->omtu)
>>>                      return -EMSGSIZE;
>>> @@ -3773,6 +3826,42 @@ void __l2cap_le_connect_rsp_defer(struct l2cap_chan *chan)
>>>                     &rsp);
>>> }
>>> 
>>> +void __l2cap_ecred_conn_rsp_defer(struct l2cap_chan *chan)
>>> +{
>>> +     struct l2cap_ecred_conn_rsp rsp;
>>> +     struct l2cap_conn *conn = chan->conn;
>>> +     u16 ident = chan->ident;
>>> +     int i = 0;
>>> +
>>> +     if (!ident) {
>>> +             return;
>>> +     }
>>> +
>> 
>> No { } here.
>> 
>>> +     BT_DBG("chan %p ident %d", chan, ident);
>>> +
>>> +     rsp.mtu     = cpu_to_le16(chan->imtu);
>>> +     rsp.mps     = cpu_to_le16(chan->mps);
>>> +     rsp.credits = cpu_to_le16(chan->rx_credits);
>>> +     rsp.result  = cpu_to_le16(L2CAP_CR_LE_SUCCESS);
>>> +
>>> +     mutex_lock(&conn->chan_lock);
>>> +
>>> +     list_for_each_entry(chan, &conn->chan_l, list) {
>>> +             if (chan->ident != ident)
>>> +                     continue;
>>> +
>>> +             /* Reset ident so only one response is sent */
>>> +             chan->ident = 0;
>>> +
>>> +             /* Include all channels pending with the same ident */
>>> +             rsp.dcid[i++] = cpu_to_le16(chan->scid);
>> 
>> This doesn’t work. The sizeof(rsp) has no dcid in there. You are overflowing into conn struct here.
>> 
>>> +     }
>>> +
>>> +     mutex_unlock(&conn->chan_lock);
>>> +
>>> +     l2cap_send_cmd(conn, ident, L2CAP_ECRED_CONN_RSP, sizeof(rsp), &rsp);
>>> +}
>>> +
>>> void __l2cap_connect_rsp_defer(struct l2cap_chan *chan)
>>> {
>>>      struct l2cap_conn_rsp rsp;
>>> @@ -5714,6 +5803,347 @@ static inline int l2cap_le_credits(struct l2cap_conn *conn,
>>>      return 0;
>>> }
>>> 
>>> +static inline int l2cap_ecred_conn_req(struct l2cap_conn *conn,
>>> +                                    struct l2cap_cmd_hdr *cmd, u16 cmd_len,
>>> +                                    u8 *data)
>>> +{
>>> +     struct l2cap_ecred_conn_req *req = (void *) data;
>>> +     struct {
>>> +             struct l2cap_ecred_conn_rsp rsp;
>>> +             __le16 dcid[5];
>>> +     } __packed pdu;
>>> +     struct l2cap_chan *chan, *pchan;
>>> +     u16 credits, mtu, mps;
>>> +     __le16 psm;
>>> +     u8 result, len = 0;
>>> +     int i;
>>> +     bool defer = false;
>>> +
>>> +     if (cmd_len < sizeof(*req))
>>> +             return -EPROTO;
>>> +
>>> +     mtu  = __le16_to_cpu(req->mtu);
>>> +     mps  = __le16_to_cpu(req->mps);
>>> +
>>> +     if (mtu < L2CAP_ECRED_MIN_MTU || mps < L2CAP_ECRED_MIN_MPS) {
>>> +             result = L2CAP_CR_LE_UNACCEPT_PARAMS;
>>> +             goto response;
>>> +     }
>>> +
>>> +     psm  = req->psm;
>>> +     credits = 0;
>>> +
>>> +     BT_DBG("psm 0x%2.2x mtu %u mps %u", __le16_to_cpu(psm), mtu, mps);
>>> +
>>> +     memset(&pdu, 0, sizeof(pdu));
>>> +
>>> +     /* Check if we have socket listening on psm */
>>> +     pchan = l2cap_global_chan_by_psm(BT_LISTEN, psm, &conn->hcon->src,
>>> +                                      &conn->hcon->dst, LE_LINK);
>>> +     if (!pchan) {
>>> +             result = L2CAP_CR_LE_BAD_PSM;
>>> +             goto response;
>>> +     }
>>> +
>>> +     mutex_lock(&conn->chan_lock);
>>> +     l2cap_chan_lock(pchan);
>>> +
>>> +     if (!smp_sufficient_security(conn->hcon, pchan->sec_level,
>>> +                                  SMP_ALLOW_STK)) {
>>> +             result = L2CAP_CR_LE_AUTHENTICATION;
>>> +             goto unlock;
>>> +     }
>>> +
>>> +     result = L2CAP_CR_LE_SUCCESS;
>>> +
>>> +     for (i = 0, cmd_len -= sizeof(req); cmd_len >= sizeof(u16);
>>> +          i++, cmd_len -= sizeof(u16)) {
>> 
>> Can we simplify the loop statement or switch to while statement?
>> 
>>> +             u16 scid = __le16_to_cpu(req->scid[i]);
>>> +
>>> +             BT_DBG("scid[%d] 0x%4.4x", i, scid);
>>> +
>>> +             pdu.dcid[i] = 0x0000;
>>> +             len += sizeof(*pdu.dcid);
>>> +
>>> +             /* Check for valid dynamic CID range */
>>> +             if (scid < L2CAP_CID_DYN_START || scid > L2CAP_CID_LE_DYN_END) {
>>> +                     result = L2CAP_CR_LE_INVALID_SCID;
>>> +                     continue;
>>> +             }
>>> +
>>> +             /* Check if we already have channel with that dcid */
>>> +             if (__l2cap_get_chan_by_dcid(conn, scid)) {
>>> +                     result = L2CAP_CR_LE_SCID_IN_USE;
>>> +                     continue;
>>> +             }
>>> +
>>> +             chan = pchan->ops->new_connection(pchan);
>>> +             if (!chan) {
>>> +                     result = L2CAP_CR_LE_NO_MEM;
>>> +                     continue;
>>> +             }
>>> +
>>> +             bacpy(&chan->src, &conn->hcon->src);
>>> +             bacpy(&chan->dst, &conn->hcon->dst);
>>> +             chan->src_type = bdaddr_src_type(conn->hcon);
>>> +             chan->dst_type = bdaddr_dst_type(conn->hcon);
>>> +             chan->psm  = psm;
>>> +             chan->dcid = scid;
>>> +             chan->omtu = mtu;
>>> +             chan->remote_mps = mps;
>>> +
>>> +             __l2cap_chan_add(conn, chan);
>>> +
>>> +             l2cap_ecred_init(chan, __le16_to_cpu(req->credits));
>>> +
>>> +             /* Init response */
>>> +             if (!pdu.rsp.credits) {
>>> +                     pdu.rsp.mtu = cpu_to_le16(chan->imtu);
>>> +                     pdu.rsp.mps = cpu_to_le16(chan->mps);
>>> +                     pdu.rsp.credits = cpu_to_le16(chan->rx_credits);
>>> +             }
>>> +
>>> +             pdu.dcid[i] = cpu_to_le16(chan->scid);
>>> +
>>> +             __set_chan_timer(chan, chan->ops->get_sndtimeo(chan));
>>> +
>>> +             chan->ident = cmd->ident;
>>> +
>>> +             if (test_bit(FLAG_DEFER_SETUP, &chan->flags)) {
>>> +                     l2cap_state_change(chan, BT_CONNECT2);
>>> +                     defer = true;
>>> +                     chan->ops->defer(chan);
>>> +             } else {
>>> +                     l2cap_chan_ready(chan);
>>> +             }
>>> +     }
>>> +
>>> +unlock:
>>> +     l2cap_chan_unlock(pchan);
>>> +     mutex_unlock(&conn->chan_lock);
>>> +     l2cap_chan_put(pchan);
>>> +
>>> +response:
>>> +     pdu.rsp.result = cpu_to_le16(result);
>>> +
>>> +     if (defer)
>>> +             return 0;
>>> +
>>> +     l2cap_send_cmd(conn, cmd->ident, L2CAP_ECRED_CONN_RSP,
>>> +                    sizeof(pdu.rsp) + len, &pdu);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static inline int l2cap_ecred_conn_rsp(struct l2cap_conn *conn,
>>> +                                    struct l2cap_cmd_hdr *cmd, u16 cmd_len,
>>> +                                    u8 *data)
>>> +{
>>> +     struct l2cap_ecred_conn_rsp *rsp = (void *) data;
>>> +     struct hci_conn *hcon = conn->hcon;
>>> +     u16 mtu, mps, credits, result;
>>> +     struct l2cap_chan *chan;
>>> +     int err = 0, sec_level;
>>> +     int i = 0;
>>> +
>>> +     if (cmd_len < sizeof(*rsp))
>>> +             return -EPROTO;
>>> +
>>> +     mtu     = __le16_to_cpu(rsp->mtu);
>>> +     mps     = __le16_to_cpu(rsp->mps);
>>> +     credits = __le16_to_cpu(rsp->credits);
>>> +     result  = __le16_to_cpu(rsp->result);
>>> +
>>> +     BT_DBG("mtu %u mps %u credits %u result 0x%4.4x", mtu, mps, credits,
>>> +            result);
>>> +
>>> +     mutex_lock(&conn->chan_lock);
>>> +
>>> +     cmd_len -= sizeof(*rsp);
>>> +
>>> +     list_for_each_entry(chan, &conn->chan_l, list) {
>>> +             u16 dcid;
>>> +
>>> +             if (chan->ident != cmd->ident ||
>>> +                 chan->mode != L2CAP_MODE_EXT_FLOWCTL ||
>>> +                 chan->state == BT_CONNECTED)
>>> +                     continue;
>>> +
>>> +             l2cap_chan_lock(chan);
>>> +
>>> +             /* Check that there is a dcid for each pending channel */
>>> +             if (cmd_len < sizeof(dcid)) {
>>> +                     l2cap_chan_del(chan, ECONNREFUSED);
>>> +                     l2cap_chan_unlock(chan);
>>> +                     continue;
>>> +             }
>>> +
>>> +             dcid = __le16_to_cpu(rsp->dcid[i++]);
>>> +             cmd_len -= sizeof(u16);
>>> +
>>> +             BT_DBG("dcid[%d] 0x%4.4x", i, dcid);
>>> +
>>> +             /* Check if dcid is already in use */
>>> +             if (dcid && __l2cap_get_chan_by_dcid(conn, dcid)) {
>>> +                     /* If a device receives a
>>> +                      * L2CAP_CREDIT_BASED_CONNECTION_RSP packet with an
>>> +                      * already-assigned Destination CID, then both the
>>> +                      * original channel and the new channel shall be
>>> +                      * immediately discarded and not used.
>>> +                      */
>>> +                     l2cap_chan_del(chan, ECONNREFUSED);
>>> +                     l2cap_chan_unlock(chan);
>>> +                     chan = __l2cap_get_chan_by_dcid(conn, dcid);
>>> +                     l2cap_chan_lock(chan);
>>> +                     l2cap_chan_del(chan, ECONNRESET);
>>> +                     l2cap_chan_unlock(chan);
>>> +                     continue;
>>> +             }
>>> +
>>> +             switch (result) {
>>> +             case L2CAP_CR_LE_AUTHENTICATION:
>>> +             case L2CAP_CR_LE_ENCRYPTION:
>>> +                     /* If we already have MITM protection we can't do
>>> +                      * anything.
>>> +                      */
>>> +                     if (hcon->sec_level > BT_SECURITY_MEDIUM) {
>>> +                             l2cap_chan_del(chan, ECONNREFUSED);
>>> +                             break;
>>> +                     }
>>> +
>>> +                     sec_level = hcon->sec_level + 1;
>>> +                     if (chan->sec_level < sec_level)
>>> +                             chan->sec_level = sec_level;
>>> +
>>> +                     /* We'll need to send a new Connect Request */
>>> +                     clear_bit(FLAG_ECRED_CONN_REQ_SENT, &chan->flags);
>>> +
>>> +                     smp_conn_security(hcon, chan->sec_level);
>>> +                     break;
>>> +
>>> +             case L2CAP_CR_LE_BAD_PSM:
>>> +                     l2cap_chan_del(chan, ECONNREFUSED);
>>> +                     break;
>>> +
>>> +             default:
>>> +                     /* If dcid was not set it means channels was refused */
>>> +                     if (!dcid) {
>>> +                             l2cap_chan_del(chan, ECONNREFUSED);
>>> +                             break;
>>> +                     }
>>> +
>>> +                     chan->ident = 0;
>>> +                     chan->dcid = dcid;
>>> +                     chan->omtu = mtu;
>>> +                     chan->remote_mps = mps;
>>> +                     chan->tx_credits = credits;
>>> +                     l2cap_chan_ready(chan);
>>> +                     break;
>>> +             }
>>> +
>>> +             l2cap_chan_unlock(chan);
>>> +     }
>>> +
>>> +     mutex_unlock(&conn->chan_lock);
>>> +
>>> +     return err;
>>> +}
>>> +
>>> +static inline int l2cap_ecred_reconf_req(struct l2cap_conn *conn,
>>> +                                      struct l2cap_cmd_hdr *cmd, u16 cmd_len,
>>> +                                      u8 *data)
>>> +{
>>> +     struct l2cap_ecred_reconf_req *req = (void *) data;
>>> +     struct l2cap_ecred_reconf_rsp rsp;
>>> +     u16 mtu, mps, result;
>>> +     struct l2cap_chan *chan;
>>> +     int i;
>>> +
>>> +     if (cmd_len < sizeof(*req)) {
>>> +             result = L2CAP_CR_LE_INVALID_PARAMS;
>>> +             goto respond;
>>> +     }
>>> +
>>> +     mtu = __le16_to_cpu(req->mtu);
>>> +     mps = __le16_to_cpu(req->mps);
>>> +
>>> +     BT_DBG("mtu %u mps %u", mtu, mps);
>>> +
>>> +     if (mtu < L2CAP_ECRED_MIN_MTU) {
>>> +             result = L2CAP_RECONF_INVALID_MTU;
>>> +             goto respond;
>>> +     }
>>> +
>>> +     if (mps < L2CAP_ECRED_MIN_MPS) {
>>> +             result = L2CAP_RECONF_INVALID_MPS;
>>> +             goto respond;
>>> +     }
>>> +
>>> +     result = L2CAP_RECONF_SUCCESS;
>>> +
>>> +     for (i = 0, cmd_len -= sizeof(*req); cmd_len < sizeof(u16);
>>> +          i++, cmd_len -= sizeof(u16)) {
>> 
>> Same comment as above.
>> 
>>> +             u16 scid;
>>> +
>>> +             scid = __le16_to_cpu(req->scid[i]);
>>> +             if (!scid)
>>> +                     return -EPROTO;
>>> +
>>> +             chan = __l2cap_get_chan_by_dcid(conn, scid);
>>> +             if (!chan)
>>> +                     continue;
>>> +
>>> +             /* If the MTU value is decreased for any of the included
>>> +              * channels, then the receiver shall disconnect all
>>> +              * included channels.
>>> +              */
>>> +             if (chan->omtu > mtu) {
>>> +                     BT_ERR("chan %p decreased MTU %u -> %u", chan,
>>> +                            chan->omtu, mtu);
>>> +                     result = L2CAP_RECONF_INVALID_MTU;
>>> +             }
>>> +
>>> +             chan->omtu = mtu;
>>> +             chan->remote_mps = mps;
>>> +     }
>>> +
>>> +respond:
>>> +     rsp.result = cpu_to_le16(result);
>>> +
>>> +     l2cap_send_cmd(conn, cmd->ident, L2CAP_ECRED_RECONF_RSP, sizeof(rsp),
>>> +                    &rsp);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static inline int l2cap_ecred_reconf_rsp(struct l2cap_conn *conn,
>>> +                                      struct l2cap_cmd_hdr *cmd, u16 cmd_len,
>>> +                                      u8 *data)
>>> +{
>>> +     struct l2cap_chan *chan;
>>> +     struct l2cap_ecred_conn_rsp *rsp = (void *) data;
>>> +     u16 result;
>>> +
>>> +     if (cmd_len < sizeof(*rsp))
>>> +             return -EPROTO;
>>> +
>>> +     result = __le16_to_cpu(rsp->result);
>>> +
>>> +     BT_DBG("result 0x%4.4x", rsp->result);
>>> +
>>> +     if (!result)
>>> +             return 0;
>>> +
>>> +     list_for_each_entry(chan, &conn->chan_l, list) {
>>> +             if (chan->ident != cmd->ident)
>>> +                     continue;
>>> +
>>> +             l2cap_chan_del(chan, ECONNRESET);
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> static inline int l2cap_le_command_rej(struct l2cap_conn *conn,
>>>                                     struct l2cap_cmd_hdr *cmd, u16 cmd_len,
>>>                                     u8 *data)
>>> @@ -5769,6 +6199,22 @@ static inline int l2cap_le_sig_cmd(struct l2cap_conn *conn,
>>>              err = l2cap_le_credits(conn, cmd, cmd_len, data);
>>>              break;
>>> 
>>> +     case L2CAP_ECRED_CONN_REQ:
>>> +             err = l2cap_ecred_conn_req(conn, cmd, cmd_len, data);
>>> +             break;
>>> +
>>> +     case L2CAP_ECRED_CONN_RSP:
>>> +             err = l2cap_ecred_conn_rsp(conn, cmd, cmd_len, data);
>>> +             break;
>>> +
>>> +     case L2CAP_ECRED_RECONF_REQ:
>>> +             err = l2cap_ecred_reconf_req(conn, cmd, cmd_len, data);
>>> +             break;
>>> +
>>> +     case L2CAP_ECRED_RECONF_RSP:
>>> +             err = l2cap_ecred_reconf_rsp(conn, cmd, cmd_len, data);
>>> +             break;
>>> +
>>>      case L2CAP_DISCONN_REQ:
>>>              err = l2cap_disconnect_req(conn, cmd, cmd_len, data);
>>>              break;
>>> @@ -6814,11 +7260,13 @@ static void l2cap_chan_le_send_credits(struct l2cap_chan *chan)
>>>      struct l2cap_le_credits pkt;
>>>      u16 return_credits;
>>> 
>>> -     return_credits = ((chan->imtu / chan->mps) + 1) - chan->rx_credits;
>>> +     return_credits = (chan->imtu / chan->mps) + 1;
>>> 
>>> -     if (!return_credits)
>>> +     if (chan->rx_credits >= return_credits)
>>>              return;
>>> 
>>> +     return_credits -= chan->rx_credits;
>>> +
>>>      BT_DBG("chan %p returning %u credits to sender", chan, return_credits);
>>> 
>>>      chan->rx_credits += return_credits;
>>> @@ -6831,7 +7279,7 @@ static void l2cap_chan_le_send_credits(struct l2cap_chan *chan)
>>>      l2cap_send_cmd(conn, chan->ident, L2CAP_LE_CREDITS, sizeof(pkt), &pkt);
>>> }
>>> 
>>> -static int l2cap_le_recv(struct l2cap_chan *chan, struct sk_buff *skb)
>>> +static int l2cap_ecred_recv(struct l2cap_chan *chan, struct sk_buff *skb)
>>> {
>>>      int err;
>>> 
>>> @@ -6846,7 +7294,7 @@ static int l2cap_le_recv(struct l2cap_chan *chan, struct sk_buff *skb)
>>>      return err;
>>> }
>>> 
>>> -static int l2cap_le_data_rcv(struct l2cap_chan *chan, struct sk_buff *skb)
>>> +static int l2cap_ecred_data_rcv(struct l2cap_chan *chan, struct sk_buff *skb)
>>> {
>>>      int err;
>>> 
>>> @@ -6894,7 +7342,7 @@ static int l2cap_le_data_rcv(struct l2cap_chan *chan, struct sk_buff *skb)
>>>              }
>>> 
>>>              if (skb->len == sdu_len)
>>> -                     return l2cap_le_recv(chan, skb);
>>> +                     return l2cap_ecred_recv(chan, skb);
>>> 
>>>              chan->sdu = skb;
>>>              chan->sdu_len = sdu_len;
>>> @@ -6926,7 +7374,7 @@ static int l2cap_le_data_rcv(struct l2cap_chan *chan, struct sk_buff *skb)
>>>      skb = NULL;
>>> 
>>>      if (chan->sdu->len == chan->sdu_len) {
>>> -             err = l2cap_le_recv(chan, chan->sdu);
>>> +             err = l2cap_ecred_recv(chan, chan->sdu);
>>>              if (!err) {
>>>                      chan->sdu = NULL;
>>>                      chan->sdu_last_frag = NULL;
>>> @@ -6987,7 +7435,8 @@ static void l2cap_data_channel(struct l2cap_conn *conn, u16 cid,
>>> 
>>>      switch (chan->mode) {
>>>      case L2CAP_MODE_LE_FLOWCTL:
>>> -             if (l2cap_le_data_rcv(chan, skb) < 0)
>>> +     case L2CAP_MODE_EXT_FLOWCTL:
>>> +             if (l2cap_ecred_data_rcv(chan, skb) < 0)
>>>                      goto drop;
>>> 
>>>              goto done;
>>> @@ -7214,8 +7663,8 @@ int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
>>>      struct hci_dev *hdev;
>>>      int err;
>>> 
>>> -     BT_DBG("%pMR -> %pMR (type %u) psm 0x%2.2x", &chan->src, dst,
>>> -            dst_type, __le16_to_cpu(psm));
>>> +     BT_DBG("%pMR -> %pMR (type %u) psm 0x%4.4x mode 0x%2.2x", &chan->src,
>>> +            dst, dst_type, __le16_to_cpu(psm), chan->mode);
>>> 
>>>      hdev = hci_get_route(dst, &chan->src, chan->src_type);
>>>      if (!hdev)
>>> @@ -7244,6 +7693,8 @@ int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
>>>              break;
>>>      case L2CAP_MODE_LE_FLOWCTL:
>>>              break;
>>> +     case L2CAP_MODE_EXT_FLOWCTL:
>>> +             break;
>> 
>> No need to do another break. Just put it under LE_FLOWCTL.
>> 
>>>      case L2CAP_MODE_ERTM:
>>>      case L2CAP_MODE_STREAMING:
>>>              if (!disable_ertm)
>>> @@ -7368,6 +7819,38 @@ int l2cap_chan_connect(struct l2cap_chan *chan, __le16 psm, u16 cid,
>>> }
>>> EXPORT_SYMBOL_GPL(l2cap_chan_connect);
>>> 
>>> +static void l2cap_ecred_reconfigure(struct l2cap_chan *chan)
>>> +{
>>> +     struct l2cap_conn *conn = chan->conn;
>>> +     struct {
>>> +             struct l2cap_ecred_reconf_req req;
>>> +             __le16 scid;
>>> +     } pdu;
>>> +
>>> +     pdu.req.mtu = cpu_to_le16(chan->imtu);
>>> +     pdu.req.mps = cpu_to_le16(chan->mps);
>>> +     pdu.scid    = cpu_to_le16(chan->scid);
>>> +
>>> +     chan->ident = l2cap_get_ident(conn);
>>> +
>>> +     l2cap_send_cmd(conn, chan->ident, L2CAP_ECRED_RECONF_REQ,
>>> +                    sizeof(pdu), &pdu);
>>> +}
>>> +
>>> +int l2cap_chan_reconfigure(struct l2cap_chan *chan, __u16 mtu)
>>> +{
>>> +     if (chan->imtu > mtu)
>>> +             return -EINVAL;
>>> +
>>> +     BT_DBG("chan %p mtu 0x%4.4x", chan, mtu);
>>> +
>>> +     chan->imtu = mtu;
>>> +
>>> +     l2cap_ecred_reconfigure(chan);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> /* ---- L2CAP interface with lower layer (HCI) ---- */
>>> 
>>> int l2cap_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr)
>>> @@ -7579,7 +8062,8 @@ static void l2cap_security_cfm(struct hci_conn *hcon, u8 status, u8 encrypt)
>>>                      else
>>>                              __set_chan_timer(chan, L2CAP_DISC_TIMEOUT);
>>>              } else if (chan->state == BT_CONNECT2 &&
>>> -                        chan->mode != L2CAP_MODE_LE_FLOWCTL) {
>>> +                        !(chan->mode == L2CAP_MODE_EXT_FLOWCTL ||
>>> +                         chan->mode == L2CAP_MODE_LE_FLOWCTL)) {
>> 
>> Please double check that this line is correctly aligned after the (.
>> 
>>>                      struct l2cap_conn_rsp rsp;
>>>                      __u16 res, stat;
>>> 
>>> diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
>>> index a7be8b59b3c2..12c557f7f40f 100644
>>> --- a/net/bluetooth/l2cap_sock.c
>>> +++ b/net/bluetooth/l2cap_sock.c
>>> @@ -232,7 +232,7 @@ static int l2cap_sock_connect(struct socket *sock, struct sockaddr *addr,
>>>                      return -EINVAL;
>>>      }
>>> 
>>> -     if (chan->psm && bdaddr_type_is_le(chan->src_type))
>>> +     if (chan->psm && bdaddr_type_is_le(chan->src_type) && !chan->mode)
>>>              chan->mode = L2CAP_MODE_LE_FLOWCTL;
>>> 
>>>      err = l2cap_chan_connect(chan, la.l2_psm, __le16_to_cpu(la.l2_cid),
>>> @@ -273,6 +273,7 @@ static int l2cap_sock_listen(struct socket *sock, int backlog)
>>>      switch (chan->mode) {
>>>      case L2CAP_MODE_BASIC:
>>>      case L2CAP_MODE_LE_FLOWCTL:
>>> +     case L2CAP_MODE_EXT_FLOWCTL:
>>>              break;
>>>      case L2CAP_MODE_ERTM:
>>>      case L2CAP_MODE_STREAMING:
>>> @@ -408,16 +409,6 @@ static int l2cap_sock_getsockopt_old(struct socket *sock, int optname,
>>> 
>>>      switch (optname) {
>>>      case L2CAP_OPTIONS:
>>> -             /* LE sockets should use BT_SNDMTU/BT_RCVMTU, but since
>>> -              * legacy ATT code depends on getsockopt for
>>> -              * L2CAP_OPTIONS we need to let this pass.
>>> -              */
>>> -             if (bdaddr_type_is_le(chan->src_type) &&
>>> -                 chan->scid != L2CAP_CID_ATT) {
>>> -                     err = -EINVAL;
>>> -                     break;
>>> -             }
>>> -
>> 
>> Should this be a separate patch. How do we keep this legacy behavior.
> 
> I kind have forgotten to fix this one, I guess we will need a new
> option in order to read the mode without using the old L2CAP_OPTIONS
> then, or do you have anything against introducing yet another option?

so what is the problem here? Is this because L2CAP by itself can not tell if enhanced credit mode is supported by the peer?

Do you actually want to create a new mode socket options with defined values by us to allow selected the mode of operation?

Regards

Marcel

