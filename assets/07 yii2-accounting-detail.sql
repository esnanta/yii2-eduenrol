
/**
  Account_header_id     = 1
  Account_Type_Asset    = 1 //ASET
 */

INSERT INTO `tx_account_detail`
    (`office_id`,`account_header_id`,`account_type`,`title`,`description`,`debit_credit`,
    `created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,
    `verlock`,`uuid`)
VALUES
    (1,1,1,'101','Kas', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'102','Persediaan Barang Dagang', NULL, NOW(), NOW(),
    1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'103','Piutang Usaha', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'104','Penyisihan Piutang Usaha', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'105','Wesel Tagih', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'106','Perlengkapan', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'107','Iklan Dibayar Dimuka', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'108','Sewa Dibayar Dimuka', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'109','Asuransi Dibayar Dimuka', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'111','Peralatan', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'112','Akumulasi Penyusutan Peralatan', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'113','Kendaraan', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'114','Akumulasi Penyusutan Peralatanan Kendaraan', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'115','Gedung', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,1,1,'116','Akumulasi Penyusutan Gedung', NULL, NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID());


/**
  Account_header_id         = 2
  Account_Type_Liability    = 2 //HUTANG
 */

INSERT INTO `tx_account_detail`
(`office_id`,`account_header_id`,`account_type`,`title`,`description`,`debit_credit`,
 `created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,
 `verlock`,`uuid`)
VALUES
    (1,2,2,'201','Utang Usaha/Dagang', NULL,NOW(), NOW(),
    1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,2,2,'202','Utang Wesel', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,2,2,'203','Utang Gaji', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,2,2,'204','Utang Pajak Penghasilan', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,2,2,'205','Utang Hipotek', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,2,2,'206','Utang Obligasi', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID());

/**
  Account_header_id         = 3
  Account_Type_Equity       = 3 //MODAL
 */
INSERT INTO `tx_account_detail`
(`office_id`,`account_header_id`,`account_type`,`title`,`description`,`debit_credit`,
 `created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,
 `verlock`,`uuid`)
VALUES
    (1,3,3,'301','Modal', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,3,3,'302','Prive', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID());

/**
  Account_header_id         = 4
  Account_Type_Equity       = 4 //PENDAPATAN
 */
INSERT INTO `tx_account_detail`
(`office_id`,`account_header_id`,`account_type`,`title`,`description`,`debit_credit`,
 `created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,
 `verlock`,`uuid`)
VALUES
    (1,4,4,'401','Penjualan', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,4,4,'402','Retur Penjualan', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,4,4,'403','Potongan Penjualan', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID());

/**
  Account_header_id         = 5
  Account_Type_Equity       = 5 //BEBAN
 */
INSERT INTO `tx_account_detail`
(`office_id`,`account_header_id`,`account_type`,`title`,`description`,`debit_credit`,
 `created_at`,`updated_at`,`created_by`,`updated_by`,`is_deleted`,`deleted_at`,`deleted_by`,
 `verlock`,`uuid`)
VALUES
    (1,5,5,'501','Pembelian', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'502','Beban Angkut Pembelian', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'503','Potongan Pembelian', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'504','Beban Gaji Pegawai', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'505','Beban Sewa Gedung', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'506','Beban Sewa Peralatan', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'507','Beban Asuransi', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'508','Beban Penyesuaian Piutang', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'509','Beban Perlengkapan Toko', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'511','Beban Perlengkapan Kantor', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'512','Beban Iklan', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'513','Beban Penyusutan Peralatan', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'514','Beban Penyusutan Gedung', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'515','Beban Bunga', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'516','Beban Listrik dan Telpon', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'517','Beban Administrasi Umum', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID()),
    (1,5,5,'518','Beban Lain-lain', NULL,NOW(), NOW(),
     1, 1, NULL, NULL, NULL, 0, UUID());