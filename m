Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE0E73FC97
	for <lists+linux-bluetooth@lfdr.de>; Tue, 27 Jun 2023 15:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjF0NOY (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 27 Jun 2023 09:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbjF0NOR (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 27 Jun 2023 09:14:17 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::613])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E601701
        for <linux-bluetooth@vger.kernel.org>; Tue, 27 Jun 2023 06:14:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvMOLhdfqxigEbWJbQ6O7ZDvFc2TyR3N4dRNyyR/azLrIDtWUUOYcDdpCECQqChiQOv5nLijXq/F6K/Zo/t55cA5SQSHMCCJt95t5uYAUAsT6qYri5lJv8X/VgTtnYunl8CiyrCM9N5DtMqF8BgNdoITVJqGsl6g4T3IvJ401U4y0CVfQDAqoOnUfnvXY1RywusuQMjxvYKtUNSZdkfXslGqHLTYdfrBUyQquepn2TDJwIlCvyc1yuaNflI9B67fQ1q6/Y4F8FdZO+tOrK3lkQ8VCwxwV0AN9GyeH4ez0LisqhG11iAH8CYuvpGW9IOwe/eUJsiND130v+sIwKmyiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0UFAYbZ0goDOy368d/lle7GUFzE+lxfHlPcKRkeWQ8=;
 b=HGt16w4CE4d1IZmOq/c2/v6o2Fzp9evaejlO5QIruIudr4XuWBVspOObY/1dOUHmcRJin8OUlfsZiOMM6lNX1BHmU/js3KHGsGolDAnFsyMgGP4tH/N1YjW/u6+hFKkzsf+Bs0q5TiFA6dSv39yAPy0Ec3TuaN2mB+VnDD124eNXXPhRT/kUpITptzoL3SBqi+SB9/p7kxrvuGdACJgfzKpK8lv7pLlqIVI0PjeOObQTGOn3vhU3uo51aQntKC6w5fSba3M/NCev8niT6yCI1MRuBHIDEkX+PU0VAhGLdLvinfDKhqweEAbg1bdkAtNIjkr93nogy6mJCvOjIocMIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0UFAYbZ0goDOy368d/lle7GUFzE+lxfHlPcKRkeWQ8=;
 b=j372oesGBlDo5QRsSywGzPn7WH3j33m1+LJYH9X12uxmfGssvZHbA4iE4yRFlrRX62yscc6ZMvfROWcppdJHJnRJo3qHGzJFLgK1n3dr3b0x0l49AzmP+KHZwIqOJlelIMt797GhjX9KpBoY04idWE5yXQLTBmLTeWxJa8iViE1/ieJJkVddsiwn0gNR6Qs6upPRceaGs4IdyuTifnNoW1vkNjhNLkm8Scj+8KwIe38FF1BspbeSdSPk+U8KQV6Dp4YiAR+CJ26fkVETmxzZjY5/SNWvTQcqzIIvRBvsDM0suE0MTmqvv7BAPBW+SSJyDUpFDQHe+rqJ5rZBq1nLkA==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by DM4PR10MB6230.namprd10.prod.outlook.com (2603:10b6:8:8d::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24; Tue, 27 Jun 2023 13:14:07 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::f01a:585:8d6:3d3c]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::f01a:585:8d6:3d3c%7]) with mapi id 15.20.6521.026; Tue, 27 Jun 2023
 13:14:06 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "luiz.dentz@gmail.com" <luiz.dentz@gmail.com>
CC:     "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: bluez SEGV in current master
Thread-Topic: bluez SEGV in current master
Thread-Index: AQHZnrvlRF4IgSCGUkSDIZGoqFv8fa+KfFUAgAAB1ICAAAX6AIAAAdoAgBPhQYCAAE3JgA==
Date:   Tue, 27 Jun 2023 13:14:06 +0000
Message-ID: <fa5231afb0ac938fe66552b2437d0cb3b6263a68.camel@infinera.com>
References: <6704ebbea9d1bb64e54b45b1b3d6cd321b28971b.camel@infinera.com>
         <CABBYNZ+5ToeenijZkpRSrQ+wyLPjFSD5S7LWwCWXVoT=m-9Y3g@mail.gmail.com>
         <da4df669a540a395eec5a596a9594bea73be404d.camel@infinera.com>
         <CABBYNZKhf0Ve5P+N9zhAuUwU5O-e5JcifcxE-0=o+X_hRdPtyA@mail.gmail.com>
         <b1588e0579d4dfd9947d0d6938f10eb0e05e8558.camel@infinera.com>
         <d7729430396099ee4e3aaf1046a7aafbc3b0c032.camel@infinera.com>
