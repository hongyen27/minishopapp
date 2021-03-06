USE [Shop_V2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [bigint] NOT NULL,
	[Ho] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[Company_Id] [varchar](15) NULL,
	[Username] [varchar](50) NULL,
	[Password] [binary](64) NULL,
	[Address] [nvarchar](200) NULL,
	[SDT] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Status] [varchar](15) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountInRole]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountInRole](
	[AccountId] [bigint] NOT NULL,
	[RoleId] [int] NOT NULL,
	[isDelete] [bit] NULL,
 CONSTRAINT [PK_AccountInRole] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NULL,
	[CreateTime] [datetime] NULL,
	[TaxCode] [nvarchar](20) NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[ImageUrl] [varchar](200) NULL,
	[Status] [varchar](15) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[AccountId] [bigint] NULL,
	[ProductId] [int] NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[Status] [varchar](15) NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [varchar](15) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[Address] [nvarchar](200) NULL,
	[SDT] [varchar](15) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CTPN]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTPN](
	[MAPN] [int] NOT NULL,
	[Material_ID] [int] NOT NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL,
	[Notes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_CTPN] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC,
	[Material_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [varchar](15) NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [bigint] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] NOT NULL,
	[AccountId] [bigint] NULL,
	[Status] [varchar](15) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[Notes] [nvarchar](max) NULL,
	[DeliverID] [bigint] NULL,
	[DeliverDT] [datetime] NULL,
	[Staff_ID] [bigint] NULL,
	[Staff_DT] [datetime] NULL,
	[Address] [nvarchar](200) NULL,
	[SDT] [varchar](50) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PN]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PN](
	[MAPN] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [bigint] NULL,
	[Status] [varchar](15) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
 CONSTRAINT [PK_PN] PRIMARY KEY CLUSTERED 
(
	[MAPN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL,
	[ImageUrl] [varchar](200) NULL,
	[CreateTime] [datetime] NULL,
	[UpdateTime] [datetime] NULL,
	[CategoryId] [int] NULL,
	[Status] [varchar](15) NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [varchar](15) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Code] [varchar](15) NULL,
	[TYPE_CODE] [varchar](15) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([Id], [Ho], [Ten], [Company_Id], [Username], [Password], [Address], [SDT], [Email], [Status]) VALUES (1951709995, N'hoang', N'thuong', NULL, N'lep', 0x5D77FE749AE6E091CC7B1090CACE51D22FC2991C05A2334F87708E52DA81E5AF9A70BA52101B422C93477E6D5CBAA9CC4643EEBD1B9D0730BF04D1644B0D2C18, N'97 Man Thiện, Phường Hiệp Phú', N'123123123', N'hoangthuongboz@gmail.com', N'A')
INSERT [dbo].[Account] ([Id], [Ho], [Ten], [Company_Id], [Username], [Password], [Address], [SDT], [Email], [Status]) VALUES (2735500288, N'Hoàng', N'Lép', NULL, N'thuong', 0xE849E2EF1ED18672A5F714808E95F7C851D6AEC9C49F547248037474B5D96A0E4B84A9C71F03F2E2C37B19C149AF0EAA5518DD9BF2CC612CF74D7D8181847130, N'97 Man Thiện, Phường Hiệp Phú', N'123', N'hoangthuongboz@gmail.com', N'A')
INSERT [dbo].[Account] ([Id], [Ho], [Ten], [Company_Id], [Username], [Password], [Address], [SDT], [Email], [Status]) VALUES (3239040753, N'Hoàng', N'Thương', NULL, N'thuongdr', 0x60F6F1588B6329B5219DA726AE83C465A829FD6D8F41D79625FA2D1B0F6BEBC4CAAC45F1BA448B7BFBB954E56809D305ABB4E4A805E2F46E110D6E4AF0D82518, N'97 Man Thiện, Phường Hiệp Phú', N'123123123', N'hoangthuongboz@gmail.com', N'A')
INSERT [dbo].[Account] ([Id], [Ho], [Ten], [Company_Id], [Username], [Password], [Address], [SDT], [Email], [Status]) VALUES (123132132123131, N'', N'admin', NULL, N'admin', 0x6FD8A78DC86D8F48C9AD4316DA242125F9C32B085F35C665EF592B60F5CD5B41D06EF21C7A95B922F1783630052C33888614BAAA61E06CE9DA740538F9924C6C, N'97MT', N'1231321323', N'admin@gmail.com', N'A')
GO
INSERT [dbo].[AccountInRole] ([AccountId], [RoleId], [isDelete]) VALUES (1951709995, 552116943, 0)
INSERT [dbo].[AccountInRole] ([AccountId], [RoleId], [isDelete]) VALUES (2735500288, 552116943, 0)
INSERT [dbo].[AccountInRole] ([AccountId], [RoleId], [isDelete]) VALUES (3239040753, 552116943, 0)
INSERT [dbo].[AccountInRole] ([AccountId], [RoleId], [isDelete]) VALUES (3239040753, 2132113211, 0)
INSERT [dbo].[AccountInRole] ([AccountId], [RoleId], [isDelete]) VALUES (123132132123131, 1400031737, 0)
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Description], [ImageUrl], [Status]) VALUES (1, N'Tản nhiệt', N'Giúp giảm nhiệt độ máy tính', NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [ImageUrl], [Status]) VALUES (2, N'Bàn phím', N'Bàn phím laptop', NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [ImageUrl], [Status]) VALUES (3, N'Chuột', N'Chuột máy tính', NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [ImageUrl], [Status]) VALUES (4, N'Tai nghe', N'Tai nghe laptop', NULL, NULL)
INSERT [dbo].[Categories] ([Id], [Name], [Description], [ImageUrl], [Status]) VALUES (5, N'Khác', N'Những sản phẩm thú vị', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Company] ([Id], [Name], [Description], [Address], [SDT]) VALUES (N'100', N'Grap', NULL, NULL, NULL)
INSERT [dbo].[Company] ([Id], [Name], [Description], [Address], [SDT]) VALUES (N'101', N'GrapFoot', NULL, NULL, NULL)
GO
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (1572968208, 2, 232000, 3)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (1572968208, 14, 390000, 1)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (2291698401, 2, 232000, 4)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (2291698401, 3, 246500, 1)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (2291698401, 4, 290000, 2)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (87541617243535722, 2, 232000, 3)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (141667537297680152, 2, 232000, 4)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (141667537297680152, 3, 246500, 5)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (234760852605256173, 1, 261000, 4)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (245308680846477150, 2, 232000, 6)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (245308680846477150, 5, 590000, 5)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (245308680846477150, 8, 540000, 10)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (368136694337295006, 2, 232000, 7)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (491644365667636370, 3, 246500, 8)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (491644365667636370, 6, 440000, 3)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (491644365667636370, 12, 490000, 5)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (491644365667636370, 24, 29000, 5)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (666188967824337316, 2, 232000, 2)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (666188967824337316, 3, 246500, 3)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (666188967824337316, 6, 440000, 3)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (666188967824337316, 7, 440000, 4)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (821130410288780368, 4, 290000, 3)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (821130410288780368, 5, 590000, 3)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (1032695213639609130, 3, 246500, 5)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (1032695213639609130, 4, 290000, 4)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (2091878486719805355, 1, 261000, 4)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (2091878486719805355, 7, 440000, 3)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (2488238607486481104, 4, 290000, 4)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (2715464930565051432, 3, 246500, 7)
INSERT [dbo].[OrderItems] ([Id], [ProductId], [Price], [Quantity]) VALUES (2715464930565051432, 8, 540000, 4)
GO
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (1572968208, 2735500288, N'P', CAST(N'2020-12-16T01:08:40.500' AS DateTime), NULL, N'Cẩn thận', NULL, NULL, NULL, NULL, N'Số 10 Đường 1011, Phường Phúc Tân, Quận Hoàn Kiếm, Thành phố Hà Nội, Việt Nam', N'0372704074')
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (2291698401, 2735500288, N'S', CAST(N'2020-12-14T09:47:46.907' AS DateTime), NULL, N'123', 3239040753, NULL, 123132132123131, NULL, N'Số 10 Đường 1011, Phường Phúc Tân, Quận Hoàn Kiếm, Thành phố Hà Nội, Việt Nam', N'0372704074')
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (87541617243535722, 23213243156423, N'S', CAST(N'2020-08-29T15:20:42.413' AS DateTime), NULL, N'Cẩn thận', 2945659753638841483, CAST(N'2020-08-30T16:22:45.727' AS DateTime), 123132132123131, NULL, N'99MT', N'0372704074')
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (141667537297680152, 23213243156423, N'S', CAST(N'2020-10-26T21:15:49.997' AS DateTime), NULL, N'123123123123', 2945659753638841483, CAST(N'2020-10-26T21:18:19.250' AS DateTime), 123132132123131, NULL, N'123123123', N'123123123')
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (234760852605256173, 23213243156423, N'S', CAST(N'2020-08-30T23:46:26.083' AS DateTime), NULL, N'cẩn thận nha', 2945659753638841483, CAST(N'2020-10-26T21:14:59.140' AS DateTime), 123132132123131, NULL, N'51a', N'06544461')
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (245308680846477150, 598534035076562937, N'C', CAST(N'2020-12-13T09:30:39.060' AS DateTime), NULL, N'abc', 1747456637809668400, NULL, 123132132123131, NULL, N'97 mt', N'12352523423')
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (368136694337295006, NULL, N'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (491644365667636370, 23213243156423, N'S', CAST(N'2020-08-30T23:41:11.593' AS DateTime), NULL, N'Giao hàng 10p', 2945659753638841483, CAST(N'2020-08-30T23:44:44.873' AS DateTime), 123132132123131, NULL, N'78mt', N'0566485421')
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (666188967824337316, 2735500288, N'S', CAST(N'2020-12-13T15:11:15.670' AS DateTime), NULL, N'123123123', 3239040753, NULL, 123132132123131, NULL, N'adadad', N'123123123')
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (821130410288780368, 23213243156423, N'S', CAST(N'2020-09-01T09:43:42.780' AS DateTime), NULL, N'Can than', 2945659753638841483, CAST(N'2020-09-01T09:48:43.620' AS DateTime), 123132132123131, NULL, N'97MT', N'0372704074')
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (1032695213639609130, 23213243156423, N'S', CAST(N'2020-09-01T11:33:01.940' AS DateTime), NULL, N'1213', 2945659753638841483, CAST(N'2020-09-01T11:35:29.897' AS DateTime), 123132132123131, NULL, N'97 MAN THIỆN', N'0372704074')
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (2091878486719805355, NULL, N'U', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (2488238607486481104, 23213243156423, N'X', CAST(N'2020-08-29T15:21:10.020' AS DateTime), NULL, N'Giao hàng 15p', 5645665645566, NULL, 123132132123131, NULL, N'100MT', N'0646546121')
INSERT [dbo].[Orders] ([Id], [AccountId], [Status], [CreateTime], [UpdateTime], [Notes], [DeliverID], [DeliverDT], [Staff_ID], [Staff_DT], [Address], [SDT]) VALUES (2715464930565051432, 123132132123131, N'S', CAST(N'2020-08-28T17:24:49.490' AS DateTime), NULL, N'Cẩn thận', 2945659753638841483, CAST(N'2020-08-30T23:44:45.590' AS DateTime), 123132132123131, NULL, N'101MT', N'0234565454')
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [CreateTime], [UpdateTime], [CategoryId], [Status], [Discount]) VALUES (1, N'Tản nhiệt yamato', N'2 quạt ', 290000, 50, N'tannhiet1.png', CAST(N'2020-08-23T00:00:00.000' AS DateTime), NULL, 1, N'1', 0.1)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [CreateTime], [UpdateTime], [CategoryId], [Status], [Discount]) VALUES (2, N'Tản nhiệt tosiba', N'2 luồng', 290000, 50, N'tannhiet2.png', CAST(N'2020-08-23T00:00:00.000' AS DateTime), NULL, 1, N'1', 0.2)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [CreateTime], [UpdateTime], [CategoryId], [Status], [Discount]) VALUES (9, N'Bàn phím logitech', N'Bàn phím nhẹ nhàng', 490000, 50, N'banphim1.png', CAST(N'2020-08-23T00:00:00.000' AS DateTime), NULL, 2, N'1', NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [CreateTime], [UpdateTime], [CategoryId], [Status], [Discount]) VALUES (10, N'Bàn phím gisaba', N'Thẻ hiện sự trẻ trung', 490000, 50, N'banphim2.png', CAST(N'2020-08-23T00:00:00.000' AS DateTime), NULL, 2, N'1', NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [CreateTime], [UpdateTime], [CategoryId], [Status], [Discount]) VALUES (14, N'Chuột không dây', N'Đem lại sự trải nghiệm mới', 390000, 50, N'chuot1.png', CAST(N'2020-08-23T00:00:00.000' AS DateTime), NULL, 3, N'1', NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [CreateTime], [UpdateTime], [CategoryId], [Status], [Discount]) VALUES (17, N'Chuột logitech g120', N'Chuột chơi game', 39000, 70, N'chuot2.png', CAST(N'2020-08-23T00:00:00.000' AS DateTime), NULL, 3, N'1', NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [CreateTime], [UpdateTime], [CategoryId], [Status], [Discount]) VALUES (18, N'Tai nghe sasi', N'Thoải mái', 19000, 70, N'tainghe1.png', CAST(N'2020-08-23T00:00:00.000' AS DateTime), NULL, 4, N'1', NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [CreateTime], [UpdateTime], [CategoryId], [Status], [Discount]) VALUES (21, N'Tai nghe buma', N'Dễ chịu', 19000, 70, N'tainghe2.png', CAST(N'2020-08-23T00:00:00.000' AS DateTime), NULL, 4, N'1', NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [CreateTime], [UpdateTime], [CategoryId], [Status], [Discount]) VALUES (24, N'SSD Samsung', N'Nâng cấp hiệu năng của máy', 29000, 70, N'khac1.png', CAST(N'2020-08-23T00:00:00.000' AS DateTime), NULL, 5, N'1', NULL)
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Quantity], [ImageUrl], [CreateTime], [UpdateTime], [CategoryId], [Status], [Discount]) VALUES (25, N'Ram 4g', N'Nâng cấp năng suất của máy', 29000, 70, N'khac2.png', CAST(N'2020-08-23T00:00:00.000' AS DateTime), NULL, 5, N'1', NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (552116943, N'Customer')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (827599740, N'Staff')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1186665084, N'Member')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1400031737, N'Administrator')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1505278279, N'Vendor')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1657562242, N'Supplier')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2132113211, N'DELIVER')
GO
INSERT [dbo].[Status] ([Id], [Name], [Code], [TYPE_CODE]) VALUES (N'1', N'Đang chờ', N'P', N'PROCESS_ORDER')
INSERT [dbo].[Status] ([Id], [Name], [Code], [TYPE_CODE]) VALUES (N'2', N'Hủy', N'X', N'PROCESS_ORDER')
INSERT [dbo].[Status] ([Id], [Name], [Code], [TYPE_CODE]) VALUES (N'3', N'Đang giao hàng', N'C', N'PROCESS_ORDER')
INSERT [dbo].[Status] ([Id], [Name], [Code], [TYPE_CODE]) VALUES (N'4', N'Đã giao', N'S', N'PROCESS_ORDER')
GO
/****** Object:  StoredProcedure [dbo].[AddCart]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddCart]
(
	@Id BIGINT,
	@ProductId INT,
	@Quantity INT,
	@Price INT
)
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM Orders WHERE Id = @Id)
		BEGIN
		INSERT INTO Orders(Id, Status) VALUES (@Id, 'U');
		END
	IF EXISTS (SELECT * FROM OrderItems WHERE Id = @Id AND ProductId = @ProductId)
	BEGIN
		UPDATE OrderItems SET Quantity += @Quantity WHERE Id = @Id AND ProductId = @ProductId
	END
	ELSE
	BEGIN
		INSERT INTO OrderItems (Id, ProductId, Quantity, Price) VALUES (@Id, @ProductId, @Quantity,@Price);
		
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[AddCategory]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddCategory]
(
	@Name NVARCHAR(64),
	@Description NVARCHAR(512)
)
AS
BEGIN
	INSERT INTO Categories (Name, Description) VALUES (@Name, @Description);
END
GO
/****** Object:  StoredProcedure [dbo].[AddMember]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddMember]
(
	@Id BIGINT,
	@Ho NVARCHAR(50),
	@Ten NVARCHAR(50),
	@Username VARCHAR(50),
	@Password BINARY(64),
	@Email VARCHAR(50),
	@Address NVARCHAR(200),
	@SDT VARCHAR(50),
	@Company_Id VARCHAR(15) = null
)
AS
BEGIN
	IF NOT EXISTS(SELECT * FROM Account WHERE Username = @Username)
	BEGIN 
		INSERT INTO Account(Id,Ho,Ten,Username,Password,Email,Address,SDT,Company_Id,Status) VALUES
			(@Id,@Ho,@Ten,@Username,@Password,@Email,@Address,@SDT,@Company_Id,N'A')
			INSERT INTO AccountInRole(AccountId,RoleId,isDelete)
			VALUES(@Id,552116943,'0')
			RETURN 1;
	END
	ELSE
		RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[AddProduct]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddProduct]
(
	@CategoryId INT,
	@Name NVARCHAR(200),
	@Description NVARCHAR(MAX),
	@Price INT,
	@Quantity INT,
	@ImageUrl NVARCHAR(128) = NULL,
	@Discount FLOAT
)
AS
	INSERT INTO Products(CategoryId, Name, Price, Quantity, Description, ImageUrl, CreateTime, UpdateTime, Discount, Status) VALUES
		(@CategoryId, @Name, @Price, @Quantity, @Description, @ImageUrl, GETDATE(),null,@Discount,N'1');
GO
/****** Object:  StoredProcedure [dbo].[AddRole]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AddRole]
(
	@Id INT,
	@Name VARCHAR(16)
)
AS
	INSERT INTO Roles(Id, Name) VALUES (@Id, @Name);
GO
/****** Object:  StoredProcedure [dbo].[CLEAR_DATA]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[CLEAR_DATA]
AS
BEGIN
	DELETE AccountInRole WHERE AccountId <> '123132132123131'
	DELETE FROM Account WHERE Username <> 'admin'
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCart]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteCart](@Id BIGINT, @ProductId INT)
AS
	DELETE FROM OrderItems WHERE Id=@Id AND ProductId=@ProductId;
GO
/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteCategory](@Id INT)
AS
	DELETE FROM Categories WHERE Id = @Id;
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteProduct](@Id INT)
AS
	DELETE FROM Products WHERE Id=@Id;
GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteRole](@Id INT)
AS
	DELETE FROM Roles WHERE Id=@Id;
GO
/****** Object:  StoredProcedure [dbo].[EditCart]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditCart](@Id BIGINT, @ProductId INT, @Quantity INT)
AS
	UPDATE OrderItems SET Quantity=@Quantity WHERE Id=@Id AND ProductId=@ProductId;

GO
/****** Object:  StoredProcedure [dbo].[EditCategory]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditCategory]
(
	@Id INT,
	@Name NVARCHAR(64),
	@Description NVARCHAR(512)
)
AS
BEGIN
	UPDATE Categories SET Name = @Name, Description = @Description WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[EditProduct]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditProduct]
(
	@Id INT,
	@CategoryId INT,
	@Name NVARCHAR(128),
	@Price INT,
	@Quantity INT,
	@Description NVARCHAR(MAX),
	@ImageUrl NVARCHAR(128) = NULL,
	@Discount FLOAT
)
AS
	UPDATE Products SET CategoryId = @CategoryId, Name = @Name, Price = @Price, Quantity = @Quantity, Description = @Description, ImageUrl = @ImageUrl,
		Discount = @Discount WHERE Id = @Id;
GO
/****** Object:  StoredProcedure [dbo].[EditRole]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EditRole]
(
	@Id INT,
	@Name VARCHAR(16)
)
AS
	UPDATE Roles SET Name=@Name WHERE Id=@Id;
GO
/****** Object:  StoredProcedure [dbo].[GetCarts]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCarts](@Id BIGINT)
AS
	SELECT c.Id, c.ProductId, p.Name, c.Price, c.Quantity, p.ImageUrl 
	FROM OrderItems c JOIN Products p ON c.ProductId = p.Id AND c.Id = @Id;
GO
/****** Object:  StoredProcedure [dbo].[GetCategories]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCategories]
AS
	SELECT * FROM Categories;
GO
/****** Object:  StoredProcedure [dbo].[GetCategoriesAndProducts]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCategoriesAndProducts]
AS
BEGIN
	SELECT * FROM Products;
	SELECT * FROM Categories;
END
GO
/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCategoryById](@id INT)
AS
	SELECT * FROM Categories WHERE Id = @id;
GO
/****** Object:  StoredProcedure [dbo].[GetCategoryDetail]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetCategoryDetail](@Id INT)
AS
BEGIN
	SELECT * FROM Categories WHERE Id=@Id;
	SELECT * FROM Products WHERE CategoryId=@Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetDelivers]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetDelivers]
AS
BEGIN
	SELECT A.Id ,CASE WHEN C.Name IS NULL OR C.Name = '' THEN (A.Ho + ' ' + A.Ten) ELSE (A.Ho + ' ' + A.Ten + '-' + C.Name) END AS TT_Delivers FROM Account A 
	LEFT JOIN Company C ON A.Company_Id = C.Id
	LEFT JOIN AccountInRole AI ON AI.AccountId = A.Id
	LEFT JOIN Roles R ON R.Id = AI.RoleId
	WHERE R.Name = 'DELIVER'
END
GO
/****** Object:  StoredProcedure [dbo].[GetMemberAndRoles]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetMemberAndRoles](@Id BIGINT)
AS
BEGIN
	SELECT a.Id, a.Username, a.Email, a.Address, a.SDT, a.Ho, a.Ten,a.Status,a.Company_Id FROM Account a WHERE a.Id=@Id;
	--IIF(MemberId IS NULL,0,1) kieu int nen phai dung CAST ep kieu ve kieu BIT
	SELECT r.Id,Name,CAST(IIF(AccountId IS NULL,0,1)AS BIT)AS Checked FROM Roles r LEFT JOIN 
		(SELECT ar.AccountId,ar.RoleId FROM AccountInRole ar WHERE ar.AccountId=@Id AND IsDelete=0) AS Tbl
		ON r.Id=Tbl.RoleId;
END

GO
/****** Object:  StoredProcedure [dbo].[GetMemberById]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetMemberById](@Id BIGINT)
AS
	SELECT * FROM Account WHERE Id=@Id;
GO
/****** Object:  StoredProcedure [dbo].[GetMembers]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetMembers]
AS
	SELECT * FROM Account;
GO
/****** Object:  StoredProcedure [dbo].[GetOrderByAccountId]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetOrderByAccountId]
(
	@AccountId BIGINT = null
)
AS
BEGIN
	DECLARE @Roles table (RoleName NVARCHAR(50))
	INSERT INTO @Roles SELECT R.Name FROM Account A 
	LEFT JOIN AccountInRole AR ON A.Id = AR.AccountId AND AR.isDelete = 0
	LEFT JOIN Roles R ON R.Id = AR.RoleId 
	WHERE A.Id = @AccountId

	if EXISTS(SELECT * FROM @Roles WHERE RoleName = 'Administrator' OR RoleName = 'Staff') 
	BEGIN
		SELECT O.Id, O.AccountId,(A.Ho +' '+A.Ten) AS HOTEN, S.Name AS Status, S.Code AS Status_code, O.CreateTime,O.UpdateTime, (AD.Ho +' '+AD.Ten) AS HOTEN_DL, O.DeliverDT , AD.SDT AS SDT_DL,
		(AC.Ho +' '+AC.Ten) AS HOTEN_ST, O.Staff_DT,
		O.Address, O.SDT, O.Notes--, OI.Price, OI.Quantity--, P.Name AS ProductName, P.ImageUrl
		FROM Orders O 
		LEFT JOIN Account A ON O.AccountId = A.Id
		LEFT JOIN Account AD ON AD.Id = O.DeliverID
		LEFT JOIN Account AC ON AC.Id = O.Staff_ID
		--LEFT JOIN OrderItems OI ON OI.Id = O.Id
		--LEFT JOIN Products P ON P.Id = OI.ProductId
		LEFT JOIN Status S ON O.Status = S.Code 
		WHERE O.CreateTime IS NOT NULL
	END
	ELSE IF EXISTS(SELECT * FROM @Roles WHERE RoleName = 'DELIVER')
	BEGIN
		SELECT O.Id,O.AccountId,(A.Ho +' '+A.Ten) AS HOTEN, S.Name AS Status, S.Code AS Status_code, O.CreateTime,O.UpdateTime, (AD.Ho +' '+AD.Ten) AS HOTEN_DL, O.DeliverDT , AD.SDT AS SDT_DL,
		(AC.Ho +' '+AC.Ten) AS HOTEN_ST, O.Staff_DT,
		O.Address, O.SDT, O.Notes--, OI.Price, OI.Quantity--, P.Name AS ProductName, P.ImageUrl
		FROM Orders O 
		LEFT JOIN Account A ON O.AccountId = A.Id
		LEFT JOIN Account AD ON AD.Id = O.DeliverID
		LEFT JOIN Account AC ON AC.Id = O.Staff_ID
		--LEFT JOIN OrderItems OI ON OI.Id = O.Id
		--LEFT JOIN Products P ON P.Id = OI.ProductId
		LEFT JOIN Status S ON O.Status = S.Code 
		WHERE 1=1 
		--AND O.Status = 'C'
		AND O.DeliverID = @AccountId
		AND (O.DeliverID IS NOT NULL OR O.DeliverID = @AccountId)
	END
	ELSE
	BEGIN
		SELECT O.Id,O.AccountId,(A.Ho +' '+A.Ten) AS HOTEN, S.Name AS Status, S.Code AS Status_code, O.CreateTime,O.UpdateTime, (AD.Ho +' '+AD.Ten) AS HOTEN_DL, O.DeliverDT , AD.SDT AS SDT_DL,
		(AC.Ho +' '+AC.Ten) AS HOTEN_ST, O.Staff_DT,
		O.Address, O.SDT, O.Notes--, OI.Price, OI.Quantity--, P.Name AS ProductName, P.ImageUrl
		FROM Orders O 
		LEFT JOIN Account A ON O.AccountId = A.Id
		LEFT JOIN Account AD ON AD.Id = O.DeliverID
		LEFT JOIN Account AC ON AC.Id = O.Staff_ID
		--LEFT JOIN OrderItems OI ON OI.Id = O.Id
		--LEFT JOIN Products P ON P.Id = OI.ProductId
		LEFT JOIN Status S ON O.Status = S.Code 
	WHERE O.AccountId = @AccountId AND CreateTime IS NOT NULL
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetOrderById]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetOrderById](@Id BIGINT)
AS
	SELECT * FROM Orders WHERE Id = @Id;
GO
/****** Object:  StoredProcedure [dbo].[GetOrderItemsByAccountId]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetOrderItemsByAccountId](@Id BIGINT)
AS
	SELECT O.Id, P.Id AS ProductId, P.Name ,OI.Quantity, OI.Price, P.ImageUrl FROM Orders O
	LEFT JOIN OrderItems OI ON OI.Id = O.Id 
	LEFT JOIN Products P ON OI.ProductId = P.Id
	WHERE 1=1
	AND O.Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[GetProductById]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetProductById](@Id INT)
AS
	SELECT * FROM Products WHERE Id = @Id;
GO
/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetProducts]
AS
	SELECT * FROM Products;
GO
/****** Object:  StoredProcedure [dbo].[GetProductsByCategory]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetProductsByCategory](@Id INT)
AS
	SELECT * FROM Products WHERE CategoryId = @Id;
GO
/****** Object:  StoredProcedure [dbo].[GetProductsDetail]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetProductsDetail](@Id INT)
AS
BEGIN
	SELECT * FROM Products WHERE Id=@Id;
	DECLARE @CategoryId INT;
	SELECT @CategoryId=CategoryId FROM Products WHERE Id=@Id;
	SELECT * FROM Products WHERE Id<>@Id AND CategoryId=@CategoryId;
END

GO
/****** Object:  StoredProcedure [dbo].[GetProductsPagination]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetProductsPagination]
(
	@Start INT,
	@END INT,
	@Total INT OUTPUT
)
AS
	BEGIN
		SELECT * FROM --SELECT ROW_NUMBER() OVER(ORDER BY ProductId) AS RowNum, * FROM Product chon nhung hang (ung voi productid tu bang Product) nam giua vi tri start va end
			(SELECT ROW_NUMBER() OVER(ORDER BY Id) AS RowNum, * FROM Products) AS Tbl
			WHERE Tbl.RowNum BETWEEN @Start AND @End;
		SELECT @Total=COUNT(*) FROM Products;
	END
GO
/****** Object:  StoredProcedure [dbo].[GetProductsRelation]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetProductsRelation](@Id INT, @CategoryId INT)
AS
	SELECT * FROM Products WHERE Id <> @Id AND CategoryId = @CategoryId;


GO
/****** Object:  StoredProcedure [dbo].[GetRoleById]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetRoleById](@Id INT)
AS
	SELECT * FROM Roles WHERE Id=@Id;
GO
/****** Object:  StoredProcedure [dbo].[GetRoles]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetRoles]
AS
	SELECT * FROM Roles;
GO
/****** Object:  StoredProcedure [dbo].[GetSummaryCategories]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetSummaryCategories]
(
	@FROMDATE VARCHAR(10) = NULL,
	@TODATE VARCHAR(10) = NULL
)
AS
DECLARE @FROM_DATEtext DATETIME = CONVERT(DATETIME,@FROMDATE + ' 00:00:00');
	DECLARE @TO_DATEtext DATETIME = CONVERT(DATETIME,@TODATE + ' 23:59:59');
SELECT C.Name AS Name, SUM(OI.Quantity) AS Total FROM Orders O 
LEFT JOIN OrderItems OI ON O.Id = OI.Id
LEFT JOIN Products P ON P.Id = OI.ProductId
LEFT JOIN Categories C ON C.Id = P.CategoryId
WHERE 1=1
AND O.Status = 'S'
 AND (O.DeliverDT >= @FROM_DATEtext
  OR @FROMDATE = ''
  OR @FROMDATE IS NULL)
 AND (O.DeliverDT <= @TO_DATEtext
  OR @TODATE = ''
  OR @TODATE IS NULL)
GROUP BY C.Name
GO
/****** Object:  StoredProcedure [dbo].[OrderProcess]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[OrderProcess]
(
	@Id BIGINT,
	@AccountId BIGINT,
	@Status VARCHAR(15),
	@DeliverId BIGINT = NULL
)
AS	
 DECLARE @Role NVARCHAR(50) = NULL
 SET @Role= (SELECT R.Name FROM Account A 
			LEFT JOIN AccountInRole AR ON A.Id = AR.AccountId
			LEFT JOIN Roles R ON AR.RoleId = R.Id
			WHERE A.Id = @AccountId)
	IF(@Role = 'Administrator' OR @Role = 'Staff')
	BEGIN
		UPDATE Orders SET Status = @Status, DeliverID = @DeliverId, Staff_ID = @AccountId WHERE Id = @Id;
	END
	ELSE IF(@Role = 'DELIVER')
	BEGIN
		UPDATE Orders SET Status = @Status, DeliverDT = GETDATE() WHERE Id = @Id;
	END
	ELSE
	BEGIN
		UPDATE Orders SET Status = @Status WHERE Id = @Id
	END
GO
/****** Object:  StoredProcedure [dbo].[Pay_OrderItems]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Pay_OrderItems]
(
	@Id BIGINT,
	@AccountId BIGINT,
	@Notes nvarchar(MAX) = NULL,
	@Address NVARCHAR(200),
	@SDT VARCHAR(50)
)
AS
BEGIN
	UPDATE Orders SET AccountId = @AccountId, Notes = @Notes, Address = @Address, SDT = @SDT, Status = N'P', CreateTime = GETDATE() WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[ProductsPagination]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ProductsPagination]
(
	@Start INT,
	@END INT
	--@Total INT OUTPUT
)
AS
	BEGIN
		SELECT * FROM --SELECT ROW_NUMBER() OVER(ORDER BY ProductId) AS RowNum, * FROM Product chon nhung hang (ung voi productid tu bang Product) nam giua vi tri start va end
			(SELECT ROW_NUMBER() OVER(ORDER BY Id) AS RowNum, * FROM Products) AS Tbl
			WHERE Tbl.RowNum BETWEEN @Start AND @End;
		--SELECT @Total=COUNT(*) FROM Product;
	END
GO
/****** Object:  StoredProcedure [dbo].[RPT_DoanhThuHaiNamGanNhat]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RPT_DoanhThuHaiNamGanNhat]
AS
BEGIN
DECLARE @T TABLE (MONTH NVARCHAR(20), CURRENT_YEAR BIGINT, LAST_YEAR BIGINT, AVERAGE_YEAR BIGINT);
WITH R(m) AS
(
    SELECT 1
    UNION ALL
    SELECT m+1 
    FROM R
    WHERE m < 12
)
SELECT m INTO #Temp FROM R

DECLARE cursor_DT CURSOR FOR
SELECT * FROM #Temp ORDER BY m DESC
OPEN cursor_DT
DECLARE @m INT, @CURRENT_YEAR BIGINT, @LAST_YEAR BIGINT, @AVERAGE_YEAR BIGINT
FETCH NEXT FROM cursor_DT INTO @m
WHILE @@FETCH_STATUS = 0
BEGIN	
	SET @CURRENT_YEAR = (SELECT ISNULL(SUM(OI.Price),0) FROM Orders O 
							LEFT JOIN OrderItems OI ON OI.Id = O.Id
							WHERE 1=1
							AND MONTH(O.DeliverDT) = @m
							AND YEAR(O.DeliverDT) = YEAR(GETDATE()))
	SET @LAST_YEAR = (SELECT ISNULL(SUM(OI.Price),0) FROM Orders O 
							LEFT JOIN OrderItems OI ON OI.Id = O.Id
							WHERE 1=1
							AND MONTH(O.DeliverDT) = @m
							AND YEAR(O.DeliverDT) = YEAR(GETDATE())-1)
	SET @AVERAGE_YEAR = (@CURRENT_YEAR+@LAST_YEAR)/2;
	INSERT INTO @T(MONTH,CURRENT_YEAR,LAST_YEAR,AVERAGE_YEAR) VALUES(N'Tháng ' + CAST(@m as varchar(10)), ISNULL(@CURRENT_YEAR, 0), ISNULL(@LAST_YEAR, 0), ISNULL(@AVERAGE_YEAR, 0));
    FETCH NEXT FROM cursor_DT INTO @m
END
SELECT * FROM @T
END
GO
/****** Object:  StoredProcedure [dbo].[RPT_TrangThaiDonHang]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[RPT_TrangThaiDonHang]
(
	@FROMDATE VARCHAR(10) = NULL,
	@TODATE VARCHAR(10) = NULL
)
AS
DECLARE @FROM_DATEtext DATETIME = CONVERT(DATETIME,@FROMDATE + ' 00:00:00');
	DECLARE @TO_DATEtext DATETIME = CONVERT(DATETIME,@TODATE + ' 23:59:59');
SELECT S.Name AS Name, COUNT(O.Status) AS Total FROM Orders O 
LEFT JOIN Status S ON S.Code = O.Status
WHERE 1=1
AND S.TYPE_CODE = 'PROCESS_ORDER'
 AND (O.CreateTime >= @FROM_DATEtext
  OR @FROMDATE = ''
  OR @FROMDATE IS NULL)
 AND (O.CreateTime <= @TO_DATEtext
  OR @TODATE = ''
  OR @TODATE IS NULL)
GROUP BY S.Name
GO
/****** Object:  StoredProcedure [dbo].[SaveMemberInRole]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SaveMemberInRole]
(	
	@AccountId BIGINT,
	@RoleId INT
)
AS
BEGIN
	IF EXISTS(SELECT 1 FROM AccountInRole ar WHERE ar.AccountId=@AccountId AND ar.RoleId=@RoleId)
		UPDATE AccountInRole SET IsDelete=~IsDelete WHERE AccountId=@AccountId AND RoleId=@RoleId;
	ELSE
		INSERT INTO AccountInRole(AccountId,RoleId,isDelete) VALUES (@AccountId,@RoleId,0);
		--O day k lay gia tri cua IsDelete nen khi check thi Default se = 0 con khi bo check thi no se goi lenh Updata thi no se phu dinh va =1 
END
GO
/****** Object:  StoredProcedure [dbo].[SearchProducts]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchProducts](@Q NVARCHAR(32))
AS
	BEGIN
		SELECT * FROM Products WHERE Name LIKE @Q;--LAY TAT CA SAN PHAM CO CHUA Q
	END
GO
/****** Object:  StoredProcedure [dbo].[SearchProductsAdvance]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchProductsAdvance]
(
	@CategoryId INT = NULL,
	@Price INT = NULL,
	@Name NVARCHAR(64) = NULL
)
AS
BEGIN 
	SELECT * FROM Products WHERE (CategoryId=@CategoryId OR @CategoryId IS NULL)
	AND (Price = @Price OR @Price IS NULL) AND (Name LIKE '%' + @Name + '%' OR @Name IS NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[SearchProductsPagination]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchProductsPagination](@Q NVARCHAR(32), @Start INT, @End INT, @Total INT OUT)
AS
	BEGIN 
		SELECT * FROM 
		(SELECT ROW_NUMBER() OVER(ORDER BY Id) AS RowNum, * FROM Products WHERE Name LIKE @Q) AS Tbl
			 WHERE RowNum BETWEEN @Start AND @End;
		SELECT @Total =COUNT(*) FROM Products WHERE Name LIKE @Q;
	END
GO
/****** Object:  StoredProcedure [dbo].[SearchProductsPaginationByQ]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SearchProductsPaginationByQ](@Q NVARCHAR(32), @Start INT, @End INT)
AS
	BEGIN 
		SELECT * FROM 
		(SELECT ROW_NUMBER() OVER(ORDER BY Id) AS RowNum, * FROM Products WHERE Name LIKE @Q) AS Tbl
			 WHERE RowNum BETWEEN @Start AND @End;
		--SELECT @Total =COUNT(*) FROM Product WHERE ProductName LIKE @Q;
	END
GO
/****** Object:  StoredProcedure [dbo].[SignIn]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SignIn]
(
	@Username VARCHAR(50),
	@Password BINARY(64)
)
AS
BEGIN
	IF EXISTS (SELECT * FROM Account WHERE Username=@Username)
	BEGIN 
		SELECT a.Id,a.Username,a.Email,a.Address,a.SDT, a.Ho, a.Ten, a.Status, a.Company_Id FROM Account a WHERE a.Username=@Username AND a.Password=@Password;
		SELECT r.Id,r.Name FROM Roles r JOIN AccountInRole ar ON r.Id=ar.RoleId 
			JOIN Account a ON a.Id=ar.AccountId WHERE a.Username=@Username AND a.Password=@Password;
		RETURN 1;
	END
	RETURN 0;
END
--ALTER PROC [dbo].[SignIn]
--(
--	@Username VARCHAR(32),
--	@Password BINARY(64)
--)
--AS
--BEGIN
--	IF EXISTS (SELECT * FROM Account WHERE Username=@Username)
--	BEGIN 
--		SELECT Id,Username,Email FROM Account WHERE Username=@Username AND Password=@Password;
--		SELECT Roles.Id,Roles.Name FROM Roles JOIN AccountInRole ON Roles.Id=AccountInRole.RoleId 
--			JOIN Account ON Account.Id=AccountInRole.AccountId WHERE Username=@Username AND Password=@Password;
--		RETURN 1;
--	END
--	RETURN 0;
--END
GO
/****** Object:  StoredProcedure [dbo].[UpdateMember]    Script Date: 12/16/2020 7:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateMember]
(
	--@Id BIGINT,
	@Username VARCHAR(32),
	@OldPassword BINARY(64),
	@NewPassword BINARY(64)
)
AS
BEGIN
	--UPDATE Member SET Password= @NewPassword WHERE MemberId = @Id;
	UPDATE Account SET Password= @NewPassword WHERE Username=@Username AND Password=@OldPassword;
END
GO
