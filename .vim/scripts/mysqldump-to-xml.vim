:g:^\/\*:d
:g:FOREIGN KEY:d
:%s:COLLATE \w\+ ::
:%s:CREATE TABLE `\(.*\)` (:\t<table name="\1">:
:%s:^) ENGINE.*$:\t<\/table>:
:%s:^  PRIMARY KEY (\(.*\)),\=:\t\t<primary_key type="primary" fields="\1" />:
:%s:^  KEY `\(.*\)` (\(.*\)),\=:\t\t<index type="index" name="\1" fields="\2" />:
:%s:^  UNIQUE KEY `\(.*\)` (\(.*\)),\=:\t\t<index type="unique" name="\1" fields="\2" />:
:%s:^  `\(.*\)` \(\w\+\)(\(.*\)) NOT NULL AUTO_INCREMENT,\=:\t\t<field name="\1" type="\2" length="\3" is_auto_increment="true" />:
:%s:^  `\(.*\)` \(\w\+\)(\(.*\)) NOT NULL DEFAULT '\(.*\)',\=:\t\t<field name="\1" type="\2" length="\3" default_value="\4" />:
:%s:^  `\(.*\)` \(\w\+\)(\(.*\)) DEFAULT '\(.*\)',\=:\t\t<field name="\1" type="\2" length="\3" default_value="\4" allow_null="true" />:
:%s:^  `\(.*\)` \(\w\+\)(\(.*\)) NOT NULL,\=:\t\t<field name="\1" type="\2" length="\3" />:
:%s:^  `\(.*\)` \(\w\+\)(\(.*\)) DEFAULT NULL,\=:\t\t<field name="\1" type="\2" length="\3" allow_null="true" />:
:%s:^  `\(.*\)` \(\w\+\) NOT NULL,\=:\t\t<field name="\1" type="\2" />:
:%s:^  `\(.*\)` \(\w\+\) DEFAULT NULL,\=:\t\t<field name="\1" type="\2" allow_null="true" />:
:%s:^  `\(.*\)` \(\w\+\),\=:\t\t<field name="\1" type="\2" />:
:%s:`::g
