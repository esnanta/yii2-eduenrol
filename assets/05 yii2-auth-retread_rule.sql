/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Nanta Es
 * Created: Aug 27, 2023
 */

/**
 * MENU FOR RETREAD MASTER
 * 02 Item Brand
 * 03 Item Category
 * 04 Item 
 * 05 Item Unit
 * 08 Supplier
 * 09 Warehouse
 * 10 Work Shift
 * 11 Account Header
 * 12 Account Detail
 * 13 Account Payable
 * 14 Account Receivable
 * 15 Rack
 * 16 Area
 * 17 Customer
 * 18 Product
 */

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-itembrand'),
       ('create-retread-master', 'create-itembrand'),
       ('update-retread-master', 'update-itembrand'),
       ('view-retread-master', 'view-itembrand'),
       ('delete-retread-master', 'delete-itembrand'),
       ('report-retread-master', 'report-itembrand');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-itemcategory'),
       ('create-retread-master', 'create-itemcategory'),
       ('update-retread-master', 'update-itemcategory'),
       ('view-retread-master', 'view-itemcategory'),
       ('delete-retread-master', 'delete-itemcategory'),
       ('report-retread-master', 'report-itemcategory');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-item'),
       ('create-retread-master', 'create-item'),
       ('update-retread-master', 'update-item'),
       ('view-retread-master', 'view-item'),
       ('delete-retread-master', 'delete-item'),
       ('report-retread-master', 'report-item');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-itemunit'),
       ('create-retread-master', 'create-itemunit'),
       ('update-retread-master', 'update-itemunit'),
       ('view-retread-master', 'view-itemunit'),
       ('delete-retread-master', 'delete-itemunit'),
       ('report-retread-master', 'report-itemunit');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-supplier'),
       ('create-retread-master', 'create-supplier'),
       ('update-retread-master', 'update-supplier'),
       ('view-retread-master', 'view-supplier'),
       ('delete-retread-master', 'delete-supplier'),
       ('report-retread-master', 'report-supplier');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-warehouse'),
       ('create-retread-master', 'create-warehouse'),
       ('update-retread-master', 'update-warehouse'),
       ('view-retread-master', 'view-warehouse'),
       ('delete-retread-master', 'delete-warehouse'),
       ('report-retread-master', 'report-warehouse');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-workshift'),
       ('create-retread-master', 'create-workshift'),
       ('update-retread-master', 'update-workshift'),
       ('view-retread-master', 'view-workshift'),
       ('delete-retread-master', 'delete-workshift'),
       ('report-retread-master', 'report-workshift');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-accountheader'),
       ('create-retread-master', 'create-accountheader'),
       ('update-retread-master', 'update-accountheader'),
       ('view-retread-master', 'view-accountheader'),
       ('delete-retread-master', 'delete-accountheader'),
       ('report-retread-master', 'report-accountheader');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-accountdetail'),
       ('create-retread-master', 'create-accountdetail'),
       ('update-retread-master', 'update-accountdetail'),
       ('view-retread-master', 'view-accountdetail'),
       ('delete-retread-master', 'delete-accountdetail'),
       ('report-retread-master', 'report-accountdetail');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-rack'),
       ('create-retread-master', 'create-rack'),
       ('update-retread-master', 'update-rack'),
       ('view-retread-master', 'view-rack'),
       ('delete-retread-master', 'delete-rack'),
       ('report-retread-master', 'report-rack');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-area'),
       ('create-retread-master', 'create-area'),
       ('update-retread-master', 'update-area'),
       ('view-retread-master', 'view-area'),
       ('delete-retread-master', 'delete-area'),
       ('report-retread-master', 'report-area');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-customer'),
       ('create-retread-master', 'create-customer'),
       ('update-retread-master', 'update-customer'),
       ('view-retread-master', 'view-customer'),
       ('delete-retread-master', 'delete-customer'),
       ('report-retread-master', 'report-customer');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-master', 'index-product'),
       ('create-retread-master', 'create-product'),
       ('update-retread-master', 'update-product'),
       ('view-retread-master', 'view-product'),
       ('delete-retread-master', 'delete-product'),
       ('report-retread-master', 'report-product');
