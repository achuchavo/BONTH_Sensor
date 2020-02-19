CREATE TABLE thsettings (
  id int(11) NOT NULL AUTO_INCREMENT,
  thport varchar(100) not NULL,
  thip varchar(100) DEFAULT '',
  theinterval int(11) default 5,
  note varchar(100) DEFAULT '',
  edited timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

drop table thsettings;


CREATE TABLE thdevice (
  id int(11) NOT NULL AUTO_INCREMENT,
  thname varchar(100) not NULL,
  ip varchar(100) DEFAULT '',
  thloc varchar(100) DEFAULT '',
  thdetailloc varchar(100) DEFAULT '',
  edited timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE thdata (
  id int(11) NOT NULL AUTO_INCREMENT,
  thname varchar(100) not NULL,
  thip varchar(100) DEFAULT '',
  thtemp decimal(18,6),
  thhum decimal(18,6),
  thpress decimal(18,6),
  note varchar(100) DEFAULT '',
  edited timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



Create index thname ON thdata (thname);
Create index thip ON thdata (thip);

drop table thdata;

unlock tables;
truncate table thdata;

