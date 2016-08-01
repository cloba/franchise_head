-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.6.31-log - MySQL Community Server (GPL)
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- franchise_head 의 데이터베이스 구조 덤핑
DROP DATABASE IF EXISTS `franchise_head`;
CREATE DATABASE IF NOT EXISTS `franchise_head` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `franchise_head`;


-- 테이블 franchise_head의 구조를 덤프합니다. delivery
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

-- Dumping data for table franchise_head.delivery: ~0 rows (대략적)
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. head_account
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

-- Dumping data for table franchise_head.head_account: ~0 rows (대략적)
/*!40000 ALTER TABLE `head_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_account` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. head_buy
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

-- Dumping data for table franchise_head.head_buy: ~0 rows (대략적)
/*!40000 ALTER TABLE `head_buy` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_buy` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. head_client
DROP TABLE IF EXISTS `head_client`;
CREATE TABLE IF NOT EXISTS `head_client` (
  `head_client_code` varchar(50) NOT NULL COMMENT '거래처 코드',
  `head_client_name` varchar(50) NOT NULL COMMENT '거래처명',
  `head_client_regit_date` datetime NOT NULL COMMENT '거래처 등록일',
  `head_client_in_charge` varchar(50) NOT NULL COMMENT '거래처 담당자 이름',
  `head_client_contract` varchar(50) NOT NULL COMMENT '계약 상태',
  `head_client_phone` varchar(50) NOT NULL COMMENT '거래처 전화번호',
  `head_client_addr` varchar(50) NOT NULL COMMENT '거래처 주소',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록 직원아이디',
  PRIMARY KEY (`head_client_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 거래처';

-- Dumping data for table franchise_head.head_client: ~0 rows (대략적)
/*!40000 ALTER TABLE `head_client` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_client` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. head_dump
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

-- Dumping data for table franchise_head.head_dump: ~0 rows (대략적)
/*!40000 ALTER TABLE `head_dump` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_dump` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. head_item
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

-- Dumping data for table franchise_head.head_item: ~5 rows (대략적)
/*!40000 ALTER TABLE `head_item` DISABLE KEYS */;
INSERT INTO `head_item` (`h_item_code`, `inte_code`, `h_item_name`, `h_item_quantity`, `h_item_amount`, `h_item_amount_unit`, `h_item_unit`, `head_client_code`, `h_item_purchase_price`, `h_item_margin_percent`, `h_item_head_profit`, `h_item_selling_price`, `h_item_retail_price`, `head_staff_id`, `h_item_regit_date`) VALUES
	('h_item_code1', 'i1', '머그컵', 10, NULL, NULL, 'BOX', 'head_client_code1', 100000, 0.5, 50000, 150000, 20000, 'head_staff_id1', '2016-07-29 11:47:38'),
	('h_item_code2', 'i2', '원두', 1, 300, 'g', 'EX', 'head_client_code2', 3000, 0.5, 1500, 4500, 0, 'head_staff_id1', '2016-07-31 13:57:40'),
	('h_item_code3', 'i3', '일반우유', 1, 1000, 'ml', 'EX', 'head_client_code2', 1000, 0.6, 600, 1600, 0, 'head_staff_id1', '2016-07-31 13:58:37'),
	('h_item_code4', 'i4', '원두', 10, NULL, NULL, 'BOX', 'head_client_code2', 30000, 0.5, 15000, 45000, 0, 'head_staff_id1', '2016-07-31 13:59:35'),
	('h_item_code5', 'i5', '일반우유', 20, NULL, NULL, 'BOX', 'head_client_code2', 20000, 0.5, 10000, 35000, 0, 'head_staff_id1', '2016-07-31 14:00:17');