/**
 * MENU FOR RETREAD TRANSACTION
 * 06 Purchase
 * 07 Purchase Receive
 * 11 Inventory
 * 12 Stock Distribution
 * 13 Stock Opname
 * 14 Stock Adjustment
 * 15 Work Request
 * 16 Work Order
 * 17 Work Remold
 */

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-transaction', 'index-purchase'),
       ('create-retread-transaction', 'create-purchase'),
       ('update-retread-transaction', 'update-purchase'),
       ('view-retread-transaction', 'view-purchase'),
       ('delete-retread-transaction', 'delete-purchase'),
       ('report-retread-transaction', 'report-purchase');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-transaction', 'index-purchasereceive'),
       ('create-retread-transaction', 'create-purchasereceive'),
       ('update-retread-transaction', 'update-purchasereceive'),
       ('view-retread-transaction', 'view-purchasereceive'),
       ('delete-retread-transaction', 'delete-purchasereceive'),
       ('report-retread-transaction', 'report-purchasereceive');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-transaction', 'index-inventory'),
       ('create-retread-transaction', 'create-inventory'),
       ('update-retread-transaction', 'update-inventory'),
       ('view-retread-transaction', 'view-inventory'),
       ('delete-retread-transaction', 'delete-inventory'),
       ('report-retread-transaction', 'report-inventory');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-transaction', 'index-stockdistribution'),
       ('create-retread-transaction', 'create-stockdistribution'),
       ('update-retread-transaction', 'update-stockdistribution'),
       ('view-retread-transaction', 'view-stockdistribution'),
       ('delete-retread-transaction', 'delete-stockdistribution'),
       ('report-retread-transaction', 'report-stockdistribution');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-transaction', 'index-accountpayable'),
       ('create-retread-transaction', 'create-accountpayable'),
       ('update-retread-transaction', 'update-accountpayable'),
       ('view-retread-transaction', 'view-accountpayable'),
       ('delete-retread-transaction', 'delete-accountpayable'),
       ('report-retread-transaction', 'report-accountpayable');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-transaction', 'index-accountreceivable'),
       ('create-retread-transaction', 'create-accountreceivable'),
       ('update-retread-transaction', 'update-accountreceivable'),
       ('view-retread-transaction', 'view-accountreceivable'),
       ('delete-retread-transaction', 'delete-accountreceivable'),
       ('report-retread-transaction', 'report-accountreceivable');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-transaction', 'index-stockopname'),
       ('create-retread-transaction', 'create-stockopname'),
       ('update-retread-transaction', 'update-stockopname'),
       ('view-retread-transaction', 'view-stockopname'),
       ('delete-retread-transaction', 'delete-stockopname'),
       ('report-retread-transaction', 'report-stockopname');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-transaction', 'index-stockadjustment'),
       ('create-retread-transaction', 'create-stockadjustment'),
       ('update-retread-transaction', 'update-stockadjustment'),
       ('view-retread-transaction', 'view-stockadjustment'),
       ('delete-retread-transaction', 'delete-stockadjustment'),
       ('report-retread-transaction', 'report-stockadjustment');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-transaction', 'index-workrequest'),
       ('create-retread-transaction', 'create-workrequest'),
       ('update-retread-transaction', 'update-workrequest'),
       ('view-retread-transaction', 'view-workrequest'),
       ('delete-retread-transaction', 'delete-workrequest'),
       ('report-retread-transaction', 'report-workrequest');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-transaction', 'index-workorder'),
       ('create-retread-transaction', 'create-workorder'),
       ('update-retread-transaction', 'update-workorder'),
       ('view-retread-transaction', 'view-workorder'),
       ('delete-retread-transaction', 'delete-workorder'),
       ('report-retread-transaction', 'report-workorder');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('index-retread-transaction', 'index-workremold'),
       ('create-retread-transaction', 'create-workremold'),
       ('update-retread-transaction', 'update-workremold'),
       ('view-retread-transaction', 'view-workremold'),
       ('delete-retread-transaction', 'delete-workremold'),
       ('report-retread-transaction', 'report-workremold');

/**
 * MENU FOR ADMIN
 */
insert into `tx_auth_item_child`(`parent`, `child`)
values ('admin', 'index-retread-master'),
       ('admin', 'create-retread-master'),
       ('admin', 'update-retread-master'),
       ('admin', 'view-retread-master'),
       ('admin', 'delete-retread-master'),
       ('admin', 'report-retread-master');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('admin', 'index-retread-transaction'),
       ('admin', 'create-retread-transaction'),
       ('admin', 'update-retread-transaction'),
       ('admin', 'view-retread-transaction'),
       ('admin', 'delete-retread-transaction'),
       ('admin', 'report-retread-transaction');

/**
 * MENU FOR OWNER
 */
insert into `tx_auth_item_child`(`parent`, `child`)
values ('owner', 'index-retread-master'),
       ('owner', 'create-retread-master'),
       ('owner', 'update-retread-master'),
       ('owner', 'view-retread-master'),
       ('owner', 'delete-retread-master'),
       ('owner', 'report-retread-master');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('owner', 'index-retread-transaction'),
       ('owner', 'create-retread-transaction'),
       ('owner', 'update-retread-transaction'),
       ('owner', 'view-retread-transaction'),
       ('owner', 'delete-retread-transaction'),
       ('owner', 'report-retread-transaction');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('owner', 'index-master'),
       ('owner', 'create-master'),
       ('owner', 'update-master'),
       ('owner', 'view-master'),
       ('owner', 'delete-master'),
       ('owner', 'report-master');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('owner', 'index-transaction'),
       ('owner', 'create-transaction'),
       ('owner', 'update-transaction'),
       ('owner', 'view-transaction'),
       ('owner', 'delete-transaction'),
       ('owner', 'report-transaction');


/**
 * MENU FOR REGULER
 */
insert into `tx_auth_item_child`(`parent`, `child`)
values ('reguler', 'index-retread-transaction'),
       ('reguler', 'create-retread-transaction'),
       ('reguler', 'view-retread-transaction'),
       ('reguler', 'report-retread-transaction');

insert into `tx_auth_item_child`(`parent`, `child`)
values ('reguler', 'index-master'),
       ('reguler', 'view-master'),
       ('reguler', 'index-retread-master'),
       ('reguler', 'view-retread-master'),
       ('reguler', 'report-retread-master');