-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.32 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for franchise_head
DROP DATABASE IF EXISTS `franchise_head`;
CREATE DATABASE IF NOT EXISTS `franchise_head` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `franchise_head`;


-- Dumping structure for table franchise_head.contract
DROP TABLE IF EXISTS `contract`;
CREATE TABLE IF NOT EXISTS `contract` (
  `contract_code` varchar(50) NOT NULL COMMENT '계약 코드',
  `head_staff_id` varchar(50) NOT NULL COMMENT '계약한 직원아이디',
  `store_code` varchar(50) NOT NULL COMMENT '가맹일련번호',
  `contractor_name` varchar(50) NOT NULL COMMENT '계약자명 (점주이름)',
  `contract_actual_date` datetime NOT NULL COMMENT '계약일자',
  `contract_regit_date` datetime NOT NULL COMMENT '데이터 등록일자',
  `contract_expiry_date` datetime DEFAULT NULL COMMENT '계약만료일',
  `contract_deposit` int(11) NOT NULL COMMENT '가맹금',
  `contract_profit_percent` int(11) NOT NULL COMMENT '이익 배분율',
  `contract_file` varchar(50) NOT NULL COMMENT '계약서 첨부파일',
  `contract_n` int(11) NOT NULL COMMENT '계약차수',
  `contract_expire` char(1) NOT NULL DEFAULT 'N' COMMENT '파기여부',
  `contract_expired_date` datetime DEFAULT NULL COMMENT '계약파기일',
  `contract_expire_content` longtext COMMENT '계약파기 내용',
  PRIMARY KEY (`contract_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='계약 관리';

-- Dumping data for table franchise_head.contract: ~2 rows (approximately)
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` (`contract_code`, `head_staff_id`, `store_code`, `contractor_name`, `contract_actual_date`, `contract_regit_date`, `contract_expiry_date`, `contract_deposit`, `contract_profit_percent`, `contract_file`, `contract_n`, `contract_expire`, `contract_expired_date`, `contract_expire_content`) VALUES
	('contract_code1', 'head_staff_id1', 'store_code1', '김철희', '2016-08-01 14:49:59', '2016-08-02 14:50:00', '2016-08-02 14:50:01', 0, 0, '0', 1, 'N', NULL, NULL),
	('contract_code2', 'head_staff_id1', 'store_code2', '김철수', '2016-08-02 14:49:59', '2016-08-02 14:50:00', '2016-08-02 14:50:01', 0, 0, '0', 1, 'N', NULL, NULL);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;


-- Dumping structure for table franchise_head.delivery
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE IF NOT EXISTS `delivery` (
  `delivery_code` varchar(50) NOT NULL COMMENT '배송관리코드',
  `orders_code` varchar(50) NOT NULL COMMENT '가맹 발주번호',
  `delivery_date` datetime NOT NULL COMMENT '배송 출발날짜',
  `delivery_receive` char(50) NOT NULL DEFAULT 'N' COMMENT '가맹 수령여부',
  `delivery_location` varchar(50) NOT NULL COMMENT '현 위치',
  `head_staff_id` varchar(50) NOT NULL COMMENT '확인한 직원아이디',
  `delivery_return` char(50) NOT NULL COMMENT '반송 해당여부',
  `delivery_person` varchar(50) NOT NULL COMMENT '배송 담당자(배달직원)',
  PRIMARY KEY (`delivery_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='배송 관리';

-- Dumping data for table franchise_head.delivery: ~4 rows (approximately)
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` (`delivery_code`, `orders_code`, `delivery_date`, `delivery_receive`, `delivery_location`, `head_staff_id`, `delivery_return`, `delivery_person`) VALUES
	('delivery_code1', 'orders_code1', '2016-08-01 17:16:48', 'N', '안성시물류창고', 'head_staff_id1', 'N', '홍길동'),
	('delivery_code2', 'orders_code2', '2016-08-02 17:16:48', 'N', '안성시물류창고', 'head_staff_id1', 'Y', '홍길동'),
	('delivery_code3', 'orders_code2', '2016-08-03 17:16:48', 'Y', '안성시물류창고', 'head_staff_id1', 'Y', '홍길동'),
	('delivery_code4', 'orders_code2', '2016-08-04 15:16:48', 'Y', '안성시물류창고', 'head_staff_id1', 'N', '홍길동');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;


-- Dumping structure for table franchise_head.head_account
DROP TABLE IF EXISTS `head_account`;
CREATE TABLE IF NOT EXISTS `head_account` (
  `head_account_code` varchar(50) NOT NULL COMMENT '본사 통합회계 전표번호',
  `subject_code` varchar(50) NOT NULL COMMENT '계정과목 코드',
  `head_client_code` varchar(50) NOT NULL COMMENT '본사 거래처',
  `head_account_flow` varchar(50) NOT NULL COMMENT '출금/입금',
  `head_account_group_code` varchar(50) NOT NULL COMMENT '통합 출/입금 관련 그룹 코드',
  `head_account_table` varchar(50) NOT NULL COMMENT '해당 테이블명',
  `head_account_sum` varchar(50) NOT NULL COMMENT '합계',
  `head_account_request_date` datetime NOT NULL COMMENT '직원 요청일자',
  `head_staff_id_request` varchar(50) NOT NULL COMMENT '요청 직원 아이디',
  `head_account_detail` varchar(50) NOT NULL COMMENT '상세내역',
  `request_check_date` datetime NOT NULL COMMENT '직원요청 확인일자',
  `head_staff_id_confirm` varchar(50) NOT NULL COMMENT '확인 직원 아이디',
  PRIMARY KEY (`head_account_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 통합회계 관리';

-- Dumping data for table franchise_head.head_account: ~0 rows (approximately)
/*!40000 ALTER TABLE `head_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_account` ENABLE KEYS */;


-- Dumping structure for table franchise_head.head_buy
DROP TABLE IF EXISTS `head_buy`;
CREATE TABLE IF NOT EXISTS `head_buy` (
  `head_buy_code` varchar(50) NOT NULL COMMENT '본사매입기록 코드',
  `h_item_code` varchar(50) NOT NULL COMMENT '상품코드',
  `head_client_code` varchar(50) NOT NULL COMMENT '본사 거래처 코드',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록한 직원아이디',
  `head_buy_date` datetime NOT NULL COMMENT '매입 날짜',
  `head_buy_group` varchar(50) NOT NULL COMMENT '매입 그룹',
  `head_buy_quantity` int(11) NOT NULL COMMENT '수량',
  `head_buy_payment` varchar(50) NOT NULL COMMENT '지불한 금액',
  `head_buy_pay` varchar(50) NOT NULL COMMENT '결제 여부',
  `head_buy_pay_date` datetime NOT NULL COMMENT '결제 날짜',
  `head_buy_final` varchar(50) NOT NULL COMMENT '마감 여부',
  `head_buy_final_staff` varchar(50) NOT NULL COMMENT '마감한 직원 아이디',
  `head_item_final_date` datetime NOT NULL COMMENT '마감일자',
  `total_account_group` varchar(50) NOT NULL COMMENT '통합회계 그룹코드',
  PRIMARY KEY (`head_buy_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 매입기록 관리';

-- Dumping data for table franchise_head.head_buy: ~0 rows (approximately)
/*!40000 ALTER TABLE `head_buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_buy` ENABLE KEYS */;


-- Dumping structure for table franchise_head.head_client
DROP TABLE IF EXISTS `head_client`;
CREATE TABLE IF NOT EXISTS `head_client` (
  `head_client_code` varchar(50) NOT NULL COMMENT '거래처 코드',
  `head_client_name` varchar(50) NOT NULL COMMENT '거래처명',
  `head_client_regit_date` datetime NOT NULL COMMENT '거래처 등록일',
  `head_client_in_charge` varchar(50) NOT NULL COMMENT '거래처 담당자 이름',
  `head_client_contract` varchar(50) NOT NULL COMMENT '계약 상태',
  `head_client_phone_first` varchar(50) NOT NULL COMMENT '거래처 연락처 첫  번째 자리',
  `head_client_phone_second` varchar(50) NOT NULL COMMENT '거래처 연락처 두  번째 자리',
  `head_client_phone_third` varchar(50) NOT NULL COMMENT '거래처 연락처 세 번째 자리',
  `head_client_road_addr` varchar(50) NOT NULL COMMENT '도로명 주소',
  `head_client_post` varchar(20) NOT NULL COMMENT '우편번호',
  `head_client_parcle_addr` varchar(50) NOT NULL COMMENT '지번주소',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록 직원아이디',
  PRIMARY KEY (`head_client_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 거래처';

-- Dumping data for table franchise_head.head_client: ~3 rows (approximately)
/*!40000 ALTER TABLE `head_client` DISABLE KEYS */;
INSERT INTO `head_client` (`head_client_code`, `head_client_name`, `head_client_regit_date`, `head_client_in_charge`, `head_client_contract`, `head_client_phone_first`, `head_client_phone_second`, `head_client_phone_third`, `head_client_road_addr`, `head_client_post`, `head_client_parcle_addr`, `head_staff_id`) VALUES
	('head_client_code1', '홍길동', '2016-08-02 15:36:05', '허균', '계약중', '01031383377', '', '', '익산시', '', '', 'id001'),
	('head_client_code2', '홍길군', '2016-08-02 15:37:35', '허준', '계약중', '01024382366', '', '', '전주시', '', '', 'id001'),
	('head_client_code3', '하하', '2016-08-02 15:38:05', '허참', '계약완료', '01022145545', '', '', '전주시', '', '', 'id002');
/*!40000 ALTER TABLE `head_client` ENABLE KEYS */;


-- Dumping structure for table franchise_head.head_dump
DROP TABLE IF EXISTS `head_dump`;
CREATE TABLE IF NOT EXISTS `head_dump` (
  `head_dump_code` varchar(50) NOT NULL COMMENT '판매불가 상품코드',
  `h_item_code` varchar(50) NOT NULL COMMENT '상품코드',
  `specific_item_code` varchar(50) NOT NULL COMMENT '개별상품 코드',
  `head_dump_reason` varchar(50) NOT NULL COMMENT '폐기 사유',
  `head_staff_id` varchar(50) NOT NULL COMMENT '본사 직원 아이디',
  `head_dump_date` datetime NOT NULL COMMENT '폐기 일자',
  PRIMARY KEY (`head_dump_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 판매불가 상품관리';

-- Dumping data for table franchise_head.head_dump: ~0 rows (approximately)
/*!40000 ALTER TABLE `head_dump` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_dump` ENABLE KEYS */;


-- Dumping structure for table franchise_head.head_item
DROP TABLE IF EXISTS `head_item`;
CREATE TABLE IF NOT EXISTS `head_item` (
  `h_item_code` varchar(50) NOT NULL COMMENT '상품코드',
  `inte_code` varchar(50) NOT NULL COMMENT '상품메뉴통합코드',
  `h_item_name` varchar(50) NOT NULL COMMENT '상품명',
  `h_item_quantity` int(11) NOT NULL COMMENT '개수',
  `h_item_amount` int(11) DEFAULT NULL COMMENT '양 (n g, n kg)',
  `h_item_amount_unit` varchar(50) DEFAULT NULL COMMENT '양의 단위 (kg, ml)',
  `h_item_unit` varchar(50) NOT NULL COMMENT '단위',
  `head_client_code` varchar(50) NOT NULL COMMENT '거래처 코드',
  `h_item_purchase_price` int(11) NOT NULL COMMENT '매입가격',
  `h_item_margin_percent` float NOT NULL COMMENT '이익율',
  `h_item_head_profit` int(11) NOT NULL COMMENT '이익금액',
  `h_item_selling_price` int(11) NOT NULL COMMENT '판매 가격',
  `h_item_retail_price` int(11) NOT NULL COMMENT '소비자 가격',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록한 직원 아이디',
  `h_item_regit_date` datetime NOT NULL COMMENT '등록날짜',
  PRIMARY KEY (`h_item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품 리스트 관리';

-- Dumping data for table franchise_head.head_item: ~5 rows (approximately)
/*!40000 ALTER TABLE `head_item` DISABLE KEYS */;
INSERT INTO `head_item` (`h_item_code`, `inte_code`, `h_item_name`, `h_item_quantity`, `h_item_amount`, `h_item_amount_unit`, `h_item_unit`, `head_client_code`, `h_item_purchase_price`, `h_item_margin_percent`, `h_item_head_profit`, `h_item_selling_price`, `h_item_retail_price`, `head_staff_id`, `h_item_regit_date`) VALUES
	('h_item_code1', 'i1', '머그컵', 10, NULL, NULL, 'BOX', 'head_client_code1', 100000, 0.5, 50000, 150000, 20000, 'head_staff_id1', '2016-07-29 11:47:38'),
	('h_item_code2', 'i2', '원두', 1, 300, 'g', 'EX', 'head_client_code2', 3000, 0.5, 1500, 4500, 0, 'head_staff_id1', '2016-07-31 13:57:40'),
	('h_item_code3', 'i3', '일반우유', 1, 1000, 'ml', 'EX', 'head_client_code2', 1000, 0.6, 600, 1600, 0, 'head_staff_id1', '2016-07-31 13:58:37'),
	('h_item_code4', 'i4', '원두', 10, NULL, NULL, 'BOX', 'head_client_code2', 30000, 0.5, 15000, 45000, 0, 'head_staff_id1', '2016-07-31 13:59:35'),
	('h_item_code5', 'i5', '일반우유', 20, NULL, NULL, 'BOX', 'head_client_code2', 20000, 0.5, 10000, 35000, 0, 'head_staff_id1', '2016-07-31 14:00:17');
/*!40000 ALTER TABLE `head_item` ENABLE KEYS */;


-- Dumping structure for table franchise_head.head_out
DROP TABLE IF EXISTS `head_out`;
CREATE TABLE IF NOT EXISTS `head_out` (
  `head_out_code` varchar(50) NOT NULL COMMENT '본사 출고 코드',
  `head_out_group` varchar(50) NOT NULL COMMENT '출고 그룹',
  `orders_code` varchar(50) NOT NULL COMMENT '가맹발주번호',
  `specific_item_code` varchar(50) NOT NULL COMMENT '상품개별코드 (바코드역할)',
  `h_item_code` varchar(50) NOT NULL COMMENT '상품코드',
  `store_code` varchar(50) NOT NULL COMMENT '가맹일련번호',
  `head_out_date` datetime NOT NULL COMMENT '출고날짜',
  `head_staff_sender` varchar(50) NOT NULL COMMENT '보낸 직원아이디',
  `head_out_status` int(11) NOT NULL COMMENT '배송상태 (1.가맹이요청 2. 배송준비중 3. 배송완료 4. 가맹이받음)',
  `head_staff_check` varchar(50) NOT NULL COMMENT '가맹요청을 확인한 직원아이디',
  `total_account_group` varchar(50) NOT NULL COMMENT '통합회계그룹코드',
  PRIMARY KEY (`head_out_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 출고 관리';

-- Dumping data for table franchise_head.head_out: ~4 rows (approximately)
/*!40000 ALTER TABLE `head_out` DISABLE KEYS */;
INSERT INTO `head_out` (`head_out_code`, `head_out_group`, `orders_code`, `specific_item_code`, `h_item_code`, `store_code`, `head_out_date`, `head_staff_sender`, `head_out_status`, `head_staff_check`, `total_account_group`) VALUES
	('head_out_code1', '1', 'orders_code1', 'specific_item_code1', 'h_item_code1', 'store_code1', '2016-08-01 16:30:37', 'head_staff_id1', 1, 'head_staff_id1', '본사출고'),
	('head_out_code2', '1', 'orders_code1', 'specific_item_code1', 'h_item_code1', 'store_code1', '2016-08-02 16:30:37', 'head_staff_id1', 2, 'head_staff_id1', '본사출고'),
	('head_out_code3', '1', 'orders_code1', 'specific_item_code1', 'h_item_code1', 'store_code1', '2016-08-03 16:30:37', 'head_staff_id1', 3, 'head_staff_id1', '본사출고'),
	('head_out_code4', '1', 'orders_code1', 'specific_item_code1', 'h_item_code1', 'store_code1', '2016-08-04 16:30:37', 'head_staff_id1', 4, 'head_staff_id1', '본사출고');
/*!40000 ALTER TABLE `head_out` ENABLE KEYS */;


-- Dumping structure for table franchise_head.head_sell
DROP TABLE IF EXISTS `head_sell`;
CREATE TABLE IF NOT EXISTS `head_sell` (
  `head_sell_code` varchar(50) NOT NULL COMMENT '본사 판매 코드',
  `inte_code` varchar(50) NOT NULL COMMENT '상품메뉴 통합코드',
  `head_sell_quantity` int(11) NOT NULL COMMENT '판매수량',
  `store_code` varchar(50) NOT NULL COMMENT '가맹일련번호',
  `head_sell_group` varchar(50) NOT NULL COMMENT '판매그룹번호',
  `head_sell_purchase_price` int(20) NOT NULL COMMENT '매입금액',
  `head_sell_selling_price` int(20) NOT NULL COMMENT '판매금액',
  `head_sell_date` datetime NOT NULL COMMENT '판매일자',
  `total_account_group` varchar(50) NOT NULL COMMENT '통합회계 그룹코드',
  `head_sell_final` char(1) NOT NULL DEFAULT 'N' COMMENT '마감유무',
  `head_sell_final_staff` varchar(50) DEFAULT NULL COMMENT '마감담당자 아이디',
  `head_sell_final_date` datetime DEFAULT NULL COMMENT '마감일자',
  `head_sell_distr` char(1) NOT NULL DEFAULT 'N' COMMENT '본사 수금 여부',
  `head_sell_profit_head` int(11) NOT NULL COMMENT '판매 건별 본사 이익금액',
  `head_sell_profit_sub` int(11) NOT NULL COMMENT '판매 건별 가맹 이익금액',
  PRIMARY KEY (`head_sell_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 판매관리';

-- Dumping data for table franchise_head.head_sell: ~2 rows (approximately)
/*!40000 ALTER TABLE `head_sell` DISABLE KEYS */;
INSERT INTO `head_sell` (`head_sell_code`, `inte_code`, `head_sell_quantity`, `store_code`, `head_sell_group`, `head_sell_purchase_price`, `head_sell_selling_price`, `head_sell_date`, `total_account_group`, `head_sell_final`, `head_sell_final_staff`, `head_sell_final_date`, `head_sell_distr`, `head_sell_profit_head`, `head_sell_profit_sub`) VALUES
	('head_sell_code1', 'i1', 3, 'store_code1', 'group1', 0, 0, '2016-08-02 16:49:10', '본사판매관리', 'Y', NULL, NULL, 'N', 0, 0),
	('head_sell_code2', 'i2', 3, 'store_code1', 'group2', 0, 0, '2016-08-03 16:49:10', '본사판매관리', 'N', NULL, NULL, 'N', 0, 0);
/*!40000 ALTER TABLE `head_sell` ENABLE KEYS */;


-- Dumping structure for table franchise_head.head_staff
DROP TABLE IF EXISTS `head_staff`;
CREATE TABLE IF NOT EXISTS `head_staff` (
  `head_staff_id` varchar(50) NOT NULL COMMENT '본사 직원 아이디',
  `head_staff_pw` varchar(50) NOT NULL COMMENT '비밀번호',
  `head_staff_name` varchar(50) NOT NULL COMMENT '이름',
  `head_staff_level` varchar(50) NOT NULL COMMENT '직급',
  `head_staff_dep` varchar(50) NOT NULL COMMENT '부서',
  `head_staff_join` date NOT NULL COMMENT '입사일',
  `head_staff_resign` date DEFAULT NULL COMMENT '퇴사일',
  `head_staff_regit_date` datetime NOT NULL COMMENT '등록일자',
  `head_staff_regit_id` varchar(50) NOT NULL COMMENT '등록한 직원 아이디',
  `head_staff_resign_identify` char(1) NOT NULL DEFAULT 'N' COMMENT '퇴사여부',
  `head_staff_phone_first` varchar(50) NOT NULL COMMENT '연락처 첫  번째 자리',
  `head_staff_phone_second` varchar(50) NOT NULL COMMENT '연락처 두 번째 자리',
  `head_staff_phone_third` varchar(50) NOT NULL COMMENT '연락처 세  번째 자리',
  `head_staff_post` varchar(20) NOT NULL COMMENT '우편번호',
  `head_staff_road_addr` varchar(50) NOT NULL COMMENT '도로명주소',
  `head_staff_parcle_addr` varchar(50) NOT NULL COMMENT '지번주소',
  PRIMARY KEY (`head_staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 직원관리';

-- Dumping data for table franchise_head.head_staff: ~2 rows (approximately)
/*!40000 ALTER TABLE `head_staff` DISABLE KEYS */;
INSERT INTO `head_staff` (`head_staff_id`, `head_staff_pw`, `head_staff_name`, `head_staff_level`, `head_staff_dep`, `head_staff_join`, `head_staff_resign`, `head_staff_regit_date`, `head_staff_regit_id`, `head_staff_resign_identify`, `head_staff_phone_first`, `head_staff_phone_second`, `head_staff_phone_third`, `head_staff_post`, `head_staff_road_addr`, `head_staff_parcle_addr`) VALUES
	('head_staff_id1', '0000', '안소영', '사원', '인사부', '2016-07-29', NULL, '2016-07-29 10:06:59', 'head_staff_id2', 'N', 'N', '', '', 'N', 'N', 'N'),
	('head_staff_id2', '0000', '박종무', '사원', '인사부', '2016-07-29', NULL, '2016-07-29 10:08:52', 'head_staff_id1', 'N', 'N', '', '', 'N', 'N', 'N');
/*!40000 ALTER TABLE `head_staff` ENABLE KEYS */;


-- Dumping structure for table franchise_head.head_stock
DROP TABLE IF EXISTS `head_stock`;
CREATE TABLE IF NOT EXISTS `head_stock` (
  `specific_item_code` varchar(50) NOT NULL COMMENT '개별상품코드',
  `h_item_code` varchar(50) NOT NULL COMMENT '상품코드',
  `head_buy_date` varchar(50) NOT NULL COMMENT '본사 매입날짜',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록한 직원아이디',
  `head_stock_regit_date` datetime NOT NULL COMMENT '등록일자',
  `head_stock_item_out` varchar(50) NOT NULL COMMENT '출고여부',
  `head_stock_in_date` datetime NOT NULL COMMENT '입고일자',
  `head_stock_in_expiry_date` datetime DEFAULT NULL COMMENT '유통기한',
  `head_stock_return` varchar(50) NOT NULL COMMENT '반품상품 해당여부',
  PRIMARY KEY (`specific_item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 재고관리';

-- Dumping data for table franchise_head.head_stock: ~3 rows (approximately)
/*!40000 ALTER TABLE `head_stock` DISABLE KEYS */;
INSERT INTO `head_stock` (`specific_item_code`, `h_item_code`, `head_buy_date`, `head_staff_id`, `head_stock_regit_date`, `head_stock_item_out`, `head_stock_in_date`, `head_stock_in_expiry_date`, `head_stock_return`) VALUES
	('1', '1', '1', '1', '2016-07-28 01:12:33', '1', '2016-07-28 01:12:36', NULL, 'n'),
	('2', '2', '2', '2', '2016-07-29 11:50:16', '2', '2016-07-29 11:50:17', '2016-07-29 11:50:18', 'n'),
	('3', '4', '5', '6', '2016-07-31 11:31:10', '7', '2016-07-31 11:31:09', '2016-07-31 11:40:57', '8');
/*!40000 ALTER TABLE `head_stock` ENABLE KEYS */;


-- Dumping structure for table franchise_head.ingre_price
DROP TABLE IF EXISTS `ingre_price`;
CREATE TABLE IF NOT EXISTS `ingre_price` (
  `ingre_price_code` varchar(50) NOT NULL COMMENT '재료당 가격계산코드',
  `menu_code` varchar(50) NOT NULL COMMENT '그룹코드 (메뉴코드)',
  `h_item_code` varchar(50) NOT NULL COMMENT '상품코드',
  `ingre_name` varchar(50) NOT NULL COMMENT '재료명',
  `ingre_amount` int(11) NOT NULL COMMENT '사용량',
  `ingre_money` int(11) NOT NULL COMMENT '사용량에 따른 가격',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록한 직원아이디',
  `ingre_regit_date` datetime NOT NULL COMMENT '등록일자',
  `ingre_status` char(1) NOT NULL DEFAULT 'Y' COMMENT '현재적용상태',
  PRIMARY KEY (`ingre_price_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메뉴당 필요한 재료량과 가격계산을 위한 테이블';

-- Dumping data for table franchise_head.ingre_price: ~2 rows (approximately)
/*!40000 ALTER TABLE `ingre_price` DISABLE KEYS */;
INSERT INTO `ingre_price` (`ingre_price_code`, `menu_code`, `h_item_code`, `ingre_name`, `ingre_amount`, `ingre_money`, `head_staff_id`, `ingre_regit_date`, `ingre_status`) VALUES
	('ingre_price_code1', 'menu_code1', 'h_item_code2', '원두', 30, 600, 'head_staff_id1', '2016-07-31 14:36:00', 'Y'),
	('ingre_price_code2', 'menu_code1', 'h_item_code4', '우유', 250, 2500, 'head_staff_id1', '2016-08-02 10:07:28', 'Y');
/*!40000 ALTER TABLE `ingre_price` ENABLE KEYS */;


-- Dumping structure for table franchise_head.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_code` varchar(50) NOT NULL COMMENT '메뉴코드',
  `inte_code` varchar(50) NOT NULL COMMENT '상품메뉴 통합코드',
  `menu_name` varchar(50) NOT NULL COMMENT '메뉴 이름',
  `menu_ingre_price` int(11) NOT NULL COMMENT '재료 구입가',
  `menu_selling_price` int(11) NOT NULL COMMENT '소비자 가격',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록한 직원아이디',
  `menu_regit_date` datetime NOT NULL COMMENT '등록한 날짜',
  `menu_status` char(50) NOT NULL DEFAULT 'Y' COMMENT '적용상태',
  `menu_expired_date` date DEFAULT NULL COMMENT '적용만료 날짜',
  PRIMARY KEY (`menu_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='메뉴 관리';

-- Dumping data for table franchise_head.menu: ~4 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`menu_code`, `inte_code`, `menu_name`, `menu_ingre_price`, `menu_selling_price`, `head_staff_id`, `menu_regit_date`, `menu_status`, `menu_expired_date`) VALUES
	('menu_code1', 'm1', '카페라떼S', 540, 5000, 'head_staff_id2', '2016-07-29 12:10:37', 'Y', NULL),
	('menu_code2', 'm2', '요거트스무디', 700, 5500, 'head_staff_id1', '2016-07-29 12:10:57', 'Y', '2016-07-29'),
	('menu_code3', 'm3', '아메리카노', 300, 4000, 'head_staff_id2', '2016-07-29 12:11:22', 'N', '2016-07-29'),
	('menu_code4', 'm4', '블루베리요거트스무디', 800, 6500, 'head_staff_id3', '2016-07-31 13:25:58', 'Y', NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- Dumping structure for table franchise_head.profit_by_pay_method
DROP TABLE IF EXISTS `profit_by_pay_method`;
CREATE TABLE IF NOT EXISTS `profit_by_pay_method` (
  `pay_method_code` varchar(50) NOT NULL COMMENT '결제방식코드',
  `pay_method` varchar(50) NOT NULL COMMENT '결제방식',
  `profit_percent` int(11) NOT NULL COMMENT '수수료 %',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록한 직원 아이디',
  `profit_regit_date` datetime NOT NULL COMMENT '등록일자',
  `profit_status` char(1) NOT NULL COMMENT '적용상태',
  PRIMARY KEY (`pay_method_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='결제 방식에 따른 수익';

-- Dumping data for table franchise_head.profit_by_pay_method: ~4 rows (approximately)
/*!40000 ALTER TABLE `profit_by_pay_method` DISABLE KEYS */;
INSERT INTO `profit_by_pay_method` (`pay_method_code`, `pay_method`, `profit_percent`, `head_staff_id`, `profit_regit_date`, `profit_status`) VALUES
	('pay_method_code1', 'BC카드', 10, 'head_staff_id1', '2016-08-12 15:34:43', 'Y'),
	('pay_method_code2', 'BC카드', 10, 'head_staff_id1', '2016-08-02 15:34:43', 'N'),
	('pay_method_code3', '현대카드', 10, 'head_staff_id1', '2016-08-12 15:34:43', 'Y'),
	('pay_method_code4', '현대카드', 10, 'head_staff_id1', '2016-08-02 15:34:43', 'N');
/*!40000 ALTER TABLE `profit_by_pay_method` ENABLE KEYS */;


-- Dumping structure for table franchise_head.recipe
DROP TABLE IF EXISTS `recipe`;
CREATE TABLE IF NOT EXISTS `recipe` (
  `recipe_code` varchar(50) NOT NULL COMMENT '레시피 코드',
  `menu_code` varchar(50) NOT NULL COMMENT '메뉴 코드',
  `recipe_act` longtext NOT NULL COMMENT '조리내용',
  `head_staff_id` varchar(50) NOT NULL COMMENT '승인한 직원아이디',
  `recipe_regit_date` datetime NOT NULL COMMENT '등록일자',
  `recipe_order` int(11) NOT NULL COMMENT '레시피 순서',
  PRIMARY KEY (`recipe_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='레시피';

-- Dumping data for table franchise_head.recipe: ~6 rows (approximately)
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` (`recipe_code`, `menu_code`, `recipe_act`, `head_staff_id`, `recipe_regit_date`, `recipe_order`) VALUES
	('1', 'menu_code1', '소량컵에 레몬원액을 따른다.', 'id001', '2016-08-01 10:30:12', 1),
	('2', '', '스팀컵에 우유를 반절 따른다. 초코소스를 1.5펌프 넣는다.  스팀를스팀 한다. 드리즐을 넣는다.', 'id001', '2016-08-01 10:31:03', 0),
	('3', '아메리카노', '큰컵에얼음을반절담는다. ESP1샷을뽑는다. 물을선까지넣는다.', 'id002', '2016-08-01 10:31:20', 0),
	('4', '아메리카노', '작은컵에얼음을반절답는다. ESP1샷을뽑는다. 물을선까지넣는다.', 'id003', '2016-08-01 10:31:37', 0),
	('5', 'menu_code1', '시럽2펌프를 넣어 섞어준다. ', 'id001', '2016-08-01 11:11:11', 2),
	('6', 'menu_code1', '뜨거운물을 부어 젓는다.', 'id001', '2016-08-02 12:22:11', 3);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;


-- Dumping structure for table franchise_head.returns
DROP TABLE IF EXISTS `returns`;
CREATE TABLE IF NOT EXISTS `returns` (
  `returns_code` varchar(50) NOT NULL COMMENT '반품 코드',
  `orders_code` varchar(50) NOT NULL COMMENT '가맹발주 번호',
  `specific_item_code` varchar(50) NOT NULL COMMENT '개별상품코드',
  `return_reason` varchar(50) NOT NULL COMMENT '반품사유',
  `return_price` int(11) NOT NULL COMMENT '반품가격',
  `return_report_date` varchar(50) NOT NULL COMMENT '가맹보고날짜',
  `return_head_check` char(50) NOT NULL COMMENT '본사확인',
  `return_head_check_date` datetime NOT NULL COMMENT '본사확인날짜',
  `head_staff_id` varchar(50) NOT NULL COMMENT '확인한 직원 아이디',
  `total_account_group` varchar(50) NOT NULL COMMENT '통합회계 그룹코드',
  `return_re_delivery` varchar(50) NOT NULL COMMENT '재배송 요청 여부',
  `return_cancel` varchar(50) NOT NULL COMMENT '반품 취소 여부',
  PRIMARY KEY (`returns_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='반품 상품';

-- Dumping data for table franchise_head.returns: ~0 rows (approximately)
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;


-- Dumping structure for table franchise_head.royalty
DROP TABLE IF EXISTS `royalty`;
CREATE TABLE IF NOT EXISTS `royalty` (
  `royalty_code` varchar(50) DEFAULT NULL COMMENT '로열티지불 코드',
  `sub_name` varchar(50) DEFAULT NULL COMMENT '가맹 점 포명',
  `contract_code` varchar(50) DEFAULT NULL COMMENT '계약코드',
  `royalty_month` varchar(50) DEFAULT NULL COMMENT '해당월',
  `sub_code` varchar(50) DEFAULT NULL COMMENT '가맹대표코드',
  `royalty_deadline` int(11) DEFAULT NULL COMMENT '로열티 지급 기일',
  `royalty_paid` char(1) NOT NULL DEFAULT 'N' COMMENT '로열티 지급 여부',
  `sub_practical_sell_price_month` int(11) NOT NULL COMMENT '해당 월 실제 판매 금액',
  `sub_sell_profit_month` int(11) NOT NULL COMMENT '해당 월 가맹 이익 금액',
  `head_sell_profit_by_sub_month` int(11) NOT NULL COMMENT '해당 월 이 가맹에 대한본사 로얄티',
  `royalty_pay_actual_date` date DEFAULT NULL COMMENT '실제 지급 날짜',
  `royalty_actual_amount` int(11) NOT NULL DEFAULT '0' COMMENT '해당월에 실제 지급한 금액'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='로열티 실제 지불관리';

-- Dumping data for table franchise_head.royalty: ~5 rows (approximately)
/*!40000 ALTER TABLE `royalty` DISABLE KEYS */;
INSERT INTO `royalty` (`royalty_code`, `sub_name`, `contract_code`, `royalty_month`, `sub_code`, `royalty_deadline`, `royalty_paid`, `sub_practical_sell_price_month`, `sub_sell_profit_month`, `head_sell_profit_by_sub_month`, `royalty_pay_actual_date`, `royalty_actual_amount`) VALUES
	('royalty_code1', '전주사랑점', 'contract_code1', '2016-06', 'sub_code1', 15, 'N', 1000000, 900000, 100000, '2016-08-08', 100000),
	('royalty_code2', '전주사랑점', 'contract_code1', '2016-07', 'sub_code1', 15, 'N', 5000000, 4500000, 500000, NULL, 0),
	('royalty_code3', '익산동산점', 'contract_code2', '2016-06', 'sub_code2', 20, 'N', 3000000, 2700000, 300000, NULL, 0),
	('royalty_code4', '익산동산점', 'contract_code2', '2016-07', 'sub_code2', 10, 'N', 3000, 2700, 300, '2016-08-08', 0);
/*!40000 ALTER TABLE `royalty` ENABLE KEYS */;


-- Dumping structure for table franchise_head.royalty_overdue
DROP TABLE IF EXISTS `royalty_overdue`;
CREATE TABLE IF NOT EXISTS `royalty_overdue` (
  `royalty_overdue_code` varchar(50) NOT NULL COMMENT '로열티 지급예정 코드',
  `contract_code` varchar(50) NOT NULL COMMENT '계약코드',
  `royalty_overdue_status` int(11) NOT NULL COMMENT '상태(일부납부/완불/지급예정)',
  `royalty_overdue_paid` int(11) NOT NULL DEFAULT '0' COMMENT '지급 금액',
  `royalty_overdue_pay_date` date NOT NULL COMMENT '납부 일자',
  `royalty_overdue_rest` int(11) NOT NULL COMMENT '남은 금액',
  PRIMARY KEY (`royalty_overdue_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='로열티 연체관리';

-- Dumping data for table franchise_head.royalty_overdue: ~0 rows (approximately)
/*!40000 ALTER TABLE `royalty_overdue` DISABLE KEYS */;
/*!40000 ALTER TABLE `royalty_overdue` ENABLE KEYS */;


-- Dumping structure for table franchise_head.sub
DROP TABLE IF EXISTS `sub`;
CREATE TABLE IF NOT EXISTS `sub` (
  `sub_code` varchar(50) NOT NULL COMMENT '가맹대표코드',
  `sub_name` varchar(50) NOT NULL COMMENT '가맹점명',
  `sub_regit_date` datetime NOT NULL COMMENT '가맹 등록 날짜',
  `sub_owner` varchar(50) NOT NULL COMMENT '점주명',
  `sub_phone_first` int(11) NOT NULL COMMENT '연락처1',
  `sub_phone_second` int(11) NOT NULL COMMENT '연락처2',
  `sub_phone_third` int(11) NOT NULL COMMENT '연락처3',
  `sub_post` int(11) NOT NULL COMMENT '우편번호',
  `sub_road_addr` varchar(50) NOT NULL COMMENT '도로명주소',
  `sub_parcle_addr` varchar(50) NOT NULL COMMENT '지번주소',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록한 직원아이디',
  PRIMARY KEY (`sub_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='가맹관리';

-- Dumping data for table franchise_head.sub: ~2 rows (approximately)
/*!40000 ALTER TABLE `sub` DISABLE KEYS */;
INSERT INTO `sub` (`sub_code`, `sub_name`, `sub_regit_date`, `sub_owner`, `sub_phone_first`, `sub_phone_second`, `sub_phone_third`, `sub_post`, `sub_road_addr`, `sub_parcle_addr`, `head_staff_id`) VALUES
	('sub_code1', '전주사랑점', '2016-08-02 11:06:15', '김철수', 10, 0, 0, 123456, '전주시덕진구', '전주시덕준구', 'head_staff_id1'),
	('sub_code2', '익산동산점', '2016-08-02 11:06:15', '김철수', 10, 0, 0, 123456, '전주시덕진구', '전주시덕준구', 'head_staff_id1');
/*!40000 ALTER TABLE `sub` ENABLE KEYS */;


-- Dumping structure for table franchise_head.subject
DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_code` varchar(50) NOT NULL COMMENT '계정과목코드',
  `subject_name` varchar(50) NOT NULL COMMENT '계정과목명',
  `subject_content` varchar(50) NOT NULL COMMENT '상세내용',
  PRIMARY KEY (`subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='계정과목';

-- Dumping data for table franchise_head.subject: ~2 rows (approximately)
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` (`subject_code`, `subject_name`, `subject_content`) VALUES
	('subject_code1', '직원급여', '직원급여과목'),
	('subject_code2', '상품매출', '상품매출과목');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;


-- Dumping structure for table franchise_head.sub_sell
DROP TABLE IF EXISTS `sub_sell`;
CREATE TABLE IF NOT EXISTS `sub_sell` (
  `sub_sell_code` varchar(50) NOT NULL COMMENT '판매일련번호',
  `sub_code` varchar(50) NOT NULL COMMENT '가맹대표코드',
  `sub_name` varchar(50) NOT NULL COMMENT '가맹이름',
  `inte_code` varchar(50) NOT NULL COMMENT '상품메뉴통합코드',
  `total_account_group` varchar(50) DEFAULT NULL COMMENT '통합회계그룹코드',
  `sub_sell_group` int(11) NOT NULL COMMENT '판매그룹(주문 건 당)',
  `sub_sell_practical_selling_price` int(11) NOT NULL COMMENT '실제 판매된 금액',
  `sub_sell_profit_head` int(11) NOT NULL COMMENT '판매 건 별 본사이익금액',
  `sub_sell_profit_sub` int(11) NOT NULL COMMENT '판매 건 별 가맹점 이익금액',
  `sub_sell_pay_method` varchar(50) NOT NULL COMMENT '결제방식(카드/현금)',
  `sub_sell_date` datetime NOT NULL COMMENT '판매일자',
  `sub_sell_staff` varchar(50) NOT NULL COMMENT '판매한 가맹직원아이디',
  `sub_sell_final` varchar(50) NOT NULL COMMENT '마감유무',
  `sub_sell_final_staff` varchar(50) NOT NULL COMMENT '마감 담당자 아이디',
  `sub_sell_final_date` datetime NOT NULL COMMENT '마감일자',
  `sub_sell_distr` char(1) NOT NULL COMMENT '본사수금여부',
  `contract_code` varchar(50) NOT NULL COMMENT '계약 코드'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table franchise_head.sub_sell: ~2 rows (approximately)
/*!40000 ALTER TABLE `sub_sell` DISABLE KEYS */;
INSERT INTO `sub_sell` (`sub_sell_code`, `sub_code`, `sub_name`, `inte_code`, `total_account_group`, `sub_sell_group`, `sub_sell_practical_selling_price`, `sub_sell_profit_head`, `sub_sell_profit_sub`, `sub_sell_pay_method`, `sub_sell_date`, `sub_sell_staff`, `sub_sell_final`, `sub_sell_final_staff`, `sub_sell_final_date`, `sub_sell_distr`, `contract_code`) VALUES
	('sub_sell_code1', 'sub_code1', '전주사랑점', 'm1', '판_그룹_5', 1, 1000, 100, 900, '현금', '2016-07-02 17:06:58', 'id011', '마감', 'id001', '2016-08-03 17:07:47', 'y', ''),
	('sub_sell_code2', 'sub_code2', '익산동산점', 'm1', '판_그룹_5', 2, 3000, 300, 2700, '현금', '2016-07-04 15:31:15', 'id013', '마감', 'id002', '2016-08-04 15:31:44', 'y', ''),
	('sub_sell_code3', 'sub_code1', '전주사랑점', 'm1', '판_그룹_5', 1, 5000, 500, 4500, '현금', '2016-07-07 12:53:13', 'id011', '마감', 'id001', '2016-08-07 12:53:30', 'y', '');
/*!40000 ALTER TABLE `sub_sell` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
