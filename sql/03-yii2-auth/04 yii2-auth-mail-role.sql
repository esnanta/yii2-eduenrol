/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Nanta Es
 * Created: Aug 29, 2021
 */

insert  into `tx_auth_item_child`(`parent`,`child`) values
('guest','index-mail-disposition'),
('guest','view-mail-disposition');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('guest','index-mail-incoming'),
('guest','view-mail-incoming');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('guest','index-mail-outgoing'),
('guest','view-mail-outgoing');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('guest','index-mail-type'),
('guest','view-mail-type');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('guest','index-mail-category'),
('guest','view-mail-category');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('reguler','index-mail-type'),
('reguler','view-mail-type');

insert  into `tx_auth_item_child`(`parent`,`child`) values
('reguler','index-mail-category'),
('reguler','view-mail-category');