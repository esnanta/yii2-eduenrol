delete from tx_account_payable_detail;
ALTER TABLE tx_account_payable_detail AUTO_INCREMENT=0;

delete from tx_account_receivable_detail;
ALTER TABLE tx_account_receivable_detail AUTO_INCREMENT=0;

delete from tx_product_detail;
ALTER TABLE tx_product_detail AUTO_INCREMENT=0;

delete from tx_account_detail;
ALTER TABLE tx_account_detail AUTO_INCREMENT=0;

delete from tx_account_header;
ALTER TABLE tx_account_header AUTO_INCREMENT=0;


/**
  ID                    = 1
  Account_Type_Asset    = 1 //ASET
 */
INSERT INTO `tx_account_header`
    (`id`, `office_id`, `account_type`, `title`, `description`, `created_at`, `updated_at`, `created_by`,
     `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`)
VALUES
    (1,1,1,'100','Kas', NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID());

/**
  ID                        = 2
  Account_Type_Liability    = 2 //HUTANG
 */

INSERT INTO `tx_account_header`
    (`id`, `office_id`, `account_type`, `title`, `description`, `created_at`, `updated_at`, `created_by`,
    `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`)
VALUES
    (2,1,2,'200','Hutang', NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID());

/**
  ID                  = 3
  Account_Type_Equity = 3 //MODAL
 */

INSERT INTO `tx_account_header`
    (`id`, `office_id`, `account_type`, `title`, `description`, `created_at`, `updated_at`, `created_by`,
    `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`)
VALUES
    (3,1,3,'300','Modal', NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID());


/**
  ID                    = 4
  Account_Type_Revenue  = 4 //pendapatan
 */

INSERT INTO `tx_account_header`
    (`id`, `office_id`, `account_type`, `title`, `description`, `created_at`, `updated_at`, `created_by`,
    `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`)
VALUES
    (4,1,4,'400','Pendapatan', NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID());

/**
  ID                    = 5
  Account_Type_Expense  = 5 //beban
 */

INSERT INTO `tx_account_header`
    (`id`, `office_id`, `account_type`, `title`, `description`, `created_at`, `updated_at`, `created_by`,
    `updated_by`, `is_deleted`, `deleted_at`, `deleted_by`, `verlock`, `uuid`)
VALUES
    (5,1,5,'500','Beban', NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID());