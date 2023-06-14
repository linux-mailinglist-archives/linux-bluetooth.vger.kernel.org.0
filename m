Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D367143E7
	for <lists+linux-bluetooth@lfdr.de>; Mon, 29 May 2023 08:11:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbjE2GL2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 29 May 2023 02:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbjE2GLY (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 29 May 2023 02:11:24 -0400
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2056.outbound.protection.outlook.com [40.107.105.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200B3AC
        for <linux-bluetooth@vger.kernel.org>; Sun, 28 May 2023 23:11:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCcU3W+TPjJprn8uSJj7/Ni5mf9aQqOXyaJ1Z+kq9msJz8Xjyf4TnxCF868x/O1LBtUnd16TMhAN7DCfmGTsDer9COzUp1rxUAPp5bCGl8Fy95nINmWdTrdfuVNkTNKNy6TgB81rDZpl4tvEZcwGaOjVYc2RpULBSB0OWxHv5mZ8Kg1rqF6BY/rYZ/OBSsxX2lhekSWLmAxPyzFeD6U4tUJoJuIewQL9vkXjowK3Sxh5B4ulHfOTUkC5rnjNnWnqILIS7KGd+vFtIyUTYAlaid16mXX3XClZ5OBpBDosHu+FWcLtyaTq548AyJSZSRTgCF2FqUiLR3lDvNMy0mda9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hbw5ZOGaADJiCK1Q5f7H8+xSUZCKfWRAGqWlHJrneZI=;
 b=IrNGTQisC/VEV40RaXeDf118coWXNcrZ6jg5p5bR+Inr6qXAwFm2YtD87zkONIREloivm26NDZ8ewA2OZt3oahVydzQgNO0nyYM9tNtXBCZIiLyPE5rLPPBhOf8jO627yfWDKguqrigbLJRfBxIYiHXFqPSK3bEMRzy0rUvO246VIOTm/0Oy6b0o5FiSwWYvp/u2t+IXpwrtykyuxCSxBZvcezJwqMNrFeqXbKSQyP167edwamtOd1vakg5WKgRsvnIX20cEzn9qFGgPi/H0ARl0+Pw/4bT3GuLzG16z+hdyMFNX3MuLrK/LKTTkM4IJJASMdIJzP+GctNlnvwc5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hbw5ZOGaADJiCK1Q5f7H8+xSUZCKfWRAGqWlHJrneZI=;
 b=Dao+LPavmQ1nrGe1dVa0Wstf3eseRv+lVEPx+stTn4n6UE7DBUSUOnA37humeemBE3znQvL0+qHEyLIGOQQ2JmgA6OF0xvZnWcKeBi4bpYWf4Msv/MIO52d7UTPmWLR3IxxjOdamnSWThanPW6oTv0t7X8JpQZfivKNPtudfT+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com (2603:10a6:20b:42d::15)
 by AS4PR04MB9651.eurprd04.prod.outlook.com (2603:10a6:20b:4ce::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 06:11:19 +0000
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::afb8:bb33:948f:d1e1]) by AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::afb8:bb33:948f:d1e1%4]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 06:11:19 +0000
From:   Iulia Tanasescu <iulia.tanasescu@nxp.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     Iulia Tanasescu <iulia.tanasescu@nxp.com>
Subject: [PATCH v2 1/1] Bluetooth: ISO: Add support for connecting multiple BISes
Date:   Mon, 29 May 2023 09:10:57 +0300
Message-Id: <20230529061057.3107-2-iulia.tanasescu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529061057.3107-1-iulia.tanasescu@nxp.com>
References: <20230529061057.3107-1-iulia.tanasescu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4PR09CA0013.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::19) To AS8PR04MB8898.eurprd04.prod.outlook.com
 (2603:10a6:20b:42d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8898:EE_|AS4PR04MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: b60f82d4-df60-4bda-aea1-08db600b84f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TEuJUOzCN2fSyiK1wtwot+8OD7vGx7V6dQ+G29/169MXvDf0ULIGUJ1VHZec/+hoM27CELZi8GHn/67VxDSofMZunVXioc5HWBCzhKZvduNkhb4h+Se7VIJOdWDVM9nF4YowzBAUT54aASyj6cLScUY/9ILMpsEXTGdssqk1GAhGJjjUPIvFH825IAItfreNb3NWMocgakadSPPDKo0jHAx+PvYAjr7jf2BEBfuWI92wO5Ck+zRYaF+cqG2to20ZJULTAmbiSgB70UDlfucG9bSc7kGj2CZ73q2WCIwVv2GXu1dOHZP2faH51QqwrSrROE2pjOz5VtdC6Eu7XOPNKTPELu4Y10yk5vu9HI5ZLSNP2fdHujyKKoj/G4JdWm0uJ6eFHgRK7lB4j0fZGx96Eq1m00GtaSaz3bjWmUxmASL4U5LG6jfZtn7waPjPpZcnScC4rVjjGSl9sRDS5KLgF84Gn3SQnRfs1u33RDwBIKWXpEvQpN58OSpslCTkYU14xksOP+g+aBjLFMI6xVZHMl3s6lHqrkfleXYDH7t9tJf1DJwyQ4DbvSC2XejHScG9BSNfT2/iI2J3F0T1TEAkeKoy29VkahBO+pBg4yF0xiekSolwJx0ioDdy6W3l35TW
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8898.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199021)(26005)(1076003)(38350700002)(38100700002)(41300700001)(52116002)(6666004)(6486002)(83380400001)(186003)(6512007)(6506007)(2616005)(478600001)(6916009)(66946007)(66556008)(66476007)(4326008)(316002)(5660300002)(8676002)(8936002)(44832011)(2906002)(30864003)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2CgEnXMz6Ij4F92NPhFGbJ3PLVveKaM/2fyMQcy8f8E/lHbqEkxMf4TGAlk4?=
 =?us-ascii?Q?YuYJgpC3sNZQ5FBuGKb91h/k1OgK0a6emQBrdQrQLP5rPxDqbrM6H3W5v95V?=
 =?us-ascii?Q?Hao0e9j/9uNSPUNldInao7YtXy7oOf3oWKnHq6Ym5gJHdoPsQ2KBfUJlXt4g?=
 =?us-ascii?Q?BRKwMJsSmgbEfQYowJMfnj3lccmOvaR2vwtHdiVCXIq8KQKGs6uw6pBagJhz?=
 =?us-ascii?Q?B4jlCf27PXaJywC0FYvgwtiXz7mDky/XqaUgUMI9/cy1CVxFGu40oIeQiWU0?=
 =?us-ascii?Q?H7zmOGgDNg9VxTLW1+rRYCQVG/yO6Vl3KBEOtj3L1ixF9cP33b/LOLl6feUV?=
 =?us-ascii?Q?eyrmSlTap/mqbPFASOOsE5wDFQdvVhteHyhmD0gn62bjie2IWXMPoAGt6egN?=
 =?us-ascii?Q?YkG8Cm/34p8Mp8P0p+KLOM0T06K3VHriBQvjeEMue4jUEp/HSi6NZB9UBcNH?=
 =?us-ascii?Q?zv0VGAWikDtTUUvf2uIlTen02kkLYEsVZzcmimDa47A/TnV24PxCfrVukzvn?=
 =?us-ascii?Q?LQWRjk/XQ8wrwHklhy53Yq9S6ZBGVjUUPmNwg2Yz+7fuN/WwubwlGsnBy45V?=
 =?us-ascii?Q?EVanDMXpGYPX2ahh1gHU18pwEuMXJ0Y3EEh6kVGSfwaw1PNYRahCGx2E1tfS?=
 =?us-ascii?Q?dXhQy5GPaj68XkjEKwueyg/HyuVRcihJuiZjR+mknjVpZQ5rNdcYp3o8lbV7?=
 =?us-ascii?Q?AYL+LhrI/70+gL8c0gKMDxpOxCrraOZ1BSY4+TCUqV3L8R9eDyP77tWwsP/F?=
 =?us-ascii?Q?BHdNf0LGlKF4S/VCEaBBUfEnVmvSDuecw/LArdKxDWlBktmgQWgcrFkmXB3m?=
 =?us-ascii?Q?F7Jglmr5VghJMThPVI8DMzUnCwWkrOotEJzEFdPfBQurjD3OQz0yugsa+MZi?=
 =?us-ascii?Q?iq6PlTydEJ9ntoNnFSiG3IO9Rww31yUS1MsBYg5pXIJF3IfqReOMuKZt9zk4?=
 =?us-ascii?Q?6FTNw+Uwh6UsmL0NNdZuOtFcottoeFULtaiA7eO8Hp51rAwU9PZ9yVkXJjXl?=
 =?us-ascii?Q?KTcdsnb8QMQ7HN9XoqEb2tHCNzxdFAlnUnGyPpKku9qBjX7+eGSkJJ9oxM43?=
 =?us-ascii?Q?YeFdonwtF9ero0LPcERTHCg2SwfmMExNwB6XEePxaCPYafFnuIXpob7ES8Oi?=
 =?us-ascii?Q?BZRqQ32780j0Wx0cZHDN3oq3Hcg6/0wRrqQ9eTCOpClQq2eck4tjLuDOFJl/?=
 =?us-ascii?Q?9kXnOW0uqFKnTZnyFklpSmjYr9NaYHY6jHCQafR9VAXXUpK1CgdaHVddbvmI?=
 =?us-ascii?Q?89YAzSw6J2Mrn2uFsgimeWRhUjeXuCgTsWU+mpiKIsm05aqMQICa63qultYa?=
 =?us-ascii?Q?/TwjBnrRqjRzioAqTlLigQabX6amxhJnvzmZPtm4Xgton5pPzEYhZnKDXig3?=
 =?us-ascii?Q?/1WaddHsampMNS/ukRL6tTEJUP1Iyiplfpixh4/R3FUUsuL9QOhbhmxYN8tl?=
 =?us-ascii?Q?7aRZNLwqcDam+1hahYPnNSUVcXuEo3ROd+X7S0yki0Pv/kqHF6VbiKV77WKO?=
 =?us-ascii?Q?JnpJZX2JFgmU+Z1m/Q2O+KRQLSddN3u3vaVufpJ4kP8BkSaFDRFwSiPyOiF6?=
 =?us-ascii?Q?FlwDp2rb2Uph5dpO53b+4MJFndAhs4sTMKPqan6gW6bLVrd6KU2NpCCt62im?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b60f82d4-df60-4bda-aea1-08db600b84f3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8898.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 06:11:19.6400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WcSVGiBjX9jzOGXG5JT+/tch/loqYG0sqKAYsS023NQGCcLdHPDONHBhmPXykCqeQYpGRBM5/s3DtLSyaIflBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9651
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

