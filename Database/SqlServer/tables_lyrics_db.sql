-- Table [artists_t]
CREATE TABLE [artists_t]
(
 [artist_id] INT IDENTITY(1,1) NOT NULL,
 [first_name] VARCHAR(50) NOT NULL,
 [last_name] VARCHAR(50) NULL,
 [country_id] INT NULL,
 [created_date] DATETIME DEFAULT GETDATE(),
 [created_by] VARCHAR(50) NULL,
 [updated_date] DATETIME,
 [updated_by] VARCHAR(50) NULL
)
GO
-- Add keys for table [artists_t]
ALTER TABLE [artists_t] ADD CONSTRAINT [artist_pk] PRIMARY KEY NONCLUSTERED ([artist_id])
GO

-- Table [countries_t]
CREATE TABLE [countries_t]
(
 [country_id] INT IDENTITY(1,1) NOT NULL,
 [country] VARCHAR(50) NOT NULL,
 [created_date] DATETIME DEFAULT GETDATE(),
 [created_by] VARCHAR(50) NULL,
 [updated_date] DATETIME,
 [updated_by] VARCHAR(50) NULL
)
GO
-- Add keys for table [countries_t]
ALTER TABLE [countries_t] ADD CONSTRAINT [country_pk] PRIMARY KEY NONCLUSTERED ([country_id])
GO

-- Table [languages_t]
CREATE TABLE [languages_t]
(
 [language_id] INT IDENTITY(1,1) NOT NULL,
 [language] VARCHAR(50) NOT NULL,
 [created_date] DATETIME DEFAULT GETDATE(),
 [created_by] VARCHAR(50) NULL,
 [updated_date] DATETIME,
 [updated_by] VARCHAR(50) NULL
)
GO
-- Add keys for table [languages_t]
ALTER TABLE [languages_t] ADD CONSTRAINT [language_pk] PRIMARY KEY NONCLUSTERED ([language_id])
GO

-- Table [categories_t]
CREATE TABLE [categories_t]
(
 [category_id] INT IDENTITY(1,1) NOT NULL,
 [category] VARCHAR(50) NOT NULL,
 [created_date] DATETIME DEFAULT GETDATE(),
 [created_by] VARCHAR(50) NULL,
 [updated_date] DATETIME,
 [updated_by] VARCHAR(50) NULL
)
GO
-- Add keys for table [categories_t]
ALTER TABLE [categories_t] ADD CONSTRAINT [category_pk] PRIMARY KEY NONCLUSTERED ([category_id])
GO

-- Table [songs_t]
CREATE TABLE [songs_t]
(
 [song_id] INT IDENTITY(1,1) NOT NULL,
 [song] VARCHAR(50) NOT NULL,
 [lyrics] TEXT NOT NULL,
 [author] VARCHAR(50) NULL,
 [category_id] INT NULL,
 [language_id] INT NULL,
 [created_date] DATETIME DEFAULT GETDATE(),
 [created_by] VARCHAR(50) NULL,
 [updated_date] DATETIME,
 [updated_by] VARCHAR(50) NULL
)
GO
-- Add keys for table [songs_t]
ALTER TABLE [songs_t] ADD CONSTRAINT [song_pk] PRIMARY KEY ([song_id])
GO

-- Table [discography_t]
CREATE TABLE [discography_t]
(
 [artist_id] INT NOT NULL,
 [song_id] INT NOT NULL,
 [discography_id] INT IDENTITY(1,1) NOT NULL,
 [discography] VARCHAR(50) NOT NULL,
 [track_number] INT NULL,
 [length] TIME NULL,
 [created_date] DATETIME DEFAULT GETDATE(),
 [created_by] VARCHAR(50) NULL,
 [updated_date] DATETIME,
 [updated_by] VARCHAR(50) NULL
)
GO
-- Add keys for table [discography_t]
ALTER TABLE [discography_t] ADD CONSTRAINT [discography_pk] PRIMARY KEY NONCLUSTERED ([artist_id],[song_id],[discography_id])
GO
ALTER TABLE [discography_t] ADD CONSTRAINT [discography] UNIQUE ([discography])
GO

-- Create relationships section ------------------------------------------------- 
ALTER TABLE [discography_t] ADD CONSTRAINT [artist_sings_songs] FOREIGN KEY ([artist_id]) REFERENCES [artists_t] ([artist_id])
GO

ALTER TABLE [discography_t] ADD CONSTRAINT [song_sung_artists] FOREIGN KEY ([song_id]) REFERENCES [songs_t] ([song_id])
GO

ALTER TABLE [songs_t] ADD CONSTRAINT [song_belongs_category] FOREIGN KEY ([category_id]) REFERENCES [categories_t] ([category_id])
GO

ALTER TABLE [songs_t] ADD CONSTRAINT [song_sung_language] FOREIGN KEY ([language_id]) REFERENCES [languages_t] ([language_id])
GO

ALTER TABLE [artists_t] ADD CONSTRAINT [artist_have_nationality] FOREIGN KEY ([country_id]) REFERENCES [countries_t] ([country_id])
GO




