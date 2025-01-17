USE [master]
GO
/****** Object:  Database [Securicy_home]    Script Date: 2021/2/22 下午 06:28:56 ******/
CREATE DATABASE [Securicy_home]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Securicy_home', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\Securicy_home.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Securicy_home_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019\MSSQL\DATA\Securicy_home_log.ldf' , SIZE = 204800KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Securicy_home] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Securicy_home].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Securicy_home] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Securicy_home] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Securicy_home] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Securicy_home] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Securicy_home] SET ARITHABORT OFF 
GO
ALTER DATABASE [Securicy_home] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Securicy_home] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Securicy_home] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Securicy_home] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Securicy_home] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Securicy_home] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Securicy_home] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Securicy_home] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Securicy_home] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Securicy_home] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Securicy_home] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Securicy_home] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Securicy_home] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Securicy_home] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Securicy_home] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Securicy_home] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Securicy_home] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Securicy_home] SET RECOVERY FULL 
GO
ALTER DATABASE [Securicy_home] SET  MULTI_USER 
GO
ALTER DATABASE [Securicy_home] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Securicy_home] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Securicy_home] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Securicy_home] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Securicy_home] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Securicy_home] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Securicy_home', N'ON'
GO
ALTER DATABASE [Securicy_home] SET QUERY_STORE = OFF
GO
USE [Securicy_home]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 2021/2/22 下午 06:28:57 ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
/****** Object:  Schema [App]    Script Date: 2021/2/22 下午 06:28:57 ******/
CREATE SCHEMA [App]
GO
/****** Object:  Schema [Home]    Script Date: 2021/2/22 下午 06:28:57 ******/
CREATE SCHEMA [Home]
GO
/****** Object:  Table [App].[Account]    Script Date: 2021/2/22 下午 06:28:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [App].[Account](
	[accountId] [varchar](50) NOT NULL,
	[accountName] [nvarchar](max) NULL,
	[mainDoorLock] [int] NULL,
	[ban] [int] NULL,
 CONSTRAINT [PK__Account__F267251E0FE307AE] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [App].[AccountLogin]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [App].[AccountLogin](
	[userId] [varchar](50) NOT NULL,
	[accountId] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AccountLogin] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [App].[Camera]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [App].[Camera](
	[accountId] [varchar](50) NOT NULL,
	[datetime] [datetime] NOT NULL,
	[image] [image] NOT NULL,
 CONSTRAINT [PK_Camera] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC,
	[datetime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [App].[Device]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [App].[Device](
	[accountId] [varchar](50) NOT NULL,
	[deviceId] [varchar](50) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Device] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC,
	[deviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [App].[Group]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [App].[Group](
	[groupId] [int] IDENTITY(100,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[groupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [App].[GroupAccount]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [App].[GroupAccount](
	[accountId] [varchar](50) NOT NULL,
	[groupId] [int] NOT NULL,
 CONSTRAINT [PK_GroupAccount] PRIMARY KEY CLUSTERED 
(
	[accountId] ASC,
	[groupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Version]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Version](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sqlVersion] [varchar](10) NULL,
	[homeVersion] [varchar](10) NULL,
	[appVersion] [varchar](10) NULL,
	[versionDescription] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Home].[Device]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Home].[Device](
	[deviceId] [int] IDENTITY(100,1) NOT NULL,
	[roomId] [int] NOT NULL,
	[deviceDetailId] [int] NOT NULL,
	[deviceName] [nvarchar](max) NOT NULL,
	[status] [int] NOT NULL,
	[ip] [varchar](15) NULL,
 CONSTRAINT [PK__Device__84BE14D750F1DAB8] PRIMARY KEY CLUSTERED 
(
	[deviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Home].[DeviceDetail]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Home].[DeviceDetail](
	[deviceDetailId] [int] IDENTITY(100,1) NOT NULL,
	[deviceDetailName] [varchar](max) NOT NULL,
	[deviceDescription] [varchar](max) NULL,
 CONSTRAINT [PK__DeviceDe__D08A743D17E7D298] PRIMARY KEY CLUSTERED 
(
	[deviceDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Home].[GroupDevice]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Home].[GroupDevice](
	[groupId] [int] NOT NULL,
	[deviceId] [int] NOT NULL,
 CONSTRAINT [PK_GroupDevice_1] PRIMARY KEY CLUSTERED 
(
	[groupId] ASC,
	[deviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Home].[Home]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Home].[Home](
	[homeId] [varchar](50) NOT NULL,
	[homeName] [nvarchar](max) NULL,
	[wifiName] [nvarchar](max) NULL,
	[mainAccount] [varchar](50) NULL,
 CONSTRAINT [PK__Home__0309556BDC0A1E45] PRIMARY KEY CLUSTERED 
(
	[homeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Home].[PowerUsed]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Home].[PowerUsed](
	[homeId] [varchar](50) NOT NULL,
	[roomId] [int] NOT NULL,
	[deviceId] [int] NOT NULL,
	[dateTime] [datetime] NOT NULL,
	[powerUsed] [float] NOT NULL,
 CONSTRAINT [PK_PowerUsed] PRIMARY KEY CLUSTERED 
(
	[homeId] ASC,
	[roomId] ASC,
	[deviceId] ASC,
	[dateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Home].[Room]    Script Date: 2021/2/22 下午 06:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Home].[Room](
	[roomId] [int] IDENTITY(100,1) NOT NULL,
	[homeId] [varchar](50) NOT NULL,
	[roomName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [App].[AccountLogin]  WITH CHECK ADD  CONSTRAINT [FK_AccountLogin_Account] FOREIGN KEY([accountId])
REFERENCES [App].[Account] ([accountId])
GO
ALTER TABLE [App].[AccountLogin] CHECK CONSTRAINT [FK_AccountLogin_Account]
GO
ALTER TABLE [App].[Camera]  WITH CHECK ADD  CONSTRAINT [FK_Camera_Account] FOREIGN KEY([accountId])
REFERENCES [App].[Account] ([accountId])
GO
ALTER TABLE [App].[Camera] CHECK CONSTRAINT [FK_Camera_Account]
GO
ALTER TABLE [App].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_Account] FOREIGN KEY([accountId])
REFERENCES [App].[Account] ([accountId])
GO
ALTER TABLE [App].[Device] CHECK CONSTRAINT [FK_Device_Account]
GO
ALTER TABLE [App].[GroupAccount]  WITH CHECK ADD  CONSTRAINT [FK_GroupAccount_Account] FOREIGN KEY([accountId])
REFERENCES [App].[Account] ([accountId])
GO
ALTER TABLE [App].[GroupAccount] CHECK CONSTRAINT [FK_GroupAccount_Account]
GO
ALTER TABLE [App].[GroupAccount]  WITH CHECK ADD  CONSTRAINT [FK_GroupAccount_Group] FOREIGN KEY([groupId])
REFERENCES [App].[Group] ([groupId])
GO
ALTER TABLE [App].[GroupAccount] CHECK CONSTRAINT [FK_GroupAccount_Group]
GO
ALTER TABLE [dbo].[Version]  WITH CHECK ADD  CONSTRAINT [FK_Version_Version] FOREIGN KEY([id])
REFERENCES [dbo].[Version] ([id])
GO
ALTER TABLE [dbo].[Version] CHECK CONSTRAINT [FK_Version_Version]
GO
ALTER TABLE [Home].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_DeviceDetail] FOREIGN KEY([deviceDetailId])
REFERENCES [Home].[DeviceDetail] ([deviceDetailId])
GO
ALTER TABLE [Home].[Device] CHECK CONSTRAINT [FK_Device_DeviceDetail]
GO
ALTER TABLE [Home].[Device]  WITH CHECK ADD  CONSTRAINT [FK_Device_Room] FOREIGN KEY([roomId])
REFERENCES [Home].[Room] ([roomId])
GO
ALTER TABLE [Home].[Device] CHECK CONSTRAINT [FK_Device_Room]
GO
ALTER TABLE [Home].[GroupDevice]  WITH CHECK ADD  CONSTRAINT [FK_GroupDevice_Device] FOREIGN KEY([deviceId])
REFERENCES [Home].[Device] ([deviceId])
GO
ALTER TABLE [Home].[GroupDevice] CHECK CONSTRAINT [FK_GroupDevice_Device]
GO
ALTER TABLE [Home].[GroupDevice]  WITH CHECK ADD  CONSTRAINT [FK_GroupDevice_Group] FOREIGN KEY([groupId])
REFERENCES [App].[Group] ([groupId])
GO
ALTER TABLE [Home].[GroupDevice] CHECK CONSTRAINT [FK_GroupDevice_Group]
GO
ALTER TABLE [Home].[Home]  WITH CHECK ADD  CONSTRAINT [FK_Home_Account] FOREIGN KEY([mainAccount])
REFERENCES [App].[Account] ([accountId])
GO
ALTER TABLE [Home].[Home] CHECK CONSTRAINT [FK_Home_Account]
GO
ALTER TABLE [Home].[PowerUsed]  WITH CHECK ADD  CONSTRAINT [FK_PowerUsed_Device] FOREIGN KEY([deviceId])
REFERENCES [Home].[Device] ([deviceId])
GO
ALTER TABLE [Home].[PowerUsed] CHECK CONSTRAINT [FK_PowerUsed_Device]
GO
ALTER TABLE [Home].[PowerUsed]  WITH CHECK ADD  CONSTRAINT [FK_PowerUsed_Home] FOREIGN KEY([homeId])
REFERENCES [Home].[Home] ([homeId])
GO
ALTER TABLE [Home].[PowerUsed] CHECK CONSTRAINT [FK_PowerUsed_Home]
GO
ALTER TABLE [Home].[PowerUsed]  WITH CHECK ADD  CONSTRAINT [FK_PowerUsed_Room] FOREIGN KEY([roomId])
REFERENCES [Home].[Room] ([roomId])
GO
ALTER TABLE [Home].[PowerUsed] CHECK CONSTRAINT [FK_PowerUsed_Room]
GO
ALTER TABLE [Home].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Home] FOREIGN KEY([homeId])
REFERENCES [Home].[Home] ([homeId])
GO
ALTER TABLE [Home].[Room] CHECK CONSTRAINT [FK_Room_Home]
GO
USE [master]
GO
ALTER DATABASE [Securicy_home] SET  READ_WRITE 
GO
