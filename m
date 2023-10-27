Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 505137D9C5F
	for <lists+linux-bluetooth@lfdr.de>; Fri, 27 Oct 2023 16:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346260AbjJ0O5I (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Fri, 27 Oct 2023 10:57:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346220AbjJ0O5D (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Fri, 27 Oct 2023 10:57:03 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2085.outbound.protection.outlook.com [40.107.247.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5285A1B9
        for <linux-bluetooth@vger.kernel.org>; Fri, 27 Oct 2023 07:57:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCO66b2/WePlqiTAGSe2fOVmdtvCkEQSgQT1mOloRTMjuP+4hnSaDfn4XHfYrxUUuueqe5hf67KrDELyhwlwLHPDRrpNy/4763NszGDJ+gGoyRFcu87RIayamX/quOQ0tiJiS2j/9RXcd6UCYa/+sFoLu5qCieHSYxrJI53UqrZ3i1wC8MatNz8XNLgwXyWyvAtpNY79uxORjkImjPPofBxjv3VOEjdly36H9VQ/IIKkY/8eizoQNaFH4PFhsvgIfas3g5H08c0X09fz2y/cFw28N3ac8Qp9DZaH6iwiUUIvqzL/244DKxS5AILILc6hLmc+NL4XnYoV4Fr2oEtyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hx/1bkmBgn0AQVcwp9xtbWkHRhHXp+dnBZkwfL3yE8M=;
 b=CDcgIC2BYeAV+MMvgv968jsPEaF2Xd+C09vBH+0L11tQwxiym/gWshbkUTHqXn367YhLYruXnUia8mq/6tFLPYEFsNvUGgdJxc1tyFmF+C6HkDshT80NVsFcMrOdZRfPnSOBpaFi44Ig0rLpCmgxETw2XmnlDVR8gSB5noHX9XDzwD7iNHtiYRCDYvgOY/gHAwq+hxQV/TjR5SFRQRNv2rwSD2BsHfyPthwwfpFe2TA0MUFpdOsE7LTgHlKSnHw6SIvmFEXDwXRCkKK3KZnkcp7ZZnFkZtHLLMT7j4nLWE3j2UZoS0+b0hEXdftLik0KEYxMG4vBkd4gHHtkTC4xsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx/1bkmBgn0AQVcwp9xtbWkHRhHXp+dnBZkwfL3yE8M=;
 b=CrFtMZZWUu9I2pJBH02Ic4me5UDcdHLSHB4aP0b9UmMnKjSxpykeoDckesDTyTRUIC9e19wuIa0zWPqT3RIY5E3/1thRUZs1BSXYm+FB4Iya36gGGH5VBR7Uaewgbr/Z3OsfyZfxOpa9ERKqqN42ig/O1FFoMs9Ptnzc9MuWSsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com (2603:10a6:20b:42d::15)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Fri, 27 Oct
 2023 14:56:58 +0000
Received: from AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::35fb:6e51:ad06:4a09]) by AS8PR04MB8898.eurprd04.prod.outlook.com
 ([fe80::35fb:6e51:ad06:4a09%3]) with mapi id 15.20.6954.011; Fri, 27 Oct 2023
 14:56:58 +0000
From:   Iulia Tanasescu <iulia.tanasescu@nxp.com>
To:     linux-bluetooth@vger.kernel.org
Cc:     claudia.rosu@nxp.com, mihai-octavian.urzica@nxp.com,
        silviu.barbulescu@nxp.com, vlad.pruteanu@nxp.com,
        andrei.istodorescu@nxp.com, luiz.dentz@gmail.com,
        Iulia Tanasescu <iulia.tanasescu@nxp.com>
Subject: [PATCH 1/1] Bluetooth: ISO: Reassociate a socket with an active BIS
Date:   Fri, 27 Oct 2023 17:56:48 +0300
Message-Id: <20231027145648.2846-2-iulia.tanasescu@nxp.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231027145648.2846-1-iulia.tanasescu@nxp.com>
References: <20231027145648.2846-1-iulia.tanasescu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR04CA0133.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::31) To AS8PR04MB8898.eurprd04.prod.outlook.com
 (2603:10a6:20b:42d::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8898:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: c30fe8ec-75e7-438d-ca7b-08dbd6fcf812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g3Qi+PoIKkN1jU3gnboT4M1gRv8L6fkHNsSEWYFGW3uIYzdBjmX6Oe1nsvVTtRLa0akmh30gDVMwQDH0091/1FXiv4QYWPt1hq+7W+pYKgACEb8zPgwH3lIy85UkXPntWYG1QlyUreUmLAs0Nz+wuXHyc22cW12U0GWx4TQt2UhzmftUy5Jt3bq5PdgASsmHQoYEdUVKAO3hdYaxvqcjefpHk04QVD0AeBCUWfzzS65n65Cw4QjKmNfnsTz7kKuJOkP6G0ECdJHFySQZ7+dlRYDbPgJ9dKyFU5SUern+Vapt8dT9MDRDPEwEzxhkMFNyiOnM6jIA3kswFvUfhetlHB9a4ykfR63AC0JTCDIJoNo873Uzlbr1rbyvJjDTgyFWMseWlKPimjdT+0bW+TpwRVZbfNIxv8amosdfneq+IBgzqffDTXJS4mZOhe/xMs5UgM28PoI/tu+vVqnU2ixevG7zdSS4DO3I3BhoXvtbfEonb3XBHduwdLmotAU2k86dLcptlL5yv7G5jNc4UdDZ6ZD/svPFgV0hhL78ta018rBkJSjKV/V+vuVo68Grzpuc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8898.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(86362001)(2906002)(44832011)(41300700001)(6916009)(36756003)(316002)(66556008)(1076003)(4326008)(8936002)(8676002)(66476007)(5660300002)(66946007)(6486002)(38100700002)(478600001)(83380400001)(26005)(6506007)(2616005)(6666004)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MYKJwSimNshowGumAqjQitU7YDGpZ1kVtm72+1NMMtq00gbYVPZmiDG2Wqhu?=
 =?us-ascii?Q?fjfu0MrhQ1ywQ04MECXb3m7dtouHrDRBjhx813xwfq9EsJwRzM9N2vaRyDOO?=
 =?us-ascii?Q?Whs+IwUrIffnkDAaHM2tQcjq/XlfGT+wG/GYldoCm/7VARf7R1VPoKrxypDf?=
 =?us-ascii?Q?tg708SszW56sSjvzpCBmXxaYHk2Fk82zYQY76Tp3uuZh2hhw7yKcWwtf0FfO?=
 =?us-ascii?Q?IY6diXg7BFI6xpVNkmkGGgx95PTaO6WxpBH8Q/8I4FD2FyGQJ9ljs22+uAa4?=
 =?us-ascii?Q?r0ISgtkHnmIOvhbV+2wqcgqzIcm5IKpOYyaxssnBHPQIveBz3v83vmEdvJbO?=
 =?us-ascii?Q?RW1o55Bt5TQvFZbRV4KS5+yqTMUSQ69449dIX0/lcZViYk++/0bdK17MTCzw?=
 =?us-ascii?Q?WQObvYlsUYsYot3dZLl1nZMmbueHiZSQaohKT1vMeC8UFKWkWY7pYBT0JYIB?=
 =?us-ascii?Q?n8T6fo5yReWq+U5P6RYKt87LO3Kl2pp05UWg/wD/kpsntLCSXR6pYrabpgDJ?=
 =?us-ascii?Q?3M7n0TafgMd4ELSrcAwg/9poxQ44Icw0q+5fI71n5+MfnFMoU0ugVzvtKAxu?=
 =?us-ascii?Q?c8joiZZ71UUT2/7GSjv/lhs5bS8ZbKyAdf1XFXX1+pF2vVecWS2jY1oTls7K?=
 =?us-ascii?Q?XRCpjjuKKrgWUP8xwi/ra8kisjDp46YAIJvcBWbtvg5Z/eY2SvNUAsYkI0AB?=
 =?us-ascii?Q?WIzcNHv5241fqJr6DLNwJ511r75F3r7EuqVdQNRPzzU5I2DdPri94lmeJeDo?=
 =?us-ascii?Q?3A1wO16xl0OR5/w3SwknKkQ5KHHY0p3vpUT3F0uTY3kNRgMgkZiM8YpXAf9W?=
 =?us-ascii?Q?Rf94GCSd3Ns3tkeT8Sms11d738gfggE1IoEGPUFda38EO/7EseuuSpLRnTfc?=
 =?us-ascii?Q?oQNNYvBVk1xPqG9qbrm4ihAI9PNirsCR4XumK8CPETuElIqSgePLyGuu3jbI?=
 =?us-ascii?Q?4mq1F1SSXA97ePiVDSJs/OZKT3PNsVRrZhdG57/kreX8hGQAIyS93l6dzhSU?=
 =?us-ascii?Q?GNG3PgCw9VQn9wmqxJmzf4U9UcX0AP2gR7DAEqbGvHDzNoaoioA1qgEyMYP1?=
 =?us-ascii?Q?DK1FZcTVA24ZMm/dwzubYnusfWqma+SB00F0Zwtvh98GQqIkmMz2NRkcciXx?=
 =?us-ascii?Q?PP8f6Vf5ujMrC3IATGZ32FeZ5+Zf80wDieMi6+d1nGhXmq6oXmqIOhvv9woC?=
 =?us-ascii?Q?9EP7sSI8Y1u2soP+XV29OWfQARldjZZ2I+Efi4tDrfpKfgdshOiqOFae+jVY?=
 =?us-ascii?Q?fGOmHg5t7jAba27BonlTJnQSGevxSOnx8hvsG3R5m4DeFtOtC0rE/7VW9Nxu?=
 =?us-ascii?Q?vcBWMs8jqK7lxuzlV/O2DDrq0uPrxQ84k6IsuFlom/OgKk1jNzQe9/86yGDZ?=
 =?us-ascii?Q?GgkKN8Ne6EV4NgIB52JwLGS2Hf0BrJY2DbKOver+bQ1B8z6DhurUsI3tCi4U?=
 =?us-ascii?Q?uYHOcsLOdPr58kbiEPynI17SJSPrIDAtYDn7FGhRckXm7DFsvithHulvtenH?=
 =?us-ascii?Q?2EhPFKquyDIwSUAI1O6W5Tgws3eEHLqodR+ODPM5HkWtzSVzXYk1E3KOwlcO?=
 =?us-ascii?Q?apZdunznD+w5ZVGhMrEL2BbkP0TCDpeVaY31JeGTSHMXR4IMWUdO72n5RL2v?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c30fe8ec-75e7-438d-ca7b-08dbd6fcf812
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8898.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 14:56:58.6335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4izIK1XiObiEoRw8RkyTvo5Iokq/GYnd7CXoUWKu3KKEBMaMFftT2RtxvbBmOL0Q5PqPPiSao2FBTk6RS6lhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7820
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

For ISO Broadcast, all BISes from a BIG have the same lifespan - they
cannot be created or terminated independently from each other.

This links together all BIS hcons that are part of the same BIG, so all
hcons are kept alive as long as the BIG is active.

If multiple BIS sockets are opened for a BIG handle, and only part of
them are closed at some point, the associated hcons will be marked as
open. If new sockets will later be opened for the same BIG, they will
be reassociated with the open BIS hcons.

All BIS hcons will be cleaned up and the BIG will be terminated when
the last BIS socket is closed from userspace.

Signed-off-by: Iulia Tanasescu <iulia.tanasescu@nxp.com>
---
 include/net/bluetooth/hci_core.h | 24 +++++++++++++
 net/bluetooth/hci_conn.c         | 27 ++++++++++++++
 net/bluetooth/iso.c              | 60 ++++++++++++++++++++++++++++++++
 3 files changed, 111 insertions(+)

diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 20988623c5cc..201c0809540a 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -1292,6 +1292,30 @@ static inline struct hci_conn *hci_conn_hash_lookup_big(struct hci_dev *hdev,
 	return NULL;
 }
 
+static inline struct hci_conn *
+hci_conn_hash_lookup_big_state(struct hci_dev *hdev, __u8 handle,  __u16 state)
+{
+	struct hci_conn_hash *h = &hdev->conn_hash;
+	struct hci_conn  *c;
+
+	rcu_read_lock();
+
+	list_for_each_entry_rcu(c, &h->list, list) {
+		if (bacmp(&c->dst, BDADDR_ANY) || c->type != ISO_LINK ||
+			c->state != state)
+			continue;
+
+		if (handle == c->iso_qos.bcast.big) {
+			rcu_read_unlock();
+			return c;
+		}
+	}
+
+	rcu_read_unlock();
+
+	return NULL;
+}
+
 static inline struct hci_conn *
 hci_conn_hash_lookup_pa_sync_big_handle(struct hci_dev *hdev, __u8 big)
 {
diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 2cee330188ce..b8ab5c0cd48e 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -2228,7 +2228,17 @@ struct hci_conn *hci_bind_bis(struct hci_dev *hdev, bdaddr_t *dst,
 			      __u8 base_len, __u8 *base)
 {
 	struct hci_conn *conn;
+	struct hci_conn *parent;
 	__u8 eir[HCI_MAX_PER_AD_LENGTH];
+	struct hci_link *link;
+
+	/* Look for any BIS that is open for rebinding */
+	conn = hci_conn_hash_lookup_big_state(hdev, qos->bcast.big, BT_OPEN);
+	if (conn) {
+		memcpy(qos, &conn->iso_qos, sizeof(*qos));
+		conn->state = BT_CONNECTED;
+		return conn;
+	}
 
 	if (base_len && base)
 		base_len = eir_append_service_data(eir, 0,  0x1851,
@@ -2256,6 +2266,20 @@ struct hci_conn *hci_bind_bis(struct hci_dev *hdev, bdaddr_t *dst,
 	conn->iso_qos = *qos;
 	conn->state = BT_BOUND;
 
+	/* Link BISes together */
+	parent = hci_conn_hash_lookup_big(hdev,
+					  conn->iso_qos.bcast.big);
+	if (parent && parent != conn) {
+		link = hci_conn_link(parent, conn);
+		if (!link) {
+			hci_conn_drop(conn);
+			return ERR_PTR(-ENOLINK);
+		}
+
+		/* Link takes the refcount */
+		hci_conn_drop(conn);
+	}
+
 	return conn;
 }
 
@@ -2287,6 +2311,9 @@ struct hci_conn *hci_connect_bis(struct hci_dev *hdev, bdaddr_t *dst,
 	if (IS_ERR(conn))
 		return conn;
 
+	if (conn->state == BT_CONNECTED)
+		return conn;
+
 	data.big = qos->bcast.big;
 	data.bis = qos->bcast.bis;
 
diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index e01b6abe36fb..13353d7dc4b1 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -587,6 +587,44 @@ static struct sock *iso_get_sock_listen(bdaddr_t *src, bdaddr_t *dst,
 	return sk ? sk : sk1;
 }
 
+static struct sock *iso_get_sock_big(struct sock *match_sk, bdaddr_t *src,
+				     bdaddr_t *dst, uint8_t big)
+{
+	struct sock *sk = NULL;
+
+	read_lock(&iso_sk_list.lock);
+
+	sk_for_each(sk, &iso_sk_list.head) {
+		if (match_sk == sk)
+			continue;
+
+		/* Look for sockets that have already been
+		 * connected to the BIG
+		 */
+		if (sk->sk_state != BT_CONNECTED &&
+		    sk->sk_state != BT_CONNECT)
+			continue;
+
+		/* Match Broadcast destination */
+		if (bacmp(&iso_pi(sk)->dst, dst))
+			continue;
+
+		/* Match BIG handle */
+		if (iso_pi(sk)->qos.bcast.big != big)
+			continue;
+
+		/* Match source address */
+		if (bacmp(&iso_pi(sk)->src, src))
+			continue;
+
+		break;
+	}
+
+	read_unlock(&iso_sk_list.lock);
+
+	return sk;
+}
+
 static void iso_sock_destruct(struct sock *sk)
 {
 	BT_DBG("sk %p", sk);
@@ -639,6 +677,28 @@ static void iso_sock_kill(struct sock *sk)
 
 static void iso_sock_disconn(struct sock *sk)
 {
+	struct sock *bis_sk;
+	struct hci_conn *hcon = iso_pi(sk)->conn->hcon;
+
+	if (test_bit(HCI_CONN_BIG_CREATED, &hcon->flags)) {
+		bis_sk = iso_get_sock_big(sk, &iso_pi(sk)->src,
+					  &iso_pi(sk)->dst,
+					  iso_pi(sk)->qos.bcast.big);
+
+		/* If there are any other connected sockets for the
+		 * same BIG, just delete the sk and leave the bis
+		 * hcon active, in case later rebinding is needed.
+		 */
+		if (bis_sk) {
+			hcon->state = BT_OPEN;
+			iso_pi(sk)->conn->hcon = NULL;
+			release_sock(sk);
+			iso_conn_del(hcon, bt_to_errno(hcon->abort_reason));
+			lock_sock(sk);
+			return;
+		}
+	}
+
 	sk->sk_state = BT_DISCONN;
 	iso_sock_set_timer(sk, ISO_DISCONN_TIMEOUT);
 	iso_conn_lock(iso_pi(sk)->conn);
-- 
2.39.2

