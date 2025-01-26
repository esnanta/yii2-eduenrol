
SET FOREIGN_KEY_CHECKS = 0;
delete from tx_auth_assignment;
delete from tx_auth_item_child;
delete from tx_auth_item;

/*Data for the table `tx_auth_item` */
/* TYPE 1 = ROLE */
insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('admin',1,'Admin',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('regular',1,'Regular',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('guest',1,'Guest',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

/* TYPE 2 = ITEM */
insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-master',2,'Index Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-master',2,'Create Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-master',2,'Update Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-master',2,'View Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-master',2,'Delete Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-master',2,'Report Master',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-transaction',2,'Index Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-transaction',2,'Create Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-transaction',2,'Update Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-transaction',2,'View Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-transaction',2,'Delete Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-transaction',2,'Report Transaction',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-applicant',2,'Index Applicant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-applicant',2,'Create Applicant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-applicant',2,'Update Applicant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-applicant',2,'View Applicant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-applicant',2,'Delete Applicant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-applicant',2,'Report Applicant',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-applicantalmamater',2,'Index Applicant Almamater',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-applicantalmamater',2,'Create Applicant Almamater',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-applicantalmamater',2,'Update Applicant Almamater',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-applicantalmamater',2,'View Applicant Almamater',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-applicantalmamater',2,'Delete Applicant Almamater',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-applicantalmamater',2,'Report Applicant Almamater',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-applicantdocument',2,'Index Applicant Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-applicantdocument',2,'Create Applicant Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-applicantdocument',2,'Update Applicant Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-applicantdocument',2,'View Applicant Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-applicantdocument',2,'Delete Applicant Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-applicantdocument',2,'Report Applicant Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-applicantfamily',2,'Index Applicant Family',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-applicantfamily',2,'Create Applicant Family',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-applicantfamily',2,'Update Applicant Family',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-applicantfamily',2,'View Applicant Family',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-applicantfamily',2,'Delete Applicant Family',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-applicantfamily',2,'Report Applicant Family',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-applicantgrade',2,'Index Applicant Grade',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-applicantgrade',2,'Create Applicant Grade',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-applicantgrade',2,'Update Applicant Grade',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-applicantgrade',2,'View Applicant Grade',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-applicantgrade',2,'Delete Applicant Grade',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-applicantgrade',2,'Report Applicant Grade',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-asset',2,'Index Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-asset',2,'Create Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-asset',2,'Update Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-asset',2,'View Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-asset',2,'Delete Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-asset',2,'Report Asset',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-assetcategory',2,'Index Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-assetcategory',2,'Create Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-assetcategory',2,'Update Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-assetcategory',2,'View Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-assetcategory',2,'Delete Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-assetcategory',2,'Report Asset Category',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-course',2,'Index Course',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-course',2,'Create Course',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-course',2,'Update Course',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-course',2,'View Course',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-course',2,'Delete Course',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-course',2,'Report Course',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-document',2,'Index Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-document',2,'Create Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-document',2,'Update Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-document',2,'View Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-document',2,'Delete Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-document',2,'Report Document',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-educationalstage',2,'Index Educational Stage',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-educationalstage',2,'Create Educational Stage',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-educationalstage',2,'Update Educational Stage',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-educationalstage',2,'View Educational Stage',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-educationalstage',2,'Delete Educational Stage',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('report-educationalstage',2,'Report Educational Stage',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-employment',2,'Index Employment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-employment',2,'Create Employment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-employment',2,'Update Employment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-employment',2,'View Employment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-employment',2,'Delete Employment',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-event',2,'Index Event',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-event',2,'Create Event',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-event',2,'Update Event',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-event',2,'View Event',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-event',2,'Delete Event',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());


insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-income',2,'Index Income',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-income',2,'Create Income',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-income',2,'Update Income',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-income',2,'View Income',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-income',2,'Delete Income',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-occupation',2,'Index Occupation',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-occupation',2,'Create Occupation',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-occupation',2,'Update Occupation',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-occupation',2,'View Occupation',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-occupation',2,'Delete Occupation',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-office',2,'Index Office',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-office',2,'Create Office',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-office',2,'Update Office',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-office',2,'View Office',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-office',2,'Delete Office',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());


insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-religion',2,'Index Religion',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-religion',2,'Create Religion',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-religion',2,'Update Religion',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-religion',2,'View Religion',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-religion',2,'Delete Religion',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-residence',2,'Index Residence',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-residence',2,'Create Residence',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-residence',2,'Update Residence',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-residence',2,'View Residence',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-residence',2,'Delete Residence',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-semester',2,'Index Semester',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-semester',2,'Create Semester',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-semester',2,'Update Semester',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-semester',2,'View Semester',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-semester',2,'Delete Semester',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-staff',2,'Index Staff',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-staff',2,'Create Staff',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-staff',2,'Update Staff',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-staff',2,'View Staff',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-staff',2,'Delete Staff',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-profile',2,'Index Profile',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-profile',2,'Create Profile',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-profile',2,'Update Profile',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-profile',2,'View Profile',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-profile',2,'Delete Profile',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-transportation',2,'Index Transportation',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-transportation',2,'Create Transportation',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-transportation',2,'Update Transportation',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-transportation',2,'View Transportation',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-transportation',2,'Delete Transportation',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());


insert  into `tx_auth_item`(`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`)
values
    ('index-theme',2,'Index Theme',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('create-theme',2,'Create Theme',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('update-theme',2,'Update Theme',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('view-theme',2,'View Theme',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP()),
    ('delete-theme',2,'Delete Theme',NULL,NULL,UNIX_TIMESTAMP(),UNIX_TIMESTAMP());


/*Data for the table `tx_auth_item_child` */

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-asset'),
    ('create-master','create-asset'),
    ('update-master','update-asset'),
    ('view-master','view-asset'),
    ('delete-master','delete-asset');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-assetcategory'),
    ('create-master','create-assetcategory'),
    ('update-master','update-assetcategory'),
    ('view-master','view-assetcategory'),
    ('delete-master','delete-assetcategory');


insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-course'),
    ('create-master','create-course'),
    ('update-master','update-course'),
    ('view-master','view-course'),
    ('delete-master','delete-course');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-document'),
    ('create-master','create-document'),
    ('update-master','update-document'),
    ('view-master','view-document'),
    ('delete-master','delete-document');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-educationalstage'),
    ('create-master','create-educationalstage'),
    ('update-master','update-educationalstage'),
    ('view-master','view-educationalstage'),
    ('delete-master','delete-educationalstage');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-employment'),
    ('create-master','create-employment'),
    ('update-master','update-employment'),
    ('view-master','view-employment'),
    ('delete-master','delete-employment');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-event'),
    ('create-master','create-event'),
    ('update-master','update-event'),
    ('view-master','view-event'),
    ('delete-master','delete-event');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-income'),
    ('create-master','create-income'),
    ('update-master','update-income'),
    ('view-master','view-income'),
    ('delete-master','delete-income');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-occupation'),
    ('create-master','create-occupation'),
    ('update-master','update-occupation'),
    ('view-master','view-occupation'),
    ('delete-master','delete-occupation');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-office'),
    ('create-master','create-office'),
    ('update-master','update-office'),
    ('view-master','view-office'),
    ('delete-master','delete-office');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-religion'),
    ('create-master','create-religion'),
    ('update-master','update-religion'),
    ('view-master','view-religion'),
    ('delete-master','delete-religion');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-residence'),
    ('create-master','create-residence'),
    ('update-master','update-residence'),
    ('view-master','view-residence'),
    ('delete-master','delete-residence');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-semester'),
    ('create-master','create-semester'),
    ('update-master','update-semester'),
    ('view-master','view-semester'),
    ('delete-master','delete-semester');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-staff'),
    ('create-master','create-staff'),
    ('update-master','update-staff'),
    ('view-master','view-staff'),
    ('delete-master','delete-staff');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-profile'),
    ('create-master','create-profile'),
    ('update-master','update-profile'),
    ('view-master','view-profile'),
    ('delete-master','delete-profile');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-theme'),
    ('create-master','create-theme'),
    ('update-master','update-theme'),
    ('view-master','view-theme'),
    ('delete-master','delete-theme');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-master','index-transportation'),
    ('create-master','create-transportation'),
    ('update-master','update-transportation'),
    ('view-master','view-transportation'),
    ('delete-master','delete-transportation');


insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-transaction','index-applicant'),
    ('create-transaction','create-applicant'),
    ('update-transaction','update-applicant'),
    ('view-transaction','view-applicant'),
    ('delete-transaction','delete-applicant'),
    ('report-transaction','report-applicant');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-transaction','index-applicantalmamater'),
    ('create-transaction','create-applicantalmamater'),
    ('update-transaction','update-applicantalmamater'),
    ('view-transaction','view-applicantalmamater'),
    ('delete-transaction','delete-applicantalmamater'),
    ('report-transaction','report-applicantalmamater');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-transaction','index-applicantdocument'),
    ('create-transaction','create-applicantdocument'),
    ('update-transaction','update-applicantdocument'),
    ('view-transaction','view-applicantdocument'),
    ('delete-transaction','delete-applicantdocument'),
    ('report-transaction','report-applicantdocument');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-transaction','index-applicantfamily'),
    ('create-transaction','create-applicantfamily'),
    ('update-transaction','update-applicantfamily'),
    ('view-transaction','view-applicantfamily'),
    ('delete-transaction','delete-applicantfamily'),
    ('report-transaction','report-applicantfamily');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-transaction','index-applicantgrade'),
    ('create-transaction','create-applicantgrade'),
    ('update-transaction','update-applicantgrade'),
    ('view-transaction','view-applicantgrade'),
    ('delete-transaction','delete-applicantgrade'),
    ('report-transaction','report-applicantgrade');

insert  into `tx_auth_item_child`(`parent`,`child`)
values
    ('index-transaction','index-archive'),
    ('create-transaction','create-archive'),
    ('update-transaction','update-archive'),
    ('view-transaction','view-archive'),
    ('delete-transaction','delete-archive'),
    ('report-transaction','report-archive');

/*Data for the table `tx_auth_assignment` */
/* ALOKASI ITEM KEPADA USER */
insert  into `tx_auth_assignment`(`item_name`,`user_id`,`created_at`) values
('admin','1',UNIX_TIMESTAMP());