/*!40000 ALTER TABLE `head_item` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. head_out
DROP TABLE IF EXISTS `head_out`;
CREATE TABLE IF NOT EXISTS `head_out` (
  `head_out_code` varchar(50) NOT NULL COMMENT '본사 출고 코드',
  `head_out_group` varchar(50) NOT NULL COMMENT '출고 그룹',
  `orders_code` varchar(50) NOT NULL COMMENT '가맹발주번호',
  `specific_item_code` varchar(50) NOT NULL,
  `h_item_code` varchar(50) NOT NULL COMMENT '상품코드',
  `store_code` varchar(50) NOT NULL COMMENT '가맹일련번호',
  `head_out_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '보내준 날짜',
  `head_staff_sender` varchar(50) NOT NULL COMMENT '보낸 직원아이디',
  `head_out_status` int(11) NOT NULL COMMENT '배송상태 (1.가맹이요청 2. 배송준비중 3. 배송완료 4. 가맹이받음)',
  `head_staff_check` varchar(50) NOT NULL COMMENT '가맹요청을 확인한 직원아이디',
  `total_account_group` varchar(50) NOT NULL COMMENT '통합회계그룹코드',
  PRIMARY KEY (`head_out_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 출고 관리';

-- Dumping data for table franchise_head.head_out: ~0 rows (대략적)
/*!40000 ALTER TABLE `head_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_out` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. head_staff
DROP TABLE IF EXISTS `head_staff`;
CREATE TABLE IF NOT EXISTS `head_staff` (
  `head_staff_id` varchar(50) NOT NULL COMMENT '본사 직원 아이디',
  `head_staff_pw` varchar(50) NOT NULL COMMENT '비밀번호',
  `head_staff_name` varchar(50) NOT NULL COMMENT '이름',
  `head_staff_level` varchar(50) NOT NULL COMMENT '직급',
  `head_staff_dep` varchar(50) NOT NULL COMMENT '부서',
  `head_staff_join` date NOT NULL COMMENT '입사일',
  `head_staff_resign` date DEFAULT NULL COMMENT '퇴사일',
  `head_staff_regit_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일자',
  `head_staff_regit_id` varchar(50) NOT NULL COMMENT '등록한 직원 아이디',
  `head_staff_resign_identify` char(1) NOT NULL DEFAULT 'N' COMMENT '퇴사여부',
  `head_staff_phone_first` varchar(50) NOT NULL COMMENT '연락처 첫  번째 자리',
  `head_staff_phone_second` varchar(50) NOT NULL COMMENT '연락처 두 번째 자리',
  `head_staff_phone_third` varchar(50) NOT NULL COMMENT '연락처 세  번째 자리',
  `head_staff_post` varchar(50) NOT NULL COMMENT '우편번호',
  `head_staff_road_addr` varchar(50) NOT NULL COMMENT '도로명주소',
  `head_staff_parcle_addr` varchar(50) NOT NULL COMMENT '지번주소',
  PRIMARY KEY (`head_staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 직원관리';

-- Dumping data for table franchise_head.head_staff: ~18 rows (대략적)
/*!40000 ALTER TABLE `head_staff` DISABLE KEYS */;
INSERT INTO `head_staff` (`head_staff_id`, `head_staff_pw`, `head_staff_name`, `head_staff_level`, `head_staff_dep`, `head_staff_join`, `head_staff_resign`, `head_staff_regit_date`, `head_staff_regit_id`, `head_staff_resign_identify`, `head_staff_phone_first`, `head_staff_phone_second`, `head_staff_phone_third`, `head_staff_post`, `head_staff_road_addr`, `head_staff_parcle_addr`) VALUES
	('1', '0000', '1', '1', '1', '2016-07-28', '2016-07-10', '2016-07-28 15:39:25', '1', 'Y', '', '', '', '', '', ''),
	('2', '0000', '2', '2', '2', '2016-07-28', '2016-07-29', '2016-07-28 19:34:11', '2', 'y', '', '', '', '', '', ''),
	('3', '0000', '3', '3', '3', '2016-07-28', NULL, '2016-07-28 20:10:32', '3', 'N', '', '', '', '', '', ''),
	('4', '0000', '4', '4', '4', '2016-07-28', '2016-07-28', '2016-07-28 20:10:50', '4', 'Y', '', '', '', '', '', ''),
	('5', '0000', '5', '5', '5', '2016-07-29', NULL, '2016-07-29 10:08:39', '5', 'y', '', '', '', '', '', ''),
	('head_staff_id1', '0000', '1', '관리자', '부서 선택', '2016-07-31', NULL, '2016-07-31 11:51:53', 'id001', 'N', '', '', '', '', '', ''),
	('head_staff_id10', '0000', '121', '관리자', '0', '2016-07-31', NULL, '2016-07-31 12:41:19', 'id001', 'N', '010', '2321', '1234', '', '', ''),
	('head_staff_id11', '0000', '12313', '관리자', '영업부', '2016-07-31', NULL, '2016-07-31 12:44:19', 'id001', 'N', '010', '111', '2323', '', '', ''),
	('head_staff_id12', '0000', '12313', '관리자', '관리부', '2016-07-31', NULL, '2016-07-31 12:52:18', 'id001', 'N', '010', '111', '1212', '', '', ''),
	('head_staff_id13', '0000', '1111111', '관리자', '영업부', '2016-07-31', NULL, '2016-07-31 13:43:39', 'id001', 'N', '010', '3333', '4444', '04403', '서울 용산구 대사관로 20 (한남동)', '서울 용산구 한남동 686-63'),
	('head_staff_id2', '0000', '2', '관리자', '영업부', '2016-07-31', NULL, '2016-07-31 11:56:30', 'id001', 'N', '', '', '', '', '', ''),
	('head_staff_id3', '0000', '121', '관리자', '', '2016-07-31', NULL, '2016-07-31 11:56:49', 'id001', 'N', '', '', '', '', '', ''),
	('head_staff_id4', '0000', 'sasa', '관리자', '', '2016-07-31', NULL, '2016-07-31 11:57:03', 'id001', 'N', '', '', '', '', '', ''),
	('head_staff_id5', '0000', 'sasa', '관리자', '', '2016-07-31', NULL, '2016-07-31 12:00:26', 'id001', 'N', '', '', '', '', '', ''),
	('head_staff_id6', '0000', '1', '관리자', '영업부', '2016-07-31', NULL, '2016-07-31 12:00:48', 'id001', 'N', '', '', '', '', '', ''),
	('head_staff_id7', '0000', '', '관리자', '0', '2016-07-31', NULL, '2016-07-31 12:09:39', 'id001', 'N', '', '', '', '', '', ''),
	('head_staff_id8', '0000', '121', '관리자', '0', '2016-07-31', NULL, '2016-07-31 12:31:39', 'id001', 'N', '010nullnull', '', '', '', '', ''),
	('head_staff_id9', '0000', '1234', '관리자', '0', '2016-07-31', NULL, '2016-07-31 12:40:18', 'id001', 'N', '010nullnull', '', '', '', '', '');
