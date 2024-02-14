USE [master]
GO
CREATE DATABASE [eShop2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eShop2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\eShop2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eShop2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\eShop2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [eShop2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eShop2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eShop2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eShop2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eShop2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eShop2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eShop2] SET ARITHABORT OFF 
GO
ALTER DATABASE [eShop2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eShop2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eShop2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eShop2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eShop2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eShop2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eShop2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eShop2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eShop2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eShop2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eShop2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eShop2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eShop2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eShop2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eShop2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eShop2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eShop2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eShop2] SET RECOVERY FULL 
GO
ALTER DATABASE [eShop2] SET  MULTI_USER 
GO
ALTER DATABASE [eShop2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eShop2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eShop2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eShop2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eShop2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'eShop2', N'ON'
GO
ALTER DATABASE [eShop2] SET QUERY_STORE = OFF
GO
USE [eShop2]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [eShop2]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2020-09-05 12:07:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[DatePlaced] [datetime] NULL,
	[DateProcessing] [datetime] NULL,
	[DateProcessed] [datetime] NULL,
	[CustomerName] [nvarchar](150) NULL,
	[CustomerAddress] [nvarchar](150) NULL,
	[CustomerCity] [nvarchar](50) NULL,
	[CustomerStateProvince] [nvarchar](50) NULL,
	[CustomerCountry] [nvarchar](50) NULL,
	[AdminUser] [nvarchar](150) NULL,
	[UniqueId] [nvarchar](100) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLineItem](
	[LineItemId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
 CONSTRAINT [PK_OrderLineItem] PRIMARY KEY CLUSTERED 
(
	[LineItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[Brand] [nvarchar](150) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Price] [float] NOT NULL,
	[ImageLink] [nvarchar](500) NULL,
	[Description] [nvarchar](1500) NULL,
    [Case] [nvarchar] (150) NOT NULL,
    [PSU] [nvarchar] (150) NOT NULL,
    [Motherboard] [nvarchar] (150) NOT NULL,
    [Processor] [nvarchar] (150) NOT NULL,
    [ProcessorCooler] [nvarchar] (150) NOT NULL,
    [RAM] [nvarchar] (150) NOT NULL,
    [Graphics] [nvarchar] (150) NOT NULL,
    [SSD] [nvarchar] (150) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (1, N'ASUS', N'ROG Strix GA15DH Gaming Desktop PC', 1199.99, N'https://m.media-amazon.com/images/I/81j2ZjRyRWL._AC_SY879_.jpg', N'The ROG Strix GA15DH Gaming Desktop PC is a powerful and stylish prebuilt gaming desktop that comes with a 9th Gen Intel Core i7-9700K processor, NVIDIA GeForce RTX 2070 graphics card, 16GB DDR4 RAM, and a 512GB PCIe SSD. The desktop also features a customizable RGB lighting system and a transparent side panel that showcases the internal components.', N'ASUS ROG Strix Helios GX601', N'ASUS ROG Thor 850W Platinum', N'ASUS ROG Strix Z390-E Gaming', N'Intel Core i7-9700K', N'ASUS ROG Strix LC 240', N'16GB DDR4 2666MHz', N'NVIDIA GeForce RTX 2070', N'512GB PCIe NVMe M.2 SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (2, N'CyberPowerPC', N'Gamer Supreme Liquid Cool Gaming PC', 1499.99, N'https://m.media-amazon.com/images/I/818SNa1ruZL._AC_SL1500_.jpg', N'The Gamer Supreme Liquid Cool Gaming PC is a high-performance prebuilt gaming desktop that comes with an AMD Ryzen 7 5800X processor, NVIDIA GeForce RTX 3070 graphics card, 16GB DDR4 RAM, and a 1TB NVMe SSD. The desktop also features a customizable RGB lighting system and a tempered glass side panel that showcases the internal components.', N'CyberPowerPC GXiVR8080A4', N'CyberPowerPC 800 Watt 80+ Gold Certified PSU', N'ASUS Prime X570-P', N'AMD Ryzen 7 5800X', N'CyberPowerPC MasterLiquid Lite 240mm ARGB CPU Liquid Cooler', N'16GB DDR4 3200MHz', N'NVIDIA GeForce RTX 3070', N'1TB NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (3, N'HP', N'OMEN 30L Gaming Desktop PC', 1799.99, N'https://m.media-amazon.com/images/I/810naSDT+2L._AC_SL1500_.jpg', N'The OMEN 30L Gaming Desktop PC is a powerful prebuilt gaming desktop that comes with an Intel Core i9-11900K processor, NVIDIA GeForce RTX 3080 graphics card, 32GB DDR4 RAM, and a 1TB PCIe NVMe SSD. The desktop also features a customizable RGB lighting system and a tempered glass side panel that showcases the internal components.', N'HP OMEN 30L GT13-0092', N'750 W Platinum efficiency power supply', N'Intel Z590', N'Intel Core i9-11900K', N'Air Cooling Solution', N'32 GB DDR4-3200 XMP RGB SDRAM', N'NVIDIA GeForce RTX 3080', N'1 TB PCIe NVMe TLC M.2 SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (4, N'Dell', N'Alienware Aurora R12 Gaming Desktop', 2199.99, N'https://m.media-amazon.com/images/I/51HgkLHvLoL._AC_SL1280_.jpg', N'The Alienware Aurora R12 Gaming Desktop is a high-end prebuilt gaming desktop that comes with an Intel Core i9-11900KF processor, NVIDIA GeForce RTX 3090 graphics card, 32GB DDR4 RAM, and a 1TB PCIe NVMe SSD. The desktop also features a customizable RGB lighting system and a tempered glass side panel that showcases the internal components.', N'Dell Alienware Aurora R12', N'1000W Power Supply', N'Intel Z590', N'Intel Core i9-11900KF', N'Alienware High Performance Liquid Cooling', N'32GB Dual Channel HyperX FURY DDR4 XMP at 3200MHz', N'NVIDIA GeForce RTX 3090', N'1TB PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (5, N'Lenovo', N'Legion Tower 5i Gaming Desktop', 1299.99, N'https://m.media-amazon.com/images/I/81oWiIr28wL._AC_SL1500_.jpg', N'The Legion Tower 5i Gaming Desktop is a powerful prebuilt gaming desktop that comes with an Intel Core i7-11700KF processor, NVIDIA GeForce RTX 3060 graphics card, 16GB DDR4 RAM, and a 512GB PCIe SSD. The desktop also features a customizable RGB lighting system and a transparent side panel that showcases the internal components.', N'Lenovo Legion Tower 5i', N'650W Platinum PSU', N'Intel B560', N'Intel Core i7-11700KF', N'Air Cooling Solution', N'16GB DDR4 3200MHz', N'NVIDIA GeForce RTX 3060', N'512GB PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (6, N'ABS', N'Gaming Desktop PC', 999.99, N'https://m.media-amazon.com/images/I/81pXOoKaQyL._AC_SL1500_.jpg', N'The ABS Gaming Desktop PC is a budget-friendly prebuilt gaming desktop that comes with an AMD Ryzen 5 5600X processor, NVIDIA GeForce GTX 1660 graphics card, 16GB DDR4 RAM, and a 512GB NVMe SSD. The desktop also features a customizable RGB lighting system and a tempered glass side panel that showcases the internal components.', N'ABS Gladiator', N'600W 80+ Gold PSU', N'ASUS Prime B550M-A', N'AMD Ryzen 5 5600X', N'ABS Gladiator 240mm Liquid Cooler', N'16GB DDR4 3000MHz', N'NVIDIA GeForce GTX 1660', N'512GB NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (7, N'CyberPowerPC', N'Gaming Tower PC', 1299.99, N'https://m.media-amazon.com/images/I/81Wx7hw9vwL._AC_SL1500_.jpg', N'The CyberPowerPC Gaming Tower PC is a high-performance gaming desktop featuring an Intel Core i7-10700K processor, NVIDIA GeForce RTX 3070 graphics card, 32GB DDR4 RAM, and a 1TB NVMe SSD. With customizable RGB lighting and a sleek design, this desktop delivers excellent gaming and multitasking capabilities.', N'CyberPowerPC Gamer Master', N'750W 80+ Bronze PSU', N'MSI MPG B550 Gaming Edge WiFi', N'Intel Core i7-10700K', N'Corsair H100i RGB Platinum SE Liquid Cooler', N'32GB DDR4 3200MHz', N'NVIDIA GeForce RTX 3070', N'1TB NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (8, N'HP', N'Pavilion Gaming Desktop', 799.99, N'https://m.media-amazon.com/images/I/81liWNg7JzL._AC_SL1500_.jpg', N'The HP Pavilion Gaming Desktop is a reliable and affordable gaming solution equipped with an AMD Ryzen 5 3600 processor, NVIDIA GeForce GTX 1660 Ti graphics card, 8GB DDR4 RAM, and a 512GB PCIe NVMe SSD. This desktop offers a sleek design and efficient performance for both gaming and everyday tasks.', N'HP Pavilion Gaming', N'500W 80+ Bronze PSU', N'HP Pavilion Gaming 690', N'AMD Ryzen 5 3600', N'Cooler Master Air Cooler', N'8GB DDR4 2666MHz', N'NVIDIA GeForce GTX 1660 Ti', N'512GB PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (9, N'Dell', N'Alienware Aurora R10', 1499.99, N'https://m.media-amazon.com/images/I/51Fjrh6ugEL._AC_SL1000_.jpg', N'The Dell Alienware Aurora R10 is a powerful gaming desktop featuring an AMD Ryzen 7 5800X processor, NVIDIA GeForce RTX 3060 Ti graphics card, 16GB DDR4 RAM, and a 1TB M.2 PCIe NVMe SSD. Designed for immersive gaming experiences, this desktop combines performance with Alienware iconic aesthetics.', N'Dell Alienware Aurora', N'850W 80+ Gold PSU', N'Dell Alienware Aurora ATX', N'AMD Ryzen 7 5800X', N'Dell Alienware High-Performance Air Cooler', N'16GB DDR4 3200MHz', N'NVIDIA GeForce RTX 3060 Ti', N'1TB M.2 PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (10, N'SkyTech', N'Blaze II Gaming PC', 899.99, N'https://m.media-amazon.com/images/I/81KvSAjWnTL._AC_SL1500_.jpg', N'The SkyTech Blaze II Gaming PC is a mid-range gaming desktop featuring an AMD Ryzen 7 2700X processor, NVIDIA GTX 1660 graphics card, 16GB DDR4 RAM, and a 500GB SSD. With its compact design and powerful components, it provides a smooth gaming experience for enthusiasts.', N'SkyTech Blaze II', N'600W 80+ PSU', N'ASRock B450M/AC Micro ATX', N'AMD Ryzen 7 2700X', N'Wraith Prism RGB Cooler', N'16GB DDR4 3000MHz', N'NVIDIA GTX 1660', N'500GB SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (11, N'CybertronPC', N'Rhodium GTX Gaming PC', 1099.99, N'https://m.media-amazon.com/images/I/61wsH0j5SvL._AC_SL1500_.jpg', N'The CybertronPC Rhodium GTX Gaming PC is a performance-oriented desktop featuring an Intel Core i5-9600K processor, NVIDIA GeForce GTX 1660 Super graphics card, 16GB DDR4 RAM, and a 512GB SSD. With a sleek case design and robust specifications, its ready for intense gaming sessions.', N'CybertronPC Rhodium', N'650W 80+ Bronze PSU', N'ASUS Prime Z390-P ATX', N'Intel Core i5-9600K', N'DeepCool GAMMAXX GT BK Cooler', N'16GB DDR4 2666MHz', N'NVIDIA GeForce GTX 1660 Super', N'512GB SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (12, N'IBUYPOWER', N'Element Mini Gaming Desktop', 799.99, N'https://m.media-amazon.com/images/I/7128GOUxSCL._AC_SL1500_.jpg', N'The iBUYPOWER Element Mini Gaming Desktop is a compact gaming solution featuring an AMD Ryzen 3 3300X processor, NVIDIA GeForce GTX 1650 graphics card, 8GB DDR4 RAM, and a 256GB SSD. With its small form factor and capable components, its perfect for tight spaces and casual gaming.', N'iBUYPOWER Element Mini', N'450W 80+ Bronze PSU', N'ASRock A320M Micro ATX', N'AMD Ryzen 3 3300X', N'Stock Air Cooler', N'8GB DDR4 3000MHz', N'NVIDIA GeForce GTX 1650', N'256GB SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (13, N'Alienware', N'Aurora R12 Gaming Desktop', 1799.99, N'https://m.media-amazon.com/images/I/51HgkLHvLoL._AC_SL1280_.jpg', N'The Alienware Aurora R12 Gaming Desktop is a high-end gaming powerhouse equipped with an Intel Core i9-11900KF processor, NVIDIA GeForce RTX 3080 graphics card, 32GB DDR4 RAM, and a 2TB M.2 PCIe NVMe SSD. Its futuristic design and top-tier components deliver exceptional gaming and multitasking performance.', N'Alienware Aurora', N'1000W 80+ Platinum PSU', N'Dell Alienware Aurora ATX', N'Intel Core i9-11900KF', N'Alienware High-Performance Liquid Cooling', N'32GB DDR4 3200MHz', N'NVIDIA GeForce RTX 3080', N'2TB M.2 PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (14, N'SkyForge', N'Ultimate Gaming Rig', 2499.99, N'https://skyforgepc.com/cdn/shop/files/h5_flow_rgb_black_550a527e-4c2e-455e-a3c4-d1abcff88461.png?v=1699594240&width=800', N'The SkyForge Ultimate Gaming Rig is a premium gaming desktop featuring an Intel Core i9-12900K processor, NVIDIA GeForce RTX 3090 graphics card, 64GB DDR4 RAM, and a 2TB PCIe Gen4 NVMe SSD. With a sleek aluminum chassis and top-of-the-line components, it offers unparalleled gaming and content creation performance.', N'SkyForge Ultimate', N'1200W 80+ Titanium PSU', N'ASUS ROG Strix Z790-E Gaming', N'Intel Core i9-12900K', N'NZXT Kraken X73 Liquid Cooler', N'64GB DDR4 3600MHz', N'NVIDIA GeForce RTX 3090', N'2TB PCIe Gen4 NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (15, N'Origin PC', N'Millennium Gaming Desktop', 2999.99, N'https://cdn.originpc.com/img/pdp/gaming/desktops/millennium/millennium-hero.png', N'The Origin PC Millennium Gaming Desktop is a high-performance gaming rig featuring an AMD Ryzen 9 5950X processor, NVIDIA GeForce RTX 3080 Ti graphics card, 128GB DDR4 RAM, and a 4TB PCIe NVMe SSD. This desktop offers customizable RGB lighting and exceptional power for gaming and professional tasks.', N'Origin PC Millennium', N'1600W 80+ Platinum PSU', N'ASUS ROG Crosshair VIII Formula', N'AMD Ryzen 9 5950X', N'Origin PC Frostbyte 360 Liquid Cooling', N'128GB DDR4 3600MHz', N'NVIDIA GeForce RTX 3080 Ti', N'4TB PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (16, N'MSI', N'MP Trident 3 Gaming Desktop', 1299.99, N'https://m.media-amazon.com/images/I/51PAVOhCgFL._AC_SL1200_.jpg', N'The MSI MP Trident 3 Gaming Desktop is a compact gaming solution featuring an Intel Core i7-11700F processor, NVIDIA GeForce RTX 3060 graphics card, 16GB DDR4 RAM, and a 1TB M.2 PCIe NVMe SSD. Its small form factor makes it ideal for tight spaces without compromising on performance.', N'MSI MP Trident 3', N'500W 80+ Bronze PSU', N'MSI B560I Gaming Edge WiFi', N'Intel Core i7-11700F', N'Cooler Master MasterLiquid Lite 120', N'16GB DDR4 3200MHz', N'NVIDIA GeForce RTX 3060', N'1TB M.2 PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (17, N'Corsair', N'One Pro i200 Compact Workstation', 2799.99, N'https://m.media-amazon.com/images/I/71WkZn95jlL._AC_SL1500_.jpg', N'The Corsair One Pro i200 Compact Workstation is a powerful desktop designed for professional workloads, featuring an Intel Core i9-11900K processor, NVIDIA Quadro RTX 4000 graphics card, 64GB DDR4 RAM, and a 2TB NVMe SSD. With a compact form factor and efficient cooling, its perfect for content creation and intensive tasks.', N'Corsair One Pro i200', N'750W SFX 80+ Platinum PSU', N'Intel Z590 Mini-ITX', N'Intel Core i9-11900K', N'Corsair Hydro Series H100i PRO Liquid Cooler', N'64GB DDR4 3200MHz', N'NVIDIA Quadro RTX 4000', N'2TB NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (18, N'Lenovo', N'IdeaCentre 5 Gaming Desktop', 999.99, N'https://m.media-amazon.com/images/I/31QFNeM0SfL._AC_.jpg', N'The Lenovo IdeaCentre 5 Gaming Desktop is a budget-friendly gaming solution featuring an AMD Ryzen 5 5600G processor, AMD Radeon RX 6600 graphics card, 16GB DDR4 RAM, and a 512GB PCIe NVMe SSD. With its sleek design and reliable components, it offers a solid gaming experience at an affordable price.', N'Lenovo IdeaCentre 5', N'500W 80+ Bronze PSU', N'Lenovo B550 Micro ATX', N'AMD Ryzen 5 5600G', N'Stock Air Cooler', N'16GB DDR4 3200MHz', N'AMD Radeon RX 6600', N'512GB PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (19, N'ZOTAC', N'Magnus One Gaming Mini PC', 1499.99, N'https://m.media-amazon.com/images/I/71X4r4hVZjL._AC_SL1500_.jpg', N'The ZOTAC Magnus One Gaming Mini PC is a compact gaming powerhouse featuring an Intel Core i5-11400 processor, NVIDIA GeForce GTX 1660 Super graphics card, 16GB DDR4 RAM, and a 512GB NVMe SSD. With its small form factor and robust performance, its an ideal solution for space-conscious gamers.', N'ZOTAC Magnus One', N'500W 80+ Bronze PSU', N'ZOTAC H570-ITX WiFi Mini-ITX', N'Intel Core i5-11400', N'ZOTAC Cooling Solution', N'16GB DDR4 3200MHz', N'NVIDIA GeForce GTX 1660 Super', N'512GB NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (20, N'Acer', N'Predator Orion 3000 Gaming Desktop', 1299.99, N'https://m.media-amazon.com/images/I/71wpUc1D8fL._AC_SL1500_.jpg', N'The Acer Predator Orion 3000 Gaming Desktop is a performance-oriented gaming rig featuring an Intel Core i7-11700 processor, NVIDIA GeForce RTX 3060 Ti graphics card, 32GB DDR4 RAM, and a 1TB PCIe NVMe SSD. With its aggressive design and powerful internals, its ready for immersive gaming experiences.', N'Acer Predator Orion 3000', N'600W 80+ Gold PSU', N'Acer B460 Micro ATX', N'Intel Core i7-11700', N'Cooler Master MasterLiquid ML120L V2', N'32GB DDR4 3200MHz', N'NVIDIA GeForce RTX 3060 Ti', N'1TB PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (21, N'ASUS', N'ROG Strix GA15 Gaming Desktop', 1499.99, N'https://m.media-amazon.com/images/I/813Nab75aQL._AC_SL1500_.jpg', N'The ASUS ROG Strix GA15 Gaming Desktop is a high-performance gaming rig featuring an AMD Ryzen 7 5800X processor, NVIDIA GeForce RTX 3070 graphics card, 16GB DDR4 RAM, and a 1TB PCIe NVMe SSD. With its futuristic design and powerful components, it delivers smooth gaming experiences and multitasking capabilities.', N'ASUS ROG Strix GA15', N'650W 80+ Gold PSU', N'ASUS B550 ATX', N'AMD Ryzen 7 5800X', N'ASUS ROG Strix LC 120 Liquid Cooler', N'16GB DDR4 3200MHz', N'NVIDIA GeForce RTX 3070', N'1TB PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (22, N'HP Omen', N'Obelisk Gaming Desktop', 1199.99, N'https://m.media-amazon.com/images/I/71RwSL4OZsL._AC_SL1500_.jpg', N'The HP Omen Obelisk Gaming Desktop is a powerful gaming rig featuring an Intel Core i7-10700F processor, NVIDIA GeForce RTX 3060 graphics card, 16GB DDR4 RAM, and a 512GB PCIe NVMe SSD. With its sleek and compact design, it offers a balance of performance and aesthetics for gamers.', N'HP Omen Obelisk', N'600W 80+ Bronze PSU', N'HP Proprietary Micro-ATX', N'Intel Core i7-10700F', N'HP Air Cooling Solution', N'16GB DDR4 3200MHz', N'NVIDIA GeForce RTX 3060', N'512GB PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (23, N'CyberPowerPC', N'Gamer Supreme Liquid Cool Gaming PC', 1699.99, N'https://m.media-amazon.com/images/I/7189RVBYa7L._AC_SL1500_.jpg', N'The CyberPowerPC Gamer Supreme Liquid Cool Gaming PC is a high-end gaming desktop featuring an AMD Ryzen 9 5900X processor, NVIDIA GeForce RTX 3080 graphics card, 32GB DDR4 RAM, and a 1TB NVMe SSD. With liquid cooling for optimal performance, its designed for enthusiasts seeking top-tier gaming experiences.', N'CyberPowerPC Gamer Supreme', N'800W 80+ Gold PSU', N'ASUS TUF Gaming B550-PLUS ATX', N'AMD Ryzen 9 5900X', N'DeepCool Castle 360EX Liquid Cooler', N'32GB DDR4 3600MHz', N'NVIDIA GeForce RTX 3080', N'1TB NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (24, N'Dell', N'Inspiron Gaming Desktop', 899.99, N'https://m.media-amazon.com/images/I/617LZ7j3uCL._AC_SL1000_.jpg', N'The Dell Inspiron Gaming Desktop is a budget-friendly gaming solution featuring an AMD Ryzen 5 3600 processor, AMD Radeon RX 5700 XT graphics card, 16GB DDR4 RAM, and a 512GB PCIe NVMe SSD. With its sleek design and reliable performance, it offers great value for entry-level gamers.', N'Dell Inspiron Gaming', N'500W 80+ Bronze PSU', N'Dell Inspiron Micro ATX', N'AMD Ryzen 5 3600', N'Stock Air Cooler', N'16GB DDR4 3200MHz', N'AMD Radeon RX 5700 XT', N'512GB PCIe NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (25, N'ABS Gladiator', N'Extreme Gaming Desktop', 1299.99, N'https://assets-global.website-files.com/5f345a660c5d7cfdea4f8725/6462d13d162f044c03dbf5c9_ABS_83-360-383_6%20(1)-min.jpg', N'The ABS Gladiator Extreme Gaming Desktop is a high-performance gaming rig featuring an Intel Core i9-11900K processor, NVIDIA GeForce RTX 3090 graphics card, 64GB DDR4 RAM, and a 2TB NVMe SSD. With its aggressive design and top-tier components, its geared towards enthusiasts and professional gamers.', N'ABS Gladiator Extreme', N'1000W 80+ Gold PSU', N'ASUS ROG Strix Z590-E ATX', N'Intel Core i9-11900K', N'NZXT Kraken Z73 Liquid Cooler', N'64GB DDR4 3600MHz', N'NVIDIA GeForce RTX 3090', N'2TB NVMe SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (26, N'SkyTech', N'Archangel Gaming PC', 1099.99, N'https://m.media-amazon.com/images/I/91kntxknL3L._AC_SL1500_.jpg', N'The SkyTech Archangel Gaming PC is a mid-range gaming desktop featuring an AMD Ryzen 5 5600X processor, NVIDIA GeForce GTX 1660 Super graphics card, 16GB DDR4 RAM, and a 500GB SSD. With its sleek white case and powerful components, it provides a reliable gaming experience.', N'SkyTech Archangel', N'600W 80+ PSU', N'MSI B550-A PRO ATX', N'AMD Ryzen 5 5600X', N'Stock Air Cooler', N'16GB DDR4 3200MHz', N'NVIDIA GeForce GTX 1660 Super', N'500GB SSD')
INSERT INTO [dbo].[Product] ([ProductId], [Brand], [Name], [Price], [ImageLink], [Description], [Case], [PSU], [Motherboard], [Processor], [ProcessorCooler], [RAM], [Graphics], [SSD]) VALUES (27, N'CybertronPC', N'Rhodium GXi VR-Ready Gaming PC', 1499.99, N'https://www.bhphotovideo.com/images/images2000x2000/cyberpowerpc_gxi10182opt_gamer_xtreme_vr_with_1336323.jpg', N'The CybertronPC Rhodium GXi VR-Ready Gaming PC is a performance-oriented desktop featuring an Intel Core i7-10700KF processor, NVIDIA GeForce RTX 3070 graphics card, 32GB DDR4 RAM, and a 1TB NVMe SSD. With its VR-ready capabilities and sleek design, its perfect for immersive gaming experiences.', N'CybertronPC Rhodium GXi', N'700W 80+ Bronze PSU', N'ASUS ROG Strix Z490-E ATX', N'Intel Core i7-10700KF', N'DeepCool Castle 240EX Liquid Cooler', N'32GB DDR4 3200MHz', N'NVIDIA GeForce RTX 3070', N'1TB NVMe SSD')
    
USE [master]
GO
ALTER DATABASE [eShop2] SET  READ_WRITE 
GO
