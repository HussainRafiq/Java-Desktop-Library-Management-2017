USE [master]
GO
/****** Object:  Database [booklibrary]    Script Date: 11/1/2017 4:42:43 AM ******/
CREATE DATABASE [booklibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'booklibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\booklibrary.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'booklibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\booklibrary_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [booklibrary] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [booklibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [booklibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [booklibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [booklibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [booklibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [booklibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [booklibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [booklibrary] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [booklibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [booklibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [booklibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [booklibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [booklibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [booklibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [booklibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [booklibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [booklibrary] SET  DISABLE_BROKER 
GO
ALTER DATABASE [booklibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [booklibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [booklibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [booklibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [booklibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [booklibrary] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [booklibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [booklibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [booklibrary] SET  MULTI_USER 
GO
ALTER DATABASE [booklibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [booklibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [booklibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [booklibrary] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'booklibrary', N'ON'
GO
USE [booklibrary]
GO
/****** Object:  StoredProcedure [dbo].[deleted]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleted] @code varchar(100)
as
delete from bookdata where book_code like @code

GO
/****** Object:  StoredProcedure [dbo].[inserted]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[inserted] @code varchar(1000),@name varchar(1000),@subject varchar(1000),@auther varchar(1000)
as
insert into bookdata values(@code,@name,@subject,@auther)
GO
/****** Object:  StoredProcedure [dbo].[sa]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sa] @auther varchar(100)
as
select * from bookdata where auther like @auther

GO
/****** Object:  StoredProcedure [dbo].[sc]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sc] @code varchar(100)
as
select * from bookdata where book_code like @code

GO
/****** Object:  StoredProcedure [dbo].[sn]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sn] @name varchar(100)
as
select * from bookdata where book_name like @name

GO
/****** Object:  StoredProcedure [dbo].[ss]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ss] @SUBJECT varchar(100)
as
select * FROM BOOKDATA WHERE SUBJECT like @SUBJECT

GO
/****** Object:  StoredProcedure [dbo].[st_id]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[st_id]  @id varchar(100)
as
select * from issuedata
GO
/****** Object:  StoredProcedure [dbo].[st_inserted]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[st_inserted] @st_name varchar(100),@st_lname varchar(100),@book_name varchar(100),@auther varchar(100),@st_id varchar(100),@date_issue varchar(100),@date_return varchar(100),@record_code varchar(100)
as
insert into issuedata values(@st_name,@st_lname,@book_name,@auther,@st_id ,@date_issue,@date_return,@record_code)

GO
/****** Object:  StoredProcedure [dbo].[st_sa]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[st_sa] @auther varchar(100)
as
select * from issuedata where bauther like @auther

GO
/****** Object:  StoredProcedure [dbo].[st_sb]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[st_sb] @name varchar(100)
as
select * from issuedata where bname like @name

GO
/****** Object:  StoredProcedure [dbo].[st_sn]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[st_sn] @st_name varchar(100)
as
select * from issuedata where st_name like @st_name

GO
/****** Object:  StoredProcedure [dbo].[st_src]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[st_src] @record_code varchar(100)
as
select * from issuedata where record_code like @record_code

GO
/****** Object:  StoredProcedure [dbo].[st_st_id]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[st_st_id]  @id varchar(100)
as
select * from issuedata where st_id like @id
GO
/****** Object:  Table [dbo].[admin]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] NULL,
	[name] [varchar](100) NULL,
	[passwords] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bookdata]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bookdata](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[book_code] [varchar](100) NULL,
	[book_name] [varchar](100) NULL,
	[subject] [varchar](100) NULL,
	[auther] [varchar](100) NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[issuedata]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[issuedata](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[st_name] [varchar](100) NULL,
	[st_lname] [varchar](100) NULL,
	[bname] [varchar](100) NULL,
	[bauther] [varchar](100) NULL,
	[date_issue] [varchar](100) NULL,
	[date_return] [varchar](100) NULL,
	[record_code] [varchar](100) NULL,
	[st_id] [varchar](100) NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[returndata]    Script Date: 11/1/2017 4:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[returndata](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[st_name] [varchar](100) NULL,
	[st_lname] [varchar](100) NULL,
	[bname] [varchar](100) NULL,
	[bauther] [varchar](100) NULL,
	[date_issue] [varchar](100) NULL,
	[date_return] [varchar](100) NULL,
	[record_code] [varchar](100) NULL,
	[st_id] [varchar](100) NULL,
UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [booklibrary] SET  READ_WRITE 
GO