/*!40000 ALTER TABLE `head_staff` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. head_stock
DROP TABLE IF EXISTS `head_stock`;
CREATE TABLE IF NOT EXISTS `head_stock` (
  `specific_item_code` varchar(50) NOT NULL COMMENT '개별상품코드',
  `h_item_code` varchar(50) NOT NULL COMMENT '상품코드',
  `head_buy_date` varchar(50) NOT NULL COMMENT '본사 매입날짜',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록한 직원아이디',
  `head_stock_regit_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일자',
  `head_stock_item_out` varchar(50) NOT NULL COMMENT '출고여부',
  `head_stock_in_date` datetime NOT NULL COMMENT '입고일자',
  `head_stock_in_expiry_date` datetime DEFAULT NULL COMMENT '유통기한',
  `head_stock_return` varchar(50) NOT NULL COMMENT '반품상품 해당여부',
  PRIMARY KEY (`specific_item_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='본사 재고관리';

-- Dumping data for table franchise_head.head_stock: ~3 rows (대략적)
/*!40000 ALTER TABLE `head_stock` DISABLE KEYS */;
INSERT INTO `head_stock` (`specific_item_code`, `h_item_code`, `head_buy_date`, `head_staff_id`, `head_stock_regit_date`, `head_stock_item_out`, `head_stock_in_date`, `head_stock_in_expiry_date`, `head_stock_return`) VALUES
	('1', '1', '1', '1', '2016-07-28 01:12:33', '1', '2016-07-28 01:12:36', NULL, 'n'),
	('2', '2', '2', '2', '2016-07-29 11:50:16', '2', '2016-07-29 11:50:17', '2016-07-29 11:50:18', 'n'),
	('3', '4', '5', '6', '2016-07-31 11:31:10', '7', '2016-07-31 11:31:09', '2016-07-31 11:40:57', '8');
/*!40000 ALTER TABLE `head_stock` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. ingre_price
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

-- Dumping data for table franchise_head.ingre_price: ~1 rows (대략적)
/*!40000 ALTER TABLE `ingre_price` DISABLE KEYS */;
INSERT INTO `ingre_price` (`ingre_price_code`, `menu_code`, `h_item_code`, `ingre_name`, `ingre_amount`, `ingre_money`, `head_staff_id`, `ingre_regit_date`, `ingre_status`) VALUES
	('ingre_price_code1', 'menu_code1', 'h_item_code2', '원두', 30, 600, 'head_staff_id01', '2016-07-31 14:36:00', 'Y');
