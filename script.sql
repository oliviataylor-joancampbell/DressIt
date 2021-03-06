USE [master]
GO
/****** Object:  Database [DressItDB]    Script Date: 7/26/2016 12:57:38 PM ******/
CREATE DATABASE [DressItDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DressItDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DressItDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DressItDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DressItDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DressItDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DressItDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DressItDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DressItDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DressItDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DressItDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DressItDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DressItDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DressItDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DressItDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DressItDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DressItDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DressItDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DressItDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DressItDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DressItDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DressItDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DressItDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DressItDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DressItDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DressItDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DressItDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DressItDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DressItDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DressItDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DressItDB] SET  MULTI_USER 
GO
ALTER DATABASE [DressItDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DressItDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DressItDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DressItDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DressItDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DressItDB]
GO
/****** Object:  Table [dbo].[Accessories]    Script Date: 7/26/2016 12:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessories](
	[OutfitID] [int] NOT NULL,
	[WardrobeItemID] [int] NOT NULL,
 CONSTRAINT [PK_Accessories] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC,
	[WardrobeItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Outfits]    Script Date: 7/26/2016 12:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Outfits](
	[OutfitID] [int] IDENTITY(1,1) NOT NULL,
	[TopID] [int] NOT NULL,
	[BottomID] [int] NOT NULL,
	[ShoeID] [int] NOT NULL,
	[OutfitName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Outfits] PRIMARY KEY CLUSTERED 
(
	[OutfitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Types]    Script Date: 7/26/2016 12:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WardrobeItems]    Script Date: 7/26/2016 12:57:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WardrobeItems](
	[WardrobeItemID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](max) NULL,
 CONSTRAINT [PK_WardrobeItems] PRIMARY KEY CLUSTERED 
(
	[WardrobeItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Accessories] ([OutfitID], [WardrobeItemID]) VALUES (6, 9)
INSERT [dbo].[Accessories] ([OutfitID], [WardrobeItemID]) VALUES (8, 4)
INSERT [dbo].[Accessories] ([OutfitID], [WardrobeItemID]) VALUES (8, 9)
INSERT [dbo].[Accessories] ([OutfitID], [WardrobeItemID]) VALUES (10, 4)
INSERT [dbo].[Accessories] ([OutfitID], [WardrobeItemID]) VALUES (10, 9)
INSERT [dbo].[Accessories] ([OutfitID], [WardrobeItemID]) VALUES (11, 4)
INSERT [dbo].[Accessories] ([OutfitID], [WardrobeItemID]) VALUES (12, 4)
INSERT [dbo].[Accessories] ([OutfitID], [WardrobeItemID]) VALUES (13, 4)
INSERT [dbo].[Accessories] ([OutfitID], [WardrobeItemID]) VALUES (14, 4)
SET IDENTITY_INSERT [dbo].[Outfits] ON 

INSERT [dbo].[Outfits] ([OutfitID], [TopID], [BottomID], [ShoeID], [OutfitName]) VALUES (6, 1, 2, 3, NULL)
INSERT [dbo].[Outfits] ([OutfitID], [TopID], [BottomID], [ShoeID], [OutfitName]) VALUES (8, 10, 2, 3, NULL)
INSERT [dbo].[Outfits] ([OutfitID], [TopID], [BottomID], [ShoeID], [OutfitName]) VALUES (10, 10, 2, 3, NULL)
INSERT [dbo].[Outfits] ([OutfitID], [TopID], [BottomID], [ShoeID], [OutfitName]) VALUES (11, 10, 2, 3, NULL)
INSERT [dbo].[Outfits] ([OutfitID], [TopID], [BottomID], [ShoeID], [OutfitName]) VALUES (12, 10, 2, 3, NULL)
INSERT [dbo].[Outfits] ([OutfitID], [TopID], [BottomID], [ShoeID], [OutfitName]) VALUES (13, 10, 2, 3, N'test2')
INSERT [dbo].[Outfits] ([OutfitID], [TopID], [BottomID], [ShoeID], [OutfitName]) VALUES (14, 10, 2, 3, N'MYERRDAY')
SET IDENTITY_INSERT [dbo].[Outfits] OFF
SET IDENTITY_INSERT [dbo].[Types] ON 

INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (1, N'Top')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (2, N'Bottom')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (3, N'Shoes')
INSERT [dbo].[Types] ([TypeID], [TypeName]) VALUES (4, N'Accessory')
SET IDENTITY_INSERT [dbo].[Types] OFF
SET IDENTITY_INSERT [dbo].[WardrobeItems] ON 

INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [TypeID], [Name], [Photo]) VALUES (1, 1, N'Grey T-Shirt', N'http://ep.yimg.com/ay/yhst-69607607458535/g200-grey-t-shirt-with-logo-3.jpg')
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [TypeID], [Name], [Photo]) VALUES (2, 2, N'Blue Jeans', N'http://lp.hm.com/hmprod?set=key%5Bsource%5D,value%5B/model/2016/D00%200402414%20002%2000%202908.jpg%5D&set=key%5Brotate%5D,value%5B%5D&set=key%5Bwidth%5D,value%5B%5D&set=key%5Bheight%5D,value%5B%5D&set=key%5Bx%5D,value%5B%5D&set=key%5By%5D,value%5B%5D&set=key%5Btype%5D,value%5BSTILL_LIFE_FRONT%5D&set=key%5Bhmver%5D,value%5B0%5D&set=key%5Bquality%5D,value%5B80%5D&set=key%5Bsize%5D,value%5B346x405%5D&call=url%5Bfile:/mobile/v2/product%5D')
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [TypeID], [Name], [Photo]) VALUES (3, 3, N'Grey Nikes', N'http://sneakernews.com/wp-content/uploads/2015/07/nike-free-flyknit-nsw-wolf-grey-01.jpg')
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [TypeID], [Name], [Photo]) VALUES (4, 4, N'necklace', N'http://media.tiffany.com/is/image/Tiffany/EcomBrowseM/tiffany-infinity-necklace-26759013_934183_ED.jpg?op_usm=1.00,1.00,6.00&defaultImage=NoImageAvailable&&')
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [TypeID], [Name], [Photo]) VALUES (9, 4, N'Ring', N'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAFoAaAMBIgACEQEDEQH/xAAbAAEAAwEBAQEAAAAAAAAAAAAABAUGAgMBB//EADYQAAIBAwICBwYEBwEAAAAAAAECAAMEEQUSITETFEFRYXGRMlOBobHRBkKC8CIjM2JysuEV/8QAFQEBAQAAAAAAAAAAAAAAAAAAAAH/xAAWEQEBAQAAAAAAAAAAAAAAAAAAEQH/2gAMAwEAAhEDEQA/AP3GIiAiIgIiICIiAiIgIiICIiAiIgIiICInzcMlcjI5iB9ieXT0920OCfDjO1dWyAykjng8oHUREBERAREQEREBE5d1RdzsFA7ScTwa9oA7VYu3cozAkzM9fs01u4JXoajPs6R6hXpCBjA8ckfAZ8rpruof6dAn/JsfeZ1b1qlxTvLi0C11Xo95KqiMSQQeJwewHJzuIwMy4mp1taXdKgztVFN2GWVhuwvgf3zlZdUafS3dS7tt9R1GUoqysy8dqt3kD6d0sb7VLy1oVbq2satxQpoH2qRvYbgDsXmTzPjjxnD10pXVXLCp0rZ6VdqFju27Rk4JXGDx8uPCBdaTXS5023qIrIDTAKMclSOBB8jJcq7OmNMtzRt6NMU9zNsD+ySckcu/PrPp1yzRwlffSJ5blyD6SKs4nnRr0q4zSqK48DPSAiIgJGvLoUEJ4ZHM90kzMXlapd7kRsIpO9vHugZ/V9cp1teW1r3Lh6dMOKKZLNuJGcDyI4d5l7p9/V6MJaafWYd+3b/35Sz0zSbVKYrELUZ+Ofv3y2VQoAUAAdgkGer0tfuaZWh1e0z+Zh0h+o+hkDTPw6NMqNWvaCXdzlqtW7IKbsnJJVQFPwHZ4zYxKMXY6ur2nW7tkterqFe1ZgXphh+dV4Bzx/h44weOc4krYXF89R3ZK9JxupsoIOOW1zxzxGcjlkcO2aZrei7bnpU2bvKgmegGOUtSMza6VqVtTRGUVkUALmqc4+M51HS7a+oNR1Gwq7Dz2uefMHPDE1MSK/Oqi3ek1KdrQq1bqzqEIjVXIrW57CH5sM4znjz4nlNJ+H9WualRrPUcGorEU6o/OOzPjiWWo0bNaResVpk8vH4dsp6IQoKtLjhsjvBB4/SQaeIiUJmtStDbdZpbjTp3BZqdUDgrEcvPPHHb6zSzmoi1EKVFDKeYYZBgYrTL+5osUZmpV/zIeIbxHYR++Eu6Ot1BwrUQ3ipxOr7QrSop6N+i/sYb09D95UNY1LEFUWlVTwqMD6HgJBo7fU6Nf2UqA+Ikg3VJfaLD9JmRp6lUtj/LouveGXf88id3H4kugmKdg1Q47GA+so0z6lZp7VYD9JhdRtm9h2byQzA1df1qpVGNAXaDz62PtLC317UFUD/zFUnnudfqDA173qgZWmx8+EqL7W667hT2UwOZ54kJdSva+F/gpZ5gHI/1z84GgUb+or3tyzgHIpgkLn6/OQQKz3t8N9u4qOxwrMcgePlNFommm3tqdN2ZwvFnbm5JyT6yfaWFrboBSTOO+TICIiUIiIHDU1bmMzg2tI80E9ogR+p0PdrHU6Hu19JIiBH6nQ92vpHU6Hu19JIiB4dUo+7E+i3pjkontEDlUC8hOoiAiIgf/9k=')
INSERT [dbo].[WardrobeItems] ([WardrobeItemID], [TypeID], [Name], [Photo]) VALUES (10, 1, N'black t-shirt', NULL)
SET IDENTITY_INSERT [dbo].[WardrobeItems] OFF
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_Outfits] FOREIGN KEY([OutfitID])
REFERENCES [dbo].[Outfits] ([OutfitID])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_Outfits]
GO
ALTER TABLE [dbo].[Accessories]  WITH CHECK ADD  CONSTRAINT [FK_Accessories_WardrobeItems] FOREIGN KEY([WardrobeItemID])
REFERENCES [dbo].[WardrobeItems] ([WardrobeItemID])
GO
ALTER TABLE [dbo].[Accessories] CHECK CONSTRAINT [FK_Accessories_WardrobeItems]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_WardrobeItems] FOREIGN KEY([TopID])
REFERENCES [dbo].[WardrobeItems] ([WardrobeItemID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_WardrobeItems]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_WardrobeItems1] FOREIGN KEY([BottomID])
REFERENCES [dbo].[WardrobeItems] ([WardrobeItemID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_WardrobeItems1]
GO
ALTER TABLE [dbo].[Outfits]  WITH CHECK ADD  CONSTRAINT [FK_Outfits_WardrobeItems2] FOREIGN KEY([ShoeID])
REFERENCES [dbo].[WardrobeItems] ([WardrobeItemID])
GO
ALTER TABLE [dbo].[Outfits] CHECK CONSTRAINT [FK_Outfits_WardrobeItems2]
GO
ALTER TABLE [dbo].[WardrobeItems]  WITH CHECK ADD  CONSTRAINT [FK_WardrobeItems_Types] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Types] ([TypeID])
GO
ALTER TABLE [dbo].[WardrobeItems] CHECK CONSTRAINT [FK_WardrobeItems_Types]
GO
USE [master]
GO
ALTER DATABASE [DressItDB] SET  READ_WRITE 
GO