In-Reply-To: <d7729430396099ee4e3aaf1046a7aafbc3b0c032.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.48.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|DM4PR10MB6230:EE_
x-ms-office365-filtering-correlation-id: 208971f9-759d-4820-2dad-08db771062fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L3wl+HjB44r/nkkApt9NWJNURkKnIysgDX56rgQFhJXnfQSx+8clFOXpKUv+ksyZsIYKy5e1RjeWwnpp1sprSYt3RLkQ8ioPs3J9fymF8lqIfF8N87xcfZkLGeWcjp6oQyIxuUNUMqkzFp3PRjIGldGU+FAWaVDn/3UekOMZhxx/UD9p7syH6OBIC5FRasNU3pxS0sPYfRzwnyxDhaMLxzhlFg6VX/c0PAgEOMe+KoGQunBtcPfGNV0PC9qMDNbbrPoZyq8bfX1+gVRAVozgvdwAuDxNl4Oh2/rdtJy4dxT2xoN2p0vDIp6BLv+NoWJ8uBbElTw1xBEmJJgZSCeSFuv1Sp3KJn33wd/tzh/Ja2kI31b0jD8uVM+Yple+bVVxcXnGqCIHOZOnyGm/ZZY4qhr5OsnFfsMm/qfu9wU/5qJfPQJyp9V7bnpW1FmsVFaxSS2RXjT56ODwPvHjxA+xlbcyy9AxjpGeIXPumstJCqyDEjuAXE5E/t7klDjjTUcdOKZUC2XMX8FiGwznjUpn8EsSrDiGPGK7wenbmt8YILVMJPPwBjV6z7ZVRm/5Om32fhaOYZV2AtBN0k5th+eF/HEYycp+PW0YupcOJxmqt8Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(451199021)(2906002)(186003)(71200400001)(6486002)(45080400002)(122000001)(38100700002)(83380400001)(2616005)(6506007)(6512007)(53546011)(30864003)(966005)(41300700001)(38070700005)(86362001)(316002)(478600001)(36756003)(66556008)(66446008)(4326008)(66946007)(66476007)(91956017)(6916009)(64756008)(76116006)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3laa1RpYTNPeFVEQUlpZ3NHckVHaWI2TkpOVVFaU3RQNjA5ZkpPaUtIZjN3?=
 =?utf-8?B?Q0IzTHZCdmVpd05BRmRFdU5FVUNYTHBVZWJZYmFvY2p6RTlsT1FDT0VHejFF?=
 =?utf-8?B?UDdPVGxGSEVJNnlvQi9welYxNy9EVzA5OVN2T2pWQ0pRUUtoVlZVSHU0VUx3?=
 =?utf-8?B?UkVOWVMybmJKV0FMTW1FTlY3RWx2bGplYi91cW1UNGZTUGRTRTB5Z2xYWUxT?=
 =?utf-8?B?S2ZGVmdxV1V0aUNtMUt4Y2NFUGNDUFBYejVhSDFqWDRMTHBabmlRWDQ1UHpQ?=
 =?utf-8?B?OTk3YlJEQ2FjZ2NUL3FWZWwrMVFuNEJMbGRxWGFQVG90V0ZrdjdRVVd0TFM0?=
 =?utf-8?B?bm9xcjVUR1hReTlPbWpzV0tRREdHb2FhR1hwQnMwdHNkUURRQjlxczdoUEtX?=
 =?utf-8?B?bjdzZ3JmTTYvcUR5WWxReGxBV1I5czc3UC96dytXWUZ5MG9TRHJKWWVpT0Iv?=
 =?utf-8?B?YTVjdDZlNjJLMWl0Q2VpNFYvbGZHUGdSdkk1YkJOb1pyZk5LQmJpdU55MmVJ?=
 =?utf-8?B?cHE2d0lpOWsvcFdKVk4xbzAyUTNHTjMvdVZmNXRjcUtUcHRxdlhxa2x2N0dz?=
 =?utf-8?B?RjZLTGMyYUZ5bmpmZFdzOUJZbWM3UlZTSFcxMGtqeVdSWUtnUzlaNXhKZEhk?=
 =?utf-8?B?aFlSbm5HT0ovYVNuWFdUQ1BuWFlXeklyVWxKZXNmNy9ta1kydFlncTNKMHBl?=
 =?utf-8?B?TDl0bERXcVNSaGFERDRrN1YvR1hBNVR5YzByQmZvZGVQN1luRHR2LysyNDd1?=
 =?utf-8?B?YVNEQ3RLK2doTlNZdFlDRERFcERHNVZRZ2ZVMjNKK0x4QVlzVlY5T2NsOGxE?=
 =?utf-8?B?aEtoTTBHMzdOaUdaeGVRK3JjbUcwV09DSVVwL3FITHpIK3VkcmpaUzJsY0pT?=
 =?utf-8?B?T2c4OWhhQTcvZHAvdERKTmlUMmt6VG1WWFI0UUxVdThodlo1cXkyY2tvQlcv?=
 =?utf-8?B?bHBtSnhOZytpMUNNZTJ2RDNHQVZhZkRWaFQ3ZkEvMzlvMTBZTHJFZXRZMW5p?=
 =?utf-8?B?bWR5dTNOUHJwOWxPL05MRDFWekUrK0d0aE5XMjhVekhDR1RlZHIxL2tWbmNF?=
 =?utf-8?B?eVlLQURXeG5pT1dJWFBZL1VoblR4QWQyR0R6bk1aMytKRVMxQktRdTl4bElU?=
 =?utf-8?B?aVI1dFovR2VvRlMxNUFrQ2pveVhuWEg2blA5NEdEaGYram1yN1BvRHM3aFVk?=
 =?utf-8?B?cVRqNTNvWmtuOWpkeTNjbFh1OWFtenBnWVArc1lWbzlvUlpVc1YxU1RSTXVZ?=
 =?utf-8?B?aCtRQjZqM25lNW9QRmpFYUlvL2NaWEhRYTdHVlNvLyszeFd0ejNPbnBMaW9B?=
 =?utf-8?B?dS9ZZFZJQ29EaW9lYnRScWxJUVdMMXdJYW9lczR3TXhueXp1aXNFSmpYcHhC?=
 =?utf-8?B?bi9sNEVnUHR1TFZhbFNCUVU4dTNXOU5pdFpnZnRaM2xOS2E5RVR0MS9vVS9S?=
 =?utf-8?B?WGZwQ2orZ1VpTmZoU2RUVHhYY2FCbVhXbENXYk4xL3l4VXBiSXUvVjRaeVRO?=
 =?utf-8?B?WGtXVE8vdTN5Q0g0NC9QK2c2WjByWEhSdnBrdEx0QzdRK240VDZLV0YyeFJW?=
 =?utf-8?B?aXc1R0JFNVBHRUhzdHBWMlEvaHdPOTUxKyt0ZXg0Y1ZBNUg2cGl0RERMZWhk?=
 =?utf-8?B?Y2MzMmpBMmNaZEtKUEl4ZjVlWUtzWkVyZ0FaV09NWUoxRGM5MWdmbnRmMkFv?=
 =?utf-8?B?dlo2c2haU3N3cERaQ1hic1BoVGFWc29mTS9ETy9LbFN4bDhSaXl2QlhwUVBs?=
 =?utf-8?B?V2ZhT1dxOUtORHJQQzlmai93SGFzSXpYZE9PUWd6YjNoTGNaeTB4cmlrcUZm?=
 =?utf-8?B?aEdsbW9WWTFnajA1K2k2V2E3dS9ROURkakZuUlJ2OEZrVDIyUGxVd2xkQ3Vw?=
 =?utf-8?B?K3Y0cnVnaUJHb0ZmQTdHRWtHTXg3SFhhdG1uNGw2MWhiMi9xdTZ6aTM4ekNF?=
 =?utf-8?B?UFVWVW1HdzlMcE01eDd3RzA3dG1OT2xyVVRQa1pzNDhBK3NaM1pIdG1Gc3dQ?=
 =?utf-8?B?L2JQTnIzbnUwVU9PcHJxaHp2OVBHai93cW9nTGVwQWx1MXl1Tk5JZVI4ZFov?=
 =?utf-8?B?RGp1cEk5SjZONWxUQVRMbGFVaDZkZ1RiQnovWDNpQTQvOEpucDE3QUZTVmkw?=
 =?utf-8?B?ZUJNSlV4MWJndWZhdkhTVmY5QjNHSWZidENPY0R6bEpIQkwyQkV6SXhEeVl3?=
 =?utf-8?Q?Ny0c0+XLuDf/TuR4CMODbngS0s/64iEmYl2Naw7/5Tb0?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9785D9931DCC7848B962FD172643C2DD@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208971f9-759d-4820-2dad-08db771062fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 13:14:06.6457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EwhKIXBPxNxO8zMqrKujCfomF792ivj5fRGg8gQvEBNoJ5kIJmQXbFwTXBQGmsJvt1lrjsS4RMU5XSt+51T4fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6230
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