It is required for some configurations to have multiple BISes as part
of the same BIG.

Similar to the flow implemented for unicast, DEFER_SETUP will also be
used to bind multiple BISes for the same BIG, before starting Periodic
Advertising and creating the BIG.

The user will have to open a new socket for each BIS. By setting the
BT_DEFER_SETUP socket option and calling connect, a new connection
will be added for the BIG and advertising handle set by the socket
QoS parameters. Since all BISes will be bound for the same BIG and
advertising handle, the socket QoS options and base parameters should
match for all connections.

By calling connect on a socket that does not have the BT_DEFER_SETUP
option set, periodic advertising will be started and the BIG will
be created, with a BIS for each previously bound connection. Since
a BIG cannot be reconfigured with additional BISes after creation,
no more connections can be bound for the BIG after the start periodic
advertising and create BIG commands have been queued.

The bis_cleanup function has also been updated, so that the advertising
set and the BIG will not be terminated unless there are no more
bound or connected BISes.

The HCI_CONN_BIG_CREATED connection flag has been added to indicate
that the BIG has been successfully created. This flag is checked at
bis_cleanup, so that the BIG is only terminated if the
HCI_LE_Create_BIG_Complete has been received.

This implementation has been tested on hardware, using the "isotest"
tool with an additional command line option, to specify the number of
BISes to create as part of the desired BIG:

    tools/isotest -i hci0 -s 00:00:00:00:00:00 -N 2 -G 1 -T 1

