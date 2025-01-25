/**
 * Author:  Nanta Es
 * Created: Sep 24, 2023
 */

/**
 * DAFTAR MENU
 * 01 Fuel Sales        
 * 02 Item Brand
 * 03 Item Category
 * 04 Item 
 * 05 Item Unit
 * 06 Purchase
 * 07 Purchase Receive
 * 08 Supplier
 * 09 Warehouse
 * 10 Work Shift
 * 11 Inventory
 * 12 Stock Distribution
 * 13 Account Header
 * 14 Account Detail
 * 15 Account Payable
 * 16 Account Receivable
 * 17 Area
 * 18 Customer
 * 19 Stock Opname
 * 20 Stock Adjustment
 * 21 Work Request
 * 22 Product
 * 23 Work Order
 * 24 Work Remold
 * xx Retread Master
 * yy Retread Transaction
 */


insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('owner', 1, 'Company Owner', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-fuelsales', 2, 'Index Fuel Sales', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-fuelsales', 2, 'Create Fuel Sales', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-fuelsales', 2, 'Update Fuel Sales', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-fuelsales', 2, 'View Fuel Sales', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-fuelsales', 2, 'Delete Fuel Sales', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-fuelsales', 2, 'Report Fuel Sales', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-itembrand', 2, 'Index Item Brand', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-itembrand', 2, 'Create Item Brand', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-itembrand', 2, 'Update Item Brand', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-itembrand', 2, 'View Item Brand', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-itembrand', 2, 'Delete Item Brand', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-itembrand', 2, 'Report Item Brand', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-itemcategory', 2, 'Index Item Category', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-itemcategory', 2, 'Create Item Category', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-itemcategory', 2, 'Update Item Category', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-itemcategory', 2, 'View Item Category', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-itemcategory', 2, 'Delete Item Category', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-itemcategory', 2, 'Report Item Category', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-item', 2, 'Index Item', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-item', 2, 'Create Item', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-item', 2, 'Update Item', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-item', 2, 'View Item', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-item', 2, 'Delete Item', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-item', 2, 'Report Item', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-itemunit', 2, 'Index Item Unit', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-itemunit', 2, 'Create Item Unit', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-itemunit', 2, 'Update Item Unit', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-itemunit', 2, 'View Item Unit', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-itemunit', 2, 'Delete Item Unit', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-itemunit', 2, 'Report Item Unit', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-purchase', 2, 'Index Purchase', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-purchase', 2, 'Create Purchase', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-purchase', 2, 'Update Purchase', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-purchase', 2, 'View Purchase', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-purchase', 2, 'Delete Purchase', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-purchase', 2, 'Report Purchase', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-purchasereceive', 2, 'Index Purchase Receive', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-purchasereceive', 2, 'Create Purchase Receive', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-purchasereceive', 2, 'Update Purchase Receive', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-purchasereceive', 2, 'View Purchase Receive', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-purchasereceive', 2, 'Delete Purchase Receive', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-purchasereceive', 2, 'Report Purchase Receive', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-supplier', 2, 'Index Supplier', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-supplier', 2, 'Create Supplier', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-supplier', 2, 'Update Supplier', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-supplier', 2, 'View Supplier', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-supplier', 2, 'Delete Supplier', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-supplier', 2, 'Report Supplier', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-rack', 2, 'Index Rack', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-rack', 2, 'Create Rack', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-rack', 2, 'Update Rack', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-rack', 2, 'View Rack', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-rack', 2, 'Delete Rack', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-rack', 2, 'Report Rack', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-warehouse', 2, 'Index Warehouse', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-warehouse', 2, 'Create Warehouse', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-warehouse', 2, 'Update Warehouse', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-warehouse', 2, 'View Warehouse', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-warehouse', 2, 'Delete Warehouse', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-warehouse', 2, 'Report Warehouse', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-workshift', 2, 'Index Workshift', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-workshift', 2, 'Create Workshift', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-workshift', 2, 'Update Workshift', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-workshift', 2, 'View Workshift', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-workshift', 2, 'Delete Workshift', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-workshift', 2, 'Report Workshift', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-inventory', 2, 'Index Inventory', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-inventory', 2, 'Create Inventory', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-inventory', 2, 'Update Inventory', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-inventory', 2, 'View Inventory', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-inventory', 2, 'Delete Inventory', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-inventory', 2, 'Report Inventory', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-stockdistribution', 2, 'Index Stock Distribution', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-stockdistribution', 2, 'Create Stock Distribution', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-stockdistribution', 2, 'Update Stock Distribution', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-stockdistribution', 2, 'View Stock Distribution', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-stockdistribution', 2, 'Delete Stock Distribution', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-stockdistribution', 2, 'Report Stock Distribution', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-accountheader', 2, 'Index Account Header', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-accountheader', 2, 'Create Account Header', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-accountheader', 2, 'Update Account Header', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-accountheader', 2, 'View Account Header', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-accountheader', 2, 'Delete Account Header', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-accountheader', 2, 'Report Account Header', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-accountdetail', 2, 'Index Account Detail', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-accountdetail', 2, 'Create Account Detail', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-accountdetail', 2, 'Update Account Detail', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-accountdetail', 2, 'View Account Detail', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-accountdetail', 2, 'Delete Account Detail', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-accountdetail', 2, 'Report Account Detail', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-accountpayable', 2, 'Index Account Payable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-accountpayable', 2, 'Create Account Payable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-accountpayable', 2, 'Update Account Payable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-accountpayable', 2, 'View Account Payable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-accountpayable', 2, 'Delete Account Payable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-accountpayable', 2, 'Report Account Payable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-accountreceivable', 2, 'Index Account Receivable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-accountreceivable', 2, 'Create Account Receivable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-accountreceivable', 2, 'Update Account Receivable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-accountreceivable', 2, 'View Account Receivable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-accountreceivable', 2, 'Delete Account Receivable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-accountreceivable', 2, 'Report Account Receivable', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-area', 2, 'Index Area', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-area', 2, 'Create Area', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-area', 2, 'Update Area', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-area', 2, 'View Area', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-area', 2, 'Delete Area', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-area', 2, 'Report Area', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-customer', 2, 'Index Customer', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-customer', 2, 'Create Customer', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-customer', 2, 'Update Customer', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-customer', 2, 'View Customer', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-customer', 2, 'Delete Customer', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-customer', 2, 'Report Customer', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-stockopname', 2, 'Index Stock Opname', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-stockopname', 2, 'Create Stock Opname', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-stockopname', 2, 'Update Stock Opname', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-stockopname', 2, 'View Stock Opname', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-stockopname', 2, 'Delete Stock Opname', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-stockopname', 2, 'Report Stock Opname', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-stockadjustment', 2, 'Index Stock Adjustment', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-stockadjustment', 2, 'Create Stock Adjustment', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-stockadjustment', 2, 'Update Stock Adjustment', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-stockadjustment', 2, 'View Stock Adjustment', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-stockadjustment', 2, 'Delete Stock Adjustment', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-stockadjustment', 2, 'Report Stock Adjustment', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-workrequest', 2, 'Index Work Request', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-workrequest', 2, 'Create Work Request', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-workrequest', 2, 'Update Work Request', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-workrequest', 2, 'View Work Request', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-workrequest', 2, 'Delete Work Request', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-workrequest', 2, 'Report Work Request', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-workorder', 2, 'Index Work Order', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-workorder', 2, 'Create Work Order', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-workorder', 2, 'Update Work Order', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-workorder', 2, 'View Work Order', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-workorder', 2, 'Delete Work Order', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-workorder', 2, 'Report Work Order', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-workremold', 2, 'Index Work Remold', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-workremold', 2, 'Create Work Remold', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-workremold', 2, 'Update Work Remold', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-workremold', 2, 'View Work Remold', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-workremold', 2, 'Delete Work Remold', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-workremold', 2, 'Report Work Remold', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-product', 2, 'Index Product', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-product', 2, 'Create Product', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-product', 2, 'Update Product', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-product', 2, 'View Product', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-product', 2, 'Delete Product', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-product', 2, 'Report Product', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-retread-master', 2, 'Index Retread Master', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-retread-master', 2, 'Create Retread Master', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-retread-master', 2, 'Update Retread Master', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-retread-master', 2, 'View Retread Master', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-retread-master', 2, 'Delete Retread Master', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-retread-master', 2, 'Report Retread Master', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

insert into `tx_auth_item`(`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
values ('index-retread-transaction', 2, 'Index Retread Transaction', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('create-retread-transaction', 2, 'Create Retread Transaction', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('update-retread-transaction', 2, 'Update Retread Transaction', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('view-retread-transaction', 2, 'View Retread Transaction', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('delete-retread-transaction', 2, 'Delete Retread Transaction', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP()),
       ('report-retread-transaction', 2, 'Report Retread Transaction', NULL, NULL, UNIX_TIMESTAMP(), UNIX_TIMESTAMP());