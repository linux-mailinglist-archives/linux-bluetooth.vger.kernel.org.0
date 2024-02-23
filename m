Return-Path: <linux-bluetooth+bounces-2096-lists+linux-bluetooth=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 450AB8610EC
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Feb 2024 13:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6411B1C221F2
	for <lists+linux-bluetooth@lfdr.de>; Fri, 23 Feb 2024 12:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 680B8692E0;
	Fri, 23 Feb 2024 12:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infinera.com header.i=@infinera.com header.b="Qx/THbvH"
X-Original-To: linux-bluetooth@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2120.outbound.protection.outlook.com [40.107.244.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C687A736
	for <linux-bluetooth@vger.kernel.org>; Fri, 23 Feb 2024 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708689686; cv=fail; b=e0zu5PfMqRMLc5uaPIO0XaSqOGnRPOGHlBSloJ0STP4Is6VC6oYbpaJ1xeKcdP+iXfdWR/vuzaGeig8Y+T0N/y38Av9k1cnznfMPmsk2V+RXzeOFFPRasKHn2rMlKSBCX5CBzSQ8nBZ6Ql9FbhaFAyCG99Ps9MvgEicoDyjKaXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708689686; c=relaxed/simple;
	bh=syf6VHRs4CPInL96PZWZcvTHouspph5KJIrQzHEPEbE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TUDrSUdixBpY2FFXYvXxa+wh/pArec+T5DQsQ33da9wpq9fSWXkxYX5HJX4GHovA2UFVIfkfghXidHxYUnazdk6SeUgg04r03wlVTBIfpOuem1xooLJRA90AoDxzE4ZTGWOtD+drtaslXIj+x1iRayj1gF9DIm7FXdOL9MpIdPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infinera.com; spf=pass smtp.mailfrom=infinera.com; dkim=pass (2048-bit key) header.d=infinera.com header.i=@infinera.com header.b=Qx/THbvH; arc=fail smtp.client-ip=40.107.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infinera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infinera.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=avBLX3QSfL824GYXDbcEyjAnLAdsDVQjlFddLY9Se4b1UCoPmkjfXUF1bAiOS08BotJtCTMzLfudRLzzLSX43U9oOvGnNmS2ydLLJ0K8Sk7Un1B3Hloa5DE8t3eIeAUAoqWRKU3kPoA5K1Bua3XyUR8XwSssyAkx1cAtZc4h/zMU6A5WK1KvwCJSP+mgTGsGR9sSrZ8MC2NSywnvCE0vSrhsOn7kmUeR8YmxDKi2YDe3+iM5HE3UvO9+atDhtJuGW6kNpxsKQTZhAtfoO5PMoamOEAwWkieftdxWBNFtm81Ea7v+VN0GOn6+4E+U5dUABN7DVPyIs6lPOJ/vJWxeog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syf6VHRs4CPInL96PZWZcvTHouspph5KJIrQzHEPEbE=;
 b=WC0a0xBdH8V9uithD6XjNrCt/0ZNO1Ym05S4bnstXZGk2wHm94LmxZFhhEaHhAAFuQalMO2LMWAJaFbvW6MHCMwuo1Qba65gLomygnaHSPdop9UG4xMV796IufXM4UUSUL7FLTD5jYDWV2W36i/YJ8YRS8eUwgkuGd6bgpyR/on3n3+WJci4NDQUZpoBQ755naJ4AiaIRNeS3wPPdGkcQJCtseSkz6+So+WC+MavIT0a1kEYYYSZ1qjvY+CZ6uCuRK87YjHVo/SPGumt9FQeln4MAx3HjpxQ9PVutz08Oba5KSxt55v1Ujg1p99Bk7Yjv0SZrJYwQ+SNkdIXgV7NOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syf6VHRs4CPInL96PZWZcvTHouspph5KJIrQzHEPEbE=;
 b=Qx/THbvHmpAyWaWZ1B/qXUma+Y1jjqU4JK2w4W12O2q7TOAEFYfyhCjH+3dGf33JVyJRHtIFgtYgx7klAtvrz94Iuqcz2fbstWPd+xAMfduMt2aSD+wdwILeHmWYDlgKdmppr5SG23XdJzT+CvVorP+apHi5IsMVirqHwzYkoPNrcG8CH3tFK8ORtMILm7DmomlD9CUfDkdUhfv2RPGuN2mHHwoMP7mwz61PLaXlEDh69QO/iein5PEomQKKwIRMAeVe7y0Rms7galj1ygiyWxqfM5YgWKYtJufmlKyJqOrWW5xUxrl7R40HypBXurXba8U2N28jvZ0zoloMJ91W8A==
Received: from CO1PR10MB4612.namprd10.prod.outlook.com (2603:10b6:303:9b::22)
 by CY5PR10MB5937.namprd10.prod.outlook.com (2603:10b6:930:2e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 12:01:19 +0000
Received: from CO1PR10MB4612.namprd10.prod.outlook.com
 ([fe80::42d5:5d74:194d:7828]) by CO1PR10MB4612.namprd10.prod.outlook.com
 ([fe80::42d5:5d74:194d:7828%5]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 12:01:19 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "emil.l.velikov@gmail.com" <emil.l.velikov@gmail.com>
CC: "linux-bluetooth@vger.kernel.org" <linux-bluetooth@vger.kernel.org>
Subject: Re: [PATCH] CUPS lives in libexecdir
Thread-Topic: [PATCH] CUPS lives in libexecdir
Thread-Index: AQHaZLfT1nCv5+aVKkC52rrUBwIM8bEWVl8AgAAErQCAAW0MgIAADnwA
Date: Fri, 23 Feb 2024 12:01:19 +0000
Message-ID: <ad9af3a622120ce0dac4c83296c76eaa0d7fbfaf.camel@infinera.com>
References: <20240221111901.2807853-1-joakim.tjernlund@infinera.com>
	 <20240221111901.2807853-2-joakim.tjernlund@infinera.com>
	 <CACvgo52M-Efhp92u=fd8qDjV39SWvuoakLgt2JtFftDmZ2pn4g@mail.gmail.com>
	 <4fdde6807ed152d0d24e086fd3357b7c4e410391.camel@infinera.com>
	 <CACvgo51GX0e5hHzVSD1AEMOLU8hiaDpE0R9su+jjN0mw5HaSBw@mail.gmail.com>
In-Reply-To:
 <CACvgo51GX0e5hHzVSD1AEMOLU8hiaDpE0R9su+jjN0mw5HaSBw@mail.gmail.com>
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
x-ms-traffictypediagnostic: CO1PR10MB4612:EE_|CY5PR10MB5937:EE_
x-ms-office365-filtering-correlation-id: 4733d53f-58ab-48b8-d00a-08dc34672583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 g/4iKBhY4cU5uVs5XrSzI/4vFM8IkHsTOyqteOi4VcR6edHpDqkP6n8x/6sEmGkKNO14dHzsLgwF/f7ULVMFdDzjWPOCXGIQW9tEfEdi9/ezl2HsGZYMX0J3YLASg4pbX0OfMfjglgiCVGvsUIvvnOcjZ7PubJS4jSIAqOLuPz9I/u3k7HBjYKcvFnF0BX98JuOPhduZYrevUirycPDjtbgcR+6aOxuj0FS6hRWMtMYm5bETaWNXhqK0jKIM/2geW1YkqD4+VKrt+AwPrqqJBNsLbqxhTGh3GGUJ/kFXTy0Yl61QI886muRZj21QTEa4HlX3Xsk+mo8tfBeL3M6eYXVyApgJA/QwtEXimSKFaYNcEosCsPJnpUJmnouzWGrNCdzLHEUgM8Lr7rQzD6uaiAaqjy00leVJr4MKzpghxcvYyxWv/C4CSF2L7SmdaFxBx2iwXG33dqS/C50PYdyhqy7yCm2yqVcwlXk5nW7cJBhgGO+EYJz4GYsFEeoRjswsz8Aq6ebwDUuzhOarWRHCxNr8ijfxrgD5YukIwi5lc2p2H4s3wJ60OZ3QMvRYuENlUw/UlC4nKvsg/GC0uQRIR9Wr6dDnXmaFr33jzfmoliu+a3I2/bX8H1XBA3Qn2z2/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR10MB4612.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UHRkRjEveE5PalNiVU00QXlRclZ3dWMyQStuV296ci9PYVM4YXlaakRmNDFJ?=
 =?utf-8?B?WE9EdmhCM0xINEQ1dUlsSkdIZjROenpkcjlOd2s1SXZITEdKdGk2ckNhUGRY?=
 =?utf-8?B?allEVXUyWFZQY1hSeTFneURGSXFGNi9tWnplRFE3NzB3dGgrQ1FiaHJsV2lH?=
 =?utf-8?B?djUvTVl2WGROMnprbk1PLzFiR3M3YzYwNDE0Nkd2cWdkc1UxR1dpakY3aTY0?=
 =?utf-8?B?UlFJVEQ1QmFDeEpBYlNOamRLWENldU5yRkN6UG9ocmphd2tTRGdlbGtMR2xS?=
 =?utf-8?B?YmU2anFuNE1hWnFVUS80d0tiTXB2ZkxSQWdlRndyOW1qV1piT2IwekYrdyt3?=
 =?utf-8?B?NXBhZjVLSVBXdUgrb0diTnJiaWt5bzBHbFlkVkNRYjIxT0pBVHV0bWkzbnpJ?=
 =?utf-8?B?dnlmUmwwblVuYWxHelkxaHNTQXpNWGcvQ20vTXFsNGNJYmpRZGhiWHZvdGo0?=
 =?utf-8?B?cy9vWTZKVzRXSW50bC9YL3lTK1NtcytBVzJWNFJWOEl5eWhDNlhpUEpleEUz?=
 =?utf-8?B?c3Z4TG1ka1FwWUxJWm1ld2JDTW9XUTNhcEN0M1A2Vy9qUGc3V1EzNjhjc3k5?=
 =?utf-8?B?amNTOTNTRGlJR2hLSzhHU3krMXlTM2RqVEp5M3VvaXpxSVoxWGdVRU5yWXhy?=
 =?utf-8?B?dDdPYmJ0TXduRGJZVFVqSDFEN3cvdzRLK3F6TklaMU5XUUh4ZVNkSFJFVEI3?=
 =?utf-8?B?VklZc1NiQXd5M2lqWDdkR3FlakorRmVpQkppUFNtRGtYMlNnMEZpMXFPeU56?=
 =?utf-8?B?QWUrM01hVVJPdHowTFI4bVdOUHk2WjdBNDlhSWRZaERHSGtEdit5NDRWNi9K?=
 =?utf-8?B?Z0p2akxoNVBvNmNoQTVYQzJUcDdYalQyYnJ4WWJzc1YwWEFRMEYyYm1xZ3lV?=
 =?utf-8?B?aGU3b2wwRUdxSlZsQnI2cTMzNGxJUzVRejJJRDNlcXZPSW8rMHgxanlCam5R?=
 =?utf-8?B?NlZvc3J4ZFFIc1VNRERnOVB3MjZXTlQyZmQxM0dabWZHdmlaa3drVmhpOEtM?=
 =?utf-8?B?bDZrTnJBOWozZ1JrM0owTnMyZlFETnU0YjlzeU50OWdzWjE2akFMaG56VVNY?=
 =?utf-8?B?V3VwS0Y4Um11bUE2Vm9KQzFPVjBvZExUNWxUc1dqUEtCUDhPS3VKdEFGUFhB?=
 =?utf-8?B?S0ZBeDdiWlM1L3l0bWJhaTIwZkFITmJIa3B1dm9ySWY0am5RRUtxcHFRdUxO?=
 =?utf-8?B?Mjl5enhWQkl0TVNoUHRGS1JiZWc5VXRIMytLUUxYOXVaM0lUZzZCVHovdzVv?=
 =?utf-8?B?UFZVMVpkOU5ZZmJHWEduOXlEY29DUzBsTSs2MklqLzY3OHVySmh3TTc2SHk2?=
 =?utf-8?B?QWN0dDNENTBQOFM1Zzh3NGNtdWYzQi9hb0hzMVdnT1BlOUJ4YjcySnJ3Z252?=
 =?utf-8?B?NFVuWFkwT090T2FadE9qVTZRM0VtTFFlejM1V1lFWkhxQitWME40MGtxLy9R?=
 =?utf-8?B?NHVQWDJnbzRpYkI4bG9MSVBubHJjL2orbU82Tnp5MytzL3J6QVpSVlNuaEFx?=
 =?utf-8?B?RU1HSzlqWHZuRUYvWGxwUndRN01Dc2J4NUlqQ1JHTElIdnA0QTZnUmRvY1dl?=
 =?utf-8?B?aEx0bjJva09yazBlYXp2cG96V3d4SGpveFFBdmRHclIxT3BCZ2h6azJvYk82?=
 =?utf-8?B?ZFRsYms1cVJHZDRZdVBtQUcwY1ZtMHhQcDlNL1NoVm1GbXZPS3l1UnF1aTdJ?=
 =?utf-8?B?R25BU0JpV3F1UUVqYmtzR3dGL0ZmYmp4a2xjVWIrSlQ5OHcrQXEybVhka1U1?=
 =?utf-8?B?SFQxSUZySmsxcFNjWDRNZEZMQjU3aUZyT3NFakRkNW9zMW5pelJhbm9pVXp1?=
 =?utf-8?B?UUo3UCtXcjIxUVdCODVsV0w2Skx4dEtMd2V1ZmtXaEwxSnAzUHBPTmRTbys3?=
 =?utf-8?B?SUFWR1hsRERzemg5T00yMitDeGpmWHJza2JqTXp0dEtpYVpBUEhKY2wyKzRG?=
 =?utf-8?B?cmVBbUNhZ3Q0SXVSOW82VEFVbFFJS0R5QTd2T3puVGJEUzZRb2xOeEZISHN4?=
 =?utf-8?B?MmtwcXRJOTFta25IaUpycTE1S2JFOU1xSU1OVWhtUlpkUnNoYUtDWk9uMTQv?=
 =?utf-8?B?QVE3TWI3Qmc4ZTNJZzVScFRhUGRHdnU5NUdlbDVZazcvSGxlOGUxTW9Kdy9z?=
 =?utf-8?B?dVlIbUdZRTgwTklXbmdBUy9UR0hkY2EzLzloWmRKL3Qrb2JQK2FlaUw0dHl3?=
 =?utf-8?Q?NgXMDL04bEZCWMZhB9rBjzvaToD1iAhLeNCBLpf/G+Ok?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <195E133B5EE95448BCC1A91A0B12A41D@namprd10.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4733d53f-58ab-48b8-d00a-08dc34672583
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 12:01:19.5219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gi+Ntps0pU1hMa2M9GdRgrgZw2saen2b/dw70/AzihCYr5GF1Qm9ZPp0a4o2/asjaP5/8zsBeUy3ArdgZ6t4Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5937

T24gRnJpLCAyMDI0LTAyLTIzIGF0IDExOjA5ICswMDAwLCBFbWlsIFZlbGlrb3Ygd3JvdGU6DQo+
IE9uIFRodSwgMjIgRmViIDIwMjQgYXQgMTM6MjIsIEpvYWtpbSBUamVybmx1bmQNCj4gPEpvYWtp
bS5UamVybmx1bmRAaW5maW5lcmEuY29tPiB3cm90ZToNCj4gPiANCj4gPiBPbiBUaHUsIDIwMjQt
MDItMjIgYXQgMTM6MDYgKzAwMDAsIEVtaWwgVmVsaWtvdiB3cm90ZToNCj4gPiA+IE9uIFdlZCwg
MjEgRmViIDIwMjQgYXQgMTE6MTksIEpvYWtpbSBUamVybmx1bmQNCj4gPiA+IDxqb2FraW0udGpl
cm5sdW5kQGluZmluZXJhLmNvbT4gd3JvdGU6DQo+ID4gPiA+IA0KPiA+ID4gPiBGcm9tOiBKb2Fr
aW0gVGplcm5sdW5kIDxKb2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNvbT4NCj4gPiA+ID4gDQo+
ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvYWtpbSBUamVybmx1bmQgPEpvYWtpbS5UamVybmx1bmRA
aW5maW5lcmEuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIE1ha2VmaWxlLnRvb2xzIHwgMiAr
LQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUudG9vbHMgYi9NYWtlZmls
ZS50b29scw0KPiA+ID4gPiBpbmRleCAwNDQzNDJlMjkuLmI3ODVlYmVhOCAxMDA2NDQNCj4gPiA+
ID4gLS0tIGEvTWFrZWZpbGUudG9vbHMNCj4gPiA+ID4gKysrIGIvTWFrZWZpbGUudG9vbHMNCj4g
PiA+ID4gQEAgLTUzOCw3ICs1MzgsNyBAQCBlbmRpZg0KPiA+ID4gPiAgZW5kaWYNCj4gPiA+ID4g
DQo+ID4gPiA+ICBpZiBDVVBTDQo+ID4gPiA+IC1jdXBzZGlyID0gJChsaWJkaXIpL2N1cHMvYmFj
a2VuZA0KPiA+ID4gPiArY3Vwc2RpciA9ICQobGliZXhlY2RpcikvY3Vwcy9iYWNrZW5kDQo+ID4g
PiA+IA0KPiA+ID4gDQo+ID4gPiBJcyB0aGlzIHRydWUsIGNhbiB5b3UgcHJvdmlkZSBzb21lIHJl
ZmVyZW5jZXM/DQo+ID4gPiANCj4gPiA+IExvb2tpbmcgYXQgRGViaWFuIFsxXSAod2hpY2ggY29u
dHJhcnkgdG8gQXJjaCBoYXMgbGliZXhlYykgLSBiYWNrZW5kcw0KPiA+ID4gYXJlIGluIC91c3Iv
bGliLiBHbGFuY2luZyBhdCB0aGUgY3VwcyBiYWNrZW5kcyBtYWtlZmlsZSBpdCdzIHVzaW5nDQo+
ID4gPiBTRVJWRVJCSU4uIENhc3VhbCBncmVwIHNob3dzIHRoYXQgbGliZXhlYyBjYW4gYmUgYXBw
bGljYWJsZSBmb3INCj4gPiA+IEJTRC9EYXJ3aW4gcGxhdGZvcm1zIFszXSwgd2hpY2ggYXJlIG91
dCBvZiBzY29wZSBmb3IgYmx1ZXogSUlSQy4NCj4gPiANCj4gPiBvbiBHZW50b28geW91IGhhdmU6
DQo+ID4gDQo+ID4gcWxpc3QgbmV0LXByaW50L2N1cHMgfCBncmVwIGJhY2tlbmQNCj4gPiAuLi4N
Cj4gPiAvdXNyL2xpYmV4ZWMvY3Vwcy9iYWNrZW5kL2ltcGxpY2l0Y2xhc3MNCj4gPiAvdXNyL2xp
YmV4ZWMvY3Vwcy9iYWNrZW5kL2JlaA0KPiA+IC91c3IvbGliZXhlYy9jdXBzL2JhY2tlbmQvc2Vy
aWFsDQo+ID4gL3Vzci9saWJleGVjL2N1cHMvYmFja2VuZC9wYXJhbGxlbA0KPiA+IC91c3IvbGli
ZXhlYy9jdXBzL2JhY2tlbmQvZHJpdmVybGVzcy1mYXgNCj4gPiAvdXNyL2xpYmV4ZWMvY3Vwcy9i
YWNrZW5kL2RyaXZlcmxlc3MNCj4gPiAvdXNyL2xpYmV4ZWMvY3Vwcy9iYWNrZW5kL2N1cHMtcGRm
DQo+ID4gDQo+ID4gYnV0IG5vdyBJIHNlZSB0aGlzIGluIEdlbnRvbyBlYnVpbGQ6DQo+ID4gICAg
ICAgICAjIEluc3RhbGwgaW4gL3Vzci9saWJleGVjIGFsd2F5cywgaW5zdGVhZCBvZiB1c2luZyAv
dXNyL2xpYi9jdXBzLCBhcyB0aGF0DQo+ID4gICAgICAgICAjIG1ha2VzIG1vcmUgc2Vuc2Ugd2hl
biBmYWNpbmcgbXVsdGlsaWIgc3VwcG9ydC4NCj4gPiAgICAgICAgIHNlZCAtaSAtZSAnczpDVVBT
X1NFUlZFUkJJTj0iJGV4ZWNfcHJlZml4L2xpYi9jdXBzIjpDVVBTX1NFUlZFUkJJTj0iJGV4ZWNf
cHJlZml4L2xpYmV4ZWMvY3VwcyI6ZycgY29uZmlndXJlIHx8ZGllDQo+ID4gDQo+ID4gICAgICAg
ICBlY29uZiAiJHtteWVjb25mYXJnc1tAXX0iDQo+ID4gDQo+ID4gICAgICAgICBzZWQgLWkgLWUg
InM6U0VSVkVSQklOLio6U0VSVkVSQklOID0gXCJcJFwoQlVJTERST09UXCkke0VQUkVGSVh9L3Vz
ci9saWJleGVjL2N1cHNcIjoiIE1ha2VkZWZzIHx8IGRpZQ0KPiA+ICAgICAgICAgc2VkIC1pIC1l
ICJzOiNkZWZpbmUgQ1VQU19TRVJWRVJCSU4uKjojZGVmaW5lIENVUFNfU0VSVkVSQklOIFwiJHtF
UFJFRklYfS91c3IvbGliZXhlYy9jdXBzXCI6IiBjb25maWcuaCB8fCBkaWUNCj4gPiAgICAgICAg
IHNlZCAtaSAtZSAiczpjdXBzX3NlcnZlcmJpbj0uKjpjdXBzX3NlcnZlcmJpbj1cIiR7RVBSRUZJ
WH0vdXNyL2xpYmV4ZWMvY3Vwc1wiOiIgY3Vwcy1jb25maWcgfHwgZGllDQo+ID4gDQo+ID4gc28g
aXQgYXBwZWFycyB0byBiZSBhIEdlbnRvbyBhZGRpdGlvbi4NCj4gPiBXb3VsZCBwZXJoYXBzDQo+
ID4gICBwa2ctY29uZmlnIGN1cHMgLS12YXJpYWJsZT1jdXBzX3NlcnZlcmJpbg0KPiA+IG9yDQo+
ID4gICBjdXBzLWNvbmZpZyAtLXNlcnZlcmJpbg0KPiA+IGJlIGFjY2VwdGFibGU/IElmIG5vIHdl
IGNhbiBqdXN0IGRyb3AgdGhpcyBhbmQgR2VudG9vIHdpbGwgY29udGludWUgdG8gcGF0Y2ggYmx1
ZXogZm9yIGN1cHMNCj4gPiANCj4gDQo+IFVzaW5nIHRoZSBmb28tY29uZmlnIHRvb2xzIHNvdW5k
cyBiZXR0ZXIgdGhhbiB0aGUgY3VycmVudCBoYXJkLWNvZGVkDQo+IGJlaGF2aW91ci4gUGF0Y2gg
dGhhdCBkb2VzIHRoYXQgZ2V0cyBhIGJpZyB0aHVtYnMtdXAgZnJvbSBtZS4NCj4gUGVyc29uYWxs
eSBJIGhhdmUgc2xpZ2h0IGluY2xpbmF0aW9uIHRvd2FyZHMgdGhlIHBrZy1jb25maWcgLSBhbHRo
b3VnaA0KPiBpdCdsbCBiZSB1cC10byB0aGUgbWFpbnRhaW5lcnMuDQoNClRoaXMgaXMgd2hhdCBJ
IGNhbWUgdXAgd2l0aDoNCg0KRnJvbSBjNjc3NmIyMDViOGFkYmY2ZTJlMjkxMDhhMWE3ZmYzNDg1
NDZhNTMxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogSm9ha2ltIFRqZXJubHVuZCA8
am9ha2ltLnRqZXJubHVuZEBpbmZpbmVyYS5jb20+DQpEYXRlOiBGcmksIDIzIEZlYiAyMDI0IDEy
OjU2OjIxICswMTAwDQpTdWJqZWN0OiBbUEFUQ0hdIGN1cHM6IFVzZSBwa2ctY29uZmlnIHRvIGZp
bmQgY3VwcyBiYWNrZW5kIGRpcg0KDQpTb21lIGRpc3RyaWJ1dGlvbnMoR2VudG9vKSBwYXRjaCBj
dXBzIGJhY2tlbmQgcGF0aCB0bw0Kc29tZXRoaW5nIGVsc2UgdGhhbiBsaWJkaXIuIFVzZSBwa2ct
Y29uZmlnIHRvIGZpbmQgYmFja2VuZA0KcGF0aCBmb3IgY3Vwcy4NCg0KU2lnbmVkLW9mZi1ieTog
Sm9ha2ltIFRqZXJubHVuZCA8am9ha2ltLnRqZXJubHVuZEBpbmZpbmVyYS5jb20+DQotLS0NCiBN
YWtlZmlsZS50b29scyB8IDIgLS0NCiBjb25maWd1cmUuYWMgICB8IDMgKysrDQogMiBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9N
YWtlZmlsZS50b29scyBiL01ha2VmaWxlLnRvb2xzDQppbmRleCAwNDQzNDJlMjkuLjc2MDcyNzU1
NyAxMDA2NDQNCi0tLSBhL01ha2VmaWxlLnRvb2xzDQorKysgYi9NYWtlZmlsZS50b29scw0KQEAg
LTUzOCw4ICs1MzgsNiBAQCBlbmRpZg0KIGVuZGlmDQogDQogaWYgQ1VQUw0KLWN1cHNkaXIgPSAk
KGxpYmRpcikvY3Vwcy9iYWNrZW5kDQotDQogY3Vwc19QUk9HUkFNUyA9IHByb2ZpbGVzL2N1cHMv
Ymx1ZXRvb3RoDQogDQogcHJvZmlsZXNfY3Vwc19ibHVldG9vdGhfU09VUkNFUyA9IHByb2ZpbGVz
L2N1cHMvbWFpbi5jIFwNCmRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMN
CmluZGV4IGJiNjM4MGYyZi4uNmE3ZmVmYTFkIDEwMDY0NA0KLS0tIGEvY29uZmlndXJlLmFjDQor
KysgYi9jb25maWd1cmUuYWMNCkBAIC0yNDIsNiArMjQyLDkgQEAgQUNfU1VCU1QoVURFVl9ESVIs
IFske3BhdGhfdWRldmRpcn1dKQ0KIEFDX0FSR19FTkFCTEUoY3VwcywgQVNfSEVMUF9TVFJJTkco
Wy0tZGlzYWJsZS1jdXBzXSwNCiAgICAgICAgICAgICAgICAgW2Rpc2FibGUgQ1VQUyBwcmludGVy
IHN1cHBvcnRdKSwgW2VuYWJsZV9jdXBzPSR7ZW5hYmxldmFsfV0pDQogQU1fQ09ORElUSU9OQUwo
Q1VQUywgdGVzdCAiJHtlbmFibGVfY3Vwc30iICE9ICJubyIpDQoraWYgKHRlc3QgIiR7ZW5hYmxl
X2N1cHN9IiAhPSAibm8iKTsgdGhlbg0KKyAgIEFDX1NVQlNUKGN1cHNkaXIsIGAkUEtHX0NPTkZJ
RyBjdXBzIC0tdmFyaWFibGU9Y3Vwc19zZXJ2ZXJiaW5gL2JhY2tlbmQpDQorZmkNCiANCiBBQ19B
UkdfRU5BQkxFKG1lc2gsIEFTX0hFTFBfU1RSSU5HKFstLWVuYWJsZS1tZXNoXSwNCiAJCVtlbmFi
bGUgTWVzaCBwcm9maWxlIHN1cHBvcnRdKSwgW2VuYWJsZV9tZXNoPSR7ZW5hYmxldmFsfV0pDQot
LSANCjIuNDMuMA0KDQogIEpvY2tlDQoNCg==

