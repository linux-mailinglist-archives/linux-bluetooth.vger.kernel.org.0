Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 453035F8CA8
	for <lists+linux-bluetooth@lfdr.de>; Sun,  9 Oct 2022 19:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbiJIRpU (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Sun, 9 Oct 2022 13:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbiJIRpR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Sun, 9 Oct 2022 13:45:17 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E961838A
        for <linux-bluetooth@vger.kernel.org>; Sun,  9 Oct 2022 10:45:14 -0700 (PDT)
Received: from monolith.lan (91-152-121-49.elisa-laajakaista.fi [91.152.121.49])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: pav)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id E89BB1B00126;
        Sun,  9 Oct 2022 20:45:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1665337512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=OfBcIOUpHSYGtN2naudQ3QEQ/sRFLlzyT54ERr0yf0Y=;
        b=BPug7GR41i/u+PLcnU4TsqUalRgdMNQq8yx8wAR/A4DTSpDDJY6Uvc3Qw8UitKI3TO4CgF
        vIP0P9HNbXfeTnZaWvMgTORCN4FkX/dqB931XkmAQ/dX0C8Ruitdf4jisn1eGyWj/SEKXN
        OVkgdiQ297Uvnzrzb7ZygekBhDP3MSe3Nx0pBEcYsNEx+U8pNI3G0V6rLAuJ8/2iAs6Pxx
        NLdBzRx4RtoPhXKWxSmS9nUzokL3vyIc/4KMj4TE0hxnyEBkY6EQA0/s/Lt3k8AZUbsBhy
        CJoD1m7njj443qaMw9BslT6No5XhpUa8e5ilp6+mWg1+9wVrwnE/Hj29kUKODg==
From:   Pauli Virtanen <pav@iki.fi>
To:     linux-bluetooth@vger.kernel.org
Cc:     Pauli Virtanen <pav@iki.fi>
Subject: [PATCH] Bluetooth: hci_conn: Fix CIS connection dst_type handling
Date:   Sun,  9 Oct 2022 20:42:15 +0300
Message-Id: <20221009174216.17533-1-pav@iki.fi>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=pav smtp.mailfrom=pav@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1665337512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=OfBcIOUpHSYGtN2naudQ3QEQ/sRFLlzyT54ERr0yf0Y=;
        b=Ptqp95LBvVZpy30d0uomN12g9DsD0sFoJWmzDEQ6TjOlVPxdmWsuu5+k27SF/LbsoZ7LsG
        hIRRobR0GWQ+FFu/yI0g0hpcoQjnl1nWnBB3kH6iNCoGGSlCHQ1BxjTSjH/7Ni48/HsAbd
        1HqoBw2FflGxKXCMsl6orp0xnRAXqEHydp1cDnGKmuHQb4MSXaLK4HVn4OQ5hwxjXNqP1Y
        gfRJ+fVfSh2qSlarHWQI3QMZ0bwckjl4gZWxDe1hMjv61myIc/Y5qC43LBWMqaKF/cueL3
        zIhzpfoZT1QFuwNAYpY4rudORgIPiW9llIVXS4q0N04cxVYNuEwYLE6Eo9l4aQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1665337512; a=rsa-sha256;
        cv=none;
        b=uSMjNjQb5FUZZth94aSh81cUJVXZRktaxYSy5247oZ6fWC+ziziW1Cx4J3ajEh4Gzvc3A+
        lAMdXJwb1r87cwZdfbCYpFV9Gr9df6nKdAAKLvoZ6K5naAxgzZ7MJTUfiZSn+iilTt2abZ
        zBbkPY9UZe6tlduPkxdRuprzCnZ8cmeMYf6Z6R7j5/qGBhue3zWERGPLqm5kJO8DwRhDX9
        L7kmXpXhQMZBZHMJdX76cnzFVUGo3KbzZ05o/5NFQVMfpyojrU1y0ESbgONaqP7IwROsF2
        ptnRMyAFXT9MS6zq4sTYxa9CG1MW/FOKYCAVis1oCCXmArw0SegI0LtG9mnHdQ==
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

hci_connect_cis and iso_connect_cis call hci_bind_cis inconsistently
with dst_type being either ISO socket address type or the HCI type, but
these values cannot be mixed like this. Fix this by using only the
socket address type.

CIS connection dst_type was also not initialized in hci_bind_cis, even
though it is used in hci_conn_hash_lookup_cis to find existing
connections.  Set the value in hci_bind_cis, so that existing CIS
connections are found e.g. when doing deferred socket connections, also
when dst_type is not 0 (ADDR_LE_DEV_PUBLIC).

