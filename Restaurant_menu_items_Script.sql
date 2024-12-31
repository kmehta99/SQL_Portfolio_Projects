USE [master]
GO

/****** Object:  Table [dbo].[menu_items]    Script Date: 31-12-2024 14:35:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[menu_items](
	[menu_item_id] [smallint] NOT NULL,
	[item_name] [varchar](45) NULL,
	[category] [varchar](45) NULL,
	[price] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[menu_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


