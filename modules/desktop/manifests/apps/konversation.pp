class desktop::apps::konversation {
	package {'konversation':}
	kde_rc::merge {'konversationrc':
		source => 'desktop/apps/konversation'
	}
}