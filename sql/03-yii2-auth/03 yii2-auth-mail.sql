


/* TYPE 2 = ITEM */

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values
('index-mail-category',2,'Index Mail Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('create-mail-category',2,'Create Mail Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('update-mail-category',2,'Update Mail Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('view-mail-category',2,'View Mail Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('delete-mail-category',2,'Delete Mail Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values
('index-mail-disposition',2,'Index Mail Disposition',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('create-mail-disposition',2,'Create Mail Disposition',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('update-mail-disposition',2,'Update Mail Disposition',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('view-mail-disposition',2,'View Mail Disposition',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('delete-mail-disposition',2,'Delete Mail Disposition',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('report-mail-disposition',2,'Report Mail Disposition',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values
('index-mail-incoming',2,'Index Mail Incoming',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('create-mail-incoming',2,'Create Mail Incoming',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('update-mail-incoming',2,'Update Mail Incoming',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('view-mail-incoming',2,'View Mail Incoming',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('delete-mail-incoming',2,'Delete Mail Incoming',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('report-mail-incoming',2,'Report Mail Incoming',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values
('index-mail-outgoing',2,'Index Mail Outgoing',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('create-mail-outgoing',2,'Create Mail Outgoing',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('update-mail-outgoing',2,'Update Mail Outgoing',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('view-mail-outgoing',2,'View Mail Outgoing',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('delete-mail-outgoing',2,'Delete Mail Outgoing',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('report-mail-outgoing',2,'Report Mail Outgoing',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) values
('index-mail-type',2,'Index Mail Type',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('create-mail-type',2,'Create Mail Type',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('update-mail-type',2,'Update Mail Type',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('view-mail-type',2,'View Mail Type',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
('delete-mail-type',2,'Delete Mail Type',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());


/*Data for the table `tx_auth_item_child` */

insert  into `tx_auth_item_child`(`parent`,`child`) values 
('index-master','index-mail-category'),
('create-master','create-mail-category'),
('update-master','update-mail-category'),
('view-master','view-mail-category'),
('delete-master','delete-mail-category');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('index-master','index-mail-type'),
('create-master','create-mail-type'),
('update-master','update-mail-type'),
('view-master','view-mail-type'),
('delete-master','delete-mail-type');


insert  into `tx_auth_item_child`(`parent`,`child`) values
('index-transaction','index-mail-disposition'),
('create-transaction','create-mail-disposition'),
('update-transaction','update-mail-disposition'),
('view-transaction','view-mail-disposition'),
('delete-transaction','delete-mail-disposition'),
('report-transaction','report-mail-disposition');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('index-transaction','index-mail-incoming'),
('create-transaction','create-mail-incoming'),
('update-transaction','update-mail-incoming'),
('view-transaction','view-mail-incoming'),
('delete-transaction','delete-mail-incoming'),
('report-transaction','report-mail-incoming');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('index-transaction','index-mail-outgoing'),
('create-transaction','create-mail-outgoing'),
('update-transaction','update-mail-outgoing'),
('view-transaction','view-mail-outgoing'),
('delete-transaction','delete-mail-outgoing'),
('report-transaction','report-mail-outgoing');
