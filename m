Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69EAB72FEC
	for <lists+linux-bluetooth@lfdr.de>; Wed, 24 Jul 2019 15:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbfGXN2U (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 24 Jul 2019 09:28:20 -0400
Received: from mail-yb1-f169.google.com ([209.85.219.169]:38039 "EHLO
        mail-yb1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfGXN2U (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 24 Jul 2019 09:28:20 -0400
Received: by mail-yb1-f169.google.com with SMTP id j199so17313528ybg.5
        for <linux-bluetooth@vger.kernel.org>; Wed, 24 Jul 2019 06:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=tJX/klMy35tYALsY7aggVhL2Ul3Uz3aMC+ZUThmxvMw=;
        b=g/4FxEcGKaRaUf0ouJNTg3ASSyK/l/ug0lBgGNaMfvTQkYzn5yqg1jOkhKcecp8fJU
         +2TNrFOvCdmkkpHGxAEvD1WVjm56Gi4zJEPqr8zSMsgxJl8C5eCLwVmnlgdBVZ+SnFb1
         hr49Y79ZcVrCoD+LPPjy5u3LmUoBlchRGoYT59v9VfayETrc5JtdmeoLSTnLGasmrZ7b
         NqxR0GA5nBj0ZZF0FZpytCu599Tz0skr3DKoDA/Z3gfZWstcli80ehH0odIIc1qfo2gL
         XFbJjm8o+u2HLMH8ZB2WxyLEZMvhJfCXVy7OEuvnNsbrox3AyZ1TMyfj7sXJBC1lM62c
         iaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=tJX/klMy35tYALsY7aggVhL2Ul3Uz3aMC+ZUThmxvMw=;
        b=FVcMmLzmwUMaoczxNEfMV89/zMIvrhmYk/bJCpT7YpZn2dtVQrQvoV/8vHltbyDnBR
         CogLa9FJ1Je/OClN219mri8JJZx9hteGHJHkuoEvv6nGeaFT1fPnlZUMc4Ngw6WDJRFH
         0+W1wqUZOwnss8tOXv1xC6Te/TuEupOe9zD0zsCIsgb7biYrcrnwzqEvAH81PYe8dw7D
         3idrY2kOo3FKvzx5ATYmdYyggNfXce1s4G8hrnNmoZyLvzxhJ+VCY87UozrfXu7huAPz
         LzR2M7ag8luxIvz0lIEpOOiXkOxofLqLNagpoJoZtAfhXzSY7iAc9/PYHvxjDC94KTpx
         40WQ==
X-Gm-Message-State: APjAAAXWsA3sVFWoN6IqAoOEGtANqb68vpGyhijiTpLhXx7Cs2WGa5Py
        I+mtwr2YiiCWbJmy7zX+TvAy5H+2voJPoDSxiSAmLJRy
X-Google-Smtp-Source: APXvYqwZxDYVXjFh9XDhZwz0R59YUl5dWvaR0cjKTQ4RF7DYl3YFGVsoIUgHslNd36PffgIpZRX8alID6+ZcqRmrEUM=
X-Received: by 2002:a25:7641:: with SMTP id r62mr50880306ybc.150.1563974898367;
 Wed, 24 Jul 2019 06:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAAu3APas5syS3gYXN-BBqB=OcDZJjpPwND6qzOO1wSmbMq2U1Q@mail.gmail.com>
 <CABBYNZ+W8dG7qgAe-2QYnSkyVG_1eA4KtMKHyXws0LWwB346Ow@mail.gmail.com>
 <CAAu3APaPaDXBNsWcCUhNF2_sM_AxiKe5B6U1xtMOU9tYwpFS2g@mail.gmail.com>
 <CAAu3APZ4n9Cc4RJ40Oca0iKchOSNifd=DbzHG_9XPtv9dr1+BQ@mail.gmail.com>
 <CAAu3APYuQM84K=pRZc=G0q7kpuRkMBVbFw4pPzfJsVJ4YyrJzA@mail.gmail.com> <CABBYNZL5=f6xSyUL+8_pfdUBe-Y5f-hA_7-iYdL7bAi1_nJvLA@mail.gmail.com>
In-Reply-To: <CABBYNZL5=f6xSyUL+8_pfdUBe-Y5f-hA_7-iYdL7bAi1_nJvLA@mail.gmail.com>
From:   Barry Byford <31baz66@gmail.com>
Date:   Wed, 24 Jul 2019 14:28:07 +0100
Message-ID: <CAAu3APaVQXRMW+6RkSqiDe77h0JyJdwSbjioMoKwFP3aT_o8YQ@mail.gmail.com>
Subject: Re: DBus LEAdvertisement and Python
To:     Bluez mailing list <linux-bluetooth@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-bluetooth-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

Thanks for the reply Luiz. Very much appreciated. Some updates based
on your feedback.

On Wed, 24 Jul 2019 at 11:45, Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> Hi Barry,
>
> On Wed, Jul 24, 2019 at 12:41 PM Barry Byford <31baz66@gmail.com> wrote:
> >
> > I have exhausted my ideas for debugging this issue. Using d-feet and
> > various other utilities the creation of the beacon using python-dbus
> > and pydbus looks identical. However, BlueZ doesn't seem to be able to
> > parse the properties from LEAdvertisement1 when it is created with
> > pydbus.
> >
> > It would be great if anyone has any ideas for what else to try.
> > Have people had similar issues using DBus libraries in other languages?
> >
> > For reference, I have installed pydbus with "sudo pip3 install pydbus"
> > I am running with BlueZ 5.50.
> >
> > The test code I am using is:
> >
> > <python3 code>
> > import pydbus
> > from gi.repository import GLib
> >
> >
> > class Advertisement:
> >     """
> >     <node>
> >         <interface name='org.bluez.LEAdvertisement1'>
> >             <method name='Release'>
> >                 <annotation name="org.freedesktop.DBus.Method.NoReply"
> > value="true"/>
> >             </method>
> >             <annotation
> > name="org.freedesktop.DBus.Properties.PropertiesChanged"
> > value="const"/>
> >             <property name="Type" type="s" access="read"/>
> >             <property name="ServiceUUIDs" type="as" access="read"/>
> >             <property name="ManufacturerData" type="a{sv}" access="read"/>
>
> Type here is wrong, it should be a{qv} see:
>
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/client/advertising.c#n464
>
> Im surprised the daemon don't generate report an error? Or it does
> register but it still doesn't advertise?

I think this might be pointing at the crux of the issue. I don't think
it is getting as far as reading what the values are.

I have removed the empty values from the advertisement so that GetAll
now returns:
$ busctl call ukBaz.bluezero /ukBaz/bluezero/advertisement0099
org.freedesktop.DBus.Properties GetAll s org.bluez.LEAdvertisement1
a{sv} 4 "IncludeTxPower" b false "Type" s "broadcast" "ServiceData"
a{sv} 1 "FEAA" ay 18 16 8 3 117 107 66 97 12246 103 105 116 104 117 98
46 105 111 "ServiceUUIDs" as 1"FEAA"

And if I just get the Type property it returns:
busctl call ukBaz.bluezero /ukBaz/bluezero/advertisement0099
org.freedesktop.DBus.Properties Get ss org.bluez.LEAdvertisement1 Type
v s "broadcast"

I am on a different system today that only has BlueZ 5.43 installed.
With experimental enabled I get the following in the bluetoothd log:
bluetoothd[10894]: Failed to read "Type" property of advertisement

But as we can see above, the type property is there to be read. I will
try this code on 5.50 later but I suspect it will just fail silently.
RegisterAdvertisement doesn't seem to be able to find the properties.
I don't know if it:
a) can't find the owning bus name from the object path
b) Isn't using Get/GetAll.

My thought behind this is that the properties do appear to be visible
to DBUS.Properties.GetAll when given the bus name and object path.
The object path is passed to RegisterAdvertisement so it has to
discover the bus name. I have no visibility as to how successful
bluetoothd is at doing that.


The updated code is:
<python code>
import pydbus
from gi.repository import GLib


class Advertisement:
    """
    <node>
        <interface name='org.bluez.LEAdvertisement1'>
            <method name='Release'>
                <annotation name="org.freedesktop.DBus.Method.NoReply"
value="true"/>
            </method>
            <annotation
name="org.freedesktop.DBus.Properties.PropertiesChanged"
value="const"/>
            <property name="Type" type="s" access="read"/>
            <property name="ServiceUUIDs" type="as" access="read"/>
            <property name="ServiceData" type="a{sv}" access="read"/>
            <property name="IncludeTxPower" type="b" access="read"/>
        </interface>
    </node>
    """
    LE_ADVERTISEMENT_IFACE = 'org.bluez.LEAdvertisement1'

    def Release(self):
        pass

    @property
    def Type(self):
        return 'broadcast'

    @property
    def ServiceUUIDs(self):
        return ['FEAA']

    @property
    def ServiceData(self):
        return {'FEAA': GLib.Variant('ay', [0x10, 0x08, 0x03, 0x75,
0x6B, 0x42, 0x61,
                         0x7A, 0x2e, 0x67, 0x69, 0x74, 0x68, 0x75,
                         0x62, 0x2E, 0x69, 0x6F])}

    @property
    def IncludeTxPower(self):
        return False

class LEAdvertisement:
    def __init__(self, service, object_path):
        bus = pydbus.SystemBus()
        bname = bus.request_name(service)
        reg1 = bus.register_object(object_path, Advertisement(), None)


class LEAdvertisingManager:
    def __init__(self, object_path):
        lea_iface = 'org.bluez.LEAdvertisingManager1'
        bus = pydbus.SystemBus()
        ad_manager = bus.get('org.bluez', '/org/bluez/hci0')[lea_iface]
        ad_manager.RegisterAdvertisement(object_path, {})


if __name__ == '__main__':
    app_name = 'ukBaz.bluezero'
    app_path = '/ukBaz/bluezero/advertisement0099'
    LEAdvertisement(app_name, app_path)
    # LEAdvertisingManager(app_path)

    loop = GLib.MainLoop()
    try:
        loop.run()
    except KeyboardInterrupt:
        print("\nStopping ...")
        loop.quit()
</python code>

>
> >             <property name="SolicitUUIDs" type="as" access="read"/>
> >             <property name="ServiceData" type="a{sv}" access="read"/>
> >             <property name="IncludeTxPower" type="b" access="read"/>
> >         </interface>
> >     </node>
> >     """
> >     LE_ADVERTISEMENT_IFACE = 'org.bluez.LEAdvertisement1'
> >
> >     def Release(self):
> >         pass
> >
> >     @property
> >     def Type(self):
> >         return 'broadcast'
> >
> >     @property
> >     def SolicitUUIDs(self):
> >         return []
>
> Don't include if empty.
>
> >     @property
> >     def ServiceUUIDs(self):
> >         return ['FEAA']
> >
> >     @property
> >     def ServiceData(self):
> >         return {'FEAA': GLib.Variant('ay', [0x10, 0x08, 0x03, 0x75,
> > 0x6B, 0x42, 0x61,
> >                          0x7A, 0x2e, 0x67, 0x69, 0x74, 0x68, 0x75,
> >                          0x62, 0x2E, 0x69, 0x6F])}
> >
> >     @property
> >     def IncludeTxPower(self):
> >         return False
> >
> >     @property
> >     def ManufacturerData(self):
> >         return []
>
> Same here, don't include it empty.
>
> >
> > class LEAdvertisement:
> >     def __init__(self, service, object_path):
> >         bus = pydbus.SystemBus()
> >         bname = bus.request_name(service)
> >         reg1 = bus.register_object(object_path, Advertisement(), None)
> >
> >
> > class LEAdvertisingManager:
> >     def __init__(self, object_path):
> >         lea_iface = 'org.bluez.LEAdvertisingManager1'
> >         bus = pydbus.SystemBus()
> >         ad_manager = bus.get('org.bluez', '/org/bluez/hci0')[lea_iface]
> >         ad_manager.RegisterAdvertisement(object_path, {})
> >
> >
> > if __name__ == '__main__':
> >     app_name = 'ukBaz.bluezero'
> >     app_path = '/ukBaz/bluezero/advertisement0099'
> >     LEAdvertisement(app_name, app_path)
> >     LEAdvertisingManager(app_path)
> >
> >     loop = GLib.MainLoop()
> >     try:
> >         loop.run()
> >     except KeyboardInterrupt:
> >         print("\nStopping ...")
> >         loop.quit()
> >
> > </python code>
> >
> > I have the following config to open the permissions up for this service name:
> >
> > $ more /etc/dbus-1/system.d/ukBaz.bluezero.conf
> > <?xml version="1.0" encoding="UTF-8"?> <!-- -*- XML -*- -->
> > <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus
> > Configuration 1.0//EN"
> >  "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
> > <busconfig>
> >
> >   <!-- ../system.conf have denied everything, so we just punch some
> > holes -->
> >
> >   <policy context="default">
> >     <allow own="ukBaz.bluezero"/>
> >     <allow send_destination="ukBaz.bluezero"
> >            send_interface="org.freedesktop.DBus.Introspectable"/>
> >     <allow send_type="method_call" log="true"/>
> >
> >   </policy>
> >
> > </busconfig>
> >
> >
> > Feedback welcome.
> >
> > Cheers,
> > Barry
> >
> >
> > On Sat, 20 Jul 2019 at 17:44, Barry Byford <31baz66@gmail.com> wrote:
> > >
> > > Hello,
> > >
> > > I have done a little more investigation on this. The difference in
> > > behaviour between the working library and the failing library comes
> > > down to this line in the BlueZ source.
> > > https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/gdbus/client.c#n720
> > > which is called from:
> > > https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/src/advertising.c#n1020
> > > It appears g_hash_table_lookup is returning NULL.
> > > I am not familiar with C and have been doing this investigation with
> > > fprintf statements. I don't know how to get the values of
> > > "proxy->prop_list" and "name". Does anyone know how I can print these
> > > values out?
> > > Even better would be, if someone could point me at to what this
> > > relates to in the Python LE Advertisement setup through DBus.
> > > I've looked up the g_hash_table_lookup command:
> > > https://developer.gnome.org/glib/stable/glib-Hash-Tables.html#g-hash-table-lookup
> > > but this hasn't helped me.
> > >
> > > Thanks,
> > > Barry
> > >
> > > On Thu, 18 Jul 2019 at 22:04, Barry Byford <31baz66@gmail.com> wrote:
> > > >
> > > > Hello Luiz,
> > > >
> > > > Thanks for the prompt response. Below are some updates following your input.
> > > >
> > > > On Thu, 18 Jul 2019 at 09:26, Luiz Augusto von Dentz
> > > > <luiz.dentz@gmail.com> wrote:
> > > > >
> > > > > Hi Barry,
> > > > >
> > > > > On Thu, Jul 18, 2019 at 10:03 AM Barry Byford <31baz66@gmail.com> wrote:
> > > > > >
> > > > > > Hello,
> > > > > >
> > > > > > The Python examples provided in the test directory of the BlueZ
> > > > > > repository use the python-dbus library. Looking at the documentation
> > > > > > of that library it does start by raising concerns and offering
> > > > > > alternatives. I have been looking at some of the alternatives and am
> > > > > > having difficultly getting them to work with BlueZ. I have been
> > > > > > focusing on the org.bluez.LEAdvertisement1 interface.
> > > > > >
> > > > > > Looking at the documentation, it says the service, interface and
> > > > > > object details are:
> > > > > > Service org.bluez
> > > > > > Interface org.bluez.LEAdvertisement1
> > > > > > Object path freely definable
> > > > > >
> > > > > > I am not being successful at publishing to the org.bluez service. It
> > > > > > is also not where the current examples publish to.
> > > > > > Looking at the GattProfile1 documentation, it has service and object
> > > > > > as application dependant.
> > > > > > Service <application dependent>
> > > > > > Interface org.bluez.GattProfile1
> > > > > > Object path <application dependent>
> > > > > > Should the documentation of Service on LEAdvertisement1 be freely
> > > > > > definable also?
> > > > >
> > > > > Yep, the bus name is up to the application which usually don't
> > > > > register a friendly name if you try to register with 'org.bluez' it
> > > > > would probably conflict with the daemon itself so you wouldn't be able
> > > > > to register that name anyway.
> > > > >
> > > > > > I have created the LEAdvertisement1 interface so that it has an
> > > > > > ObjectManager and is introspectable. When I pass the object to
> > > > > > RegisterAdvertisement on the org.bluez.LEAdvertisingManager1 interface
> > > > > > it accepts it (does not give an error) but does not register the data
> > > > > > and I see no advertisement appear. Is there somewhere I can find a
> > > > > > more detailed description of what needs to be on the
> > > > > > org.bluez.LEAdvertisement1 interface that will work with
> > > > > > RegisterAdvertisement?
> > > > >
> > > > > Do you have the bluetoothd output when you register, I get the
> > > > > following when using bluetoothctl:
> > > > >
> > > > > bluetooth]# power on
> > > > > Changing power on succeeded
> > > > > [bluetooth]# advertise on
> > > > > [CHG] Controller B8:8A:60:D8:17:D7 SupportedInstances: 0x04
> > > > > [CHG] Controller B8:8A:60:D8:17:D7 ActiveInstances: 0x01
> > > > > Advertising object registered
> > > > > Tx Power: off
> > > > > Name: off
> > > > > Apperance: off
> > > > > Discoverable: off
> > > > > [bluetooth]#
> > > >
> > > > Using the new dbus library I get:
> > > > Log from bluetoothctl:
> > > > [CHG] Controller FC:F8:AE:8F:0C:A4 SupportedInstances: 0x04
> > > > [CHG] Controller FC:F8:AE:8F:0C:A4 ActiveInstances: 0x01
> > > >
> > > > From the bluetoothd log:
> > > > bluetoothd[2856]: src/advertising.c:register_advertisement()
> > > > RegisterAdvertisement
> > > > bluetoothd[2856]: src/advertising.c:client_create() Adding proxy for
> > > > /ukBaz/bluezero/advertisement1
> > > > bluetoothd[2856]: src/advertising.c:register_advertisement()
> > > > Registered advertisement at path /ukBaz/bluezero/advertisement1
> > > > bluetoothd[2856]: src/advertising.c:refresh_adv() Refreshing
> > > > advertisement: /ukBaz/bluezero/advertisement1
> > > > bluetoothd[2856]: src/advertising.c:add_adv_callback() Advertisement
> > > > registered: /ukBaz/bluezero/advertisement1
> > > >
> > > >
> > > > With the old pyton-dbus library (that is working) I get:
> > > > log from bluetoothctl:
> > > > [CHG] Controller FC:F8:AE:8F:0C:A4 SupportedInstances: 0x04
> > > > [CHG] Controller FC:F8:AE:8F:0C:A4 ActiveInstances: 0x01
> > > >
> > > > From the bluetoothd log:
> > > > bluetoothd[2856]: src/advertising.c:register_advertisement()
> > > > RegisterAdvertisement
> > > > bluetoothd[2856]: src/advertising.c:client_create() Adding proxy for
> > > > /ukBaz/bluezero/advertisement0001
> > > > bluetoothd[2856]: src/advertising.c:register_advertisement()
> > > > Registered advertisement at path /ukBaz/bluezero/advertisement0001
> > > > bluetoothd[2856]: src/advertising.c:parse_service_uuids() Adding
> > > > ServiceUUID: FEAA
> > > > bluetoothd[2856]: src/advertising.c:parse_service_data() Adding
> > > > ServiceData for FEAA
> > > > bluetoothd[2856]: src/advertising.c:refresh_adv() Refreshing
> > > > advertisement: /ukBaz/bluezero/advertisement0001
> > > > bluetoothd[2856]: src/advertising.c:add_adv_callback() Advertisement
> > > > registered: /ukBaz/bluezero/advertisement0001
> > > >
> > > >
> > > > >
> > > > > bluetoothd[6103]: src/advertising.c:client_create() Adding proxy for
> > > > > /org/bluez/advertising
> > > > > bluetoothd[6103]: src/advertising.c:register_advertisement()
> > > > > Registered advertisement at path /org/bluez/advertising
> > > > > bluetoothd[6103]: src/advertising.c:refresh_adv() Refreshing
> > > > > advertisement: /org/bluez/advertising
> > > > > bluetoothd[6103]: src/advertising.c:add_adv_callback() Advertisement
> > > > > registered: /org/bluez/advertising
> > > > >
> > > > >
> > > > > > For reference, I have put below what I am currently  putting on the
> > > > > > org.bluez.LEAdvertisement1 interface.
> > > > > >
> > > > > > Thanks,
> > > > > > Barry
> > > > > >
> > > > > >
> > > > > > $ busctl call ukBaz.bluezero /ukBaz/bluezero/advertisement1
> > > > > > org.freedesktop.DBus.ObjectManager GetManagedObjects
> > > > > > a{oa{sa{sv}}} 1 "/ukBaz/bluezero/advertisement1" 5
> > > > > > "org.freedesktop.DBus.Properties" 0
> > > > > > "org.freedesktop.DBus.Introspectable" 0 "org.freedesktop.DBus.Peer" 0
> > > > > > "org.freedesktop.DBus.ObjectManager" 0 "org.bluez.LEAdvertisement1" 6
> > > > > > "Type" s "broadcast" "ServiceUUIDs" as 0 "ManufacturerData" a{sv} 0
> > > > > > "SolicitUUIDs" as 0 "ServiceData" a{sv} 1 "FEAA" ay 18 16 8 3 117 107
> > > > > > 66 97 122 46 103 105 116 104 117 98 46 105 111 "IncludeTxPower" b
> > > > > > false
> > > > >
> > > > > Not sure if that is the problem but usually ObjectManager is suppose
> > > > > to be on the '/' (root) path.
> > > >
> > > > Good point. It is not clear (to me anyway) exactly what the
> > > > requirement is from reading the spec
> > > > https://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager
> > > > I have moved the object manager to the root (/) but this does not seem
> > > > to have changed anything.
> > > >
> > > > $ busctl call ukBaz.bluezero / org.freedesktop.DBus.ObjectManager
> > > > GetManagedObjects
> > > > a{oa{sa{sv}}} 1 "/ukBaz/bluezero/advertisement1" 4
> > > > "org.freedesktop.DBus.Properties" 0
> > > > "org.freedesktop.DBus.Introspectable" 0 "org.freedesktop.DBus.Peer" 0
> > > > "org.bluez.LEAdvertisement1" 6 "Type" s "broadcast" "ServiceUUIDs" as
> > > > 0 "ManufacturerData" a{sv} 0 "SolicitUUIDs" as 0 "ServiceData" a{sv} 1
> > > > "FEAA" ay 18 16 8 3 117 107 66 97 122 46 103 105 116 104 117 98 46 105
> > > > 111 "IncludeTxPower" b false
> > > >
> > > >
> > > > >
> > > > > > $ busctl call ukBaz.bluezero /ukBaz/bluezero/advertisement1
> > > > > > org.freedesktop.DBus.Properties GetAll s org.bluez.LEAdvertisement1
> > > > > > a{sv} 6 "Type" s "broadcast" "ServiceUUIDs" as 0 "ManufacturerData"
> > > > > > a{sv} 0 "SolicitUUIDs" as 0 "ServiceData" a{sv} 1 "FEAA" ay 18 16 8 3
> > > > > > 117 107 66 97 122 46 103 105 116 104 117 98 46 105 111
> > > > > > "IncludeTxPower" b false
> > > > > >
> > > >
> > > > Using the d-feet application I did a GetAll on the advertisements and
> > > > the data looks identical for both
> > > > Using the new DBus library:
> > > > {'IncludeTxPower': False,
> > > >  'ManufacturerData': {},
> > > >  'ServiceData': {'FEAA': [16,
> > > >                           8,
> > > >                           3,
> > > >                           117,
> > > >                           107,
> > > >                           66,
> > > >                           97,
> > > >                           122,
> > > >                           46,
> > > >                           103,
> > > >                           105,
> > > >                           116,
> > > >                           104,
> > > >                           117,
> > > >                           98,
> > > >                           46,
> > > >                           105,
> > > >                           111]},
> > > >  'ServiceUUIDs': ['FEAA'],
> > > >  'SolicitUUIDs': [],
> > > >  'Type': 'broadcast'}
> > > >
> > > > Using the old Python-dbus library:
> > > > {'IncludeTxPower': False,
> > > >  'ServiceData': {'FEAA': [16,
> > > >                           8,
> > > >                           3,
> > > >                           117,
> > > >                           107,
> > > >                           66,
> > > >                           97,
> > > >                           122,
> > > >                           46,
> > > >                           103,
> > > >                           105,
> > > >                           116,
> > > >                           104,
> > > >                           117,
> > > >                           98,
> > > >                           46,
> > > >                           105,
> > > >                           111]},
> > > >  'ServiceUUIDs': ['FEAA'],
> > > >  'Type': 'broadcast'}
> > > >
> > > > > > $ busctl call ukBaz.bluezero /ukBaz/bluezero/advertisement1
> > > > > > org.freedesktop.DBus.Introspectable Introspect
> > > > > > s "<!DOCTYPE node PUBLIC \"-//freedesktop//DTD D-BUS Object
> > > > > > Introspection 1.0//EN\"\n
> > > > > > \"http://www.freedesktop.org/standards/dbus/1.0/introspect.dtd\">\n<!--
> > > > > > GDBus 2.60.4 -->\n<node>\n  <interface
> > > > > > name=\"org.freedesktop.DBus.Properties\">\n    <method name=\"Get\">\n
> > > > > >      <arg type=\"s\" name=\"interface_name\" direction=\"in\"/>\n
> > > > > > <arg type=\"s\" name=\"property_name\" direction=\"in\"/>\n      <arg
> > > > > > type=\"v\" name=\"value\" direction=\"out\"/>\n    </method>\n
> > > > > > <method name=\"GetAll\">\n      <arg type=\"s\"
> > > > > > name=\"interface_name\" direction=\"in\"/>\n      <arg type=\"a{sv}\"
> > > > > > name=\"properties\" direction=\"out\"/>\n    </method>\n    <method
> > > > > > name=\"Set\">\n      <arg type=\"s\" name=\"interface_name\"
> > > > > > direction=\"in\"/>\n      <arg type=\"s\" name=\"property_name\"
> > > > > > direction=\"in\"/>\n      <arg type=\"v\" name=\"value\"
> > > > > > direction=\"in\"/>\n    </method>\n    <signal
> > > > > > name=\"PropertiesChanged\">\n      <arg type=\"s\"
> > > > > > name=\"interface_name\"/>\n      <arg type=\"a{sv}\"
> > > > > > name=\"changed_properties\"/>\n      <arg type=\"as\"
> > > > > > name=\"invalidated_properties\"/>\n    </signal>\n  </interface>\n
> > > > > > <interface name=\"org.freedesktop.DBus.Introspectable\">\n    <method
> > > > > > name=\"Introspect\">\n      <arg type=\"s\" name=\"xml_data\"
> > > > > > direction=\"out\"/>\n    </method>\n  </interface>\n  <interface
> > > > > > name=\"org.freedesktop.DBus.Peer\">\n    <method name=\"Ping\"/>\n
> > > > > > <method name=\"GetMachineId\">\n      <arg type=\"s\"
> > > > > > name=\"machine_uuid\" direction=\"out\"/>\n    </method>\n
> > > > > > </interface>\n  <interface
> > > > > > name=\"org.freedesktop.DBus.ObjectManager\">\n    <method
> > > > > > name=\"GetManagedObjects\">\n      <arg type=\"a{oa{sa{sv}}}\"
> > > > > > name=\"object_paths_interfaces_and_properties\" direction=\"out\">\n
> > > > > >    </arg>\n    </method>\n    <signal name=\"InterfacesAdded\">\n
> > > > > > <arg type=\"o\" name=\"object_path\">\n      </arg>\n      <arg
> > > > > > type=\"a{sa{sv}}\" name=\"interfaces_and_properties\">\n      </arg>\n
> > > > > >    </signal>\n    <signal name=\"InterfacesRemoved\">\n      <arg
> > > > > > type=\"o\" name=\"object_path\">\n      </arg>\n      <arg type=\"as\"
> > > > > > name=\"interfaces\">\n      </arg>\n    </signal>\n  </interface>\n
> > > > > > <interface name=\"org.bluez.LEAdvertisement1\">\n    <annotation
> > > > > > name=\"org.freedesktop.DBus.Properties.PropertiesChanged\"
> > > > > > value=\"const\">\n    </annotation>\n    <method name=\"Release\">\n
> > > > > >    <annotation name=\"org.freedesktop.DBus.Method.NoReply\"
> > > > > > value=\"true\">\n      </annotation>\n    </method>\n    <property
> > > > > > type=\"s\" name=\"Type\" access=\"read\">\n    </property>\n
> > > > > > <property type=\"as\" name=\"ServiceUUIDs\" access=\"read\">\n
> > > > > > </property>\n    <property type=\"a{sv}\" name=\"ManufacturerData\"
> > > > > > access=\"read\">\n    </property>\n    <property type=\"as\"
> > > > > > name=\"SolicitUUIDs\" access=\"read\">\n    </property>\n    <property
> > > > > > type=\"a{sv}\" name=\"ServiceData\" access=\"read\">\n
> > > > > > </property>\n    <property type=\"b\" name=\"IncludeTxPower\"
> > > > > > access=\"read\">\n    </property>\n  </interface>\n</node>\n"
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Luiz Augusto von Dentz
>
>
>
> --
> Luiz Augusto von Dentz
