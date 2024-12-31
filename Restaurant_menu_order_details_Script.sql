USE [master]
GO

/****** Object:  Table [dbo].[order_details]    Script Date: 31-12-2024 14:36:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[order_details](
	[order_details_id] [smallint] NOT NULL,
	[order_id] [smallint] NOT NULL,
	[order_date] [date] NULL,
	[order_time] [time](7) NULL,
	[item_id] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[order_details_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


