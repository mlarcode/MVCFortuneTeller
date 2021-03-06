USE [master]
GO
/****** Object:  Database [FortuneTellerMVC2]    Script Date: 9/19/2016 1:12:23 AM ******/
CREATE DATABASE [FortuneTellerMVC2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FortuneTellerMVC2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FortuneTellerMVC2.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FortuneTellerMVC2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FortuneTellerMVC2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FortuneTellerMVC2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FortuneTellerMVC2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FortuneTellerMVC2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET ARITHABORT OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FortuneTellerMVC2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FortuneTellerMVC2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FortuneTellerMVC2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FortuneTellerMVC2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FortuneTellerMVC2] SET  MULTI_USER 
GO
ALTER DATABASE [FortuneTellerMVC2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FortuneTellerMVC2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FortuneTellerMVC2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FortuneTellerMVC2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FortuneTellerMVC2] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FortuneTellerMVC2]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 9/19/2016 1:12:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[FavoriteColorsID] [int] IDENTITY(1,1) NOT NULL,
	[Color] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[FavoriteColorsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 9/19/2016 1:12:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthMonth] [int] NOT NULL,
	[FavoriteColors] [int] NOT NULL,
	[Age] [int] NOT NULL,
	[NumberOfSiblings] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Months]    Script Date: 9/19/2016 1:12:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Months](
	[BirthMonthID] [int] IDENTITY(1,1) NOT NULL,
	[Month] [nchar](15) NULL,
 CONSTRAINT [PK_Months] PRIMARY KEY CLUSTERED 
(
	[BirthMonthID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Colors1] FOREIGN KEY([FavoriteColors])
REFERENCES [dbo].[Colors] ([FavoriteColorsID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Colors1]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Months] FOREIGN KEY([BirthMonth])
REFERENCES [dbo].[Months] ([BirthMonthID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Months]
GO
USE [master]
GO
ALTER DATABASE [FortuneTellerMVC2] SET  READ_WRITE 
GO
