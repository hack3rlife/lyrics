USE [lyicsdb]

-- Table [Artist]
CREATE TABLE [Artist]
(
 [ArtistId] INT IDENTITY(1,1) NOT NULL,
 [FirstName] VARCHAR(50) NOT NULL,
 [LastName] VARCHAR(50) NULL,
 [CountryId] INT NULL,
 [CreatedDate] DATETIME DEFAULT GETDATE(),
 [CreatedBy] VARCHAR(50) NULL,
 [LastUpdate] DATETIME,
 [UpdatedBy] VARCHAR(50) NULL
)
GO
-- Add keys for table [Artist]
ALTER TABLE [Artist] ADD CONSTRAINT [artist_pk] PRIMARY KEY NONCLUSTERED ([ArtistId])
GO

-- Table [Country]
CREATE TABLE [Country]
(
 [CountryId] INT IDENTITY(1,1) NOT NULL,
 [CountryName] VARCHAR(50) NOT NULL,
 [CreatedDate] DATETIME DEFAULT GETDATE(),
 [CreatedBy] VARCHAR(50) NULL,
 [LastUpdate] DATETIME,
 [UpdatedBy] VARCHAR(50) NULL
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
 [CreatedBy] VARCHAR(50) NULL,
 [LastUpdate] DATETIME,
 [UpdatedBy] VARCHAR(50) NULL
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
 [CreatedBy] VARCHAR(50) NULL,
 [LastUpdate] DATETIME,
 [UpdatedBy] VARCHAR(50) NULL
)
GO
-- Add keys for table [Category]
ALTER TABLE [Category] ADD CONSTRAINT [category_pk] PRIMARY KEY NONCLUSTERED ([CategoryId])
GO

-- Table [Song]
CREATE TABLE [Song]
(
 [SongId] INT IDENTITY(1,1) NOT NULL,
 [SongName] VARCHAR(50) NOT NULL,
 [Lyrics] TEXT NOT NULL,
 [Author] VARCHAR(50) NULL,
 [CategoryId] INT NULL,
 [IdiomId] INT NULL,
 [CreatedDate] DATETIME DEFAULT GETDATE(),
 [CreatedBy] VARCHAR(50) NULL,
 [LastUpdate] DATETIME,
 [UpdatedBy] VARCHAR(50) NULL
)
GO
-- Add keys for table [Song]
ALTER TABLE [Song] ADD CONSTRAINT [song_pk] PRIMARY KEY ([SongId])
GO

-- Table [Album]
CREATE TABLE [Album]
(
 [ArtistId] INT NOT NULL,
 [SongId] INT NOT NULL,
 [AlbumId] INT IDENTITY(1,1) NOT NULL,
 [AlbumName] VARCHAR(50) NOT NULL,
 [TrackNum] INT NULL,
 [Length] TIME NULL,
 [CreatedDate] DATETIME DEFAULT GETDATE(),
 [CreatedBy] VARCHAR(50) NULL,
 [LastUpdate] DATETIME,
 [UpdatedBy] VARCHAR(50) NULL
)
GO
-- Add keys for table [Album]
ALTER TABLE [Album] ADD CONSTRAINT [album_pk] PRIMARY KEY NONCLUSTERED ([ArtistId],[SongId],[AlbumId])
GO
ALTER TABLE [Album] ADD CONSTRAINT [album_name] UNIQUE ([AlbumName])
GO

-- Create relationships section ------------------------------------------------- 
ALTER TABLE [Album] ADD CONSTRAINT [artist_sings_songs] FOREIGN KEY ([ArtistId]) REFERENCES [Artist] ([ArtistId])
GO
ALTER TABLE [Album] ADD CONSTRAINT [song_sung_artists] FOREIGN KEY ([SongId]) REFERENCES [Song] ([SongId])
GO
ALTER TABLE [Song] ADD CONSTRAINT [song_belongs_category] FOREIGN KEY ([CategoryId]) REFERENCES [Category] ([CategoryId])
GO
ALTER TABLE [Song] ADD CONSTRAINT [song_sung_Idiom] FOREIGN KEY ([IdiomId]) REFERENCES [Idiom] ([IdiomId])
GO
ALTER TABLE [Artist] ADD CONSTRAINT [artist_have_nationality] FOREIGN KEY ([CountryId]) REFERENCES [Country] ([CountryId])
GO




