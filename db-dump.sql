-- --------------------------------------------------------
-- Хост:                         192.168.56.200
-- Версия сервера:               8.0.35-0ubuntu0.22.04.1 - (Ubuntu)
-- Операционная система:         Linux
-- HeidiSQL Версия:              11.0.0.5958
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица explorer.block_data
DROP TABLE IF EXISTS `block_data`;
CREATE TABLE IF NOT EXISTS `block_data` (
  `blocknumber` int NOT NULL,
  `time_stamp` varchar(256) NOT NULL,
  `blockhash` varchar(256) NOT NULL,
  `transaction_length` varchar(256) NOT NULL,
  PRIMARY KEY (`blocknumber`),
  UNIQUE KEY `uq_multicolumn` (`blocknumber`,`time_stamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица explorer.contract_data
DROP TABLE IF EXISTS `contract_data`;
CREATE TABLE IF NOT EXISTS `contract_data` (
  `blocknumber` int NOT NULL,
  `contractAddress` varchar(256) NOT NULL,
  `sha3` varchar(64) NOT NULL,
  `verified` int NOT NULL DEFAULT '0',
  `version` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `optimization` int NOT NULL DEFAULT '0',
  `evmVersion` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `abi` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `source` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`blocknumber`),
  UNIQUE KEY `uq_multicolumn` (`blocknumber`,`contractAddress`),
  KEY `sha3` (`sha3`),
  KEY `verified` (`verified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

-- Дамп структуры для таблица explorer.transaction_data
DROP TABLE IF EXISTS `transaction_data`;
CREATE TABLE IF NOT EXISTS `transaction_data` (
  `blockNumber` int NOT NULL,
  `blockNumberHex` varchar(256) NOT NULL,
  `txHash` varchar(256) NOT NULL,
  `time_stamp` varchar(256) NOT NULL,
  `fromAddress` varchar(256) NOT NULL,
  `toAddress` varchar(256) NOT NULL,
  `value` varchar(256) NOT NULL,
  UNIQUE KEY `uq_txHash` (`txHash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Экспортируемые данные не выделены.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