The btmon log shows that a BIG containing 2 BISes has been created:

< HCI Command: LE Create Broadcast Isochronous Group (0x08|0x0068) plen 31
        Handle: 0x01
        Advertising Handle: 0x01
        Number of BIS: 2
        SDU Interval: 10000 us (0x002710)
        Maximum SDU size: 40
        Maximum Latency: 10 ms (0x000a)
        RTN: 0x02
        PHY: LE 2M (0x02)
        Packing: Sequential (0x00)
        Framing: Unframed (0x00)
        Encryption: 0x00
        Broadcast Code: 00000000000000000000000000000000

> HCI Event: Command Status (0x0f) plen 4
      LE Create Broadcast Isochronous Group (0x08|0x0068) ncmd 1
        Status: Success (0x00)

> HCI Event: LE Meta Event (0x3e) plen 23
      LE Broadcast Isochronous Group Complete (0x1b)
        Status: Success (0x00)
        Handle: 0x01
        BIG Synchronization Delay: 1974 us (0x0007b6)
        Transport Latency: 1974 us (0x0007b6)
        PHY: LE 2M (0x02)
        NSE: 3
        BN: 1
        PTO: 1
        IRC: 3
        Maximum PDU: 40
        ISO Interval: 10.00 msec (0x0008)
        Connection Handle #0: 10
        Connection Handle #1: 11