T24gVHVlLCAyMDIzLTA2LTI3IGF0IDEwOjM1ICswMjAwLCBKb2FraW0gVGplcm5sdW5kIHdyb3Rl
Og0KPiBPbiBXZWQsIDIwMjMtMDYtMTQgYXQgMTk6MDAgKzAyMDAsIEpvYWtpbSBUamVybmx1bmQg
d3JvdGU6DQo+ID4gT24gV2VkLCAyMDIzLTA2LTE0IGF0IDA5OjUzIC0wNzAwLCBMdWl6IEF1Z3Vz
dG8gdm9uIERlbnR6IHdyb3RlOg0KPiA+ID4gSGkgSm9ha2ltLA0KPiA+ID4NCj4gPiA+IE9uIFdl
ZCwgSnVuIDE0LCAyMDIzIGF0IDk6MzLigK9BTSBKb2FraW0gVGplcm5sdW5kDQo+ID4gPiA8Sm9h
a2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlOg0KPiA+ID4gPg0KPiA+ID4gPiBPbiBX
ZWQsIDIwMjMtMDYtMTQgYXQgMDk6MjUgLTA3MDAsIEx1aXogQXVndXN0byB2b24gRGVudHogd3Jv
dGU6DQo+ID4gPiA+ID4gSGkgSm9ha2ltLA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gV2VkLCBK
dW4gMTQsIDIwMjMgYXQgNTozNuKAr0FNIEpvYWtpbSBUamVybmx1bmQNCj4gPiA+ID4gPiA8Sm9h
a2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+IHdyb3RlOg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+IGNvbW1pdCBiYXA6IEFkZCBicm9hZGNhc3Qgc291cmNlIHN1cHBvcnQsIDMwMzA4ODMsIGlu
IGJsdWV6LmdpdA0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IEEgY28td29ya2VyIHNlZSB0aGlz
IFNFR1Ygd2hlbiBjb25uZWN0aW5nIGEgaGVhZHNldDoNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiBKdW4gMTMgMTM6Mzg6MTUgc3lzdGVtZC1jb3JlZHVtcFszOTQxXTogUHJvY2VzcyAxODk3IChi
bHVldG9vdGhkKSBvZiB1c2VyIDAgZHVtcGVkIGNvcmUuDQo+ID4gPiA+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTW9kdWxlIGJsdWV0b290aGQgd2l0aG91dCBi
dWlsZC1pZC4NCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAjMCAgMHgwMDAwNTU2YmVhOTMyNzdhIGEyZHBfcmVzdW1lX2NvbXBsZXRlIChibHVldG9v
dGhkICsgMHgzZTc3YSkNCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAjMSAgMHgwMDAwNTU2YmVhOTIxMGEyIGZpbmFsaXplX3Jlc3VtZSAoYmx1ZXRv
b3RoZCArIDB4MmQwYTIpDQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIzIgIDB4MDAwMDU1NmJlYTkyYWZhZiBhdmR0cF9zdGFydF9yZXNwIChibHVl
dG9vdGhkICsgMHgzNmZhZikNCj4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAjNiAgMHgwMDAwNTU2YmVhOWRjYzg1IG1haW5sb29wX3J1biAoYmx1ZXRv
b3RoZCArIDB4ZThjODUpDQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIzcgIDB4MDAwMDU1NmJlYTlkZDBkYyBtYWlubG9vcF9ydW5fd2l0aF9zaWdu
YWwgKGJsdWV0b290aGQgKyAweGU5MGRjKQ0KPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICM4ICAweDAwMDA1NTZiZWE5MWE0ZWYgbWFpbiAoYmx1ZXRv
b3RoZCArIDB4MjY0ZWYpDQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIzExIDB4MDAwMDU1NmJlYTkxYWNlMSBfc3RhcnQgKGJsdWV0b290aGQgKyAw
eDI2Y2UxKQ0KPiA+ID4gPiA+ID4gSnVuIDEzIDEzOjM4OjE1IHN5c3RlbWRbMV06IGJsdWV0b290
aC5zZXJ2aWNlOiBNYWluIHByb2Nlc3MgZXhpdGVkLCBjb2RlPWR1bXBlZCwgc3RhdHVzPTExL1NF
R1YNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQ3Jhc2ggc2VlbXMgdG8g
YmUgYXQ6DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gMzQyICAgICBzdGF0aWMgdm9pZCBhMmRw
X3Jlc3VtZV9jb21wbGV0ZShzdHJ1Y3QgYXZkdHAgKnNlc3Npb24sIGludCBlcnIsDQo+ID4gPiA+
ID4gPiAzNDMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdm9pZCAqdXNlcl9kYXRhKQ0KPiA+ID4gPiA+ID4gMzQ0ICAgICB7DQo+ID4g
PiA+ID4gPiAzNDUgICAgICAgICAgICAgc3RydWN0IG1lZGlhX293bmVyICpvd25lciA9IHVzZXJf
ZGF0YTsNCj4gPiA+ID4gPiA+IDM0NiAgICAgICAgICAgICBzdHJ1Y3QgbWVkaWFfcmVxdWVzdCAq
cmVxID0gb3duZXItPnBlbmRpbmc7DQo+ID4gPiA+ID4gPiAzNDcgICAgICAgICAgICAgc3RydWN0
IG1lZGlhX3RyYW5zcG9ydCAqdHJhbnNwb3J0ID0gb3duZXItPnRyYW5zcG9ydDsNCj4gPiA+ID4g
PiA+IDM0OCAgICAgICAgICAgICBzdHJ1Y3QgYTJkcF9zZXAgKnNlcCA9IG1lZGlhX2VuZHBvaW50
X2dldF9zZXAodHJhbnNwb3J0LT5lbmRwb2ludCk7DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
QSBnb29kIHN0YXJ0KGJ1dCBkb2VzIE5PVCBmaXggdGhlIHByb2JsZW0pIG1pZ2h0IGJlOg0KPiA+
ID4gPiA+ID4NCj4gPiA+ID4gPiA+IC0tLSBibHVlei05OTk5L3Byb2ZpbGVzL2F1ZGlvL3RyYW5z
cG9ydC5jLm9yZyAgIDIwMjMtMDYtMTMgMTg6Mzg6MTQuNTQyMTM3NTMxICswMjAwDQo+ID4gPiA+
ID4gPiArKysgYmx1ZXotOTk5OS9wcm9maWxlcy9hdWRpby90cmFuc3BvcnQuYyAgICAgICAyMDIz
LTA2LTEzIDE4OjQ4OjMyLjU0MjUyNzg4MiArMDIwMA0KPiA+ID4gPiA+ID4gQEAgLTM0NSw3ICsz
NDUsNyBAQA0KPiA+ID4gPiA+ID4gICAgICAgICBzdHJ1Y3QgbWVkaWFfb3duZXIgKm93bmVyID0g
dXNlcl9kYXRhOw0KPiA+ID4gPiA+ID4gICAgICAgICBzdHJ1Y3QgbWVkaWFfcmVxdWVzdCAqcmVx
ID0gb3duZXItPnBlbmRpbmc7DQo+ID4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCBtZWRpYV90cmFu
c3BvcnQgKnRyYW5zcG9ydCA9IG93bmVyLT50cmFuc3BvcnQ7DQo+ID4gPiA+ID4gPiAtICAgICAg
IHN0cnVjdCBhMmRwX3NlcCAqc2VwID0gbWVkaWFfZW5kcG9pbnRfZ2V0X3NlcCh0cmFuc3BvcnQt
PmVuZHBvaW50KTsNCj4gPiA+ID4gPiA+ICsgICAgICAgc3RydWN0IGEyZHBfc2VwICpzZXA7DQo+
ID4gPiA+ID4gPiAgICAgICAgIHN0cnVjdCBhdmR0cF9zdHJlYW0gKnN0cmVhbTsNCj4gPiA+ID4g
PiA+ICAgICAgICAgaW50IGZkOw0KPiA+ID4gPiA+ID4gICAgICAgICB1aW50MTZfdCBpbXR1LCBv
bXR1Ow0KPiA+ID4gPiA+ID4gQEAgLTM1NSw3ICszNTUsMTAgQEANCj4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPiAgICAgICAgIGlmIChlcnIpDQo+ID4gPiA+ID4gPiAgICAgICAgICAgICAgICAgZ290
byBmYWlsOw0KPiA+ID4gPiA+ID4gKyAgICAgICBpZiAoIXRyYW5zcG9ydCkNCj4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICBnb3RvIGZhaWw7DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gKyAg
ICAgICBzZXAgPSBtZWRpYV9lbmRwb2ludF9nZXRfc2VwKHRyYW5zcG9ydC0+ZW5kcG9pbnQpOw0K
PiA+ID4gPiA+ID4gICAgICAgICBzdHJlYW0gPSBhMmRwX3NlcF9nZXRfc3RyZWFtKHNlcCk7DQo+
ID4gPiA+ID4gPiAgICAgICAgIGlmIChzdHJlYW0gPT0gTlVMTCkNCj4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICBnb3RvIGZhaWw7DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gYmx1ZXotNS42
NiBXb3JrcyBmaW5lIHRob3VnaC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBIZWFkc2V0OiBX
SC0xMDAwWE0zDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gICBKb2NrZQ0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gV2VpcmQsIEkgZG9uJ3QgdGhpbmsgbXVjaCBoYXMgY2hhbmdlZCBmb3IgQTJEUCwg
YnV0IHBlcmhhcHMgdGhlcmUgaXMNCj4gPiA+ID4gPiBzb21lIEJBUCByZWxhdGVkIGNoYW5nZXMg
YWZmZWN0aW5nIEEyRFAgZm9yIHNvbWUgcmVhc29uLCBhbnkgY2hhbmNlIHRvDQo+ID4gPiA+ID4g
YmlzZWN0IHRoZSBwYXRjaCB0aGF0IGludHJvZHVjZXMgdGhpcyBwcm9ibGVtPyBPciBpdCBpcyBu
b3QgYWx3YXlzDQo+ID4gPiA+ID4gcmVwcm9kdWNpYmxlPw0KPiA+ID4gPg0KPiA+ID4gPiBJdCBp
cyByZXByb2R1Y2libGUgYnV0IG9uIGFuIHJlbW90ZSBsYXB0b3AgdXNlZCBmb3IgZGFpbHkgd29y
ayBzbyB3b3VsZCBkaXN0dXJiIHF1aXRlIGEgbG90Lg0KPiA+ID4gPiBDYW4gSSB0dXJuIG9mZiBC
QVAgc29tZWhvdyB0byBzZWUgaWYgaXQgaXMgaW50ZXJmZXJpbmcgPw0KPiA+ID4gPg0KPiA+ID4g
PiBBbnkgY2hhbmNlIGl0IGlzIHJlbGF0ZWQgdG8gaHR0cHM6Ly9naXRodWIuY29tL2JsdWV6L2Js
dWV6L2lzc3Vlcy81MzMgPw0KPiA+ID4NCj4gPiA+IFJpZ2h0LCB5ZWFoIHRoYXQgaXMgcG9zc2li
bGUgc2luY2UgaXQgYXBwZWFycyB0byBiZSBzb21lIHVuYmFsYW5jZWQNCj4gPiA+IHJlZmVyZW5j
ZSBjb3VudCBpc3N1ZSwgdGhhdCBzYWlkIHRoYXQgd2FzIGEgdmVyeSBvbGQgdmVyc2lvbiwgbm90
IHN1cmUNCj4gPiA+IGlmIHdlIGhhdmVuJ3QgZml4ZWQgdGhhdC4NCj4gPg0KPiA+IEl0IGlzIG5v
dCBmaXhlZCBpbiB1bnJlZiBjb2RlIGRpc2N1c3NlZCBpbiB0aGF0IGlzc3VlIG9uIG1hc3Rlcg0K
PiA+DQo+ID4gICAgIEpvY2tlDQo+DQo+IE1hbmFnZWQgdG8gZ2V0IGEgYnQ6DQo+IENvcmUgd2Fz
IGdlbmVyYXRlZCBieSBgL3Vzci9saWJleGVjL2JsdWV0b290aC9ibHVldG9vdGhkJy4NCj4gUHJv
Z3JhbSB0ZXJtaW5hdGVkIHdpdGggc2lnbmFsIFNJR1NFR1YsIFNlZ21lbnRhdGlvbiBmYXVsdC4N
Cj4gIzAgIGEyZHBfcmVzdW1lX2NvbXBsZXRlIChzZXNzaW9uPTB4NTVlNDM3NDI5YzQwLCBlcnI9
MCwgdXNlcl9kYXRhPTB4NTVlNDM3NDU2YzkwKSBhdCBwcm9maWxlcy9hdWRpby90cmFuc3BvcnQu
YzozNTQNCj4NCj4gd2FybmluZzogU291cmNlIGZpbGUgaXMgbW9yZSByZWNlbnQgdGhhbiBleGVj
dXRhYmxlLg0KPiAzNTQgICAgICAgICAgIHJlcS0+aWQgPSAwOw0KPiAoZ2RiKSBidCBmdWxsDQo+
ICMwICBhMmRwX3Jlc3VtZV9jb21wbGV0ZSAoc2Vzc2lvbj0weDU1ZTQzNzQyOWM0MCwgZXJyPTAs
IHVzZXJfZGF0YT0weDU1ZTQzNzQ1NmM5MCkgYXQgcHJvZmlsZXMvYXVkaW8vdHJhbnNwb3J0LmM6
MzU0DQo+ICAgICAgICAgb3duZXIgPSAweDU1ZTQzNzQ1NmM5MA0KPiAgICAgICAgIHJlcSA9IDB4
MA0KPiAgICAgICAgIHRyYW5zcG9ydCA9IDB4MA0KPiAgICAgICAgIHNlcCA9IDxvcHRpbWl6ZWQg
b3V0Pg0KPiAgICAgICAgIHN0cmVhbSA9IDxvcHRpbWl6ZWQgb3V0Pg0KPiAgICAgICAgIGZkID0g
MA0KPiAgICAgICAgIGltdHUgPSAwDQo+ICAgICAgICAgb210dSA9IDANCj4gICAgICAgICByZXQg
PSA8b3B0aW1pemVkIG91dD4NCj4gIzEgIDB4MDAwMDU1ZTQzNjdmMzBhMiBpbiBmaW5hbGl6ZV9y
ZXN1bWUgKGRhdGE9MHg1NWU0Mzc0NWZjOTApIGF0IHByb2ZpbGVzL2F1ZGlvL2EyZHAuYzozNTIN
Cj4gICAgICAgICBjYiA9IDB4NTVlNDM3NDcyZjEwDQo+ICAgICAgICAgcyA9IDB4NTVlNDM3NDVm
YzkwDQo+ICAgICAgICAgbCA9IDB4MA0KPiAjMiAgMHgwMDAwNTVlNDM2N2ZjZmFmIGluIGF2ZHRw
X3N0YXJ0X3Jlc3AgKHJlc3A9MHg1NWU0Mzc0MjljYjMsIHNpemU9MCwgc3RyZWFtPTB4NTVlNDM3
NDU1NjkwLCBzZXNzaW9uPTB4NTVlNDM3NDI5YzQwKSBhdCBwcm9maWxlcy9hdWRpby9hdmR0cC5j
OjI4NjgNCj4gICAgICAgICBzZXAgPSAweDU1ZTQzNzQxMTY2MA0KPiAjMyAgYXZkdHBfcGFyc2Vf
cmVzcCAodHJhbnNhY3Rpb249PG9wdGltaXplZCBvdXQ+LCBzaXplPTAsIGJ1Zj0weDU1ZTQzNzQy
OWNiMywgc2lnbmFsX2lkPTxvcHRpbWl6ZWQgb3V0Piwgc3RyZWFtPTB4NTVlNDM3NDU1NjkwLA0K
PiAgICAgc2Vzc2lvbj0weDU1ZTQzNzQyOWM0MCkgYXQgcHJvZmlsZXMvYXVkaW8vYXZkdHAuYzoy
OTg4DQo+ICAgICAgICAgbmV4dCA9IDB4MA0KPiAgICAgICAgIGdldF9hbGwgPSAweDU1ZTQzNjhj
MTlhOCAiIg0KPiAgICAgICAgIG5leHQgPSA8b3B0aW1pemVkIG91dD4NCj4gICAgICAgICBnZXRf
YWxsID0gPG9wdGltaXplZCBvdXQ+DQo+ICAgICAgICAgX19mdW5jX18gPSAiYXZkdHBfcGFyc2Vf
cmVzcCINCj4gICAgICAgICBfX2J0ZF9kZWJ1Z19kZXNjID0ge2ZpbGUgPSAweDU1ZTQzNjhiM2Y5
NyAicHJvZmlsZXMvYXVkaW8vYXZkdHAuYyIsIGZsYWdzID0gMH0NCj4gICAgICAgICBfX2J0ZF9k
ZWJ1Z19kZXNjID0ge2ZpbGUgPSAweDU1ZTQzNjhiM2Y5NyAicHJvZmlsZXMvYXVkaW8vYXZkdHAu
YyIsIGZsYWdzID0gMH0NCj4gICAgICAgICBfX2J0ZF9kZWJ1Z19kZXNjID0ge2ZpbGUgPSAweDU1
ZTQzNjhiM2Y5NyAicHJvZmlsZXMvYXVkaW8vYXZkdHAuYyIsIGZsYWdzID0gMH0NCj4gICAgICAg
ICBfX2J0ZF9kZWJ1Z19kZXNjID0ge2ZpbGUgPSAweDU1ZTQzNjhiM2Y5NyAicHJvZmlsZXMvYXVk
aW8vYXZkdHAuYyIsIGZsYWdzID0gMH0NCj4gICAgICAgICBfX2J0ZF9kZWJ1Z19kZXNjID0ge2Zp
bGUgPSAweDU1ZTQzNjhiM2Y5NyAicHJvZmlsZXMvYXVkaW8vYXZkdHAuYyIsIGZsYWdzID0gMH0N
Cj4gICAgICAgICBfX2J0ZF9kZWJ1Z19kZXNjID0ge2ZpbGUgPSAweDU1ZTQzNjhiM2Y5NyAicHJv
ZmlsZXMvYXVkaW8vYXZkdHAuYyIsIGZsYWdzID0gMH0NCj4gICAgICAgICBfX2J0ZF9kZWJ1Z19k
ZXNjID0ge2ZpbGUgPSAweDU1ZTQzNjhiM2Y5NyAicHJvZmlsZXMvYXVkaW8vYXZkdHAuYyIsIGZs
YWdzID0gMH0NCj4gICAgICAgICBfX2J0ZF9kZWJ1Z19kZXNjID0ge2ZpbGUgPSAweDU1ZTQzNjhi
M2Y5NyAicHJvZmlsZXMvYXVkaW8vYXZkdHAuYyIsIGZsYWdzID0gMH0NCj4gICAgICAgICBfX2J0
ZF9kZWJ1Z19kZXNjID0ge2ZpbGUgPSAweDU1ZTQzNjhiM2Y5NyAicHJvZmlsZXMvYXVkaW8vYXZk
dHAuYyIsIGZsYWdzID0gMH0NCj4gICAgICAgICBfX2J0ZF9kZWJ1Z19kZXNjID0ge2ZpbGUgPSAw
eDU1ZTQzNjhiM2Y5NyAicHJvZmlsZXMvYXVkaW8vYXZkdHAuYyIsIGZsYWdzID0gMH0NCj4gICAg
ICAgICBfX2J0ZF9kZWJ1Z19kZXNjID0ge2ZpbGUgPSAweDU1ZTQzNjhiM2Y5NyAicHJvZmlsZXMv
YXVkaW8vYXZkdHAuYyIsIGZsYWdzID0gMH0NCj4gIzQgIHNlc3Npb25fY2IgKGNoYW49PG9wdGlt
aXplZCBvdXQ+LCBjb25kPTxvcHRpbWl6ZWQgb3V0PiwgZGF0YT0weDU1ZTQzNzQyOWM0MCkgYXQg
cHJvZmlsZXMvYXVkaW8vYXZkdHAuYzoyMjg2DQo+ICAgICAgICAgc2Vzc2lvbiA9IDB4NTVlNDM3
NDI5YzQwDQo+ICAgICAgICAgaGVhZGVyID0gPG9wdGltaXplZCBvdXQ+DQo+IC0tVHlwZSA8UkVU
PiBmb3IgbW9yZSwgcSB0byBxdWl0LCBjIHRvIGNvbnRpbnVlIHdpdGhvdXQgcGFnaW5nLS0NCj4g
ICAgICAgICBzaXplID0gPG9wdGltaXplZCBvdXQ+DQo+ICAgICAgICAgZmQgPSA8b3B0aW1pemVk
IG91dD4NCj4gICAgICAgICBfX2Z1bmNfXyA9ICJzZXNzaW9uX2NiIg0KPiAjNSAgMHgwMDAwN2Zi
NjRjMjcxYWNmIGluIGdfbWFpbl9kaXNwYXRjaCAoY29udGV4dD0weDU1ZTQzNzQwYzg3MCkgYXQg
L3Zhci90bXAvcG9ydGFnZS9kZXYtbGlicy9nbGliLTIuNzYuMi9nbGliLTIuNzYuMi9nbGliL2dt
YWluLmM6MzQ2MA0KPiAgICAgICAgIGRpc3BhdGNoID0gMHg3ZmI2NGMyY2EzMzAgPGdfaW9fdW5p
eF9kaXNwYXRjaD4NCj4gICAgICAgICBwcmV2X3NvdXJjZSA9IDB4MA0KPiAgICAgICAgIGJlZ2lu
X3RpbWVfbnNlYyA9IDANCj4gICAgICAgICB3YXNfaW5fY2FsbCA9IDANCj4gICAgICAgICB1c2Vy
X2RhdGEgPSAweDU1ZTQzNzQyOWM0MA0KPiAgICAgICAgIGNhbGxiYWNrID0gMHg1NWU0MzY3ZmFl
NjAgPHNlc3Npb25fY2I+DQo+ICAgICAgICAgY2JfZnVuY3MgPSA8b3B0aW1pemVkIG91dD4NCj4g
ICAgICAgICBjYl9kYXRhID0gMHg1NWU0Mzc0NDg1NzANCj4gICAgICAgICBuZWVkX2Rlc3Ryb3kg
PSA8b3B0aW1pemVkIG91dD4NCj4gICAgICAgICBzb3VyY2UgPSAweDU1ZTQzNzQ1NmU1MA0KPiAg
ICAgICAgIGN1cnJlbnQgPSAweDU1ZTQzNzQxNmEwMA0KPiAgICAgICAgIGkgPSAwDQo+ICAgICAg
ICAgY3VycmVudCA9IDxvcHRpbWl6ZWQgb3V0Pg0KPiAgICAgICAgIGkgPSA8b3B0aW1pemVkIG91
dD4NCj4gICAgICAgICBfX2Z1bmNfXyA9ICJnX21haW5fZGlzcGF0Y2giDQo+ICAgICAgICAgc291
cmNlID0gPG9wdGltaXplZCBvdXQ+DQo+ICAgICAgICAgX2dfYm9vbGVhbl92YXJfMTYzID0gPG9w
dGltaXplZCBvdXQ+DQo+ICAgICAgICAgd2FzX2luX2NhbGwgPSA8b3B0aW1pemVkIG91dD4NCj4g
ICAgICAgICB1c2VyX2RhdGEgPSA8b3B0aW1pemVkIG91dD4NCj4gICAgICAgICBjYWxsYmFjayA9
IDxvcHRpbWl6ZWQgb3V0Pg0KPiAgICAgICAgIGNiX2Z1bmNzID0gPG9wdGltaXplZCBvdXQ+DQo+
ICAgICAgICAgY2JfZGF0YSA9IDxvcHRpbWl6ZWQgb3V0Pg0KPiAgICAgICAgIG5lZWRfZGVzdHJv
eSA9IDxvcHRpbWl6ZWQgb3V0Pg0KPiAgICAgICAgIGRpc3BhdGNoID0gPG9wdGltaXplZCBvdXQ+
DQo+ICAgICAgICAgcHJldl9zb3VyY2UgPSA8b3B0aW1pemVkIG91dD4NCj4gICAgICAgICBiZWdp
bl90aW1lX25zZWMgPSA8b3B0aW1pemVkIG91dD4NCj4gICAgICAgICBfZ19ib29sZWFuX3Zhcl8x
NjQgPSA8b3B0aW1pemVkIG91dD4NCj4gIzYgIGdfbWFpbl9jb250ZXh0X2Rpc3BhdGNoIChjb250
ZXh0PWNvbnRleHRAZW50cnk9MHg1NWU0Mzc0MGM4NzApIGF0IC92YXIvdG1wL3BvcnRhZ2UvZGV2
LWxpYnMvZ2xpYi0yLjc2LjIvZ2xpYi0yLjc2LjIvZ2xpYi9nbWFpbi5jOjQyMDANCj4gTm8gbG9j
YWxzLg0KPiAjNyAgMHgwMDAwN2ZiNjRjMjcxZWE4IGluIGdfbWFpbl9jb250ZXh0X2l0ZXJhdGUg
KGNvbnRleHQ9MHg1NWU0Mzc0MGM4NzAsIGJsb2NrPWJsb2NrQGVudHJ5PTEsIGRpc3BhdGNoPWRp
c3BhdGNoQGVudHJ5PTEsIHNlbGY9PG9wdGltaXplZCBvdXQ+KQ0KPiAgICAgYXQgL3Zhci90bXAv
cG9ydGFnZS9kZXYtbGlicy9nbGliLTIuNzYuMi9nbGliLTIuNzYuMi9nbGliL2dtYWluLmM6NDI3
Ng0KPiAgICAgICAgIG1heF9wcmlvcml0eSA9IDIxNDc0ODM2NDcNCj4gICAgICAgICB0aW1lb3V0
ID0gNTk1Mg0KPiAtLVR5cGUgPFJFVD4gZm9yIG1vcmUsIHEgdG8gcXVpdCwgYyB0byBjb250aW51
ZSB3aXRob3V0IHBhZ2luZy0tDQo+ICAgICAgICAgc29tZV9yZWFkeSA9IDENCj4gICAgICAgICBu
ZmRzID0gPG9wdGltaXplZCBvdXQ+DQo+ICAgICAgICAgYWxsb2NhdGVkX25mZHMgPSAzNQ0KPiAg
ICAgICAgIGZkcyA9IDB4NTVlNDM3NDM5MDkwDQo+ICAgICAgICAgYmVnaW5fdGltZV9uc2VjID0g
MA0KPiAjOCAgMHgwMDAwN2ZiNjRjMjcyMTVmIGluIGdfbWFpbl9sb29wX3J1biAobG9vcD0weDU1
ZTQzNzQwYzllMCkgYXQgL3Zhci90bXAvcG9ydGFnZS9kZXYtbGlicy9nbGliLTIuNzYuMi9nbGli
LTIuNzYuMi9nbGliL2dtYWluLmM6NDQ3OQ0KPiAgICAgICAgIHNlbGYgPSA8b3B0aW1pemVkIG91
dD4NCj4gICAgICAgICBfX2Z1bmNfXyA9ICJnX21haW5fbG9vcF9ydW4iDQo+ICM5ICAweDAwMDA1
NWU0MzY4YWZiNTUgaW4gbWFpbmxvb3BfcnVuICgpIGF0IHNyYy9zaGFyZWQvbWFpbmxvb3AtZ2xp
Yi5jOjY2DQo+IE5vIGxvY2Fscy4NCj4gIzEwIDB4MDAwMDU1ZTQzNjhhZmZhYyBpbiBtYWlubG9v
cF9ydW5fd2l0aF9zaWduYWwgKGZ1bmM9ZnVuY0BlbnRyeT0weDU1ZTQzNjgyZjZhMCA8c2lnbmFs
X2NhbGxiYWNrPiwgdXNlcl9kYXRhPXVzZXJfZGF0YUBlbnRyeT0weDApDQo+ICAgICBhdCBzcmMv
c2hhcmVkL21haW5sb29wLW5vdGlmeS5jOjE4OA0KPiAgICAgICAgIGRhdGEgPSAweDU1ZTQzNzQx
NjgyMA0KPiAgICAgICAgIGlvID0gMHg1NWU0Mzc0MTY4NDANCj4gICAgICAgICByZXQgPSA8b3B0
aW1pemVkIG91dD4NCj4gIzExIDB4MDAwMDU1ZTQzNjdlYzRmZiBpbiBtYWluIChhcmdjPTxvcHRp
bWl6ZWQgb3V0PiwgYXJndj08b3B0aW1pemVkIG91dD4pIGF0IHNyYy9tYWluLmM6MTQ1MA0KPiAg
ICAgICAgIGNvbnRleHQgPSA8b3B0aW1pemVkIG91dD4NCj4gICAgICAgICBlcnIgPSAweDANCj4g
ICAgICAgICBzZHBfbXR1ID0gMA0KPiAgICAgICAgIHNkcF9mbGFncyA9IDxvcHRpbWl6ZWQgb3V0
Pg0KPiAgICAgICAgIGdkYnVzX2ZsYWdzID0gPG9wdGltaXplZCBvdXQ+DQo+ICAgICAgICAgX19m
dW5jX18gPSAibWFpbiINCj4NCj4gU28gcmVxIGlzIE5VTEwgYW5kOg0KPiBwcmludCAqb3duZXIN
Cj4gJDIgPSB7dHJhbnNwb3J0ID0gMHgwLCBwZW5kaW5nID0gMHgwLCBuYW1lID0gMHg1NWU0Mzc0
NzNmNzAgIjoxLjQxIiwgd2F0Y2ggPSAwfQ0KPg0KPiBwcmludCAqc2Vzc2lvbg0KPiAkMyA9IHty
ZWYgPSAzLCB2ZXJzaW9uID0gMjU5LCBsc2VwcyA9IDB4NTVlNDM3NDI1OTkwLCBkZXZpY2UgPSAw
eDU1ZTQzNzQzMTNkMCwgc3RhdGUgPSBBVkRUUF9TRVNTSU9OX1NUQVRFX0NPTk5FQ1RFRCwgaW8g
PSAweDU1ZTQzNzQ1ODM3MCwNCj4gICBpb19pZCA9IDM4MCwgc2VwcyA9IDB4NTVlNDM3NDU1OWUw
ID0gezB4NTVlNDM3NDU1YTQwLCAweDU1ZTQzNzQyYmI4MCwgMHg1NWU0Mzc0MmMxZjAsIDB4NTVl
NDM3NDVkYWQwLCAweDU1ZTQzNzQ1ZTA2MH0sIHN0cmVhbXMgPSAweDU1ZTQzNzQ1ZGI3MCA9IHsN
Cj4gICAgIDB4NTVlNDM3NDU1NjkwfSwgcmVxX3F1ZXVlID0gMHgwLCBwcmlvX3F1ZXVlID0gMHgw
LCBwZW5kaW5nX29wZW4gPSAweDAsIHBlbmRpbmdfb3Blbl9pbyA9IDB4MCwgcGh5ID0gNTExLCBp
bXR1ID0gNjcyLCBvbXR1ID0gODk1LCBpbiA9IHsNCj4gICAgIGFjdGl2ZSA9IDAsIG5vX29mX3Bh
Y2tldHMgPSAxLCB0cmFuc2FjdGlvbiA9IDMgJ1wwMDMnLCBtZXNzYWdlX3R5cGUgPSAyICdcMDAy
Jywgc2lnbmFsX2lkID0gNyAnXGEnLA0KPiAgICAgYnVmID0gIlwwMDRcMDA1XDMzNFxiXDAzMFxi
XGZcYlxiXGIiLCAnXDAwMCcgPHJlcGVhdHMgMTAxMyB0aW1lcz4sIGRhdGFfc2l6ZSA9IDAgJ1ww
MDAnfSwNCj4gICBidWYgPSAweDU1ZTQzNzQyYTBmMCAiMlxhXDAyNCIsIDxpbmNvbXBsZXRlIHNl
cXVlbmNlIFwzMzQ+LCBkaXNjb3ZlciA9IDB4MCwgcmVxID0gMHg1NWU0Mzc0NTViNzAsIGRjX3Rp
bWVyID0gMCwgZGNfdGltZW91dCA9IDEsIHN0cmVhbV9zZXR1cCA9IDB9DQo+DQoNCkkgZm9yZ290
LCBJIGhhdmUgdGhlc2UgbG9jYWwgcGF0Y2hlcyB0b286DQotLS0gYmx1ZXotOTk5OS9wcm9maWxl
cy9hdWRpby9hMmRwLmMub3JnICAgICAgICAyMDIzLTA2LTE0IDE2OjIwOjQ1Ljc3NzI2MzUwMiAr
MDIwMA0KKysrIGJsdWV6LTk5OTkvcHJvZmlsZXMvYXVkaW8vYTJkcC5jICAgIDIwMjMtMDYtMTQg
MTY6MjE6NTIuNjUwODQzNjgxICswMjAwDQpAQCAtMjMxLDEwICsyMzEsOCBAQA0KDQogICAgICAg
IERCRygiJXA6IHJlZj0lZCIsIHNldHVwLCBzZXR1cC0+cmVmKTsNCg0KLSAgICAgICBpZiAoc2V0
dXAtPnJlZiA+IDApDQotICAgICAgICAgICAgICAgcmV0dXJuOw0KLQ0KLSAgICAgICBzZXR1cF9m
cmVlKHNldHVwKTsNCisgICAgICAgaWYgKHNldHVwLT5yZWYgPT0gMCkNCisgICAgICAgICAgICAg
ICBzZXR1cF9mcmVlKHNldHVwKTsNCiB9DQoNCiBzdGF0aWMgc3RydWN0IGEyZHBfc2V0dXBfY2Ig
KnNldHVwX2NiX25ldyhzdHJ1Y3QgYTJkcF9zZXR1cCAqc2V0dXApDQotLS0gYmx1ZXotOTk5OS9w
cm9maWxlcy9hdWRpby9hdmR0cC5jLm9yZyAgICAgICAyMDIzLTA2LTE0IDE2OjIyOjE1LjM1MzY5
OTM3MSArMDIwMA0KKysrIGJsdWV6LTk5OTkvcHJvZmlsZXMvYXVkaW8vYXZkdHAuYyAgIDIwMjMt
MDYtMTQgMTY6MjQ6MDUuMjUwOTg4ODA4ICswMjAwDQpAQCAtMTIyMCw3ICsxMjIwLDcgQEANCg0K
ICAgICAgICBEQkcoIiVwOiByZWY9JWQiLCBzZXNzaW9uLCBzZXNzaW9uLT5yZWYpOw0KDQotICAg
ICAgIGlmIChzZXNzaW9uLT5yZWYgPiAwKQ0KKyAgICAgICBpZiAoc2Vzc2lvbi0+cmVmICE9IDAp
DQogICAgICAgICAgICAgICAgcmV0dXJuOw0KDQogICAgICAgIHN3aXRjaCAoc2Vzc2lvbi0+c3Rh
dGUpIHsNCi0tLSBibHVlei05OTk5L3Byb2ZpbGVzL2F1ZGlvL3RyYW5zcG9ydC5jLm9yZyAgIDIw
MjMtMDYtMTMgMTg6Mzg6MTQuNTQyMTM3NTMxICswMjAwDQorKysgYmx1ZXotOTk5OS9wcm9maWxl
cy9hdWRpby90cmFuc3BvcnQuYyAgICAgICAyMDIzLTA2LTEzIDE4OjM5OjIyLjExMDk2NTE4NCAr
MDIwMA0KQEAgLTM0NSw3ICszNDUsNyBAQA0KICAgICAgICBzdHJ1Y3QgbWVkaWFfb3duZXIgKm93
bmVyID0gdXNlcl9kYXRhOw0KICAgICAgICBzdHJ1Y3QgbWVkaWFfcmVxdWVzdCAqcmVxID0gb3du
ZXItPnBlbmRpbmc7DQogICAgICAgIHN0cnVjdCBtZWRpYV90cmFuc3BvcnQgKnRyYW5zcG9ydCA9
IG93bmVyLT50cmFuc3BvcnQ7DQotICAgICAgIHN0cnVjdCBhMmRwX3NlcCAqc2VwID0gbWVkaWFf
ZW5kcG9pbnRfZ2V0X3NlcCh0cmFuc3BvcnQtPmVuZHBvaW50KTsNCisgICAgICAgc3RydWN0IGEy
ZHBfc2VwICpzZXA7DQogICAgICAgIHN0cnVjdCBhdmR0cF9zdHJlYW0gKnN0cmVhbTsNCiAgICAg
ICAgaW50IGZkOw0KICAgICAgICB1aW50MTZfdCBpbXR1LCBvbXR1Ow0KQEAgLTM1Niw2ICszNTYs
NyBAQA0KICAgICAgICBpZiAoZXJyKQ0KICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCg0KKyAg
ICAgICBzZXAgPSBtZWRpYV9lbmRwb2ludF9nZXRfc2VwKHRyYW5zcG9ydC0+ZW5kcG9pbnQpOw0K
ICAgICAgICBzdHJlYW0gPSBhMmRwX3NlcF9nZXRfc3RyZWFtKHNlcCk7DQogICAgICAgIGlmIChz
dHJlYW0gPT0gTlVMTCkNCiAgICAgICAgICAgICAgICBnb3RvIGZhaWw7DQoNCg==
