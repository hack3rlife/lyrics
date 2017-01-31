USE [lyicsdb]
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[song_sung_Idiom]') AND parent_object_id = OBJECT_ID(N'[dbo].[Song]'))
ALTER TABLE [dbo].[Song] DROP CONSTRAINT [song_sung_Idiom]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[song_belongs_category]') AND parent_object_id = OBJECT_ID(N'[dbo].[Song]'))
ALTER TABLE [dbo].[Song] DROP CONSTRAINT [song_belongs_category]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[song_sung_artists]') AND parent_object_id = OBJECT_ID(N'[dbo].[Discography]'))
ALTER TABLE [dbo].[Discography] DROP CONSTRAINT [song_sung_artists]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[artist_sings_songs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Discography]'))
ALTER TABLE [dbo].[Discography] DROP CONSTRAINT [artist_sings_songs]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[album_has_songs]') AND parent_object_id = OBJECT_ID(N'[dbo].[Discography]'))
ALTER TABLE [dbo].[Discography] DROP CONSTRAINT [album_has_songs]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[artist_have_nationality]') AND parent_object_id = OBJECT_ID(N'[dbo].[Artist]'))
ALTER TABLE [dbo].[Artist] DROP CONSTRAINT [artist_have_nationality]
GO

/****** Object:  Table [dbo].[Song]    Script Date: 6/22/2016 6:14:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Song]') AND type in (N'U'))
DROP TABLE [dbo].[Song]
GO
/****** Object:  Table [dbo].[Idiom]    Script Date: 6/22/2016 6:14:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Idiom]') AND type in (N'U'))
DROP TABLE [dbo].[Idiom]
GO
/****** Object:  Table [dbo].[Discography]    Script Date: 6/22/2016 6:14:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Discography]') AND type in (N'U'))
DROP TABLE [dbo].[Discography]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 6/22/2016 6:14:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND type in (N'U'))
DROP TABLE [dbo].[Country]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/22/2016 6:14:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Category]') AND type in (N'U'))
DROP TABLE [dbo].[Category]
GO
/****** Object:  Table [dbo].[Artist]    Script Date: 6/22/2016 6:14:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Artist]') AND type in (N'U'))
DROP TABLE [dbo].[Artist]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 6/22/2016 6:14:53 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Album]') AND type in (N'U'))
DROP TABLE [dbo].[Album]
GO

-- Table [Artist]
CREATE TABLE [Artist]
(
 [ArtistId] UNIQUEIDENTIFIER NOT NULL  DEFAULT NEWID(),
 [Name] VARCHAR(255) NOT NULL, 
 [Featuring] VARCHAR(255) NOT NULL, 
 [CountryId] UNIQUEIDENTIFIER NULL,
 [CreatedDate] DATETIME DEFAULT GETDATE(),
 [CreatedBy] VARCHAR(100) NULL DEFAULT ('admin'),
 [LastUpdate] DATETIME NULL DEFAULT (GETDATE()),
 [UpdatedBy] VARCHAR(100) NULL DEFAULT ('admin')
)
GO
-- Add keys for table [Artist]
ALTER TABLE [Artist] ADD CONSTRAINT [artist_pk] PRIMARY KEY NONCLUSTERED ([ArtistId])
GO

-- Table [Country]
CREATE TABLE [Country]
(
 [CountryId] UNIQUEIDENTIFIER NOT NULL  DEFAULT NEWID(),
 [CountryName] VARCHAR(100) NOT NULL,
 [CreatedDate] DATETIME DEFAULT GETDATE(),
 [CreatedBy] VARCHAR(100) NULL DEFAULT ('admin'),
 [LastUpdate] DATETIME NULL DEFAULT (GETDATE()),
 [UpdatedBy] VARCHAR(100) NULL DEFAULT ('admin')
)
GO
-- Add keys for table [Country]
ALTER TABLE [Country] ADD CONSTRAINT [country_pk] PRIMARY KEY NONCLUSTERED ([CountryId])
GO

-- Table [Idiom]
CREATE TABLE [Idiom]
(
 [IdiomId] UNIQUEIDENTIFIER NOT NULL  DEFAULT NEWID(),
 [IdiomName] VARCHAR(50) NOT NULL,
 [CreatedDate] DATETIME DEFAULT GETDATE(),
 [CreatedBy] VARCHAR(100) NULL DEFAULT ('admin'),
 [LastUpdate] DATETIME NULL DEFAULT (GETDATE()),
 [UpdatedBy] VARCHAR(100) NULL DEFAULT ('admin')
)
GO
-- Add keys for table [Idiom]
ALTER TABLE [Idiom] ADD CONSTRAINT [idiom_pk] PRIMARY KEY NONCLUSTERED ([IdiomId])
GO

-- Table [Category]
CREATE TABLE [Category]
(
 [CategoryId] UNIQUEIDENTIFIER NOT NULL  DEFAULT NEWID(),
 [CategoryName] VARCHAR(50) NOT NULL,
 [CreatedDate] DATETIME DEFAULT GETDATE(),
 [CreatedBy] VARCHAR(100) NULL DEFAULT ('admin'),
 [LastUpdate] DATETIME NULL DEFAULT (GETDATE()),
 [UpdatedBy] VARCHAR(100) NULL DEFAULT ('admin')
)
GO
-- Add keys for table [Category]
ALTER TABLE [Category] ADD CONSTRAINT [category_pk] PRIMARY KEY NONCLUSTERED ([CategoryId])
GO

-- Table [Song]
CREATE TABLE [Song]
(
 [SongId] UNIQUEIDENTIFIER NOT NULL  DEFAULT NEWID(),
 [SongName] VARCHAR(255) NOT NULL,
 [Lyrics] TEXT NOT NULL,
 [Author] VARCHAR(255) NULL,
 [CategoryId] UNIQUEIDENTIFIER NULL,
 [IdiomId] UNIQUEIDENTIFIER NULL,
 [CreatedDate] DATETIME DEFAULT GETDATE(),
 [CreatedBy] VARCHAR(100) NULL DEFAULT ('admin'),
 [LastUpdate] DATETIME NULL DEFAULT (GETDATE()),
 [UpdatedBy] VARCHAR(100) NULL DEFAULT ('admin')
)
GO
-- Add keys for table [Song]
ALTER TABLE [Song] ADD CONSTRAINT [song_pk] PRIMARY KEY ([SongId])
GO

-- Table [Album]
CREATE TABLE [Album](
	[AlbumId] UNIQUEIDENTIFIER NOT NULL  DEFAULT NEWID(),
	[AlbumName] VARCHAR(100) NOT NULL,
	[CreatedDate] DATETIME DEFAULT GETDATE(),
	[CreatedBy] VARCHAR(100) DEFAULT ('admin') ,
	[LastUpdate] DATETIME DEFAULT GETDATE(),
	[UpdatedBy] VARCHAR(100) DEFAULT ('admin') 
)
GO
ALTER TABLE [Album] ADD CONSTRAINT [album_pk] PRIMARY KEY ([AlbumId])
GO

-- Table [Discography]
CREATE TABLE [Discography]
(
 [DiscoId] NIQUEIDENTIFIER NOT NULL DEFAULT (newid()),
 [ArtistId] UNIQUEIDENTIFIER,
 [SongId] UNIQUEIDENTIFIER,
 [AlbumId] UNIQUEIDENTIFIER ,
 [CreatedDate] DATETIME DEFAULT GETDATE(),
 [CreatedBy] VARCHAR(100) DEFAULT ('admin') ,
 [LastUpdate] DATETIME DEFAULT GETDATE(),
 [UpdatedBy] VARCHAR(100) DEFAULT ('admin') 
)
GO
-- Add keys for table [Discography]
ALTER TABLE [Discography] ADD CONSTRAINT [Discography_pk] PRIMARY KEY NONCLUSTERED ([DiscoId])
GO

-- Create relationships section ------------------------------------------------- 
ALTER TABLE [Discography] ADD CONSTRAINT [artist_sings_songs] FOREIGN KEY ([ArtistId]) REFERENCES [Artist] ([ArtistId])
GO
ALTER TABLE [Discography] ADD CONSTRAINT [song_sung_artists] FOREIGN KEY ([SongId]) REFERENCES [Song] ([SongId])
GO
ALTER TABLE [Discography] ADD CONSTRAINT [album_has_songs] FOREIGN KEY ([AlbumId]) REFERENCES [Album] ([AlbumId])
GO
ALTER TABLE [Song] ADD CONSTRAINT [song_belongs_category] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([CategoryId])
GO
ALTER TABLE [Song] ADD CONSTRAINT [song_sung_Idiom] FOREIGN KEY ([IdiomId]) REFERENCES [Idiom] ([IdiomId])
GO
ALTER TABLE [Artist] ADD CONSTRAINT [artist_have_nationality] FOREIGN KEY ([CountryId]) REFERENCES [Country] ([CountryId])
GO