< HCI Command: LE Setup Isochronous Data Path (0x08|0x006e) plen 13
        Handle: 10
        Data Path Direction: Input (Host to Controller) (0x00)
        Data Path: HCI (0x00)
        Coding Format: Transparent (0x03)
        Company Codec ID: Ericsson Technology Licensing (0)
        Vendor Codec ID: 0
        Controller Delay: 0 us (0x000000)
        Codec Configuration Length: 0
        Codec Configuration: 

> HCI Event: Command Complete (0x0e) plen 6
      LE Setup Isochronous Data Path (0x08|0x006e) ncmd 1
        Status: Success (0x00)
        Handle: 10

< HCI Command: LE Setup Isochronous Data Path (0x08|0x006e) plen 13
        Handle: 11
        Data Path Direction: Input (Host to Controller) (0x00)
        Data Path: HCI (0x00)
        Coding Format: Transparent (0x03)
        Company Codec ID: Ericsson Technology Licensing (0)
        Vendor Codec ID: 0
        Controller Delay: 0 us (0x000000)
        Codec Configuration Length: 0
        Codec Configuration: 

> HCI Event: Command Complete (0x0e) plen 6
      LE Setup Isochronous Data Path (0x08|0x006e) ncmd 1
        Status: Success (0x00)
        Handle: 11

< ISO Data TX: Handle 10 flags 0x02 dlen 44

< ISO Data TX: Handle 11 flags 0x02 dlen 44

> HCI Event: Number of Completed Packets (0x13) plen 5
        Num handles: 1
        Handle: 10
        Count: 1

> HCI Event: Number of Completed Packets (0x13) plen 5
        Num handles: 1
        Handle: 11
        Count: 1

Signed-off-by: Iulia Tanasescu <iulia.tanasescu@nxp.com>
---
 include/net/bluetooth/hci_core.h |  30 +++++++
 net/bluetooth/hci_conn.c         | 147 ++++++++++++++++++++++---------
 net/bluetooth/hci_event.c        |  50 ++++++-----
 net/bluetooth/iso.c              |  28 ++++--
 4 files changed, 186 insertions(+), 69 deletions(-)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 9f37326c1c05..74ec1f40ab6b 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -975,6 +975,7 @@ enum {
 	HCI_CONN_SCANNING,
 	HCI_CONN_AUTH_FAILURE,
 	HCI_CONN_PER_ADV,
+	HCI_CONN_BIG_CREATED,
 };
 
 static inline bool hci_conn_ssp_enabled(struct hci_conn *conn)
@@ -1116,6 +1117,32 @@ static inline struct hci_conn *hci_conn_hash_lookup_bis(struct hci_dev *hdev,
 	return NULL;
 }
 
