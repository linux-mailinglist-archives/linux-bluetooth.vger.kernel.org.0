Return-Path: <linux-bluetooth-owner@vger.kernel.org>
X-Original-To: lists+linux-bluetooth@lfdr.de
Delivered-To: lists+linux-bluetooth@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B111C7B0E3C
	for <lists+linux-bluetooth@lfdr.de>; Wed, 27 Sep 2023 23:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbjI0Vk2 (ORCPT <rfc822;lists+linux-bluetooth@lfdr.de>);
        Wed, 27 Sep 2023 17:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjI0Vk0 (ORCPT
        <rfc822;linux-bluetooth@vger.kernel.org>);
        Wed, 27 Sep 2023 17:40:26 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AE2194
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Sep 2023 14:40:20 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6934202b8bdso1312586b3a.1
        for <linux-bluetooth@vger.kernel.org>; Wed, 27 Sep 2023 14:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695850819; x=1696455619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AITTg7wzMfwstGQCpgCXYeNHsCBEEvHmneYfk2K9WCQ=;
        b=FjBRvN5GhdBozsFJrBTZiba3JJ9uMXQvp4Cp9dU4UNp5xro3h9DPBoCGQQpqK3eXbP
         rL9k9WsC+ayaqbydYL56wbCKkm0jNWhDIghjf/pldvcwmjMKMTMjx4THQ66lUMK186jW
         venCAsIzhyGN6bOk8DqsHJPaoO1/YuzcxcweiTtivCCx01+FAkgy5uqDPrn6241VuNOa
         XxhqhALIX5KYoWnHrduOpfKa+/+jOCXaVUZ9veQy53wNBO1UZCQs3iKMd6W3F8HJbxMm
         yeqIHL61v7fYn7kKAaIn/VZ8/hIPoCOpfPl5vxoUMODWU38AKAx/NWsG1keDcRdQ3Is2
         SaJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695850819; x=1696455619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AITTg7wzMfwstGQCpgCXYeNHsCBEEvHmneYfk2K9WCQ=;
        b=Px/u1hG9a7HagzGNoBfY0shCogqjAg4QlIadAFEd66IhbSGYMr8er59KC17pPyJiQp
         qhAC8VybfxtaDZIbSO2ij2Za3/2Nw+6RBByDXY0uRoA1fTfd3YQYpOvrF06TE6Wbs4yj
         P/kAp1VfrK/D/ATKCjbEBa25k6uYghh28AggsLPVoRMP/HBNt2QyMTx413qqkkWQA1MY
         8RAddt4bLZ2gH0TrvyM6Zv3pzPuXTzJ0/cagYHup/TQQ8rLoIwQnNJ+pYFH5xv7+9faz
         dQHp/+KReAv2cpt9T61IAhXlOTnhXYLjh6hv2ex0ZOVBE6fjGhCPxbmyNmzIUFTgKMRi
         oxUw==
X-Gm-Message-State: AOJu0Yxv+G08n0jYkoiYxrdcGNoBJh1k+8TtJHtnryG2CZ6AQhxWNyyB
        zC2Dd+T18Gy1s6rSKVEcHvfHMEIUIWtpTdi2
X-Google-Smtp-Source: AGHT+IHsbAFfLMOxcychEUuZOKW04HS0tOGL7Wjsk7FE5KtUnuclS2xqpRgwulxDensclSyaq6a3Fw==
X-Received: by 2002:a05:6a00:1808:b0:690:d2de:14cc with SMTP id y8-20020a056a00180800b00690d2de14ccmr4250998pfa.33.1695850817657;
        Wed, 27 Sep 2023 14:40:17 -0700 (PDT)
Received: from lvondent-mobl4.. (c-98-232-221-87.hsd1.or.comcast.net. [98.232.221.87])
        by smtp.gmail.com with ESMTPSA id s26-20020aa78d5a000000b00672ea40b8a9sm12546004pfe.170.2023.09.27.14.40.15
        for <linux-bluetooth@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 14:40:16 -0700 (PDT)
From:   Luiz Augusto von Dentz <luiz.dentz@gmail.com>
To:     linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 06/12] doc/media: Convert media-api.rst into manpages
Date:   Wed, 27 Sep 2023 14:39:57 -0700
Message-ID: <20230927214003.1873224-7-luiz.dentz@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927214003.1873224-1-luiz.dentz@gmail.com>
References: <20230927214003.1873224-1-luiz.dentz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-bluetooth.vger.kernel.org>
X-Mailing-List: linux-bluetooth@vger.kernel.org

From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>

This splits media-api.rst into org.bluez.Media<interface>.rst and
generate manpages for them.
---
 Makefile.am                      |   21 +-
 doc/media-api.rst                | 1144 ------------------------------
 doc/org.bluez.Media.rst          |  133 ++++
 doc/org.bluez.MediaControl.rst   |   80 +++
 doc/org.bluez.MediaEndpoint.rst  |  224 ++++++
 doc/org.bluez.MediaFolder.rst    |  117 +++
 doc/org.bluez.MediaItem.rst      |  131 ++++
 doc/org.bluez.MediaPlayer.rst    |  315 ++++++++
 doc/org.bluez.MediaTransport.rst |  274 +++++++
 9 files changed, 1292 insertions(+), 1147 deletions(-)
 delete mode 100644 doc/media-api.rst
 create mode 100644 doc/org.bluez.Media.rst
 create mode 100644 doc/org.bluez.MediaControl.rst
 create mode 100644 doc/org.bluez.MediaEndpoint.rst
 create mode 100644 doc/org.bluez.MediaFolder.rst
 create mode 100644 doc/org.bluez.MediaItem.rst
 create mode 100644 doc/org.bluez.MediaPlayer.rst
 create mode 100644 doc/org.bluez.MediaTransport.rst

diff --git a/Makefile.am b/Makefile.am
index 30db74a0c441..a17841b0668d 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -357,8 +357,16 @@ CLEANFILES += $(builtin_files) src/bluetooth.service
 
 if MANPAGES
 man_MANS += src/bluetoothd.8
+man_MANS += doc/org.bluez.Media.5 doc/org.bluez.MediaControl.5 \
+		doc/org.bluez.MediaPlayer.5 doc/org.bluez.MediaFolder.5 \
+		doc/org.bluez.MediaItem.5 doc/org.bluez.MediaEndpoint.5 \
+		doc/org.bluez.MediaTransport.5
 endif
 manual_pages += src/bluetoothd.8
+manual_pages += doc/org.bluez.Media.5 doc/org.bluez.MediaControl.5 \
+		doc/org.bluez.MediaPlayer.5 doc/org.bluez.MediaFolder.5 \
+		doc/org.bluez.MediaItem.5 doc/org.bluez.MediaEndpoint.5 \
+		doc/org.bluez.MediaTransport.5
 
 EXTRA_DIST += src/genbuiltin src/bluetooth.conf \
 			src/main.conf profiles/network/network.conf \
@@ -397,9 +405,13 @@ EXTRA_DIST += doc/assigned-numbers.txt doc/supported-features.txt \
 EXTRA_DIST += doc/mgmt-api.txt \
 		doc/adapter-api.txt doc/device-api.txt \
 		doc/agent-api.txt doc/profile-api.txt \
-		doc/network-api.txt doc/media-api.rst \
-		doc/health-api.txt doc/sap-api.txt \
-		doc/input-api.txt
+		doc/network-api.txt doc/health-api.txt \
+		doc/sap-api.txt doc/input-api.txt
+
+EXTRA_DIST += doc/org.bluez.Media.rst doc/org.bluez.MediaControl.rst \
+		doc/org.bluez.MediaPlayer.rst doc/org.bluez.MediaFolder.rst \
+		doc/org.bluez.MediaItem.rst doc/org.bluez.MediaEndpoint.rst \
+		doc/org.bluez.MediaTransport.rst
 
 EXTRA_DIST += doc/gatt-api.txt doc/advertising-api.txt
 
