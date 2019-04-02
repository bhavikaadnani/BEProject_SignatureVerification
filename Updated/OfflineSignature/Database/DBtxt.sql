USE [OfflineSignature]
GO
/****** Object:  Table [dbo].[Register]    Script Date: 03/20/2019 14:06:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Register](
	[Sid] [int] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](500) NULL,
	[Lname] [varchar](500) NULL,
	[EmailId] [varchar](500) NULL,
	[Address] [varchar](500) NULL,
	[accountno] [varchar](500) NULL,
	[Adhaarcard] [varchar](500) NULL,
	[Profile] [varchar](500) NULL,
	[Signature] [varchar](500) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
