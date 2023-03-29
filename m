Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EED16CCFCD
	for <lists+linux-bluetooth@lfdr.de>; Wed, 29 Mar 2023 04:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjC2CJL (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Tue, 28 Mar 2023 22:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjC2CJK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Tue, 28 Mar 2023 22:09:10 -0400
Received: from cstnet.cn (smtp80.cstnet.cn [159.226.251.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E43FF10F3;
        Tue, 28 Mar 2023 19:09:08 -0700 (PDT)
Received: from localhost.localdomain (unknown [124.16.138.125])
        by APP-01 (Coremail) with SMTP id qwCowAAnLkq+nSNkVe5rGA--.3137S2;
        Wed, 29 Mar 2023 10:09:02 +0800 (CST)
From:   Jiasheng Jiang <jiasheng@iscas.ac.cn>
To:     simon.horman@corigine.com
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: Re: [PATCH 1/2] Bluetooth: 6LoWPAN: Modify the error handling in the loop
Date:   Wed, 29 Mar 2023 10:09:00 +0800
Message-Id: <20230329020900.33013-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAAnLkq+nSNkVe5rGA--.3137S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw17ZFyruFW8Cw1DJFWDJwb_yoW8JF4xpr
        4xGa4vy3Z8XF18Grs2y3s7Wa4rC395Kr15XrZY9w10kw1avr1Iyr4rta4ruFyIkr1ku3yY
        vrsY9F1kCw1DZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
        628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64
        vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
        jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
        x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
        8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
        0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUFxhLDUUUU
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

On Tue, Mar 21, 2023 at 00:09:11AM +0800, Simon Horman wrote:
>On Mon, Mar 20, 2023 at 02:31:55PM +0800, Jiasheng Jiang wrote:
>> Return the error when send_pkt fails in order to avoid the error being
>> overwritten.
>> Moreover, remove the redundant 'ret'.
>> 
>> Fixes: 9c238ca8ec79 ("Bluetooth: 6lowpan: Check transmit errors for multicast packets")
>> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> 
> I see that the error handling is imperfect - only the most recent
> error value is returned.
> 
> But I think this patch introduces a behavioural change: if
> an error occurs then no attempt is made to send the
> multicast packet to devices that follow in the list of peers.
> 
> If so, I'd want to be sure that behaviour is desirable.

I think it's a matter of trade-offs.
The original error handling can complete the remaining correct tasks.
However, my patch can avoid resource waste, because if the an
error occurs, the rest is likely to go wrong.
For example, if a memory allocation fails because of the insufficient
memory, the next memory allocation will likely fails too.
Maybe it is better to use different error handlings depending on the
type of errors:
Immediately return "ENOMEM" errors and continue execute if the other errors occur.

Thanks,
Jiang