Fixes: 26afbd826ee3 ("Bluetooth: Add initial implementation of CIS connections")
Signed-off-by: Pauli Virtanen <pav@iki.fi>
---

Notes:
    I've been playing with the LE Audio bits with Pipewire, and ran into
    a problem in connecting to nrf5340 devkit running its example
    application, which presumably is supposed to work.
    
    Everything works up to trying to acquire the BlueZ transport, which
    fails in BlueZ profiles/audio/bap.c:bap_accept_io where read() from the
    socket returns EINVAL.
    
    Adding some debug prints in kernel side shows that this occurs in
    
    net/bluetooth/iso.c:iso_sock_recvmsg ->
    net/bluetooth/iso.c:iso_connect_cis ->
    net/bluetooth/hci_conn.c:hci_bind_cis
    
    At this point, the CIS connection to the device already exists, but
    hci_conn_hash_lookup_cis fails to find it, because hci_conn->dst_type in
    the connection list does not match the dst_type passed to hci_bind_cis.
    Since it does not find existing connection, it tries to create a new
    one, which fails in hci_le_set_cig_params in the if (qos->cis !=
    BT_ISO_QOS_CIS_UNSET) branch, because the same CIS id is already
    reserved.
    
    It appears the dst_type field of CIS hci_conn is never initialized, so
    it happens to work for dst_type being ADDR_LE_DEV_PUBLIC (0) but not in
    other cases. In the case with the devkit, it's ADDR_LE_DEV_RANDOM.
    
    iso_connect_cis also calls hci_bind_cis directly with
    iso_pi(sk)->dst_type, which is BDADDR_LE_* value, not ADDR_LE_DEV_*
    value like it is when hci_bind_cis is called from hci_connect_cis.
    
    The patch here attempts to address these.  With this, sound comes out
    from the remote device fine, but I'm not familiar with the code here, so
    caveat emptor...
    
    Logs for reference (on v6.0, without this patch, with some extra BT_DBG added):
    
    bluetoothd[5349]: profiles/audio/bap.c:bap_connect_io() ep 0x60b0000392a0 stream 0x60b000039a30 defer true
    kernel: sock 000000002255c62a
    kernel: sk 0000000056fe6d75
    kernel: sk 0000000056fe6d75 84:5c:f3:52:11:91 type 1
    kernel: sk 0000000056fe6d75
    kernel: sk 0000000056fe6d75
    kernel: iso_sock_connect: sk 0000000056fe6d75
    kernel: iso_connect_cis: 84:5c:f3:52:11:91 -> c8:3d:d1:fe:ca:67, dst_type:2
    kernel: 84:5c:f3:52:11:91 -> c8:3d:d1:fe:ca:67
    kernel: hci0 orig refcnt 11
    kernel: hci0 hci_bind_cis: dst:c8:3d:d1:fe:ca:67 dst_type:2
    kernel: hci0 hci_bind_cis: new cis
    kernel: hci0 dst c8:3d:d1:fe:ca:67
    kernel: hci0 orig refcnt 12
    kernel: 00000000ece7f209 hci_le_set_cig_params
    kernel: hcon 00000000ece7f209 conn 00000000f0fe860f
    kernel: conn 00000000f0fe860f
    kernel: sock 0000000056fe6d75 state 3
    kernel: iso_connect_cis: ret:0
    kernel: hci0 orig refcnt 13
    kernel: iso_sock_connect: sk 0000000056fe6d75 ret:0
    kernel: sk 0000000056fe6d75
    kernel: sock 000000002255c62a, sk 0000000056fe6d75
    kernel: sock 000000002255c62a, sk 0000000056fe6d75
    kernel: hci0: event 0x0e
    kernel: hci0: opcode 0x2062
    kernel: hci0: status 0x00
    kernel: hci0: 00000000ece7f209 handle 0x0a00 link 0000000000000000
    bluetoothd[5349]: profiles/audio/bap.c:bap_connect_io() bt_io: connect: ep:0x60b0000392a0
    bluetoothd[5349]: profiles/audio/bap.c:bap_connect_io() bt_io: connect -> io:0x60c000015ac0 fd:32
    bluetoothd[5349]: src/shared/bap.c:bap_stream_io_attach() stream 0x60b000039a30 connecting true
    bluetoothd[5349]: src/shared/bap.c:stream_io_new() fd 32
    bluetoothd[5349]: profiles/audio/bap.c:bap_connecting() stream 0x60b000039a30 fd 32: CIG 0x00 CIS 0x00
    bluetoothd[5349]: src/shared/bap.c:bap_queue_req() req 0x606000017fc0 (op 0x02) queue 0x6030000
    bluetoothd[5349]: profiles/gap/gas.c:read_device_name_cb() GAP Device Name: NRF5340_AUDIO
    kernel: hci0: event 0x13
    kernel: hci0: num 1
    kernel: hcon 000000002dae917f mode 0
    kernel: hci0: event 0x3e
    kernel: hci0: subevent 0x07
    kernel: hci0: event 0x13
    kernel: hci0: num 1
    bluetoothd[5349]: src/shared/att.c:can_read_data() (chan 0x607000008bb0) ATT PDU received: 0x1b
    bluetoothd[5349]: profiles/audio/bap.c:qos_cb() stream 0x60b000039a30 code 0x00 reason 0x00
    kernel: hcon 000000002dae917f mode 0
    kernel: hcon 000000002dae917f mode 0
    kernel: hci0: event 0x13
    kernel: hci0: num 1
    kernel: hcon 000000002dae917f mode 0
    bluetoothd[5349]: src/shared/att.c:can_read_data() (chan 0x607000008bb0) ATT PDU received: 0x1b
    bluetoothd[5349]: src/shared/bap.c:bap_ep_set_status() ASE status: ep 0x603000026980 id 0x01 ha
    bluetoothd[5349]: src/shared/bap.c:ep_status_qos() CIG 0x00 CIS 0x00 interval 10000 framing 0x0
    bluetoothd[5349]: profiles/audio/media.c:pac_config() endpoint 0x60d000000860 path /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/pac_sink0
    bluetoothd[5349]: profiles/audio/media.c:media_endpoint_async_call() Calling SetConfiguration: name = :1.146 path = /MediaEndpoint/BAPSource/lc3
    bluetoothd[5349]: src/shared/bap.c:bap_stream_state_changed() stream 0x60b000039a30 dir 0x01: c
    bluetoothd[5349]: src/shared/bap.c:bap_stream_update_io_links() stream 0x60b000039a30
    bluetoothd[5349]: profiles/audio/bap.c:bap_state() stream 0x60b000039a30: config(1) -> qos(2)
    bluetoothd[5349]: profiles/audio/bap.c:bap_create_io() ep 0x60b0000392a0 stream 0x60b000039a30 defer true
    bluetoothd[5349]: src/shared/bap.c:bt_bap_stream_io_get_qos() in (nil) out 0x60b000039a68
    bluetoothd[5349]: profiles/audio/transport.c:bap_state_changed() stream 0x60b000039a30: config(1) -> qos(2)
    bluetoothd[5349]: profiles/audio/transport.c:transport_update_playing() /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/pac_sink0/fd0 State=TRANSPORT_STATE_IDLE Playing=0
    bluetoothd[5349]: profiles/gap/gas.c:read_appearance_cb() GAP Appearance: 0x0000
    kernel: hci0: event 0x13
    kernel: hci0: num 1
    kernel: hcon 000000002dae917f mode 0
    kernel: hci0: event 0x13
    kernel: hci0: num 1
    kernel: hcon 000000002dae917f mode 0
    kernel: hci0: event 0x13
    kernel: hci0: num 1
    bluetoothd[5349]: src/shared/gatt-client.c:db_hash_read_cb() DB Hash found: handle 0x0008 lengt
    bluetoothd[5349]: src/shared/gatt-client.c:db_hash_read_cb() DB Hash match: skipping discovery
    bluetoothd[5349]: src/shared/gatt-client.c:write_client_features() Writing Client Features 0x05
    bluetoothd[5349]: src/device.c:gatt_client_ready_cb() status: success, error: 0
    bluetoothd[5349]: src/gatt-client.c:btd_gatt_client_ready() GATT client ready
    kernel: hcon 000000002dae917f mode 0
    bluetoothd[5349]: src/gatt-client.c:create_services() Exporting objects for GATT services: C8:3D:D1:FE:CA:67
    bluetoothd[5349]: src/gatt-client.c:service_create() Exported GATT service: /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/service0001
    bluetoothd[5349]: src/gatt-client.c:characteristic_create() Exported GATT characteristic: /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/service0001/char0002
    bluetoothd[5349]: src/gatt-client.c:descriptor_create() Exported GATT characteristic descriptor: /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/service0001/char0002/desc0004
    bluetoothd[5349]: src/gatt-client.c:characteristic_create() Exported GATT characteristic: /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/service0001/char0005
    bluetoothd[5349]: src/gatt-client.c:characteristic_create() Exported GATT characteristic: /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/service0001/char0007
    bluetoothd[5349]: src/gatt-client.c:service_create() Exported GATT service: /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/service0022
    bluetoothd[5349]: src/gatt-client.c:characteristic_create() Exported GATT characteristic: /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/service0022/char0023
    bluetoothd[5349]: src/gatt-client.c:descriptor_create() Exported GATT characteristic descriptor: /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/service0022/char0023/desc0025
    bluetoothd[5349]: src/gatt-client.c:characteristic_create() Exported GATT characteristic: /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/service0022/char0026
    bluetoothd[5349]: src/gatt-client.c:characteristic_create() Exported GATT characteristic: /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/service0022/char0028
    bluetoothd[5349]: src/gatt-client.c:descriptor_create() Exported GATT characteristic descriptor: /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/service0022/char0028/desc002a
    bluetoothd[5349]: src/gatt-client.c:btd_gatt_client_ready() Features 0x00
    bluetoothd[5349]: src/gatt-client.c:btd_gatt_client_ready() Update Features 0x05
    bluetoothd[5349]: src/device.c:device_svc_resolved() /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67 err 0
    kernel: hci0: event 0x13
    kernel: hci0: num 1
    kernel: hcon 000000002dae917f mode 0
    kernel: hci0: event 0x13
    kernel: hci0: num 1
    bluetoothd[5349]: src/shared/gatt-client.c:service_changed_register_cb() Registered handler for
    kernel: hcon 000000002dae917f mode 0
    bluetoothd[5349]: profiles/audio/transport.c:media_owner_create() Owner created: sender=:1.146
    bluetoothd[5349]: src/shared/bap.c:bap_queue_req() req 0x60600001cee0 (op 0x03) queue 0x6030000
    bluetoothd[5349]: profiles/audio/transport.c:transport_set_state() State changed /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/pac_sink0/fd0: TRANSPORT_STATE_IDLE -> TRANSPORT_STATE_REQUESTING
    bluetoothd[5349]: profiles/audio/transport.c:media_request_create() Request created: method=Acquire id=3
    bluetoothd[5349]: profiles/audio/transport.c:media_owner_add() Owner :1.146 Request Acquire
    bluetoothd[5349]: profiles/audio/transport.c:media_transport_set_owner() Transport /org/bluez/hci0/dev_C8_3D_D1_FE_CA_67/pac_sink0/fd0 Owner :1.146
    kernel: hci0: event 0x13
    kernel: hci0: num 1
    bluetoothd[5349]: src/shared/att.c:can_read_data() (chan 0x607000008bb0) ATT PDU received: 0x1b
    kernel: hcon 000000002dae917f mode 0
    kernel: hcon 000000002dae917f mode 0
    bluetoothd[5349]: src/shared/att.c:can_read_data() (chan 0x607000008bb0) ATT PDU received: 0x1b
    bluetoothd[5349]: src/shared/bap.c:bap_ep_set_status() ASE status: ep 0x603000026980 id 0x01 ha
    bluetoothd[5349]: src/shared/bap.c:ep_status_metadata() CIS 0x00 CIG 0x00 metadata len 4
    bluetoothd[5349]: src/shared/bap.c:bap_stream_state_changed() stream 0x60b000039a30 dir 0x01: q
    bluetoothd[5349]: profiles/audio/bap.c:bap_state() stream 0x60b000039a30: qos(2) -> enabling(3)
    bluetoothd[5349]: profiles/audio/bap.c:bap_create_io() ep 0x60b0000392a0 stream 0x60b000039a30 defer false
    bluetoothd[5349]: src/shared/bap.c:bt_bap_stream_io_get_qos() in (nil) out 0x60b000039a68
    bluetoothd[5349]: profiles/audio/bap.c:bap_accept_io() stream 0x60b000039a30 fd 32 defer true
    kernel: sk 0000000056fe6d75
    kernel: iso_sock_recvmsg: sk 0000000056fe6d75
    kernel: iso_sock_recvmsg: defer connect 0000000056fe6d75
    kernel: iso_connect_cis: 84:5c:f3:52:11:91 -> c8:3d:d1:fe:ca:67, dst_type:2
    kernel: 84:5c:f3:52:11:91 -> c8:3d:d1:fe:ca:67
    kernel: hci0 orig refcnt 12
    kernel: hci0 hci_connect_cis: dst:c8:3d:d1:fe:ca:67 dst_type:2
    kernel: hcon 000000002dae917f orig refcnt 1
    kernel: hci0 hci_bind_cis: dst:c8:3d:d1:fe:ca:67 dst_type:1
    kernel: hci0 hci_conn_hash_lookup_cis: c:00000000ece7f209 c->dst:c8:3d:d1:fe:ca:67 c->dst_type:0 ba:c8:3d:d1:fe:ca:67 ba_type:1
    kernel: hci0 hci_bind_cis: new cis
    kernel: hci0 dst c8:3d:d1:fe:ca:67
    kernel: hci0 orig refcnt 13
    kernel: 00000000c554a79d hci_le_set_cig_params
    kernel: 00000000ece7f209 cis_list: cig:0 cis:0 vs. d->cig:0, d->cis:0
    kernel: 00000000ece7f209 cis_list: MATCH
    kernel: hci0 hci_le_set_cig_params: ERROR: cig:0, cis:0 already exists
    kernel: hci0 hci_bind_cis: ERROR: hci_le_set_cig_params
    kernel: hcon 00000000c554a79d orig refcnt 0
    kernel: hcon 000000002dae917f orig refcnt 2
    kernel: iso_connect_cis: ret:-22
    kernel: hci0 orig refcnt 14
    kernel: sock 000000002255c62a, sk 0000000056fe6d75
    kernel: sock 0000000056fe6d75 state 5
    kernel: sk 0000000056fe6d75 state 5 socket 000000002255c62a
    kernel: sk 0000000056fe6d75, conn 00000000f0fe860f, err 104
    kernel: hcon 00000000ece7f209 orig refcnt 0
    bluetoothd[5349]: profiles/audio/bap.c:bap_accept_io() read: Invalid argument (22)

 net/bluetooth/hci_conn.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
