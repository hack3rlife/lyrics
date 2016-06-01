USE [lyicsdb]

-- Table [Artist]
CREATE TABLE [Artist]
(
 [ArtistId] INT IDENTITY(1,1) NOT NULL,
 [Name] VARCHAR(255) NOT NULL, 
 [CountryId] INT NULL,
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
 [CountryId] INT IDENTITY(1,1) NOT NULL,
 [CountryName] VARCHAR(255) NOT NULL,
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
 [IdiomId] INT IDENTITY(1,1) NOT NULL,
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
 [CategoryId] INT IDENTITY(1,1) NOT NULL,
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
 [SongId] INT IDENTITY(1,1) NOT NULL,
 [SongName] VARCHAR(255) NOT NULL,
 [Lyrics] TEXT NOT NULL,
 [Author] VARCHAR(255) NULL,
 [CategoryId] INT NULL,
 [IdiomId] INT NULL,
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
CREATE TABLE [dbo].[Album](
	[AlbumId] [int] IDENTITY(1,1) NOT NULL,
	[AlbumName] [varchar](100) NOT NULL,
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
 [ArtistId] INT NOT NULL,
 [SongId] INT NOT NULL,
 [AlbumId] INT (1,1) NOT NULL,
 [CreatedDate] DATETIME DEFAULT GETDATE(),
 [CreatedBy] VARCHAR(100) DEFAULT ('admin') ,
 [LastUpdate] DATETIME DEFAULT GETDATE(),
 [UpdatedBy] VARCHAR(100) DEFAULT ('admin') 
)
GO
-- Add keys for table [Discography]
ALTER TABLE [Discography] ADD CONSTRAINT [Discography_pk] PRIMARY KEY NONCLUSTERED ([ArtistId],[SongId],[AlbumId])
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