+static inline struct hci_conn *
+hci_conn_hash_lookup_per_adv_bis(struct hci_dev *hdev,
+				 bdaddr_t *ba,
+				 __u8 big, __u8 bis)
+{
+	struct hci_conn_hash *h = &hdev->conn_hash;
+	struct hci_conn  *c;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(c, &h->list, list) {
+		if (bacmp(&c->dst, ba) || c->type != ISO_LINK ||
+			!test_bit(HCI_CONN_PER_ADV, &c->flags))
+			continue;
+
+		if (c->iso_qos.bcast.big == big &&
+		    c->iso_qos.bcast.bis == bis) {
+			rcu_read_unlock();
+			return c;
+		}
+	}
+	rcu_read_unlock();
+
+	return NULL;
+}
+
 static inline struct hci_conn *hci_conn_hash_lookup_handle(struct hci_dev *hdev,
 								__u16 handle)
 {
@@ -1351,6 +1378,9 @@ struct hci_conn *hci_connect_sco(struct hci_dev *hdev, int type, bdaddr_t *dst,
 				 __u16 setting, struct bt_codec *codec);
 struct hci_conn *hci_bind_cis(struct hci_dev *hdev, bdaddr_t *dst,
 			      __u8 dst_type, struct bt_iso_qos *qos);
+struct hci_conn *hci_bind_bis(struct hci_dev *hdev, bdaddr_t *dst,
+			      struct bt_iso_qos *qos,
+			      __u8 base_len, __u8 *base);
 struct hci_conn *hci_connect_cis(struct hci_dev *hdev, bdaddr_t *dst,
 				 __u8 dst_type, struct bt_iso_qos *qos);
 struct hci_conn *hci_connect_bis(struct hci_dev *hdev, bdaddr_t *dst,
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 1f906f8508bc..0838c0256a7e 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -790,6 +790,7 @@ struct iso_list_data {
 		struct hci_cp_le_set_cig_params cp;
 		struct hci_cis_params cis[0x11];
 	} pdu;
+	bool big_term;
 };
 
 static void bis_list(struct hci_conn *conn, void *data)
@@ -826,11 +827,8 @@ static int terminate_big_sync(struct hci_dev *hdev, void *data)
 
 	hci_remove_ext_adv_instance_sync(hdev, d->bis, NULL);
 
-	/* Check if ISO connection is a BIS and terminate BIG if there are
-	 * no other connections using it.
-	 */
-	hci_conn_hash_list_state(hdev, find_bis, ISO_LINK, BT_CONNECTED, d);
-	if (d->count)
+	/* Only terminate BIG if it has been created */
+	if (!d->big_term)
 		return 0;
 
 	return hci_le_terminate_big_sync(hdev, d->big,
@@ -842,7 +840,8 @@ static void terminate_big_destroy(struct hci_dev *hdev, void *data, int err)
 	kfree(data);
 }
 
-static int hci_le_terminate_big(struct hci_dev *hdev, u8 big, u8 bis)
+static int hci_le_terminate_big(struct hci_dev *hdev, u8 big, u8 bis,
+				bool big_term)
 {
 	struct iso_list_data *d;
 	int ret;
@@ -855,6 +854,7 @@ static int hci_le_terminate_big(struct hci_dev *hdev, u8 big, u8 bis)
 
 	d->big = big;
 	d->bis = bis;
+	d->big_term = big_term;
 
 	ret = hci_cmd_sync_queue(hdev, terminate_big_sync, d,
 				 terminate_big_destroy);
@@ -914,6 +914,7 @@ static int hci_le_big_terminate(struct hci_dev *hdev, u8 big, u16 sync_handle)
 static void bis_cleanup(struct hci_conn *conn)
 {
 	struct hci_dev *hdev = conn->hdev;
+	struct hci_conn *bis;
 
 	bt_dev_dbg(hdev, "conn %p", conn);
 
@@ -921,8 +922,19 @@ static void bis_cleanup(struct hci_conn *conn)
 		if (!test_and_clear_bit(HCI_CONN_PER_ADV, &conn->flags))
 			return;
 
+		/* Check if ISO connection is a BIS and terminate advertising
+		 * set and BIG if there are no other connections using it.
+		 */
+		bis = hci_conn_hash_lookup_bis(hdev, BDADDR_ANY,
+					       conn->iso_qos.bcast.big,
+					       conn->iso_qos.bcast.bis);
+		if (bis)
+			return;
+
 		hci_le_terminate_big(hdev, conn->iso_qos.bcast.big,
-				     conn->iso_qos.bcast.bis);
+				     conn->iso_qos.bcast.bis,
+				     test_and_clear_bit(HCI_CONN_BIG_CREATED,
+							&conn->flags));
 	} else {
 		hci_le_big_terminate(hdev, conn->iso_qos.bcast.big,
 				     conn->sync_handle);
@@ -1491,10 +1503,10 @@ static int qos_set_bis(struct hci_dev *hdev, struct bt_iso_qos *qos)
 
 /* This function requires the caller holds hdev->lock */
 static struct hci_conn *hci_add_bis(struct hci_dev *hdev, bdaddr_t *dst,
-				    struct bt_iso_qos *qos)
+				    struct bt_iso_qos *qos, __u8 base_len,
+				    __u8 *base)
 {
 	struct hci_conn *conn;
-	struct iso_list_data data;
 	int err;
 
 	/* Let's make sure that le is enabled.*/
@@ -1512,24 +1524,27 @@ static struct hci_conn *hci_add_bis(struct hci_dev *hdev, bdaddr_t *dst,
 	if (err)
 		return ERR_PTR(err);
 
-	data.big = qos->bcast.big;
-	data.bis = qos->bcast.bis;
-	data.count = 0;
-
-	/* Check if there is already a matching BIG/BIS */
-	hci_conn_hash_list_state(hdev, bis_list, ISO_LINK, BT_BOUND, &data);
-	if (data.count)
+	/* Check if the LE Create BIG command has already been sent */
+	conn = hci_conn_hash_lookup_per_adv_bis(hdev, dst, qos->bcast.big,
+						qos->bcast.big);
+	if (conn)
 		return ERR_PTR(-EADDRINUSE);
 
-	conn = hci_conn_hash_lookup_bis(hdev, dst, qos->bcast.big, qos->bcast.bis);
-	if (conn)
+	/* Check BIS settings against other bound BISes, since all
+	 * BISes in a BIG must have the same value for all parameters
+	 */
+	conn = hci_conn_hash_lookup_bis(hdev, dst, qos->bcast.big,
+					qos->bcast.bis);
+
+	if (conn && (memcmp(qos, &conn->iso_qos, sizeof(*qos)) ||
+		     base_len != conn->le_per_adv_data_len ||
+		     memcmp(conn->le_per_adv_data, base, base_len)))
 		return ERR_PTR(-EADDRINUSE);
 
 	conn = hci_conn_add(hdev, ISO_LINK, dst, HCI_ROLE_MASTER);
 	if (!conn)
 		return ERR_PTR(-ENOMEM);
 
-	set_bit(HCI_CONN_PER_ADV, &conn->flags);
 	conn->state = BT_CONNECT;
 
 	hci_conn_hold(conn);
@@ -1743,12 +1758,21 @@ static int hci_le_create_big(struct hci_conn *conn, struct bt_iso_qos *qos)
 {
 	struct hci_dev *hdev = conn->hdev;
 	struct hci_cp_le_create_big cp;
+	struct iso_list_data data;
 
 	memset(&cp, 0, sizeof(cp));
 
+	data.big = qos->bcast.big;
+	data.bis = qos->bcast.bis;
+	data.count = 0;
+
+	/* Create a BIS for each bound connection */
+	hci_conn_hash_list_state(hdev, bis_list, ISO_LINK,
+				 BT_BOUND, &data);
+
 	cp.handle = qos->bcast.big;
 	cp.adv_handle = qos->bcast.bis;
-	cp.num_bis  = 0x01;
+	cp.num_bis  = data.count;
 	hci_cpu_to_le24(qos->bcast.out.interval, cp.bis.sdu_interval);
 	cp.bis.sdu = cpu_to_le16(qos->bcast.out.sdu);
 	cp.bis.latency =  cpu_to_le16(qos->bcast.out.latency);
@@ -2020,16 +2044,6 @@ static void hci_iso_qos_setup(struct hci_dev *hdev, struct hci_conn *conn,
 		qos->latency = conn->le_conn_latency;
 }
 
-static void hci_bind_bis(struct hci_conn *conn,
-			 struct bt_iso_qos *qos)
-{
-	/* Update LINK PHYs according to QoS preference */
-	conn->le_tx_phy = qos->bcast.out.phy;
-	conn->le_tx_phy = qos->bcast.out.phy;
-	conn->iso_qos = *qos;
-	conn->state = BT_BOUND;
-}
-
 static int create_big_sync(struct hci_dev *hdev, void *data)
 {
 	struct hci_conn *conn = data;
@@ -2152,27 +2166,80 @@ static void create_big_complete(struct hci_dev *hdev, void *data, int err)
 	}
 }
 
-struct hci_conn *hci_connect_bis(struct hci_dev *hdev, bdaddr_t *dst,
-				 __u8 dst_type, struct bt_iso_qos *qos,
-				 __u8 base_len, __u8 *base)
+struct hci_conn *hci_bind_bis(struct hci_dev *hdev, bdaddr_t *dst,
+			      struct bt_iso_qos *qos,
+			      __u8 base_len, __u8 *base)
 {
 	struct hci_conn *conn;
-	int err;
+	__u8 eir[HCI_MAX_PER_AD_LENGTH];
+
+	if (base_len && base)
+		base_len = eir_append_service_data(eir, 0,  0x1851,
+						   base, base_len);
 
 	/* We need hci_conn object using the BDADDR_ANY as dst */
-	conn = hci_add_bis(hdev, dst, qos);
+	conn = hci_add_bis(hdev, dst, qos, base_len, eir);
 	if (IS_ERR(conn))
 		return conn;
 
-	hci_bind_bis(conn, qos);
+	/* Update LINK PHYs according to QoS preference */
+	conn->le_tx_phy = qos->bcast.out.phy;
+	conn->le_tx_phy = qos->bcast.out.phy;
 
 	/* Add Basic Announcement into Peridic Adv Data if BASE is set */
 	if (base_len && base) {
-		base_len = eir_append_service_data(conn->le_per_adv_data, 0,
-						   0x1851, base, base_len);
+		memcpy(conn->le_per_adv_data,  eir, sizeof(eir));
 		conn->le_per_adv_data_len = base_len;
 	}
 
+	hci_iso_qos_setup(hdev, conn, &qos->bcast.out,
+			  conn->le_tx_phy ? conn->le_tx_phy :
+			  hdev->le_tx_def_phys);
+
+	conn->iso_qos = *qos;
+	conn->state = BT_BOUND;
+
+	return conn;
+}
+
+static void bis_mark_per_adv(struct hci_conn *conn, void *data)
+{
+	struct iso_list_data *d = data;
+
+	/* Skip if not broadcast/ANY address */
+	if (bacmp(&conn->dst, BDADDR_ANY))
+		return;
+
+	if (d->big != conn->iso_qos.bcast.big ||
+	    d->bis == BT_ISO_QOS_BIS_UNSET ||
+	    d->bis != conn->iso_qos.bcast.bis)
+		return;
+
+	set_bit(HCI_CONN_PER_ADV, &conn->flags);
+}
+
+struct hci_conn *hci_connect_bis(struct hci_dev *hdev, bdaddr_t *dst,
+				 __u8 dst_type, struct bt_iso_qos *qos,
+				 __u8 base_len, __u8 *base)
+{
+	struct hci_conn *conn;
+	int err;
+	struct iso_list_data data;
+
+	conn = hci_bind_bis(hdev, dst, qos, base_len, base);
+	if (IS_ERR(conn))
+		return conn;
+
+	data.big = qos->bcast.big;
+	data.bis = qos->bcast.bis;
+
+	/* Set HCI_CONN_PER_ADV for all bound connections, to mark that
+	 * the start periodic advertising and create BIG commands have
+	 * been queued
+	 */
+	hci_conn_hash_list_state(hdev, bis_mark_per_adv, ISO_LINK,
+				 BT_BOUND, &data);
+
 	/* Queue start periodic advertising and create BIG */
 	err = hci_cmd_sync_queue(hdev, create_big_sync, conn,
 				 create_big_complete);
@@ -2181,10 +2248,6 @@ struct hci_conn *hci_connect_bis(struct hci_dev *hdev, bdaddr_t *dst,
 		return ERR_PTR(err);
 	}
 
-	hci_iso_qos_setup(hdev, conn, &qos->bcast.out,
-			  conn->le_tx_phy ? conn->le_tx_phy :
-			  hdev->le_tx_def_phys);
-
 	return conn;
 }
 
diff --git a/net/bluetooth/hci_event.c b/net/bluetooth/hci_event.c
index d00ef6e3fc45..c24958af525a 100644
--- a/net/bluetooth/hci_event.c
+++ b/net/bluetooth/hci_event.c
@@ -6910,6 +6910,7 @@ static void hci_le_create_big_complete_evt(struct hci_dev *hdev, void *data,
 {
 	struct hci_evt_le_create_big_complete *ev = data;
 	struct hci_conn *conn;
+	__u8 bis_idx = 0;
 
 	BT_DBG("%s status 0x%2.2x", hdev->name, ev->status);
 
@@ -6918,33 +6919,42 @@ static void hci_le_create_big_complete_evt(struct hci_dev *hdev, void *data,
 		return;
 
 	hci_dev_lock(hdev);
+	rcu_read_lock();
 
-	conn = hci_conn_hash_lookup_big(hdev, ev->handle);
-	if (!conn)
-		goto unlock;
+	/* Connect all BISes that are bound to the BIG */
+	list_for_each_entry_rcu(conn, &hdev->conn_hash.list, list) {
+		if (bacmp(&conn->dst, BDADDR_ANY) ||
+		    conn->type != ISO_LINK ||
+		    conn->iso_qos.bcast.big != ev->handle)
+			continue;
 
-	if (conn->type != ISO_LINK) {
-		bt_dev_err(hdev,
-			   "Invalid connection link type handle 0x%2.2x",
-			   ev->handle);
-		goto unlock;
-	}
+		conn->handle = __le16_to_cpu(ev->bis_handle[bis_idx++]);
 
-	if (ev->num_bis)
-		conn->handle = __le16_to_cpu(ev->bis_handle[0]);
+		if (!ev->status) {
+			conn->state = BT_CONNECTED;
+			set_bit(HCI_CONN_BIG_CREATED, &conn->flags);
+			hci_debugfs_create_conn(conn);
+			hci_conn_add_sysfs(conn);
+			hci_iso_setup_path(conn);
+			continue;
+		}
 
-	if (!ev->status) {
-		conn->state = BT_CONNECTED;
-		hci_debugfs_create_conn(conn);
-		hci_conn_add_sysfs(conn);
-		hci_iso_setup_path(conn);
-		goto unlock;
+		hci_connect_cfm(conn, ev->status);
+		rcu_read_unlock();
+		hci_conn_del(conn);
+		rcu_read_lock();
 	}
 
-	hci_connect_cfm(conn, ev->status);
-	hci_conn_del(conn);
+	if (!ev->status && !bis_idx)
+		/* If no BISes have been connected for the BIG,
+		 * terminate. This is in case all bound connections
+		 * have been closed before the BIG creation
+		 * has completed.
+		 */
+		hci_le_terminate_big_sync(hdev, ev->handle,
+					  HCI_ERROR_LOCAL_HOST_TERM);
 
-unlock:
+	rcu_read_unlock();
 	hci_dev_unlock(hdev);
 }
 
diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index 34d55a85d8f6..485348fcc030 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -284,13 +284,24 @@ static int iso_connect_bis(struct sock *sk)
 		goto unlock;
 	}
 
-	hcon = hci_connect_bis(hdev, &iso_pi(sk)->dst,
-			       le_addr_type(iso_pi(sk)->dst_type),
-			       &iso_pi(sk)->qos, iso_pi(sk)->base_len,
-			       iso_pi(sk)->base);
-	if (IS_ERR(hcon)) {
-		err = PTR_ERR(hcon);
-		goto unlock;
+	/* Just bind if DEFER_SETUP has been set */
+	if (test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags)) {
+		hcon = hci_bind_bis(hdev, &iso_pi(sk)->dst,
+				    &iso_pi(sk)->qos, iso_pi(sk)->base_len,
+				    iso_pi(sk)->base);
+		if (IS_ERR(hcon)) {
+			err = PTR_ERR(hcon);
+			goto unlock;
+		}
+	} else {
+		hcon = hci_connect_bis(hdev, &iso_pi(sk)->dst,
+				       le_addr_type(iso_pi(sk)->dst_type),
+				       &iso_pi(sk)->qos, iso_pi(sk)->base_len,
+				       iso_pi(sk)->base);
+		if (IS_ERR(hcon)) {
+			err = PTR_ERR(hcon);
+			goto unlock;
+		}
 	}
 
 	conn = iso_conn_add(hcon);
@@ -315,6 +326,9 @@ static int iso_connect_bis(struct sock *sk)
 	if (hcon->state == BT_CONNECTED) {
 		iso_sock_clear_timer(sk);
 		sk->sk_state = BT_CONNECTED;
+	} else if (test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags)) {
+		iso_sock_clear_timer(sk);
+		sk->sk_state = BT_CONNECT;
 	} else {
 		sk->sk_state = BT_CONNECT;
 		iso_sock_set_timer(sk, sk->sk_sndtimeo);
-- 
2.34.1