index 9777e7b109ee..78d8b8b7fd72 100644
--- a/net/bluetooth/hci_conn.c
+++ b/net/bluetooth/hci_conn.c
@@ -1691,12 +1691,19 @@ struct hci_conn *hci_bind_cis(struct hci_dev *hdev, bdaddr_t *dst,
 {
 	struct hci_conn *cis;
 
+	/* Convert from ISO socket address type to HCI address type  */
+	if (dst_type == BDADDR_LE_PUBLIC)
+		dst_type = ADDR_LE_DEV_PUBLIC;
+	else
+		dst_type = ADDR_LE_DEV_RANDOM;
+
 	cis = hci_conn_hash_lookup_cis(hdev, dst, dst_type);
 	if (!cis) {
 		cis = hci_conn_add(hdev, ISO_LINK, dst, HCI_ROLE_MASTER);
 		if (!cis)
 			return ERR_PTR(-ENOMEM);
 		cis->cleanup = cis_cleanup;
+		cis->dst_type = dst_type;
 	}
 
 	if (cis->state == BT_CONNECTED)
@@ -2075,20 +2082,21 @@ struct hci_conn *hci_connect_cis(struct hci_dev *hdev, bdaddr_t *dst,
 {
 	struct hci_conn *le;
 	struct hci_conn *cis;
+	u8 hci_dst_type;
 
 	/* Convert from ISO socket address type to HCI address type  */
 	if (dst_type == BDADDR_LE_PUBLIC)
-		dst_type = ADDR_LE_DEV_PUBLIC;
+		hci_dst_type = ADDR_LE_DEV_PUBLIC;
 	else
-		dst_type = ADDR_LE_DEV_RANDOM;
+		hci_dst_type = ADDR_LE_DEV_RANDOM;
 
 	if (hci_dev_test_flag(hdev, HCI_ADVERTISING))
-		le = hci_connect_le(hdev, dst, dst_type, false,
+		le = hci_connect_le(hdev, dst, hci_dst_type, false,
 				    BT_SECURITY_LOW,
 				    HCI_LE_CONN_TIMEOUT,
 				    HCI_ROLE_SLAVE);
 	else
-		le = hci_connect_le_scan(hdev, dst, dst_type,
+		le = hci_connect_le_scan(hdev, dst, hci_dst_type,
 					 BT_SECURITY_LOW,
 					 HCI_LE_CONN_TIMEOUT,
 					 CONN_REASON_ISO_CONNECT);
-- 
2.37.3

