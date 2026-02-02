USE [Data_cleaning_projects]
GO

/****** Object:  Table [dbo].[audible_uncleaned]    Script Date: 2026-02-02 11:25:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[audible_uncleaned](
	[name] [nvarchar](max) NULL,
	[author] [nvarchar](100) NULL,
	[narrator] [nvarchar](150) NULL,
	[time] [nvarchar](150) NULL,
	[releasedate] [nvarchar](150) NULL,
	[language] [nvarchar](50) NULL,
	[stars] [nvarchar](50) NULL,
	[ratings] [varchar](150) NULL,
	[price] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO