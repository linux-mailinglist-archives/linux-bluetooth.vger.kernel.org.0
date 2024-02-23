Return-Path: <linux-bluetooth+bounces-2117-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A65138617DB
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Feb 2024 17:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D77AB21F8E
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Feb 2024 16:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3BCF84A2B;
	Fri, 23 Feb 2024 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infinera.com header.i=@infinera.com header.b="XeR9ByQb"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2131.outbound.protection.outlook.com [40.107.94.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379D32E41A
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Feb 2024 16:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708705695; cv=fail; b=BUp8q4AWPHUFStsSzB2DpS4cmVPw0c217jbAVNBKidvnmcR5ScOzRw27PQJ3Av9jQdWI62SollglDYti3g1dlwqJfu0KhvXaOCQv8jRy/VK2R1uflb9+LWVaNGtzw1TXFsOLEq6Fc3O8tWlUjTjqL2Y6gzx4/Os7yaS5NKlgpSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708705695; c=relaxed/simple;
	bh=Frpc/Mt7O6hhqVKOKyaGr2nkUz3d6/FDidoXw6HQ/zs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=btp5QAz5kwetzfd+vLtP3gtZxP39+aZiZTeVM2TO53bIZmWDFc1oWxABXL3yxkQ2vZQHx0MsLTLsdWeJ6VuVvAWndKAGfjPzP3dHpB+wH3XZ2p14BHqVqyvGBO91+W4L3QHtd+vkvTmKAS0Y6/K6zbz5uJJUTVFkN24xcv/xFSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infinera.com; spf=pass smtp.mailfrom=infinera.com; dkim=pass (2048-bit key) header.d=infinera.com header.i=@infinera.com header.b=XeR9ByQb; arc=fail smtp.client-ip=40.107.94.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infinera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infinera.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVWVxFikw9jVUF4KlyVyNP9vDMz73BireA8ebVS25kF3Hog2RgtEsFZmshcWOSqIMArglJPN3JFarhzUfzO9Wr9Lv0LQQ1SS35PnWipymz+Rz2leGfo0pKfTi4FxzDQOc4SeSpqDH9pMoGK1tdv+2oLudEacpjpQTAeHJIjbxYQC2J/vt6J/3BQtFQGbeSVYHehVW9uVcZTrUxwMceWgL22ccxXTWWNoCj+IMtWv7NjDFVhfo7lC2jFIkwDMkYJvfkGyqhytnyOfHb1Y9YoemdLoAAwRwkJf0ggyjFK4RURNdHI21UpTifpbWX0vDexyceZYens/2baMxRyoFlrc6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Frpc/Mt7O6hhqVKOKyaGr2nkUz3d6/FDidoXw6HQ/zs=;
 b=CIjAv+fSrFwcxYL/gdl/OAbGKO/mnHYtGNbkwEg+rxS+xWV/Pm1yAb2KzKgQf0w2hBeEpTmX2TD8Tlm9655xg4wB65p9UlvnVntIU2BpSIAxPpqGJ7Q21L2Sk2noUqM9cxj8xjFLqWWF5weNMgQ+hfC2GqUgXZMdGSSX7OTlDgla1z2taL9PUj5uJxzdsdFzmgABFvaTrTw3inz2DV3JZE0KVQ80zdL30WDTtSfwOigEgW08Neoc6nwMhRaZuMe/HmLVftu5dWuHRhG8fQmnDe83WKmD8Ic8mSA9aUcJ57b+vTDz/9IiH0y42oc3Onn1elVtdkvaSDTUgfrgd1wM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Frpc/Mt7O6hhqVKOKyaGr2nkUz3d6/FDidoXw6HQ/zs=;
 b=XeR9ByQbVkM4gZFJwaZElliqnVZqfHzDYtuzgcmj8lMtkG5Qq6LavF7iF+eq1az0rmw5sZ+zanXqBIwoPxjVrYq0dz/NZEhpEz1kEv3NoUfZRvLGs428LVdjy/iPGvv3XH5+C/AUnuRHG8JVU5B/yscvPcE8pmNRlGyNgpmkF5CMNMlMd4NxZBAhrhlH6Ksy4F97vS9hnfKBL+hzkponIjJjVMgl+5Bvoo6rmWWGjw5DtE7wEAyU7Nc2UK1AAXYONDYhNn64V20MeQNIW+x3sufkVhOdBOlMi6iUzx22UJax0C7w3lFy9rnstj0cZrwMS2yzEtm0JWlFGZJgAwh0Zw==
Received: from CO1PR10MB4612.namprd10.prod.outlook.com (2603:10b6:303:9b::22)
 by CO6PR10MB5539.namprd10.prod.outlook.com (2603:10b6:303:136::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 16:28:10 +0000
Received: from CO1PR10MB4612.namprd10.prod.outlook.com
 ([fe80::42d5:5d74:194d:7828]) by CO1PR10MB4612.namprd10.prod.outlook.com
 ([fe80::42d5:5d74:194d:7828%5]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 16:28:10 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>
CC: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH] CUPS lives in libexecdir
Thread-Topic: [PATCH] CUPS lives in libexecdir
Thread-Index:
 AQHaZLfT1nCv5+aVKkC52rrUBwIM8bEWVl8AgAAErQCAAW0MgIAADnwAgABGx4CAAAPIgA==
Date: Fri, 23 Feb 2024 16:28:10 +0000
Message-ID: <2a7d2057b0030d9f07a5db28e8e236833bb08064.camel@infinera.com>
References: <20240221111901.2807853-1-joakim.tjernlund@infinera.com>
	 <20240221111901.2807853-2-joakim.tjernlund@infinera.com>
	 <CACvgo52M-Efhp92u=fd8qDjV39SWvuoakLgt2JtFftDmZ2pn4g@mail.gmail.com>
	 <4fdde6807ed152d0d24e086fd3357b7c4e410391.camel@infinera.com>
	 <CACvgo51GX0e5hHzVSD1AEMOLU8hiaDpE0R9su+jjN0mw5HaSBw@mail.gmail.com>
	 <ad9af3a622120ce0dac4c83296c76eaa0d7fbfaf.camel@infinera.com>
	 <CACvgo51_p7aZ791VVeWLnRLCeE+mmYZnYK8R4k=WDtOpWbhAbw@mail.gmail.com>
In-Reply-To:
 <CACvgo51_p7aZ791VVeWLnRLCeE+mmYZnYK8R4k=WDtOpWbhAbw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.50.4 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR10MB4612:EE_|CO6PR10MB5539:EE_
x-ms-office365-filtering-correlation-id: a8fee3aa-c5dc-4f2e-e332-08dc348c6ccd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 w9ZY87bcuW4irEtZ5ZoZL/If/gPd7hqLfOV/bBtEd+6CrVd/gInc94sWdBI2vWb6GFvqDTtHP/F3nL4SFOTtmvIMhxg5Ow274UkmXyuhKLTFcceV524NcA6sAH37TviGTsXaHbmLo/5054/FGx1lhkXlnT59xMjrawAU7iKqFosSmkw55ScMW8wVI/PcRxJbJE7Rj6KFvSfICmDISj4+ql+4ViGE/rnYJ8+Tz7aktrQi3XTK6Vc+bgbKYSzx5Ed8SimwNKg4sKtMVLm9hspZ1cMbyddGP9NSbu/svkAhOzb4R6IaM4E9GKz1cFCaqTD0IRH6X5Ux+WokWYAJgExfB+fizzCZawS4iUYRHKsJxsqD3qhNBjiJM/2EpJ6Luw0yYpsKVpOStKTCPs773OGxFjgFOi8CMZPF5YH0g6HOLYR1WuetRRAC9Ni7d35yp8x6dNMMud7NRSj3dnD7ZnGc0ZaT31qmXowNFTHa0tlx1xcN9kIR5Gs9iVCpSsLUORVx+TN6dy405lMMlfGFpj87v9Iso+RIto97xTRO66UlCkqVRFqPJjYGmzr+PyKT52s+CHkChP+DPtKQMGnAmbsoRRsXD8BQfl6N4woo2BW/KfWXVgoArYGHFALGl8OdVc8h
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4612.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L2ZoT0FFamtGNmdIYm5KNWVQamtpcWZCSTl6cVNHcWx1cWlRa1RjbXVhRytJ?=
 =?utf-8?B?S0YxZU5DcDZGNkgyRWZSRTR1QlVEdkhtYVBZN0tKNDlkKzA2S2U1RnU3VWJu?=
 =?utf-8?B?RG5Lc1F3MTk5MUp3SGtNSnhlbkhseVE1Ui9VdUlzeU9mTW93ejRPUzZ6aHBj?=
 =?utf-8?B?M2pQTVh6V3krZk56WlZGeFZHWUVVTjlyNjZiN2JKejg1cTQ3cWdHa3F6RUhO?=
 =?utf-8?B?Nitobm5aYmpaSUhIVEkwbVRGTjJRVk9FN2x6T2hLbzdKZ1lKZTBvYXpwbjlW?=
 =?utf-8?B?bHpBVW1Td05DVHUxYWM3SVlYSlRHUDNvdENyaXFGYXpnNTJKRWEwODh3WXdU?=
 =?utf-8?B?aGhOSmU1V290Q1c2YVZveWlyWE81WHF1YjBwVlZaV1ZVdk9SR0YrMUk1cmZ1?=
 =?utf-8?B?SFgzZHlFNWI2Y3IwMDVWb1hWa2JjY2ltYjRzUFplZTFrdVdKMkhwYmI2ZWhp?=
 =?utf-8?B?cG9kVUF5clg4aTlvRnFCdzE2UEk4MWRrcGg2Ti9vbEtNWVRvUk5CU1V3RzNh?=
 =?utf-8?B?aGtQTnF4TDBmVTBDUVI1VFNQOWcyd3d0ZlNuaEJ3QmpTMGZvNXB3ZmVTR0I5?=
 =?utf-8?B?RjJvVGt3eWZsOWlnY2RvbE1ldS9DRDJvVGdINWVjRldaWW1PbXgzaDczT0w2?=
 =?utf-8?B?ZmZOS3BHOVNndVZYeUxYUGp1VVlxY3E3RjBUNFJSTXdTdUxSRVhRc05xZ0Rn?=
 =?utf-8?B?N0J2QSttWjRuVnpCeXBTbG9pc0FEK01BSzdmR1dhREtXeW5Nb0sxUWEyRHFv?=
 =?utf-8?B?bGVSV1NwR1BUQW02ZC9jNHBySmpzdXd6N3NnbHJaYzljcnRGT1RaZXNqek5x?=
 =?utf-8?B?OHFhdFlPM1V2Ymx5elQ5OURSb0xsRzFyaGkvM0VRWVMvU0RHZHBiMm9OK3dS?=
 =?utf-8?B?NnJXYmNBTmgyNWJ2T0sxVmJxanlJbnpzOS9BS1dQL2xXT2ljM0ZlWEJyWWNM?=
 =?utf-8?B?cnJKajc3Z2ZSVkJNWWsyVHppWGtEVnd0bFEzSk9jR0pndXN3MnhqQjhJZDhI?=
 =?utf-8?B?eThVRHRoQUpBUkNWeU5GUktuM1d1dFZEMWREeG5wQVNjaEJUdGJkQXM3R2RM?=
 =?utf-8?B?NGV0anRkMWNiZE05akZCaFJMUE5GdWpUVkptTzNhaEtmUnRGZDdCc2Z2M0Rq?=
 =?utf-8?B?NjI3WktiQ2taMXNkODJ1K1Y5MUIrdkp5ZE1tR1NQS1pOL09YTGdnOUFqNXhq?=
 =?utf-8?B?L1ByOWVVQWFzbUxxb01KaUwvb2VwUjR5UVowY0VUcnZrZ3BaWk40VzRDNm8x?=
 =?utf-8?B?ZXVSM0RTSXpiYUkySGxreVJsRVdzenMvM1ZvQ3p0MzhOMVRqQXJCcllLQnZp?=
 =?utf-8?B?NkJrb3M0QlNUNndhWEVsV0R2bVA0dlhPMFF1b3FUSWhzT0R5VzBzU21LYTdY?=
 =?utf-8?B?RzY5OE5tQ0l2UWxrWjVTUFd1MkVFT2dJc21DamJzakxRRm5CZjhIOU5YK2Q5?=
 =?utf-8?B?bkhCeHRkNXN3WEc0OVU3MktZNy8rSUN1dWJQSmk3Sno3aVRtL1FZTHBGS2lD?=
 =?utf-8?B?TjNSVkZsRDNaWXkzRWp3OHY3YVJmSWJBU3U0MWY0MWx0eG12TDZsNVIrUGJk?=
 =?utf-8?B?aG1wV2MvVHZlSm9QenZqTjRNV0NlTDF0RGNWWGNVVzY3VUlFQ3QrOG8vZXM0?=
 =?utf-8?B?RUVEc0xzKzBYSXJSS0lDZnB0QmRCU1lVamlNVDVjZnU0QnRXZ3BFMmN5VlBR?=
 =?utf-8?B?WnRyaE5RV2tQdmZHVTFMaW9yUlVlTi9PNEtHVHpTcU1rVi9sUWhkUUdYa2hR?=
 =?utf-8?B?L3VpMENUSnBLUGpBTHhwWUIzYjRwZEx3QUg0aGQ1bU9lRSs1SENHZlRpck5h?=
 =?utf-8?B?STdWTnpETk42S2JuRnM0ek1HbjRKM3RBOElHVDNCdnFuM2ZBb0RDV3JPdG9Y?=
 =?utf-8?B?ZFV6ZXBEajNVK1BTK1U3WjRFNkZ4QTF5SUhEZ1RsUWhvbFpnb1gvWTFJaVd2?=
 =?utf-8?B?TXErZHFqU3FvQUd3UldWVzFNNFJPK2dPcWlPRmVWbXJiWVBCYUVzRFd2SDBp?=
 =?utf-8?B?NTVCaTBhTURERkJ5emR1NlQ5K3o5NURZQkEzdlkvbU1ySTZYZTAyMTlVK3hv?=
 =?utf-8?B?dDZ1d0pFQXZsaHdLc2lVNjU1WjZ5M21mblRnNnY2aGdBWDN2RitONXNoWjNB?=
 =?utf-8?B?NTNEcmtPUFM5T0ZhN0NFSUdIUWp4cnRWajJJbTZEUWN0eGIydVRoK3l3b1Mx?=
 =?utf-8?Q?HdL843nlvUDa5/DZKwOTH+Ur/wlk7YQsCTAJuL9I0bZ2?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBB06D3ACAC1E74D87FB20BD2572E36E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-bluetooth@vger.kernel.org
List-Id: <linux-bluetooth.vger.kernel.org>
List-Subscribe: <mailto:linux-bluetooth+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-bluetooth+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4612.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fee3aa-c5dc-4f2e-e332-08dc348c6ccd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 16:28:10.5124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ee6oXDrL5JJ2MKcYAtcZ+jZV3w2AEcRd5kZRJy4zrOm58c9ThuBzSRFSahFQm4Kd8x1cOIjR0X5M2pIpokkVig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5539

T24gRnJpLCAyMDI0LTAyLTIzIGF0IDE2OjE0ICswMDAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6DQo+
IE9uIEZyaSwgMjMgRmViIDIwMjQgYXQgMTI6MDEsIEpvYWtpbSBUamVybmx1bmQNCj4gPEpvYWtp
bS5UamVybmx1bmRAaW5maW5lcmEuY29tPiB3cm90ZToNCj4gPiANCj4gPiBPbiBGcmksIDIwMjQt
MDItMjMgYXQgMTE6MDkgKzAwMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToNCj4gPiA+IE9uIFRodSwg
MjIgRmViIDIwMjQgYXQgMTM6MjIsIEpvYWtpbSBUamVybmx1bmQNCj4gPiA+IDxKb2FraW0uVGpl
cm5sdW5kQGluZmluZXJhLmNvbT4gd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiBPbiBUaHUsIDIw
MjQtMDItMjIgYXQgMTM6MDYgKzAwMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToNCj4gPiA+ID4gPiBP
biBXZWQsIDIxIEZlYiAyMDI0IGF0IDExOjE5LCBKb2FraW0gVGplcm5sdW5kDQo+ID4gPiA+ID4g
PGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPiB3cm90ZToNCj4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gRnJvbTogSm9ha2ltIFRqZXJubHVuZCA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVy
YS5jb20+DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvYWtpbSBU
amVybmx1bmQgPEpvYWtpbS5UamVybmx1bmRAaW5maW5lcmEuY29tPg0KPiA+ID4gPiA+ID4gLS0t
DQo+ID4gPiA+ID4gPiAgTWFrZWZpbGUudG9vbHMgfCAyICstDQo+ID4gPiA+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+ID4gPiANCj4g
PiA+ID4gPiA+IGRpZmYgLS1naXQgYS9NYWtlZmlsZS50b29scyBiL01ha2VmaWxlLnRvb2xzDQo+
ID4gPiA+ID4gPiBpbmRleCAwNDQzNDJlMjkuLmI3ODVlYmVhOCAxMDA2NDQNCj4gPiA+ID4gPiA+
IC0tLSBhL01ha2VmaWxlLnRvb2xzDQo+ID4gPiA+ID4gPiArKysgYi9NYWtlZmlsZS50b29scw0K
PiA+ID4gPiA+ID4gQEAgLTUzOCw3ICs1MzgsNyBAQCBlbmRpZg0KPiA+ID4gPiA+ID4gIGVuZGlm
DQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ICBpZiBDVVBTDQo+ID4gPiA+ID4gPiAtY3Vwc2Rp
ciA9ICQobGliZGlyKS9jdXBzL2JhY2tlbmQNCj4gPiA+ID4gPiA+ICtjdXBzZGlyID0gJChsaWJl
eGVjZGlyKS9jdXBzL2JhY2tlbmQNCj4gPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+
IElzIHRoaXMgdHJ1ZSwgY2FuIHlvdSBwcm92aWRlIHNvbWUgcmVmZXJlbmNlcz8NCj4gPiA+ID4g
PiANCj4gPiA+ID4gPiBMb29raW5nIGF0IERlYmlhbiBbMV0gKHdoaWNoIGNvbnRyYXJ5IHRvIEFy
Y2ggaGFzIGxpYmV4ZWMpIC0gYmFja2VuZHMNCj4gPiA+ID4gPiBhcmUgaW4gL3Vzci9saWIuIEds
YW5jaW5nIGF0IHRoZSBjdXBzIGJhY2tlbmRzIG1ha2VmaWxlIGl0J3MgdXNpbmcNCj4gPiA+ID4g
PiBTRVJWRVJCSU4uIENhc3VhbCBncmVwIHNob3dzIHRoYXQgbGliZXhlYyBjYW4gYmUgYXBwbGlj
YWJsZSBmb3INCj4gPiA+ID4gPiBCU0QvRGFyd2luIHBsYXRmb3JtcyBbM10sIHdoaWNoIGFyZSBv
dXQgb2Ygc2NvcGUgZm9yIGJsdWV6IElJUkMuDQo+ID4gPiA+IA0KPiA+ID4gPiBvbiBHZW50b28g
eW91IGhhdmU6DQo+ID4gPiA+IA0KPiA+ID4gPiBxbGlzdCBuZXQtcHJpbnQvY3VwcyB8IGdyZXAg
YmFja2VuZA0KPiA+ID4gPiAuLi4NCj4gPiA+ID4gL3Vzci9saWJleGVjL2N1cHMvYmFja2VuZC9p
bXBsaWNpdGNsYXNzDQo+ID4gPiA+IC91c3IvbGliZXhlYy9jdXBzL2JhY2tlbmQvYmVoDQo+ID4g
PiA+IC91c3IvbGliZXhlYy9jdXBzL2JhY2tlbmQvc2VyaWFsDQo+ID4gPiA+IC91c3IvbGliZXhl
Yy9jdXBzL2JhY2tlbmQvcGFyYWxsZWwNCj4gPiA+ID4gL3Vzci9saWJleGVjL2N1cHMvYmFja2Vu
ZC9kcml2ZXJsZXNzLWZheA0KPiA+ID4gPiAvdXNyL2xpYmV4ZWMvY3Vwcy9iYWNrZW5kL2RyaXZl
cmxlc3MNCj4gPiA+ID4gL3Vzci9saWJleGVjL2N1cHMvYmFja2VuZC9jdXBzLXBkZg0KPiA+ID4g
PiANCj4gPiA+ID4gYnV0IG5vdyBJIHNlZSB0aGlzIGluIEdlbnRvbyBlYnVpbGQ6DQo+ID4gPiA+
ICAgICAgICAgIyBJbnN0YWxsIGluIC91c3IvbGliZXhlYyBhbHdheXMsIGluc3RlYWQgb2YgdXNp
bmcgL3Vzci9saWIvY3VwcywgYXMgdGhhdA0KPiA+ID4gPiAgICAgICAgICMgbWFrZXMgbW9yZSBz
ZW5zZSB3aGVuIGZhY2luZyBtdWx0aWxpYiBzdXBwb3J0Lg0KPiA+ID4gPiAgICAgICAgIHNlZCAt
aSAtZSAnczpDVVBTX1NFUlZFUkJJTj0iJGV4ZWNfcHJlZml4L2xpYi9jdXBzIjpDVVBTX1NFUlZF
UkJJTj0iJGV4ZWNfcHJlZml4L2xpYmV4ZWMvY3VwcyI6ZycgY29uZmlndXJlIHx8ZGllDQo+ID4g
PiA+IA0KPiA+ID4gPiAgICAgICAgIGVjb25mICIke215ZWNvbmZhcmdzW0BdfSINCj4gPiA+ID4g
DQo+ID4gPiA+ICAgICAgICAgc2VkIC1pIC1lICJzOlNFUlZFUkJJTi4qOlNFUlZFUkJJTiA9IFwi
XCRcKEJVSUxEUk9PVFwpJHtFUFJFRklYfS91c3IvbGliZXhlYy9jdXBzXCI6IiBNYWtlZGVmcyB8
fCBkaWUNCj4gPiA+ID4gICAgICAgICBzZWQgLWkgLWUgInM6I2RlZmluZSBDVVBTX1NFUlZFUkJJ
Ti4qOiNkZWZpbmUgQ1VQU19TRVJWRVJCSU4gXCIke0VQUkVGSVh9L3Vzci9saWJleGVjL2N1cHNc
IjoiIGNvbmZpZy5oIHx8IGRpZQ0KPiA+ID4gPiAgICAgICAgIHNlZCAtaSAtZSAiczpjdXBzX3Nl
cnZlcmJpbj0uKjpjdXBzX3NlcnZlcmJpbj1cIiR7RVBSRUZJWH0vdXNyL2xpYmV4ZWMvY3Vwc1wi
OiIgY3Vwcy1jb25maWcgfHwgZGllDQo+ID4gPiA+IA0KPiA+ID4gPiBzbyBpdCBhcHBlYXJzIHRv
IGJlIGEgR2VudG9vIGFkZGl0aW9uLg0KPiA+ID4gPiBXb3VsZCBwZXJoYXBzDQo+ID4gPiA+ICAg
cGtnLWNvbmZpZyBjdXBzIC0tdmFyaWFibGU9Y3Vwc19zZXJ2ZXJiaW4NCj4gPiA+ID4gb3INCj4g
PiA+ID4gICBjdXBzLWNvbmZpZyAtLXNlcnZlcmJpbg0KPiA+ID4gPiBiZSBhY2NlcHRhYmxlPyBJ
ZiBubyB3ZSBjYW4ganVzdCBkcm9wIHRoaXMgYW5kIEdlbnRvbyB3aWxsIGNvbnRpbnVlIHRvIHBh
dGNoIGJsdWV6IGZvciBjdXBzDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBVc2luZyB0aGUgZm9v
LWNvbmZpZyB0b29scyBzb3VuZHMgYmV0dGVyIHRoYW4gdGhlIGN1cnJlbnQgaGFyZC1jb2RlZA0K
PiA+ID4gYmVoYXZpb3VyLiBQYXRjaCB0aGF0IGRvZXMgdGhhdCBnZXRzIGEgYmlnIHRodW1icy11
cCBmcm9tIG1lLg0KPiA+ID4gUGVyc29uYWxseSBJIGhhdmUgc2xpZ2h0IGluY2xpbmF0aW9uIHRv
d2FyZHMgdGhlIHBrZy1jb25maWcgLSBhbHRob3VnaA0KPiA+ID4gaXQnbGwgYmUgdXAtdG8gdGhl
IG1haW50YWluZXJzLg0KPiA+IA0KPiA+IFRoaXMgaXMgd2hhdCBJIGNhbWUgdXAgd2l0aDoNCj4g
PiANCj4gPiBGcm9tIGM2Nzc2YjIwNWI4YWRiZjZlMmUyOTEwOGExYTdmZjM0ODU0NmE1MzEgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxDQo+ID4gRnJvbTogSm9ha2ltIFRqZXJubHVuZCA8am9ha2lt
LnRqZXJubHVuZEBpbmZpbmVyYS5jb20+DQo+ID4gRGF0ZTogRnJpLCAyMyBGZWIgMjAyNCAxMjo1
NjoyMSArMDEwMA0KPiA+IFN1YmplY3Q6IFtQQVRDSF0gY3VwczogVXNlIHBrZy1jb25maWcgdG8g
ZmluZCBjdXBzIGJhY2tlbmQgZGlyDQo+ID4gDQo+ID4gU29tZSBkaXN0cmlidXRpb25zKEdlbnRv
bykgcGF0Y2ggY3VwcyBiYWNrZW5kIHBhdGggdG8NCj4gPiBzb21ldGhpbmcgZWxzZSB0aGFuIGxp
YmRpci4gVXNlIHBrZy1jb25maWcgdG8gZmluZCBiYWNrZW5kDQo+ID4gcGF0aCBmb3IgY3Vwcy4N
Cj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2FraW0gVGplcm5sdW5kIDxqb2FraW0udGplcm5s
dW5kQGluZmluZXJhLmNvbT4NCj4gPiAtLS0NCj4gPiAgTWFrZWZpbGUudG9vbHMgfCAyIC0tDQo+
ID4gIGNvbmZpZ3VyZS5hYyAgIHwgMyArKysNCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL01ha2VmaWxl
LnRvb2xzIGIvTWFrZWZpbGUudG9vbHMNCj4gPiBpbmRleCAwNDQzNDJlMjkuLjc2MDcyNzU1NyAx
MDA2NDQNCj4gPiAtLS0gYS9NYWtlZmlsZS50b29scw0KPiA+ICsrKyBiL01ha2VmaWxlLnRvb2xz
DQo+ID4gQEAgLTUzOCw4ICs1MzgsNiBAQCBlbmRpZg0KPiA+ICBlbmRpZg0KPiA+IA0KPiA+ICBp
ZiBDVVBTDQo+ID4gLWN1cHNkaXIgPSAkKGxpYmRpcikvY3Vwcy9iYWNrZW5kDQo+ID4gLQ0KPiA+
ICBjdXBzX1BST0dSQU1TID0gcHJvZmlsZXMvY3Vwcy9ibHVldG9vdGgNCj4gPiANCj4gPiAgcHJv
ZmlsZXNfY3Vwc19ibHVldG9vdGhfU09VUkNFUyA9IHByb2ZpbGVzL2N1cHMvbWFpbi5jIFwNCj4g
PiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjDQo+ID4gaW5kZXggYmI2
MzgwZjJmLi42YTdmZWZhMWQgMTAwNjQ0DQo+ID4gLS0tIGEvY29uZmlndXJlLmFjDQo+ID4gKysr
IGIvY29uZmlndXJlLmFjDQo+ID4gQEAgLTI0Miw2ICsyNDIsOSBAQCBBQ19TVUJTVChVREVWX0RJ
UiwgWyR7cGF0aF91ZGV2ZGlyfV0pDQo+ID4gIEFDX0FSR19FTkFCTEUoY3VwcywgQVNfSEVMUF9T
VFJJTkcoWy0tZGlzYWJsZS1jdXBzXSwNCj4gPiAgICAgICAgICAgICAgICAgIFtkaXNhYmxlIENV
UFMgcHJpbnRlciBzdXBwb3J0XSksIFtlbmFibGVfY3Vwcz0ke2VuYWJsZXZhbH1dKQ0KPiA+ICBB
TV9DT05ESVRJT05BTChDVVBTLCB0ZXN0ICIke2VuYWJsZV9jdXBzfSIgIT0gIm5vIikNCj4gPiAr
aWYgKHRlc3QgIiR7ZW5hYmxlX2N1cHN9IiAhPSAibm8iKTsgdGhlbg0KPiA+ICsgICBBQ19TVUJT
VChjdXBzZGlyLCBgJFBLR19DT05GSUcgY3VwcyAtLXZhcmlhYmxlPWN1cHNfc2VydmVyYmluYC9i
YWNrZW5kKQ0KPiA+ICtmaQ0KPiA+IA0KPiA+ICBBQ19BUkdfRU5BQkxFKG1lc2gsIEFTX0hFTFBf
U1RSSU5HKFstLWVuYWJsZS1tZXNoXSwNCj4gPiAgICAgICAgICAgICAgICAgW2VuYWJsZSBNZXNo
IHByb2ZpbGUgc3VwcG9ydF0pLCBbZW5hYmxlX21lc2g9JHtlbmFibGV2YWx9XSkNCj4gDQo+IEFG
QUlDVCB0aGUgZXhpc3RpbmcgcGF0dGVybnMgaXMgdG8gdXNlICJBQ19TVUJTVChGT09CQVJESVIs
IC4uLikiIGluDQo+IGNvbmZpZ3VyZS5hYyBhbmQgImZvb2JhcmRpciA9ICQoRk9PQkFSRElSKSIg
aW4gdGhlIG1ha2VmaWxlcy4NCj4gDQo+IFRoYW5rcw0KPiBFbWlsDQpMaWtlIHNvID8NCg0KRnJv
bSA3MGE0MjRiOTkzNTcxMmZlZjI5N2FmY2IwZTZkZmY4ZWUxNTRiMjFlIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQ0KRnJvbTogSm9ha2ltIFRqZXJubHVuZCA8am9ha2ltLnRqZXJubHVuZEBpbmZp
bmVyYS5jb20+DQpEYXRlOiBGcmksIDIzIEZlYiAyMDI0IDEyOjU2OjIxICswMTAwDQpTdWJqZWN0
OiBbUEFUQ0hdIGN1cHM6IFVzZSBwa2ctY29uZmlnIHRvIGZpbmQgY3VwcyBiYWNrZW5kIGRpcg0K
DQpTb21lIGRpc3RyaWJ1dGlvbnMoR2VudG9vKSBwYXRjaCBjdXBzIGJhY2tlbmQgcGF0aCB0bw0K
c29tZXRoaW5nIGVsc2UgdGhhbiBsaWJkaXIuIFVzZSBwa2ctY29uZmlnIHRvIGZpbmQgYmFja2Vu
ZA0KcGF0aCBmb3IgY3Vwcy4NCg0KU2lnbmVkLW9mZi1ieTogSm9ha2ltIFRqZXJubHVuZCA8am9h
a2ltLnRqZXJubHVuZEBpbmZpbmVyYS5jb20+DQotLS0NCiBNYWtlZmlsZS50b29scyB8IDMgKyst
DQogY29uZmlndXJlLmFjICAgfCAzICsrKw0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9NYWtlZmlsZS50b29scyBiL01ha2Vm
aWxlLnRvb2xzDQppbmRleCAwNDQzNDJlMjkuLmMxNzI0NDY3NyAxMDA2NDQNCi0tLSBhL01ha2Vm
aWxlLnRvb2xzDQorKysgYi9NYWtlZmlsZS50b29scw0KQEAgLTUzOCw3ICs1MzgsOCBAQCBlbmRp
Zg0KIGVuZGlmDQogDQogaWYgQ1VQUw0KLWN1cHNkaXIgPSAkKGxpYmRpcikvY3Vwcy9iYWNrZW5k
DQorDQorY3Vwc2RpciA9ICQoQ1VQU0RJUikNCiANCiBjdXBzX1BST0dSQU1TID0gcHJvZmlsZXMv
Y3Vwcy9ibHVldG9vdGgNCiANCmRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUu
YWMNCmluZGV4IGJiNjM4MGYyZi4uNzc4YzI3YTBmIDEwMDY0NA0KLS0tIGEvY29uZmlndXJlLmFj
DQorKysgYi9jb25maWd1cmUuYWMNCkBAIC0yNDIsNiArMjQyLDkgQEAgQUNfU1VCU1QoVURFVl9E
SVIsIFske3BhdGhfdWRldmRpcn1dKQ0KIEFDX0FSR19FTkFCTEUoY3VwcywgQVNfSEVMUF9TVFJJ
TkcoWy0tZGlzYWJsZS1jdXBzXSwNCiAgICAgICAgICAgICAgICAgW2Rpc2FibGUgQ1VQUyBwcmlu
dGVyIHN1cHBvcnRdKSwgW2VuYWJsZV9jdXBzPSR7ZW5hYmxldmFsfV0pDQogQU1fQ09ORElUSU9O
QUwoQ1VQUywgdGVzdCAiJHtlbmFibGVfY3Vwc30iICE9ICJubyIpDQoraWYgKHRlc3QgIiR7ZW5h
YmxlX2N1cHN9IiAhPSAibm8iKTsgdGhlbg0KKyAgIEFDX1NVQlNUKENVUFNESVIsIGAkUEtHX0NP
TkZJRyBjdXBzIC0tdmFyaWFibGU9Y3Vwc19zZXJ2ZXJiaW5gL2JhY2tlbmQpDQorZmkNCiANCiBB
Q19BUkdfRU5BQkxFKG1lc2gsIEFTX0hFTFBfU1RSSU5HKFstLWVuYWJsZS1tZXNoXSwNCiAJCVtl
bmFibGUgTWVzaCBwcm9maWxlIHN1cHBvcnRdKSwgW2VuYWJsZV9tZXNoPSR7ZW5hYmxldmFsfV0p
DQotLSANCjIuNDMuMA0KDQo=

