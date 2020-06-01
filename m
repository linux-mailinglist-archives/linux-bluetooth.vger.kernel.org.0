Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 846811EA812
	for <lists+linux-bluetooth@lfdr.de>; Mon,  1 Jun 2020 19:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgFARCj (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Mon, 1 Jun 2020 13:02:39 -0400
Received: from sonic306-2.consmr.mail.bf2.yahoo.com ([74.6.132.41]:40052 "EHLO
        sonic306-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726149AbgFARCj (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Mon, 1 Jun 2020 13:02:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1591030958; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=s1srIOW9ZvbxPRaS7yTXyzXg2ti5Nya8Z9yTLPvLaNkSw3VbThCvIOlLC+MLKr7NGq+ps84TulW3Z8RTCuN7BSQlIXgP0rOx9mLG2CtArdcBhIBhaygYj/PZCcXcf31ZqCPoLcTDE7Gomw4sW4cnxgcEyHzHTDMu0nnDiewkzp4GJscjLnk0bY8LnpNRyGp6KtyyW/XhP50JlIHNHjL722NKU7KjYwoMcIgLpuhTVMRUlZ1dh5tKvxQlNF6RJL0ZfDQGZSXFK2PmzcKYfapzWsFL7ggWyUXuugg2jiwf0Wp1MEbP/3PiefKU0/7/3wKDDIFvZ5nDLfWX4sb9NbufHA==
X-YMail-OSG: 544J9WcVM1mHszZknAISIeHlZIyH8OmDejJ17QF_A2ZztOZee.slpAdpT76T6y9
 7TVBJo3al4Gv_Gz53yVNIKy_mYxbB_W6XqffcepdfKK2fm_lte7h1dUXUBc6RHZWKNyDPVO225sK
 gBkRo8533E5lu3L2XC6L2c4CXfZ0IFceuPg1bVZ3Zq05xc6qWL5O_ANjQeAzxEQ9LRw._Awsnd5X
 6WFHddYvt9PY2F5qUHiLdt1.v32QKnwWxboJ12CJnJSFidBaWabMHv9ONT0oy6pijoJ9h_bllJF.
 as8cZE2NWk7P3lMPhdHzKwuFJWbZQDn03zriwR9J5hcUutZMwiXo2tsJnjzBqT84PXb9wa882yO6
 i2hvj0a28RUAcb3qXEPqwaKzFD33J19TI2U84lTdlLva2r_LaQDrzEha8wrm5c1m.ycR0PZzryR5
 AozM.DNSpGxIwKMt6KUFEpWzy9yAjSgjXxCaY5qUJu.EwW5Aya1PadhKpZnkK_ovMbI1Ng1.yn_p
 T_CegwyHbWwn60dMs76THGeyc7q34ByesnF0FUM96ootHdyiOLbYq3aZlTJ8mh7WqzVqMPgqEhvg
 bZUzB6Lv6hchuVeFo6pdgsAi30q_Fr6ukxFdy.bQmrv7zC7xXkO.31zLFo2talgHfy0z9Alu7IVM
 ny1mbbP3uqnzc0O8vcXOmzqYJvhHAgz76exzt1ssdtF5X1vYQ8bLJPeLnkzfKNKMe.WY.AsR7EL7
 _aRGkGpUwJ1XussBGwZ73.H6G27MIhJIQElmT4R55C9ZJjfmU0ucyde9TnfRngLp2BrQ0bf2dDv7
 oW2ixvUzBpshKfXLLNw0OzPDgWGISIXNu4B1NQnewm1bDhLgl3uKcxirKnfZSYL6sCm9lEnqUPVi
 gASCv72yEEvd3WYEXLzHdF_PDoJg2wcNAUbhnJrl09qi2A41.gvURpwMjw0LIrMna0GPrwY7xSMd
 EYxJ9g5d4ybuv8edBmaElVpb0tN.DsXBvRdecMArgQp94Wx.j2l2b._CWltqIA7VRi8N0zAmavQ8
 4SAHdLHjvd1Ta9rNWj1LeTz05J6pImRMS1UV4TpPy_G6QObtfek0dLXXO4l3NPuebkUZxhhgwYel
 AR9e3LnN2MQe6C4AXWMZp1iFQEsqIHT97iaZPN5SQV.5YcRfC6og2UUri.ZdOIgAkKhD_3jbM7a4
 sCOM_2c.2orgy.Cc5dzxw4wkdAWJi8pz0FKy4i8q3MlTqjnxMJXjT2Z8Z9S5Y2Cy7K52B7PtDoFk
 z31t0K49eAw3haanUbO7G9atIe4fvvIRiG7.Y.k4nPJOD7MePqpKc3WlX4.ROA5fE4acmcrXprev
 gLw--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Mon, 1 Jun 2020 17:02:38 +0000
Date:   Mon, 1 Jun 2020 17:02:37 +0000 (UTC)
From:   Ms lisa Hugh <lisahugh531@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <1758419908.636566.1591030957490@mail.yahoo.com>
Subject: YOUR HELP FOR THIS BUSINESS MS LISA.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1758419908.636566.1591030957490.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16037 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:76.0) Gecko/20100101 Firefox/76.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org



Dear Friend,

I am Ms Lisa hugh, work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment, amount (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me for success.

Note/ 50% for you why 50% for me after success of the transfer to your bank account.

Below information is what i need from you so will can be reaching each other

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa hugh.
