USE [master]
GO
/****** Object:  Database [KspExamen]    Script Date: 30/06/2023 06:54:41 p. m. ******/
CREATE DATABASE [KspExamen]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'KspExamen_Data', FILENAME = N'c:\dzsqls\KspExamen.mdf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 LOG ON 
( NAME = N'KspExamen_Logs', FILENAME = N'c:\dzsqls\KspExamen.ldf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [KspExamen] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [KspExamen].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [KspExamen] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [KspExamen] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [KspExamen] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [KspExamen] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [KspExamen] SET ARITHABORT OFF 
GO
ALTER DATABASE [KspExamen] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [KspExamen] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [KspExamen] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [KspExamen] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [KspExamen] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [KspExamen] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [KspExamen] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [KspExamen] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [KspExamen] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [KspExamen] SET  ENABLE_BROKER 
GO
ALTER DATABASE [KspExamen] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [KspExamen] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [KspExamen] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [KspExamen] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [KspExamen] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [KspExamen] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [KspExamen] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [KspExamen] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [KspExamen] SET  MULTI_USER 
GO
ALTER DATABASE [KspExamen] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [KspExamen] SET DB_CHAINING OFF 
GO
ALTER DATABASE [KspExamen] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [KspExamen] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [KspExamen] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [KspExamen] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [KspExamen] SET QUERY_STORE = ON
GO
ALTER DATABASE [KspExamen] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [KspExamen]
GO
/****** Object:  User [AldairRodriguez_SQLLogin_1]    Script Date: 30/06/2023 06:54:42 p. m. ******/
CREATE USER [AldairRodriguez_SQLLogin_1] FOR LOGIN [AldairRodriguez_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [AldairRodriguez_SQLLogin_1]
GO
/****** Object:  Schema [AldairRodriguez_SQLLogin_1]    Script Date: 30/06/2023 06:54:42 p. m. ******/
CREATE SCHEMA [AldairRodriguez_SQLLogin_1]
GO
/****** Object:  Table [dbo].[Beneficiario]    Script Date: 30/06/2023 06:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beneficiario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreBeneficiario] [varchar](50) NULL,
	[ApellidoPaternoBeneficiario] [varchar](50) NULL,
	[ApellidoMaternoBeneficiario] [varchar](50) NULL,
	[Parentesco] [varchar](50) NULL,
	[FechaNacimiento] [date] NULL,
	[Sexo] [varchar](10) NULL,
	[Empleado_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 30/06/2023 06:54:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FotoEmpleado] [image] NULL,
	[NombreEmpleado] [varchar](50) NULL,
	[ApellidoPaternoEmpleado] [varchar](50) NULL,
	[ApellidoMaternoEmpleado] [varchar](50) NULL,
	[PuestoTrabajo] [varchar](50) NULL,
	[Salario] [money] NULL,
	[Estatus] [bit] NULL,
	[FechaContratacion] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Beneficiario]  WITH CHECK ADD  CONSTRAINT [fk_Beneficiario] FOREIGN KEY([Empleado_Id])
REFERENCES [dbo].[Empleado] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Beneficiario] CHECK CONSTRAINT [fk_Beneficiario]
GO
ALTER TABLE [dbo].[Beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_Beneficiario_Empleado] FOREIGN KEY([Empleado_Id])
REFERENCES [dbo].[Empleado] ([Id])
GO
ALTER TABLE [dbo].[Beneficiario] CHECK CONSTRAINT [FK_Beneficiario_Empleado]
GO
USE [master]
GO
ALTER DATABASE [KspExamen] SET  READ_WRITE 
GO
