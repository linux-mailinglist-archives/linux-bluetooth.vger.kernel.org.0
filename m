Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676463FF184
	for <lists+linux-bluetooth@lfdr.de>; Thu,  2 Sep 2021 18:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346319AbhIBQgM (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Thu, 2 Sep 2021 12:36:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346193AbhIBQgK (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Thu, 2 Sep 2021 12:36:10 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259FFC061575
        for <linux-bluetooth@vger.kernel.org>; Thu,  2 Sep 2021 09:35:12 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id fs6so1723932pjb.4
        for <linux-bluetooth@vger.kernel.org>; Thu, 02 Sep 2021 09:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=jugmU6zxXuRvTadmLkTuUJDMJv4tKYHJ4uha6ABX0aY=;
        b=JHS+ezPUcLRFoLbpm5QcgDOYID8K73EsxZN73TDCWZ0/WJazUFPjyyKQYAUx3pOneL
         KdvRM/kQVSxPPEK3xx/+6zuoVwGXxu7n6AVRJoqlYq+RMThjKhL/48iVl2lj1VU/u115
         OCoNoWUqtX74Yc6v6X4RqIfEaM0+BWeyK9+Z2kvl3KUH29JQ3dAWMbCjT4Afl8o1Aj7s
         WXIkrpUIr48UPuPcz9J7snRxEzzeEBBkvf9X8bS0+JsjIDPR1s++TuYuuXrLuvwHfnxt
         vBYlWU7krEdlOIqYgeCG4u7vrrOGdpzhbll+7+fLRbhQdfiRSrz6/SjVDEQn9nyz9pge
         DQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=jugmU6zxXuRvTadmLkTuUJDMJv4tKYHJ4uha6ABX0aY=;
        b=SCIGHvbG45XnTeej13DcxAN2wJzG7qCzY6R7wC5C5MPdO6SO74Z0p2W1fTnFp77cX5
         viAABnaPlnL+lj/zbgXFL4JddtVvzpanzBPf7oc0wZ78qClCYB5l/o8hRlFs0waqT5p+
         vvksNKOO3ZBCKkuoiLK4D9uAGMBxW+SP+AmUTTnnGfiWyBeO/hoBL7dPqdIrq6WjKSTT
         eX0+r52/YkMzTbrUAGAZZpVsYD9FlsXvHBTZPWphvykpt/KHUxWF/GNmLwAren3TTNyo
         lCC/WrIY8us72ZVCHat0pmnQCuIm68s2oyJU4WuCpH1M/qVwu0aWEZYr/bjeBGSiHACw
         y1ow==
X-Gm-Message-State: AOAM533uQSArLFkGt6hmD8hAO8ceNBSSrXWLgwbIAf0eAFM/zE9GKIh8
        BEQayWXKH6GGjNGh/S5FJvxzF9V/7CD5ovq9Ja4=
X-Google-Smtp-Source: ABdhPJxCd7QokIm5rwmQr3ytrs8qFoXIFGbqhPO2520MUl+AWXMY8aWzdw8naPiLKcMknhAnKw3pBP6KdZiZAXuTxRg=
X-Received: by 2002:a17:902:c643:b0:138:b603:f944 with SMTP id
 s3-20020a170902c64300b00138b603f944mr3697827pls.45.1630600511622; Thu, 02 Sep
 2021 09:35:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:a829:b0:56:fbb1:21d7 with HTTP; Thu, 2 Sep 2021
 09:35:10 -0700 (PDT)
Reply-To: liampayen50@gmail.com
From:   liam payen <fallc828@gmail.com>
Date:   Thu, 2 Sep 2021 09:35:10 -0700
Message-ID: <CABL-saDE9-sbPTRZj3yWkeYjkgWJzZH5xsFO+VW7scL-FzuYqw@mail.gmail.com>
Subject: =?UTF-8?B?5oiR6ZyA6KaB5L2g55qE5biu5Yqp?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

5oiR5piv5Yip5Lqa5aeGwrfkvanmgankuK3lo6vlpKvkurrjgIINCg0K5Zyo576O5Zu96ZmG5Yab
55qE5Yab5LqL6YOo6Zeo44CC576O5Zu977yM5LiA5ZCN5Lit5aOr77yMMzIg5bKB77yM5oiR5Y2V
6Lqr77yM5p2l6Ieq576O5Zu955Sw57qz6KW/5bee5YWL5Yip5aSr5YWw77yM55uu5YmN6am75omO
5Zyo5Yip5q+U5Lqa54+t5Yqg6KW/77yM5LiO5oGQ5oCW5Li75LmJ5L2c5oiY44CC5oiR55qE5Y2V
5L2N5piv56ysNOaKpOeQhumYn+esrDc4MuaXheaUr+aPtOiQpeOAgg0KDQrmiJHmmK/kuIDkuKrl
hYXmu6HniLHlv4PjgIHor5rlrp7lkozmt7Hmg4XnmoTkurrvvIzlhbfmnInoia/lpb3nmoTlub3p
u5jmhJ/vvIzmiJHllpzmrKLnu5Por4bmlrDmnIvlj4vlubbkuobop6Pku5bku6znmoTnlJ/mtLvm
lrnlvI/vvIzmiJHllpzmrKLnnIvliLDlpKfmtbfnmoTms6LmtarlkozlsbHohInnmoTnvo7kuL3k
u6Xlj4rlpKfoh6rnhLbmiYDmi6XmnInnmoTkuIDliIfmj5DkvpvjgILlvojpq5jlhbTog73mm7Tl
pJrlnLDkuobop6PmgqjvvIzmiJHorqTkuLrmiJHku6zlj6/ku6Xlu7rnq4voia/lpb3nmoTllYbk
uJrlj4vosIrjgIINCg0K5oiR5LiA55u05b6I5LiN5byA5b+D77yM5Zug5Li66L+Z5Lqb5bm05p2l
55Sf5rS75a+55oiR5LiN5YWs5bmz77yb5oiR5aSx5Y675LqG54i25q+N77yM6YKj5bm05oiRIDIx
DQrlsoHjgILmiJHniLbkurLnmoTlkI3lrZfmmK/luJXnibnph4zmlq/kvanmganvvIzmiJHnmoTm
r43kurLmmK/njpvkuL3kvanmganjgILmsqHmnInkurrluK7liqnmiJHvvIzkvYblvojpq5jlhbTm
iJHnu4jkuo7lnKjnvo7lhpvkuK3mib7liLDkuoboh6rlt7HjgIINCg0K5oiR57uT5ama55Sf5LqG
5a2p5a2Q77yM5L2G5LuW5q275LqG77yM5LiN5LmF5oiR5LiI5aSr5byA5aeL5qy66aqX5oiR77yM
5omA5Lul5oiR5LiN5b6X5LiN5pS+5byD5ama5ae744CCDQoNCuaIkeS5n+W+iOW5uOi/kO+8jOWc
qOaIkeeahOWbveWutue+juWbveWSjOWIqeavlOS6muePreWKoOilv+i/memHjOaLpeacieaIkeeU
n+a0u+S4reaJgOmcgOeahOS4gOWIh++8jOS9huayoeacieS6uuS4uuaIkeaPkOS+m+W7uuiuruOA
guaIkemcgOimgeS4gOS4quivmuWunueahOS6uuadpeS/oeS7u++8jOS7luS5n+S8muWwseWmguS9
leaKlei1hOaIkeeahOmSseaPkOS+m+W7uuiuruOAguWboOS4uuaIkeaYr+aIkeeItuavjeWcqOS7
luS7rOWOu+S4luWJjeeUn+S4i+eahOWUr+S4gOS4gOS4quWls+WtqeOAgg0KDQrmiJHkuI3orqTo
r4bkvaDmnKzkurrvvIzkvYbmiJHorqTkuLrmnInkuIDkuKrlgLzlvpfkv6HotZbnmoTlpb3kurrv
vIzku5blj6/ku6Xlu7rnq4vnnJ/mraPnmoTkv6Hku7vlkozoia/lpb3nmoTllYbkuJrlj4vosIrv
vIzlpoLmnpzkvaDnnJ/nmoTmnInkuIDkuKror5rlrp7nmoTlkI3lrZfvvIzmiJHkuZ/mnInkuIDk
upvkuJzopb/opoHlkozkvaDliIbkuqvnm7jkv6HjgILlnKjkvaDouqvkuIrvvIzlm6DkuLrmiJHp
nIDopoHkvaDnmoTluK7liqnjgILmiJHmi6XmnInmiJHlnKjliKnmr5Tkuprnj63liqDopb/ov5np
h4zotZrliLDnmoTmgLvpop3vvIgyNTANCuS4h+e+juWFg++8ieOAguaIkeS8muWcqOS4i+S4gOWw
geeUteWtkOmCruS7tuS4reWRiuivieS9oOaIkeaYr+WmguS9leWBmuWIsOeahO+8jOS4jeimgeaD
iuaFjO+8jOS7luS7rOayoeaciemjjumZqe+8jOiAjOS4lOaIkei/mOWcqOS4jiBSZWQNCuacieiB
lOezu+eahOS6uumBk+S4u+S5ieWMu+eUn+eahOW4ruWKqeS4i+Wwhui/meeslOmSseWtmOWFpeS6
humTtuihjOOAguaIkeW4jOacm+aCqOWwhuiHquW3seS9nOS4uuaIkeeahOWPl+ebiuS6uuadpeaO
peaUtuWfuumHkeW5tuWcqOaIkeWcqOi/memHjOWujOaIkOWQjuehruS/neWug+eahOWuieWFqOW5
tuiOt+W+l+aIkeeahOWGm+S6i+mAmuihjOivgeS7peWcqOaCqOeahOWbveWutuS4juaCqOS8mumd
ou+8m+S4jeimgeWus+aAlemTtuihjOS8muWwhui1hOmHkeWtmOWCqOWcqA0KQVRNIFZJU0Eg5Y2h
5Lit77yM6L+Z5a+55oiR5Lus5p2l6K+05piv5a6J5YWo5LiU5b+r5o2355qE44CCDQoNCueslOiu
sDvmiJHkuI3nn6XpgZPmiJHku6zopoHlnKjov5nph4zlkYblpJrkuYXvvIzmiJHnmoTlkb3ov5Dv
vIzlm6DkuLrmiJHlnKjov5nph4zkuKTmrKHngrjlvLnooq3lh7vkuK3lubjlrZjkuIvmnaXvvIzo
v5nkv4Pkvb/miJHlr7vmib7kuIDkuKrlgLzlvpfkv6HotZbnmoTkurrmnaXluK7liqnmiJHmjqXm
lLblkozmipXotYTln7rph5HvvIzlm6DkuLrmiJHlsIbmnaXliLDkvaDku6znmoTlm73lrrblh7ro
uqvmipXotYTvvIzlvIDlp4vmlrDnlJ/mtLvvvIzkuI3lho3lvZPlhbXjgIINCg0K5aaC5p6c5oKo
5oS/5oSP6LCo5oWO5aSE55CG77yM6K+35Zue5aSN5oiR44CC5oiR5Lya5ZGK6K+J5L2g5LiL5LiA
5q2l55qE5rWB56iL77yM5bm257uZ5L2g5Y+R6YCB5pu05aSa5YWz5LqO5Z+66YeR5a2Y5YWl6ZO2
6KGM55qE5L+h5oGv44CC5Lul5Y+K6ZO26KGM5bCG5aaC5L2V5biu5Yqp5oiR5Lus6YCa6L+HIEFU
TSBWSVNBDQpDQVJEIOWwhui1hOmHkei9rOenu+WIsOaCqOeahOWbveWuti/lnLDljLrjgILlpoLm
npzkvaDmnInlhbTotqPvvIzor7fkuI7miJHogZTns7vjgIINCg==