/*!40000 ALTER TABLE `ingre_price` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. menu
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

-- Dumping data for table franchise_head.menu: ~4 rows (대략적)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`menu_code`, `inte_code`, `menu_name`, `menu_ingre_price`, `menu_selling_price`, `head_staff_id`, `menu_regit_date`, `menu_status`, `menu_expired_date`) VALUES
	('menu_code1', 'm1', '카페라떼S', 540, 5000, 'head_staff_id2', '2016-07-29 12:10:37', 'Y', NULL),
	('menu_code2', 'm2', '요거트스무디', 700, 5500, 'head_staff_id1', '2016-07-29 12:10:57', 'Y', '2016-07-29'),
	('menu_code3', 'm3', '아메리카노', 300, 4000, 'head_staff_id2', '2016-07-29 12:11:22', 'N', '2016-07-29'),
	('menu_code4', 'm4', '블루베리요거트스무디', 800, 6500, 'head_staff_id3', '2016-07-31 13:25:58', 'Y', NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. profit_by_pay_method
DROP TABLE IF EXISTS `profit_by_pay_method`;
CREATE TABLE IF NOT EXISTS `profit_by_pay_method` (
  `pay_method_code` varchar(50) NOT NULL COMMENT '결제방식코드',
  `pay_method` varchar(50) NOT NULL COMMENT '결제방식',
  `profit_percent` varchar(50) NOT NULL COMMENT '수익 %',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록한 직원 아이디',
  `profit_date` datetime NOT NULL COMMENT '등록일자',
  `profit_status` char(50) NOT NULL COMMENT '적용상태',
  PRIMARY KEY (`pay_method_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='결제 방식에 따른 수익';

-- Dumping data for table franchise_head.profit_by_pay_method: ~0 rows (대략적)
/*!40000 ALTER TABLE `profit_by_pay_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `profit_by_pay_method` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. recipe
DROP TABLE IF EXISTS `recipe`;
CREATE TABLE IF NOT EXISTS `recipe` (
  `recipe_code` varchar(50) NOT NULL COMMENT '레시피 코드',
  `menu_code` varchar(50) NOT NULL COMMENT '메뉴 코드',
  `recipe_act` longtext NOT NULL COMMENT '조리내용',
  `head_staff_id` varchar(50) NOT NULL COMMENT '승인한 직원아이디',
  `recipe_regit_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '등록일자',
  PRIMARY KEY (`recipe_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='레시피';

-- Dumping data for table franchise_head.recipe: ~4 rows (대략적)
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` (`recipe_code`, `menu_code`, `recipe_act`, `head_staff_id`, `recipe_regit_date`) VALUES
	('1', 'menu_code1', '소량컵에 레몬원액을 따르고 시럽2펌프를 넣어 섞어준다음 뜨거운물을 부어 젓는다.', 'id001', '2016-08-01 10:30:12'),
	('2', '초콜릿밀크', '스팀컵에 우유를 반절 따른다. 초코소스를 1.5펌프 넣는다.  스팀를스팀 한다. 드리즐을 넣는다.', 'id001', '2016-08-01 10:31:03'),
	('3', '아메리카노', '큰컵에얼음을반절담는다. ESP1샷을뽑는다. 물을선까지넣는다.', 'id002', '2016-08-01 10:31:20'),
	('4', '아메리카노', '작은컵에얼음을반절답는다. ESP1샷을뽑는다. 물을선까지넣는다.', 'id003', '2016-08-01 10:31:37');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. returns
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

-- Dumping data for table franchise_head.returns: ~0 rows (대략적)
/*!40000 ALTER TABLE `returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `returns` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. store
DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `store_code` varchar(50) NOT NULL COMMENT '가맹대표코드',
  `head_staff_id` varchar(50) NOT NULL COMMENT '등록한 직원아이디',
  `store_regit_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '가맹 등록 날짜',
  `store_name` varchar(50) NOT NULL COMMENT '가맹점명',
  `store_owner` varchar(50) NOT NULL COMMENT '점주명',
  `store_telephone` varchar(50) NOT NULL COMMENT '연락처',
  `store_addr` varchar(50) NOT NULL COMMENT '주소',
  PRIMARY KEY (`store_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='가맹관리';

-- Dumping data for table franchise_head.store: ~0 rows (대략적)
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
/*!40000 ALTER TABLE `store` ENABLE KEYS */;


-- 테이블 franchise_head의 구조를 덤프합니다. subject
DROP TABLE IF EXISTS `subject`;
CREATE TABLE IF NOT EXISTS `subject` (
  `subject_code` varchar(50) NOT NULL COMMENT '계정과목코드',
  `subject_name` varchar(50) NOT NULL COMMENT '계정과목명',
  `subject_content` varchar(50) NOT NULL COMMENT '상세내용',
  PRIMARY KEY (`subject_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='계정과목';

-- Dumping data for table franchise_head.subject: ~0 rows (대략적)
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
