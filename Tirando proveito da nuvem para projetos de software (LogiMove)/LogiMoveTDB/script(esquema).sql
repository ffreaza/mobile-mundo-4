/****** Object:  Database [LogiMoveTDB]    Script Date: 27/02/2024 08:30:42 ******/
CREATE DATABASE [LogiMoveTDB]  (EDITION = 'GeneralPurpose', SERVICE_OBJECTIVE = 'GP_S_Gen5_2', MAXSIZE = 8 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = ON;
GO
ALTER DATABASE [LogiMoveTDB] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [LogiMoveTDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LogiMoveTDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LogiMoveTDB] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [LogiMoveTDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LogiMoveTDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [LogiMoveTDB] SET  MULTI_USER 
GO
ALTER DATABASE [LogiMoveTDB] SET ENCRYPTION ON
GO
ALTER DATABASE [LogiMoveTDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [LogiMoveTDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** Os scripts das configurações no escopo do banco de dados no Azure devem ser executados dentro da conexão de banco de dados de destino. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 27/02/2024 08:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] NOT NULL,
	[Nome] [varchar](100) NULL,
	[Empresa] [varchar](100) NULL,
	[Endereço] [varchar](200) NULL,
	[Contato] [varchar](50) NULL,
	[ledger_start_transaction_id] [bigint] GENERATED ALWAYS AS transaction_id START HIDDEN NOT NULL,
	[ledger_end_transaction_id] [bigint] GENERATED ALWAYS AS transaction_id END HIDDEN NULL,
	[ledger_start_sequence_number] [bigint] GENERATED ALWAYS AS sequence_number START HIDDEN NOT NULL,
	[ledger_end_sequence_number] [bigint] GENERATED ALWAYS AS sequence_number END HIDDEN NULL,
PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[MSSQL_LedgerHistoryFor_1589580701]), 
LEDGER = ON (LEDGER_VIEW = [dbo].[Clients_Ledger] (TRANSACTION_ID_COLUMN_NAME = [ledger_transaction_id], SEQUENCE_NUMBER_COLUMN_NAME = [ledger_sequence_number], OPERATION_TYPE_COLUMN_NAME = [ledger_operation_type], OPERATION_TYPE_DESC_COLUMN_NAME = [ledger_operation_type_desc]))
)
GO
/****** Object:  Table [dbo].[Drivers]    Script Date: 27/02/2024 08:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Drivers](
	[DriverID] [int] NOT NULL,
	[Nome] [varchar](100) NULL,
	[CNH] [varchar](20) NULL,
	[Endereço] [varchar](200) NULL,
	[Contato] [varchar](50) NULL,
	[ledger_start_transaction_id] [bigint] GENERATED ALWAYS AS transaction_id START HIDDEN NOT NULL,
	[ledger_end_transaction_id] [bigint] GENERATED ALWAYS AS transaction_id END HIDDEN NULL,
	[ledger_start_sequence_number] [bigint] GENERATED ALWAYS AS sequence_number START HIDDEN NOT NULL,
	[ledger_end_sequence_number] [bigint] GENERATED ALWAYS AS sequence_number END HIDDEN NULL,
PRIMARY KEY CLUSTERED 
(
	[DriverID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[MSSQL_LedgerHistoryFor_1525580473]), 
LEDGER = ON (LEDGER_VIEW = [dbo].[Drivers_Ledger] (TRANSACTION_ID_COLUMN_NAME = [ledger_transaction_id], SEQUENCE_NUMBER_COLUMN_NAME = [ledger_sequence_number], OPERATION_TYPE_COLUMN_NAME = [ledger_operation_type], OPERATION_TYPE_DESC_COLUMN_NAME = [ledger_operation_type_desc]))
)
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/02/2024 08:30:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] NOT NULL,
	[ClientID] [int] NULL,
	[DriverID] [int] NULL,
	[DetalhesPedido] [text] NULL,
	[DataEntrega] [date] NULL,
	[Status] [varchar](50) NULL,
	[ledger_start_transaction_id] [bigint] GENERATED ALWAYS AS transaction_id START HIDDEN NOT NULL,
	[ledger_end_transaction_id] [bigint] GENERATED ALWAYS AS transaction_id END HIDDEN NULL,
	[ledger_start_sequence_number] [bigint] GENERATED ALWAYS AS sequence_number START HIDDEN NOT NULL,
	[ledger_end_sequence_number] [bigint] GENERATED ALWAYS AS sequence_number END HIDDEN NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [dbo].[MSSQL_LedgerHistoryFor_1653580929]), 
LEDGER = ON (LEDGER_VIEW = [dbo].[Orders_Ledger] (TRANSACTION_ID_COLUMN_NAME = [ledger_transaction_id], SEQUENCE_NUMBER_COLUMN_NAME = [ledger_sequence_number], OPERATION_TYPE_COLUMN_NAME = [ledger_operation_type], OPERATION_TYPE_DESC_COLUMN_NAME = [ledger_operation_type_desc]))
)
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([ClientID])
REFERENCES [dbo].[Clients] ([ClientID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([DriverID])
REFERENCES [dbo].[Drivers] ([DriverID])
GO
ALTER DATABASE [LogiMoveTDB] SET  READ_WRITE 
GO