@@ -667,6 +679,9 @@ endif
 %.1: %.rst Makefile
 	$(RST2MAN_PROCESS)
 
+%.5: %.rst Makefile
+	$(RST2MAN_PROCESS)
+
 %.8: %.rst Makefile
 	$(RST2MAN_PROCESS)
 
diff --git a/doc/media-api.rst b/doc/media-api.rst
deleted file mode 100644
index b37ae8f01630..000000000000
--- a/doc/media-api.rst
+++ /dev/null
@@ -1,1144 +0,0 @@
-===================================
-BlueZ D-Bus Media API documentation
-===================================
-
-
-Media interface
-===============
-
-:Service:	org.bluez
-:Interface:	org.bluez.Media1
-:Object path:	[variable prefix]/{hci0,hci1,...}
-
-Methods
--------
-
-void RegisterEndpoint(object endpoint, dict properties)
-```````````````````````````````````````````````````````
-
-	Register a local end point to sender, the sender can register as many
-	end points as it likes.
-
-	Note: If the sender disconnects the end points are automatically
-	unregistered.
-
-	possible properties:
-
-	:string UUID:
-
-		UUID of the profile which the endpoint is for.
-
-		UUID must be in the list of SupportedUUIDS.
-
-	:byte Codec:
-
-		Assigned number of codec that the endpoint implements. The
-		values should match the profile specification which is
-		indicated by the UUID.
-
-	:uint32_t Vendor [Optional]:
-
-		Vendor-specific Company ID, Codec ID tuple that the endpoint
-		implements.
-
-		It shall be set to appropriate value when Vendor Specific Codec
-		(0xff) is used.
-
-	:array{byte} Capabilities:
-
-		Capabilities blob, it is used as it is so the size and byte
-		order must match.
-
-	:array{byte} Metadata [Optional]:
-
-		Metadata blob, it is used as it is so the size and byte order
-		must match.
-
-	Possible Errors:
-
-	:org.bluez.Error.InvalidArguments:
-	:org.bluez.Error.NotSupported:
-
-		emitted when interface for the end-point is disabled
-
-void UnregisterEndpoint(object endpoint)
-````````````````````````````````````````
-	Unregister sender end point.
-
-void RegisterPlayer(object player, dict properties)
-```````````````````````````````````````````````````
-
-	Register a media player object to sender, the sender can register as
-	many objects as it likes.
-
-	Object must implement at least org.mpris.MediaPlayer2.Player as defined
-	in MPRIS 2.2 spec:
-
-		http://specifications.freedesktop.org/mpris-spec/latest/
-
-	Note: If the sender disconnects its objects are automatically
-	unregistered.
-
-	Possible Errors:
-
-	:org.bluez.Error.InvalidArguments:
-	:org.bluez.Error.NotSupported:
-
-void UnregisterPlayer(object player)
-````````````````````````````````````
-
-	Unregister sender media player.
-
-void RegisterApplication(object root, dict options)
-```````````````````````````````````````````````````
-
-	Register endpoints an player objects within root object which must
-	implement ObjectManager.
-
-	The application object path together with the D-Bus system bus
-	connection ID define the identification of the application.
-
-	Possible errors:
-
-	:org.bluez.Error.InvalidArguments:
-	:org.bluez.Error.AlreadyExists:
-
-void UnregisterApplication(object application)
-``````````````````````````````````````````````
-
-	This unregisters the services that has been previously registered. The
-	object path parameter must match the same value that has been used on
-	registration.
-
-	Possible errors:
-
-	:org.bluez.Error.InvalidArguments:
-	:org.bluez.Error.DoesNotExist:
-
-Properties
-----------
-
-array{string} SupportedUUIDs [readonly]
-```````````````````````````````````````
-
-	List of 128-bit UUIDs that represents the supported Endpoint
-	registration.
-
-MediaControl interface
-======================
-
-:Service:	org.bluez
-:Interface:	org.bluez.MediaControl1
-:Object path:	[variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
-
-Methods
--------
-
-void Play() [Deprecated]
-````````````````````````
-
-	Resume playback.
-
-void Pause() [Deprecated]
-`````````````````````````
-
-	Pause playback.
-
-void Stop() [Deprecated]
-````````````````````````
-
-	Stop playback.
-
-void Next() [Deprecated]
-````````````````````````
-
-	Next item.
-
-void Previous() [Deprecated]
-````````````````````````````
-
-	Previous item.
-
-void VolumeUp() [Deprecated]
-````````````````````````````
-
-	Adjust remote volume one step up
-
-void VolumeDown() [Deprecated]
-``````````````````````````````
-
-	Adjust remote volume one step down
-
-void FastForward() [Deprecated]
-```````````````````````````````
-
-	Fast forward playback, this action is only stopped when another method
-	in this interface is called.
-
-void Rewind() [Deprecated]
-``````````````````````````
-
-	Rewind playback, this action is only stopped when another method in
-	this interface is called.
-
-Properties
-----------
-
-boolean Connected [readonly]
-````````````````````````````
-
-object Player [readonly, optional]
-``````````````````````````````````
-
-	Addressed Player object path.
-
-MediaPlayer interface
-=====================
-
-:Service:	org.bluez (Controller role)
-:Interface:	org.bluez.MediaPlayer1
-:Object path:	[variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX/playerX
-
-Methods
--------
-
-void Play()
-```````````
-
-	Resume playback.
-
-	Possible Errors:
-
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-void Pause()
-````````````
-
-	Pause playback.
-
-	Possible Errors:
-
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-void Stop()
-```````````
-
-	Stop playback.
-
-	Possible Errors:
-
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-void Next()
-```````````
-
-	Next item.
-
-	Possible Errors:
-
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-void Previous()
-```````````````
-
-	Previous item.
-
-	Possible Errors:
-
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-void FastForward()
-``````````````````
-
-	Fast forward playback, this action is only stopped when another method
-	in this interface is called.
-
-	Possible Errors:
-
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-void Rewind()
-`````````````
-
-	Rewind playback, this action is only stopped when another method in
-	this interface is called.
-
-	Possible Errors:
-
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-void Press(byte avc_key)
-````````````````````````
-
-	Press a specific key to send as passthrough command. The key will be
-	released automatically. Use Hold() instead if the intention is to hold
-	down the key.
-
-	Possible Errors:
-
-	:org.bluez.Error.InvalidArguments:
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-void Hold(byte avc_key)
-```````````````````````
-
-	Press and hold a specific key to send as passthrough command. It is
-	your responsibility to make sure that Release() is called after calling
-	this method. The held key will also be released when any other method
-	in this interface is called.
-
-	Possible Errors:
-
-	:org.bluez.Error.InvalidArguments:
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-void Release()
-``````````````
-
-	Release the previously held key invoked using Hold().
-
-	Possible Errors:
-
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-Properties
-----------
-
-string Equalizer [readwrite]
-````````````````````````````
-
-	Possible values: "off" or "on"
-
-string Repeat [readwrite]
-`````````````````````````
-
-	Possible values: "off", "singletrack", "alltracks" or "group"
-
-string Shuffle [readwrite]
-``````````````````````````
-
-	Possible values: "off", "alltracks" or "group"
-
-string Scan [readwrite]
-```````````````````````
-
-	Possible values: "off", "alltracks" or "group"
-
-string Status [readonly]
-````````````````````````
-
-	Possible status: "playing", "stopped", "paused", "forward-seek",
-			 "reverse-seek" or "error"
-
-uint32 Position [readonly]
-``````````````````````````
-
-	Playback position in milliseconds. Changing the position may generate
-	additional events that will be sent to the remote device. When position
-	is 0 it means the track is starting and when it's greater than or equal
-	to track's duration the track has ended.
-
-	Note that even if duration is not available in metadata it's possible
-	to signal its end by setting position to the maximum uint32 value.
-
-dict Track [readonly]
-`````````````````````
-
-	Track metadata.
-
-	Possible values:
-
-	:string Title:
-
-		Track title name
-
-	:string Artist:
-
-		Track artist name
-
-	:string Album:
-
-		Track album name
-
-	:string Genre:
-
-		Track genre name
-
-	:uint32 NumberOfTracks:
-
-		Number of tracks in total
-
-	:uint32 TrackNumber:
-
-		Track number
-
-	:uint32 Duration:
-
-		Track duration in milliseconds
-
-object Device [readonly]
-````````````````````````
-
-	Device object path.
-
-string Name [readonly]
-``````````````````````
-
-	Player name
-
-string Type [readonly]
-``````````````````````
-
-	Player type
-
-	Possible values:
-
-		"Audio"
-		"Video"
-		"Audio Broadcasting"
-		"Video Broadcasting"
-
-string Subtype [readonly]
-`````````````````````````
-
-	Player subtype
-
-	Possible values:
-
-		"Audio Book"
-		"Podcast"
-
-boolean Browsable [readonly]
-````````````````````````````
-
-	If present indicates the player can be browsed using MediaFolder
-	interface.
-
-	Possible values:
-
-	:True:
-
-		Supported and active
-
-	:False:
-
-		Supported but inactive
-
-	Note: If supported but inactive clients can enable it by using
-	MediaFolder interface but it might interfere in the playback of other
-	players.
-
-boolean Searchable [readonly]
-`````````````````````````````
-
-	If present indicates the player can be searched using MediaFolder
-	interface.
-
-	Possible values:
-
-	:True:
-
-		Supported and active
-
-	:False:
-
-		Supported but inactive
-
-	Note: If supported but inactive clients can enable it by using
-	MediaFolder interface but it might interfere in the playback of other
-	players.
-
-object Playlist
-```````````````
-
-	Playlist object path.
-
-MediaFolder interface
-=====================
-
-:Service:	unique name (Target role)
-		org.bluez (Controller role)
-:Interface:	org.bluez.MediaFolder1
-:Object path:	freely definable (Target role)
-		[variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX/playerX
-		(Controller role)
-
-Methods
--------
-
-object Search(string value, dict filter)
-````````````````````````````````````````
-
-	Return a folder object containing the search result.
-
-	To list the items found use the folder object returned and pass to
-	ChangeFolder.
-
-	Possible Errors:
-
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-array{objects, properties} ListItems(dict filter)
-`````````````````````````````````````````````````
-
-	Return a list of items found
-
-	Possible Errors:
-
-	:org.bluez.Error.InvalidArguments:
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-void ChangeFolder(object folder)
-````````````````````````````````
-
-	Change current folder.
-
-	Note: By changing folder the items of previous folder might be destroyed
-	and have to be listed again, the exception is NowPlaying folder which
-	should be always present while the player is active.
-
-	Possible Errors:
-
-	:org.bluez.Error.InvalidArguments:
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-Properties
-----------
-
-uint32 NumberOfItems [readonly]
-```````````````````````````````
-
-	Number of items in the folder
-
-string Name [readonly]
-``````````````````````
-
-	Folder name:
-
-	Possible values:
-
-	:"/Filesystem/...":
-
-		Filesystem scope
-
-	:"/NowPlaying/...":
-
-		NowPlaying scope
-
-	Note: /NowPlaying folder might not be listed if player is stopped,
-	folders created by Search are virtual so once another Search is perform
-	or the folder is changed using ChangeFolder it will no longer be listed.
-
-Filters
--------
-
-:uint32 Start:
-
-	Offset of the first item.
-
-	Default value: 0
-
-:uint32 End:
-
-	Offset of the last item.
-
-	Default value: NumbeOfItems
-
-:array{string} Attributes:
-
-	Item properties that should be included in the list.
-
-	Possible Values:
-
-		"title", "artist", "album", "genre", "number-of-tracks",
-		"number", "duration"
-
-		Default Value: All
-
-MediaItem interface
-===================
-
-:Service:	unique name (Target role)
-		org.bluez (Controller role)
-:Interface:	org.bluez.MediaItem1
-:Object path:	freely definable (Target role)
-		[variable
-		prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX/playerX/itemX
-		(Controller role)
-
-Methods
--------
-
-void Play()
-```````````
-
-	Play item
-
-	Possible Errors:
-
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-void AddtoNowPlaying()
-``````````````````````
-
-	Add item to now playing list
-
-	Possible Errors:
-
-	:org.bluez.Error.NotSupported:
-	:org.bluez.Error.Failed:
-
-Properties
-----------
-
-object Player [readonly]
-````````````````````````
-
-	Player object path the item belongs to
-
-string Name [readonly]
-``````````````````````
-
-	Item displayable name
-
-string Type [readonly]
-``````````````````````
-
-	Item type
-
-	Possible values: "video", "audio", "folder"
-
-string FolderType [readonly, optional]
-``````````````````````````````````````
-
-	Folder type.
-
-	Possible values: "mixed", "titles", "albums", "artists"
-
-	Available if property Type is "Folder"
-
-boolean Playable [readonly, optional]
-`````````````````````````````````````
-
-	Indicates if the item can be played
-
-	Available if property Type is "folder"
-
-dict Metadata [readonly]
-````````````````````````
-
-	Item metadata.
-
-	Possible values:
-
-	:string Title:
-
-		Item title name
-
-		Available if property Type is "audio" or "video"
-
-	:string Artist:
-
-		Item artist name
-
-		Available if property Type is "audio" or "video"
-
-	:string Album:
-
-		Item album name
-
-		Available if property Type is "audio" or "video"
-
-	:string Genre:
-
-		Item genre name
-
-		Available if property Type is "audio" or "video"
-
-	:uint32 NumberOfTracks:
-
-		Item album number of tracks in total
-
-		Available if property Type is "audio" or "video"
-
-	:uint32 Number:
-
-		Item album number
-
-		Available if property Type is "audio" or "video"
-
-	:uint32 Duration:
-
-		Item duration in milliseconds
-
-		Available if property Type is "audio" or "video"
-
-MediaEndpoint interface
-=======================
-
-:Service:	unique name (Server role)
-		org.bluez (Client role)
-:Interface:	org.bluez.MediaEndpoint1
-:Object path:	freely definable (Server role)
-		[variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX/sepX
-		(Client role)
-
-Methods
--------
-
-void SetConfiguration(object transport, dict properties)
-````````````````````````````````````````````````````````
-
-	Set configuration for the transport.
-
-	For client role transport must be set with a server endpoint oject which
-	will be configured and the properties must contain the following
-	properties:
-
-	:array{byte} Capabilities [Mandatory]:
-
-		See Endpoint.Capabilities property.
-
-	:array{byte} Metadata [ISO only]:
-
-		See Endpoint.Metadata property.
-
-	:uint32 Location [ISO only]:
-
-		See Endpoint.Location property.
-
-	:byte Framing [ISO only]:
-
-		See Endpoint.Framing property.
-
-	:byte PHY [ISO only]:
-
-		See Endpoint.PHY property.
-
-	:uint16 MaximumLatency [ISO only]:
-
-		See Endpoint.MaximumLatency property.
-
-	:uint32 MinimumDelay [ISO only]:
-
-		See Endpoint.MinimumDelay property.
-
-	:uint32 MaximumDelay [ISO only]:
-
-		See Endpoint.MaximumDelay property.
-
-	:uint32 PreferredMinimumDelay [ISO only]:
-
-		See Endpoint.PreferredMinimumDelay property.
-
-	:uint32 PreferredMaximumDelay [ISO only]:
-
-		See Endpoint.PreferredMaximumDelay property.
-
-
-array{byte} SelectConfiguration(array{byte} capabilities)
-`````````````````````````````````````````````````````````
-
-	Select preferable configuration from the supported capabilities.
-
-	Returns a configuration which can be used to setup a transport.
-
-	Note: There is no need to cache the selected configuration since on
-	success the configuration is send back as parameter of SetConfiguration.
-
-dict SelectProperties(dict properties)
-``````````````````````````````````````
-
-	Select preferable properties from the supported properties:
-
-	:object Endpoint [ISO only]:
-	:Refer to SetConfiguration for the list of other possible properties.:
-
-	Returns propeties which can be used to setup a transport.
-
-	Note: There is no need to cache the selected properties since on
-	success the configuration is send back as parameter of SetConfiguration.
-
-void ClearConfiguration(object transport)
-`````````````````````````````````````````
-
-	Clear transport configuration.
-
-void Release()
-``````````````
-
-	This method gets called when the service daemon unregisters the
-	endpoint. An endpoint can use it to do cleanup tasks. There is no need
-	to unregister the endpoint, because when this method gets called it has
-	already been unregistered.
-
-Properties
-----------
-
-string UUID [readonly, optional]
-````````````````````````````````
-
-	UUID of the profile which the endpoint is for.
-
-byte Codec [readonly, optional]
-```````````````````````````````
-
-	Assigned number of codec that the endpoint implements.
-	The values should match the profile specification which is indicated by
-	the UUID.
-
-uint32_t Vendor [readonly, Optional]
-````````````````````````````````````
-
-	Vendor-specific Company ID, Codec ID tuple that the endpoint implements.
-
-	It shall be set to appropriate value when Vendor Specific Codec (0xff)
-	is used.
-
-array{byte} Capabilities [readonly, optional]
-`````````````````````````````````````````````
-
-	Capabilities blob, it is used as it is so the size and byte order must
-	match.
-
-array{byte} Metadata [readonly, Optional]
-`````````````````````````````````````````
-
-	Metadata blob, it is used as it is so the size and byte order must
-	match.
-
-object Device [readonly, optional]
-``````````````````````````````````
-
-	Device object which the endpoint is belongs to.
-
-bool DelayReporting [readonly, optional]
-````````````````````````````````````````
-
-	Indicates if endpoint supports Delay Reporting.
-
-byte Framing [ISO only]
-```````````````````````
-
-	Indicates endpoint support framing.
-
-byte PHY [ISO only]
-```````````````````
-
-	Indicates endpoint supported PHY.
-
-uint16_t MaximumLatency [ISO only]
-``````````````````````````````````
-
-	Indicates endpoint maximum latency.
-
-uint32_t MinimumDelay [ISO only]
-````````````````````````````````
-
-	Indicates endpoint minimum presentation delay.
-
-uint32_t MaximumDelay [ISO only]
-````````````````````````````````
-
-	Indicates endpoint maximum presentation delay.
-
-uint32_t PreferredMinimumDelay [ISO only]
-`````````````````````````````````````````
-
-	Indicates endpoint preferred minimum presentation delay.
-
-uint32_t PreferredMinimumDelay [ISO only]
-`````````````````````````````````````````
-
-	Indicates endpoint preferred minimum presentation delay.
-
-uint32 Location [ISO only]
-``````````````````````````
-
-	Indicates endpoint supported locations.
-
-uint16 SupportedContext [ISO only]
-``````````````````````````````````
-
-	Indicates endpoint supported audio context.
-
-uint16 Context [ISO only]
-`````````````````````````
-
-	Indicates endpoint available audio context.
-
-MediaTransport interface
-========================
-
-:Service:	org.bluez
-:Interface:	org.bluez.MediaTransport1
-:Object path:	[variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX/fdX
-
-Methods
--------
-
-fd, uint16, uint16 Acquire()
-````````````````````````````
-
-	Acquire transport file descriptor and the MTU for read and write
-	respectively.
-
-	Possible Errors:
-
-	:org.bluez.Error.NotAuthorized:
-	:org.bluez.Error.Failed:
-
-fd, uint16, uint16 TryAcquire()
-```````````````````````````````
-
-	Acquire transport file descriptor only if the transport is in "pending"
-	state at the time the message is received by BlueZ. Otherwise no request
-	will be sent to the remote device and the function will just fail with
-	org.bluez.Error.NotAvailable.
-
-	Possible Errors:
-
-	:org.bluez.Error.NotAuthorized:
-	:org.bluez.Error.Failed:
-	:org.bluez.Error.NotAvailable:
-
-void Release()
-``````````````
-
-	Releases file descriptor.
-
-Properties
-----------
-
-object Device [readonly]
-````````````````````````
-
-	Device object which the transport is connected to.
-
-string UUID [readonly]
-``````````````````````
-
-	UUID of the profile which the transport is for.
-
-byte Codec [readonly]
-`````````````````````
-
-	Assigned number of codec that the transport support.
-	The values should match the profile specification which is indicated by
-	the UUID.
-
-array{byte} Configuration [readonly]
-````````````````````````````````````
-
-	Configuration blob, it is used as it is so the size and byte order must
-	match.
-
-string State [readonly]
-```````````````````````
-
-	Indicates the state of the transport. Possible values are:
-
-	:"idle": not streaming
-	:"pending": streaming but not acquired
-	:"active": streaming and acquired
-
-uint16 Delay [readwrite, optional]
-``````````````````````````````````
-
-	Transport delay in 1/10 of millisecond, this property is only writeable
-	when the transport was acquired by the sender.
-
-uint16 Volume [readwrite, optional]
-```````````````````````````````````
-
-	Indicates volume level of the transport, this property is only writeable
-	when the transport was acquired by the sender.
-
-	Possible Values: 0-127
-
-object Endpoint [readonly, optional, experimental]
-``````````````````````````````````````````````````
-
-	Endpoint object which the transport is associated with.
-
-uint32 Location [readonly, ISO only, experimental]
-``````````````````````````````````````````````````
-
-	Indicates transport Audio Location.
-
-array{byte} Metadata [readwrite, ISO Only, experimental]
-````````````````````````````````````````````````````````
-
-	Indicates transport Metadata.
-
-array{object} Links [readonly, optional, ISO only, experimental]
-````````````````````````````````````````````````````````````````
-
-	Linked transport objects which the transport is associated with.
-
-dict QoS [readonly, optional, ISO only, experimental]
-`````````````````````````````````````````````````````
-
-	Only present when QoS is configured.
-
-	Possible values for Unicast:
-
-	:byte CIG:
-
-		Indicates configured CIG.
-
-		Possible values:
-
-		:0x00 - 0xef:
-
-			Valid ID range.
-
-		:0xff:
-
-			Auto allocate.
-
-	:byte CIS:
-
-		Indicates configured CIS.
-
-		Possible values:
-
-		:0x00 - 0xef:
-
-			Valid ID range.
-
-		:0xff:
-
-			Auto allocate.
-
-	:byte Framing:
-
-		Indicates configured framing.
-
-		Possible values:
-
-		:0x00:
-
-			Unframed.
-
-		:0x01:
-
-			Framed.
-
-	:uint32 PresentationDelay:
-
-		Indicates configured transport presentation delay (us).
-
-	:byte TargetLatency:
-
-		Indicates the requested target latency.
-
-		Possible values:
-
-		:0x01:
-
-			Low Latency.
-
-		:0x02:
-
-			Balanced Latency/Reliability.
-
-		:0x03:
-
-			High Reliability.
-
-	Possible values for Broadcast:
-
-	:byte BIG:
-
-		Indicates configured QoS BIG.
-
-	:byte BIS:
-
-		Indicates configured BIS.
-
-	:byte SyncFactor:
-
-		Indicates configured broadcast sync factor.
-
-	:byte Packing:
-
-		Indicates configured packing.
-
-	:byte Framing:
-
-		Indicates configured framing.
-
-	:byte Options:
-
-		Indicates configured broadcast options.
-
-	:uint16 Skip:
-
-		Indicates configured broadcast skip.
-
-	:byte SyncTimeout:
-
-		Indicates configured broadcast sync timeout.
-
-	:byte SyncType:
-
-		Indicates configured broadcast sync CTE type.
-
-	:byte MSE:
-
-		Indicates configured broadcast MSE.
-
-	:uint16 Timeout:
-
-		Indicates configured broadcast timeout.
-
-	Possible values for both Unicast and Broadcast:
-
-	:uint32 Interval:
-
-		Indicates configured ISO interval (us).
-
-	:uint16 Latency:
-
-		Indicates configured transport latency (ms).
-
-	:uint16 SDU:
-
-		Indicates configured maximum SDU.
-
-	:byte PHY:
-
-		Indicates configured PHY.
-
-		Possible values:
-
-		:bit 0:
-
-			LE 1M
-
-		:bit 1:
-
-			LE 2M
-
-		:bit 2:
-
-			LE Coded
-
-	:byte Retransmissions:
-
-		Indicates configured retransmissions.
diff --git a/doc/org.bluez.Media.rst b/doc/org.bluez.Media.rst
new file mode 100644
index 000000000000..678e6090c6e1
--- /dev/null
+++ b/doc/org.bluez.Media.rst
@@ -0,0 +1,133 @@
+===============
+org.bluez.Media
+===============
+
+-----------------------------------
+BlueZ D-Bus Media API documentation
+-----------------------------------
+
+:Version: BlueZ
+:Date: September 2023
+:Manual section: 5
+:Manual group: Linux System Administration
+
+Interface
+=========
+
+:Service: org.bluez
+:Interface: org.bluez.Media1
+:Object path: [variable prefix]/{hci0,hci1,...}
+
+Methods
+-------
+
+void RegisterEndpoint(object endpoint, dict properties)
+```````````````````````````````````````````````````````
+
+	Register a local end point to sender, the sender can register as many
+	end points as it likes.
+
+	Note: If the sender disconnects the end points are automatically
+	unregistered.
+
+	possible properties:
+
+	:string UUID:
+
+		UUID of the profile which the endpoint is for.
+
+		UUID must be in the list of SupportedUUIDS.
+
+	:byte Codec:
+
+		Assigned number of codec that the endpoint implements. The
+		values should match the profile specification which is
+		indicated by the UUID.
+
+	:uint32_t Vendor [Optional]:
+
+		Vendor-specific Company ID, Codec ID tuple that the endpoint
+		implements.
+
+		It shall be set to appropriate value when Vendor Specific Codec
+		(0xff) is used.
+
+	:array{byte} Capabilities:
+
+		Capabilities blob, it is used as it is so the size and byte
+		order must match.
+
+	:array{byte} Metadata [Optional]:
+
+		Metadata blob, it is used as it is so the size and byte order
+		must match.
+
+	Possible Errors:
+
+	:org.bluez.Error.InvalidArguments:
+	:org.bluez.Error.NotSupported:
+
+		emitted when interface for the end-point is disabled
+
+void UnregisterEndpoint(object endpoint)
+````````````````````````````````````````
+	Unregister sender end point.
+
+void RegisterPlayer(object player, dict properties)
+```````````````````````````````````````````````````
+
+	Register a media player object to sender, the sender can register as
+	many objects as it likes.
+
+	Object must implement at least org.mpris.MediaPlayer2.Player as defined
+	in MPRIS 2.2 spec:
+
+		http://specifications.freedesktop.org/mpris-spec/latest/
+
+	Note: If the sender disconnects its objects are automatically
+	unregistered.
+
+	Possible Errors:
+
+	:org.bluez.Error.InvalidArguments:
+	:org.bluez.Error.NotSupported:
+
+void UnregisterPlayer(object player)
+````````````````````````````````````
+
+	Unregister sender media player.
+
+void RegisterApplication(object root, dict options)
+```````````````````````````````````````````````````
+
+	Register endpoints an player objects within root object which must
+	implement ObjectManager.
+
+	The application object path together with the D-Bus system bus
+	connection ID define the identification of the application.
+
+	Possible errors:
+
+	:org.bluez.Error.InvalidArguments:
+	:org.bluez.Error.AlreadyExists:
+
+void UnregisterApplication(object application)
+``````````````````````````````````````````````
+
+	This unregisters the services that has been previously registered. The
+	object path parameter must match the same value that has been used on
+	registration.
+
+	Possible errors:
+
+	:org.bluez.Error.InvalidArguments:
+	:org.bluez.Error.DoesNotExist:
+
+Properties
+----------
+
+array{string} SupportedUUIDs [readonly]
+```````````````````````````````````````
+
+	List of 128-bit UUIDs that represents the supported Endpoint
+	registration.
diff --git a/doc/org.bluez.MediaControl.rst b/doc/org.bluez.MediaControl.rst
new file mode 100644
index 000000000000..54e84e8c62eb
--- /dev/null
+++ b/doc/org.bluez.MediaControl.rst
@@ -0,0 +1,80 @@
+======================
+org.bluez.MediaControl
+======================
+
+------------------------------------------
+BlueZ D-Bus MediaControl API documentation
+------------------------------------------
+
+:Version: BlueZ
+:Date: September 2023
+:Manual section: 5
+:Manual group: Linux System Administration
+
+Interface
+=========
+
+:Service:	org.bluez
+:Interface:	org.bluez.MediaControl1
+:Object path:	[variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX
+
+Methods
+-------
+
+void Play() [Deprecated]
+````````````````````````
+
+	Resume playback.
+
+void Pause() [Deprecated]
+`````````````````````````
+
+	Pause playback.
+
+void Stop() [Deprecated]
+````````````````````````
+
+	Stop playback.
+
+void Next() [Deprecated]
+````````````````````````
+
+	Next item.
+
+void Previous() [Deprecated]
+````````````````````````````
+
+	Previous item.
+
+void VolumeUp() [Deprecated]
+````````````````````````````
+
+	Adjust remote volume one step up
+
+void VolumeDown() [Deprecated]
+``````````````````````````````
+
+	Adjust remote volume one step down
+
+void FastForward() [Deprecated]
+```````````````````````````````
+
+	Fast forward playback, this action is only stopped when another method
+	in this interface is called.
+
+void Rewind() [Deprecated]
+``````````````````````````
+
+	Rewind playback, this action is only stopped when another method in
+	this interface is called.
+
+Properties
+----------
+
+boolean Connected [readonly]
+````````````````````````````
+
+object Player [readonly, optional]
+``````````````````````````````````
+
+	Addressed Player object path.
diff --git a/doc/org.bluez.MediaEndpoint.rst b/doc/org.bluez.MediaEndpoint.rst
new file mode 100644
index 000000000000..cba8cb3edc6e
--- /dev/null
+++ b/doc/org.bluez.MediaEndpoint.rst
@@ -0,0 +1,224 @@
+=======================
+org.bluez.MediaEndpoint
+=======================
+
+-------------------------------------------
+BlueZ D-Bus MediaEndpoint API documentation
+-------------------------------------------
+
+:Version: BlueZ
+:Date: September 2023
+:Manual section: 5
+:Manual group: Linux System Administration
+
+Interface
+=========
+
+:Service:	unique name (Server role)
+		org.bluez (Client role)
+:Interface:	org.bluez.MediaEndpoint1
+:Object path:	freely definable (Server role)
+		[variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX/sepX
+		(Client role)
+
+Methods
+-------
+
+void SetConfiguration(object transport, dict properties)
+````````````````````````````````````````````````````````
+
+	Set configuration for the transport.
+
+	For client role transport must be set with a server endpoint oject which
+	will be configured and the properties must contain the following
+	properties:
+
+	:array{byte} Capabilities [Mandatory]:
+
+		See Capabilities property.
+
+	:array{byte} Metadata [ISO only]:
+
+		See Metadata property.
+
+	:uint32 Location [ISO only]:
+
+		See Location property.
+
+	:byte Framing [ISO only]:
+
+		See Framing property.
+
+	:byte PHY [ISO only]:
+
+		See PHY property.
+
+	:uint16 MaximumLatency [ISO only]:
+
+		See MaximumLatency property.
+
+	:uint32 MinimumDelay [ISO only]:
+
+		See MinimumDelay property.
+
+	:uint32 MaximumDelay [ISO only]:
+
+		See MaximumDelay property.
+
+	:uint32 PreferredMinimumDelay [ISO only]:
+
+		See PreferredMinimumDelay property.
+
+	:uint32 PreferredMaximumDelay [ISO only]:
+
+		See PreferredMaximumDelay property.
+
+array{byte} SelectConfiguration(array{byte} capabilities)
+`````````````````````````````````````````````````````````
+
+	Select preferable configuration from the supported capabilities.
+
+	Returns a configuration which can be used to setup a transport.
+
+	Note: There is no need to cache the selected configuration since on
+	success the configuration is send back as parameter of SetConfiguration.
+
+dict SelectProperties(dict properties)
+``````````````````````````````````````
+
+	Select preferable properties from the supported properties:
+
+	:object Endpoint [ISO only]:
+	:Refer to SetConfiguration for the list of other possible properties.:
+
+	Returns propeties which can be used to setup a transport.
+
+	Note: There is no need to cache the selected properties since on
+	success the configuration is send back as parameter of SetConfiguration.
+
+void ClearConfiguration(object transport)
+`````````````````````````````````````````
+
+	Clear transport configuration.
+
+void Release()
+``````````````
+
+	This method gets called when the service daemon unregisters the
+	endpoint. An endpoint can use it to do cleanup tasks. There is no need
+	to unregister the endpoint, because when this method gets called it has
+	already been unregistered.
+
+MediaEndpoint Properties
+------------------------
+
+string UUID [readonly, optional]
+````````````````````````````````
+
+	UUID of the profile which the endpoint is for.
+
+byte Codec [readonly, optional]
+```````````````````````````````
+
+	Assigned number of codec that the endpoint implements.
+	The values should match the profile specification which is indicated by
+	the UUID.
+
+uint32_t Vendor [readonly, Optional]
+````````````````````````````````````
+
+	Vendor-specific Company ID, Codec ID tuple that the endpoint implements.
+
+	It shall be set to appropriate value when Vendor Specific Codec (0xff)
+	is used.
+
+array{byte} Capabilities [readonly, optional]
+`````````````````````````````````````````````
+
+	Capabilities blob, it is used as it is so the size and byte order must
+	match.
+
+array{byte} Metadata [readonly, Optional]
+`````````````````````````````````````````
+
+	Metadata blob, it is used as it is so the size and byte order must
+	match.
+
+object Device [readonly, optional]
+``````````````````````````````````
+
+	Device object which the endpoint is belongs to.
+
+bool DelayReporting [readonly, optional]
+````````````````````````````````````````
+
+	Indicates if endpoint supports Delay Reporting.
+
+byte Framing [ISO only]
+```````````````````````
+
+	Indicates endpoint support framing.
+
+byte PHY [ISO only]
+```````````````````
+
+	Indicates endpoint supported PHY.
+
+	Possible values:
+
+	:bit 0:
+
+		LE 1M
+
+	:bit 1:
+
+		LE 2M
+
+	:bit 2:
+
+		LE Coded
+
+byte Retransmissions [ISO only]
+```````````````````````````````
+
+	Indicates endpoint preferred number of retransmissions.
+
+uint16_t MaximumLatency [ISO only]
+``````````````````````````````````
+
+	Indicates endpoint maximum latency.
+
+uint32_t MinimumDelay [ISO only]
+````````````````````````````````
+
+	Indicates endpoint minimum presentation delay.
+
+uint32_t MaximumDelay [ISO only]
+````````````````````````````````
+
+	Indicates endpoint maximum presentation delay.
+
+uint32_t PreferredMinimumDelay [ISO only]
+`````````````````````````````````````````
+
+	Indicates endpoint preferred minimum presentation delay.
+
+uint32_t PreferredMaximumDelay [ISO only]
+`````````````````````````````````````````
+
+	Indicates endpoint preferred maximum presentation delay.
+
+uint32 Location [ISO only]
+``````````````````````````
+
+	Indicates endpoint supported locations.
+
+uint16 SupportedContext [ISO only]
+``````````````````````````````````
+
+	Indicates endpoint supported audio context.
+
+uint16 Context [ISO only]
+`````````````````````````
+
+	Indicates endpoint available audio context.
diff --git a/doc/org.bluez.MediaFolder.rst b/doc/org.bluez.MediaFolder.rst
new file mode 100644
index 000000000000..dd56f06b41e4
--- /dev/null
+++ b/doc/org.bluez.MediaFolder.rst
@@ -0,0 +1,117 @@
+=====================
+org.bluez.MediaFolder
+=====================
+
+-----------------------------------------
+BlueZ D-Bus MediaFolder API documentation
+-----------------------------------------
+
+:Version: BlueZ
+:Date: September 2023
+:Manual section: 5
+:Manual group: Linux System Administration
+
+Interface
+=========
+
+:Service:	unique name (Target role)
+		org.bluez (Controller role)
+:Interface:	org.bluez.MediaFolder1
+:Object path:	freely definable (Target role)
+		[variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX/playerX
+		(Controller role)
+
+Methods
+-------
+
+object Search(string value, dict filter)
+````````````````````````````````````````
+
+	Return a folder object containing the search result.
+
+	To list the items found use the folder object returned and pass to
+	ChangeFolder.
+
+	Possible Errors:
+
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+array{objects, properties} ListItems(dict filter)
+`````````````````````````````````````````````````
+
+	Return a list of items found
+
+	Possible Errors:
+
+	:org.bluez.Error.InvalidArguments:
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+void ChangeFolder(object folder)
+````````````````````````````````
+
+	Change current folder.
+
+	Note: By changing folder the items of previous folder might be destroyed
+	and have to be listed again, the exception is NowPlaying folder which
+	should be always present while the player is active.
+
+	Possible Errors:
+
+	:org.bluez.Error.InvalidArguments:
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+Properties
+----------
+
+uint32 NumberOfItems [readonly]
+```````````````````````````````
+
+	Number of items in the folder
+
+string Name [readonly]
+``````````````````````
+
+	Folder name:
+
+	Possible values:
+
+	:"/Filesystem/...":
+
+		Filesystem scope
+
+	:"/NowPlaying/...":
+
+		NowPlaying scope
+
+	Note: /NowPlaying folder might not be listed if player is stopped,
+	folders created by Search are virtual so once another Search is perform
+	or the folder is changed using ChangeFolder it will no longer be listed.
+
+Filters
+-------
+
+:uint32 Start:
+
+	Offset of the first item.
+
+	Default value: 0
+
+:uint32 End:
+
+	Offset of the last item.
+
+	Default value: NumbeOfItems
+
+:array{string} Attributes:
+
+	Item properties that should be included in the list.
+
+	Possible Values:
+
+		"title", "artist", "album", "genre", "number-of-tracks",
+		"number", "duration"
+
+		Default Value: All
diff --git a/doc/org.bluez.MediaItem.rst b/doc/org.bluez.MediaItem.rst
new file mode 100644
index 000000000000..855e8a6395b7
--- /dev/null
+++ b/doc/org.bluez.MediaItem.rst
@@ -0,0 +1,131 @@
+===================
+org.bluez.MediaItem
+===================
+
+---------------------------------------
+BlueZ D-Bus MediaItem API documentation
+---------------------------------------
+
+:Version: BlueZ
+:Date: September 2023
+:Manual section: 5
+:Manual group: Linux System Administration
+
+Interface
+=========
+
+:Service:	unique name (Target role)
+		org.bluez (Controller role)
+:Interface:	org.bluez.MediaItem1
+:Object path:	freely definable (Target role)
+		[variable
+		prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX/playerX/itemX
+		(Controller role)
+
+Methods
+-------
+
+void Play()
+```````````
+
+	Play item
+
+	Possible Errors:
+
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+void AddtoNowPlaying()
+``````````````````````
+
+	Add item to now playing list
+
+	Possible Errors:
+
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+Properties
+----------
+
+object Player [readonly]
+````````````````````````
+
+	Player object path the item belongs to
+
+string Name [readonly]
+``````````````````````
+
+	Item displayable name
+
+string Type [readonly]
+``````````````````````
+
+	Item type
+
+	Possible values: "video", "audio", "folder"
+
+string FolderType [readonly, optional]
+``````````````````````````````````````
+
+	Folder type.
+
+	Possible values: "mixed", "titles", "albums", "artists"
+
+	Available if property Type is "Folder"
+
+boolean Playable [readonly, optional]
+`````````````````````````````````````
+
+	Indicates if the item can be played
+
+	Available if property Type is "folder"
+
+dict Metadata [readonly]
+````````````````````````
+
+	Item metadata.
+
+	Possible values:
+
+	:string Title:
+
+		Item title name
+
+		Available if property Type is "audio" or "video"
+
+	:string Artist:
+
+		Item artist name
+
+		Available if property Type is "audio" or "video"
+
+	:string Album:
+
+		Item album name
+
+		Available if property Type is "audio" or "video"
+
+	:string Genre:
+
+		Item genre name
+
+		Available if property Type is "audio" or "video"
+
+	:uint32 NumberOfTracks:
+
+		Item album number of tracks in total
+
+		Available if property Type is "audio" or "video"
+
+	:uint32 Number:
+
+		Item album number
+
+		Available if property Type is "audio" or "video"
+
+	:uint32 Duration:
+
+		Item duration in milliseconds
+
+		Available if property Type is "audio" or "video"
diff --git a/doc/org.bluez.MediaPlayer.rst b/doc/org.bluez.MediaPlayer.rst
new file mode 100644
index 000000000000..60bd679bb7c0
--- /dev/null
+++ b/doc/org.bluez.MediaPlayer.rst
@@ -0,0 +1,315 @@
+=====================
+org.bluez.MediaPlayer
+=====================
+
+-----------------------------------------
+BlueZ D-Bus MediaPlayer API documentation
+-----------------------------------------
+
+:Version: BlueZ
+:Date: September 2023
+:Manual section: 5
+:Manual group: Linux System Administration
+
+Interface
+=========
+
+:Service:	org.bluez (Controller role)
+:Interface:	org.bluez.MediaPlayer1
+:Object path:	[variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX/playerX
+
+Methods
+-------
+
+void Play()
+```````````
+
+	Resume playback.
+
+	Possible Errors:
+
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+void Pause()
+````````````
+
+	Pause playback.
+
+	Possible Errors:
+
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+void Stop()
+```````````
+
+	Stop playback.
+
+	Possible Errors:
+
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+void Next()
+```````````
+
+	Next item.
+
+	Possible Errors:
+
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+void Previous()
+```````````````
+
+	Previous item.
+
+	Possible Errors:
+
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+void FastForward()
+``````````````````
+
+	Fast forward playback, this action is only stopped when another method
+	in this interface is called.
+
+	Possible Errors:
+
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+void Rewind()
+`````````````
+
+	Rewind playback, this action is only stopped when another method in
+	this interface is called.
+
+	Possible Errors:
+
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+void Press(byte avc_key)
+````````````````````````
+
+	Press a specific key to send as passthrough command. The key will be
+	released automatically. Use Hold() instead if the intention is to hold
+	down the key.
+
+	Possible Errors:
+
+	:org.bluez.Error.InvalidArguments:
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+void Hold(byte avc_key)
+```````````````````````
+
+	Press and hold a specific key to send as passthrough command. It is
+	your responsibility to make sure that Release() is called after calling
+	this method. The held key will also be released when any other method
+	in this interface is called.
+
+	Possible Errors:
+
+	:org.bluez.Error.InvalidArguments:
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+void Release()
+``````````````
+
+	Release the previously held key invoked using Hold().
+
+	Possible Errors:
+
+	:org.bluez.Error.NotSupported:
+	:org.bluez.Error.Failed:
+
+Properties
+----------
+
+string Equalizer [readwrite]
+````````````````````````````
+
+	Indicates Player Equalizer setting.
+
+	Possible values:
+
+	:"off":
+	:"on":
+
+string Repeat [readwrite]
+`````````````````````````
+
+	Indicates Player Repeat setting.
+
+	Possible values:
+
+	:"off":
+	:"singletrack":
+	:"alltracks":
+	:"group":
+
+string Shuffle [readwrite]
+``````````````````````````
+
+	Indicates Player Suffle setting.
+
+	Possible values:
+
+	:"off":
+	:"alltracks":
+	:"group":
+
+string Scan [readwrite]
+```````````````````````
+
+	Indicates Player Scan setting.
+
+	Possible values:
+
+	:"off":
+	:"alltracks":
+	:"group":
+
+string Status [readonly]
+````````````````````````
+
+	Indicates Player Status setting.
+
+	Possible status:
+
+	:"playing":
+	:"stopped":
+	:"paused":
+	:"forward-seek":
+	:"reverse-seek":
+	:"error":
+
+uint32 Position [readonly]
+``````````````````````````
+
+	Playback position in milliseconds. Changing the position may generate
+	additional events that will be sent to the remote device. When position
+	is 0 it means the track is starting and when it's greater than or equal
+	to track's duration the track has ended.
+
+	Note that even if duration is not available in metadata it's possible
+	to signal its end by setting position to the maximum uint32 value.
+
+dict Track [readonly]
+`````````````````````
+
+	Track metadata.
+
+	Possible values:
+
+	:string Title:
+
+		Track title name
+
+	:string Artist:
+
+		Track artist name
+
+	:string Album:
+
+		Track album name
+
+	:string Genre:
+
+		Track genre name
+
+	:uint32 NumberOfTracks:
+
+		Number of tracks in total
+
+	:uint32 TrackNumber:
+
+		Track number
+
+	:uint32 Duration:
+
+		Track duration in milliseconds
+
+object Device [readonly]
+````````````````````````
+
+	Device object path.
+
+string Name [readonly]
+``````````````````````
+
+	Player name
+
+string Type [readonly]
+``````````````````````
+
+	Player type
+
+	Possible values:
+
+		"Audio"
+		"Video"
+		"Audio Broadcasting"
+		"Video Broadcasting"
+
+string Subtype [readonly]
+`````````````````````````
+
+	Player subtype
+
+	Possible values:
+
+		"Audio Book"
+		"Podcast"
+
+boolean Browsable [readonly]
+````````````````````````````
+
+	If present indicates the player can be browsed using MediaFolder
+	interface.
+
+	Possible values:
+
+	:True:
+
+		Supported and active
+
+	:False:
+
+		Supported but inactive
+
+	Note: If supported but inactive clients can enable it by using
+	MediaFolder interface but it might interfere in the playback of other
+	players.
+
+boolean Searchable [readonly]
+`````````````````````````````
+
+	If present indicates the player can be searched using MediaFolder
+	interface.
+
+	Possible values:
+
+	:True:
+
+		Supported and active
+
+	:False:
+
+		Supported but inactive
+
+	Note: If supported but inactive clients can enable it by using
+	MediaFolder interface but it might interfere in the playback of other
+	players.
+
+object Playlist
+```````````````
+
+	Playlist object path.
diff --git a/doc/org.bluez.MediaTransport.rst b/doc/org.bluez.MediaTransport.rst
new file mode 100644
index 000000000000..6e95df8f2ee8
--- /dev/null
+++ b/doc/org.bluez.MediaTransport.rst
@@ -0,0 +1,274 @@
+========================
+org.bluez.MediaTransport
+========================
+
+--------------------------------------------
+BlueZ D-Bus MediaTransport API documentation
+--------------------------------------------
+
+:Version: BlueZ
+:Date: September 2023
+:Manual section: 5
+:Manual group: Linux System Administration
+
+Interface
+=========
+
+:Service:	org.bluez
+:Interface:	org.bluez.MediaTransport1
+:Object path:	[variable prefix]/{hci0,hci1,...}/dev_XX_XX_XX_XX_XX_XX/fdX
+
+Methods
+-------
+
+fd, uint16, uint16 Acquire()
+````````````````````````````
+
+	Acquire transport file descriptor and the MTU for read and write
+	respectively.
+
+	Possible Errors:
+
+	:org.bluez.Error.NotAuthorized:
+	:org.bluez.Error.Failed:
+
+fd, uint16, uint16 TryAcquire()
+```````````````````````````````
+
+	Acquire transport file descriptor only if the transport is in "pending"
+	state at the time the message is received by BlueZ. Otherwise no request
+	will be sent to the remote device and the function will just fail with
+	org.bluez.Error.NotAvailable.
+
+	Possible Errors:
+
+	:org.bluez.Error.NotAuthorized:
+	:org.bluez.Error.Failed:
+	:org.bluez.Error.NotAvailable:
+
+void Release()
+``````````````
+
+	Releases file descriptor.
+
+Properties
+----------
+
+object Device [readonly]
+````````````````````````
+
+	Device object which the transport is connected to.
+
+string UUID [readonly]
+``````````````````````
+
+	UUID of the profile which the transport is for.
+
+byte Codec [readonly]
+`````````````````````
+
+	Assigned number of codec that the transport support.
+	The values should match the profile specification which is indicated by
+	the UUID.
+
+array{byte} Configuration [readonly]
+````````````````````````````````````
+
+	Configuration blob, it is used as it is so the size and byte order must
+	match.
+
+string State [readonly]
+```````````````````````
+
+	Indicates the state of the transport. Possible values are:
+
+	:"idle": not streaming
+	:"pending": streaming but not acquired
+	:"active": streaming and acquired
+
+uint16 Delay [readwrite, optional]
+``````````````````````````````````
+
+	Transport delay in 1/10 of millisecond, this property is only writeable
+	when the transport was acquired by the sender.
+
+uint16 Volume [readwrite, optional]
+```````````````````````````````````
+
+	Indicates volume level of the transport, this property is only writeable
+	when the transport was acquired by the sender.
+
+	Possible Values: 0-127
+
+object Endpoint [readonly, optional, experimental]
+``````````````````````````````````````````````````
+
+	Endpoint object which the transport is associated with.
+
+uint32 Location [readonly, ISO only, experimental]
+``````````````````````````````````````````````````
+
+	Indicates transport Audio Location.
+
+array{byte} Metadata [readwrite, ISO Only, experimental]
+````````````````````````````````````````````````````````
+
+	Indicates transport Metadata.
+
+array{object} Links [readonly, optional, ISO only, experimental]
+````````````````````````````````````````````````````````````````
+
+	Linked transport objects which the transport is associated with.
+
+dict QoS [readonly, optional, ISO only, experimental]
+`````````````````````````````````````````````````````
+
+	Only present when QoS is configured.
+
+	Possible values for Unicast:
+
+	:byte CIG:
+
+		Indicates configured CIG.
+
+		Possible values:
+
+		:0x00 - 0xef:
+
+			Valid ID range.
+
+		:0xff:
+
+			Auto allocate.
+
+	:byte CIS:
+
+		Indicates configured CIS.
+
+		Possible values:
+
+		:0x00 - 0xef:
+
+			Valid ID range.
+
+		:0xff:
+
+			Auto allocate.
+
+	:byte Framing:
+
+		Indicates configured framing.
+
+		Possible values:
+
+		:0x00:
+
+			Unframed.
+
+		:0x01:
+
+			Framed.
+
+	:uint32 PresentationDelay:
+
+		Indicates configured transport presentation delay (us).
+
+	:byte TargetLatency:
+
+		Indicates the requested target latency.
+
+		Possible values:
+
+		:0x01:
+
+			Low Latency.
+
+		:0x02:
+
+			Balanced Latency/Reliability.
+
+		:0x03:
+
+			High Reliability.
+
+	Possible values for Broadcast:
+
+	:byte BIG:
+
+		Indicates configured QoS BIG.
+
+	:byte BIS:
+
+		Indicates configured BIS.
+
+	:byte SyncFactor:
+
+		Indicates configured broadcast sync factor.
+
+	:byte Packing:
+
+		Indicates configured packing.
+
+	:byte Framing:
+
+		Indicates configured framing.
+
+	:byte Options:
+
+		Indicates configured broadcast options.
+
+	:uint16 Skip:
+
+		Indicates configured broadcast skip.
+
+	:byte SyncTimeout:
+
+		Indicates configured broadcast sync timeout.
+
+	:byte SyncType:
+
+		Indicates configured broadcast sync CTE type.
+
+	:byte MSE:
+
+		Indicates configured broadcast MSE.
+
+	:uint16 Timeout:
+
+		Indicates configured broadcast timeout.
+
+	Possible values for both Unicast and Broadcast:
+
+	:uint32 Interval:
+
+		Indicates configured ISO interval (us).
+
+	:uint16 Latency:
+
+		Indicates configured transport latency (ms).
+
+	:uint16 SDU:
+
+		Indicates configured maximum SDU.
+
+	:byte PHY:
+
+		Indicates configured PHY.
+
+		Possible values:
+
+		:bit 0:
+
+			LE 1M
+
+		:bit 1:
+
+			LE 2M
+
+		:bit 2:
+
+			LE Coded
+
+	:byte Retransmissions:
+
+		Indicates configured retransmissions.
-- 
2.41.0

