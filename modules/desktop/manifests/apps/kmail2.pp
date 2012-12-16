class desktop::apps::kmail2 {
	package {'kdepim-kmail':}
	enduser_file {'.kmail_signature':
		mode => 0700,
		source => 'desktop/apps/kmail2'
	}
	kde_rc::ini {'kmail2rc|General|Default domain=perot.me':}
	kde_rc::ini {'kmail2rc|General|SystemTrayEnabled=true':}
	kde_rc::ini {'kmail2rc|General|first-start=false':}
	kde_rc::ini {'kmail2rc|General|mime-header-count=2':}
	kde_rc::ini {'kmail2rc|MessageListView::Colors|ImportantMessageColor=0,127,0':}
	kde_rc::ini {'kmail2rc|MessageListView::Colors|TodoMessageColor=0,152,0':}
	kde_rc::ini {'kmail2rc|MessageListView::Colors|UnreadMessageColor=84,164,255':}
	kde_rc::ini {'kmail2rc|MessageListView::StorageModelSortOrder|GlobalSortOrderGroupSortDirection=Descending':}
	kde_rc::ini {'kmail2rc|MessageListView::StorageModelSortOrder|GlobalSortOrderGroupSorting=SortGroupsByDateTime':}
	kde_rc::ini {'kmail2rc|MessageListView::StorageModelSortOrder|GlobalSortOrderMessageSortDirection=Descending':}
	kde_rc::ini {'kmail2rc|MessageListView::StorageModelSortOrder|GlobalSortOrderMessageSorting=SortMessagesByDateTime':}
	kde_rc::ini {'kmail2rc|Composer|crypto-show-encryption-result=false':}
	kde_rc::ini {'kmail2rc|Composer|crypto-warning-unencrypted=true':}
	kde_rc::ini {'kmail2rc|Composer|crypto-warning-unsigned=true':}
	kde_rc::ini {'kmail2rc|Composer|pgp-auto-sign=true':}
	kde_rc::ini {'kmail2rc|Composer|current-transport=etienne@perot.me':}
	kde_rc::ini {'kmail2rc|Composer|pref-charsets=utf-8,locale,us-ascii,iso-8859-1':}
	kde_rc::ini {'kmail2rc|Composer|signature=manual':}
	kde_rc::ini {'kmail2rc|Reader|AutoImportKeys=true':}
	kde_rc::ini {'kmail2rc|Reader|MimeTreeMode=Always':}
	kde_rc::ini {'kmail2rc|Reader|FallbackCharacterEncoding=ISO-8859-15':}
	kde_rc::ini {'kmail2rc|Reader|PGPMessageEncr=0,128,255':}
	kde_rc::ini {'kmail2rc|Reader|PGPMessageErr=255,0,0':}
	kde_rc::ini {'kmail2rc|Reader|PGPMessageOkKeyBad=255,255,64':}
	kde_rc::ini {'kmail2rc|Reader|PGPMessageOkKeyOk=42,99,25':}
	kde_rc::ini {'kmail2rc|Reader|PGPMessageWarn=255,255,64':}
	kde_rc::ini {'kmail2rc|Reader|defaultColors=false':}
	kde_rc::ini {'kmail2rc|Reader|showColorBar=true':}
	kde_rc::ini {'kmail2rc|Reader|ShowExpandQuotesMark=true':}
	kde_rc::ini {'kmail2rc|Reader|attachment-strategy=smart':}
	kde_rc::ini {'kmail2rc|TemplateParser|TemplateReply=%CURSOR\n%BLANK\n-- \n%SIGNATURE\nOn %ODATE %OTIMELONG %OFROMNAME wrote:\n%QUOTE\n%BLANK':}
	kde_rc::ini {'kmail2rc|TipOfDay|RunOnStart=false':}
	kde_rc::ini {'kmail2rc|Notification Messages|systemtrayquitKMail=false':}
	# Use generic message prefix
	kde_rc::ini {'kmail2rc|Composer|useCustomMessageIdSuffix=true':}
	kde_rc::ini {'kmail2rc|Composer|myMessageIdSuffix=id':}
	# Remove User-Agent header
	kde_rc::ini {'kmail2rc|Mime #0|name=User-Agent':}
	kde_rc::ini {'kmail2rc|Mime #0|value=':}
	# Remove X-KMail-Identity header
	kde_rc::ini {'kmail2rc|Mime #1|name=X-KMail-Identity':}
	kde_rc::ini {'kmail2rc|Mime #1|value=':}
	kde_rc {'kmailrc':
		source => 'desktop/apps/kmail2'
	}
	kde_rc {'kmail.eventsrc':
		source => 'desktop/apps/kmail2'
	}
	kde_rc {'emaildefaults':
		source => 'desktop/apps/kmail2'
	}
	kde_rc {'emailidentities':
		source => 'desktop/apps/kmail2'
	}
}