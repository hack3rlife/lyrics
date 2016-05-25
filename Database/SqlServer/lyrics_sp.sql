CREATE PROCEDURE [select_Idioms_sp]
	@iIdiomId INT = NULL
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		IF (@iIdiomId is NULL)
			SELECT * FROM [Idiom]
		ELSE
			SELECT * FROM [Idiom] WHERE @iIdiomId = @iIdiomId
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END
GO

CREATE PROCEDURE [insert_Idiom_sp]
	@iIdiom VARCHAR(50)
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		INSERT INTO [Idiom] (Idiom) VALUES (@iIdiom)
	END TRY
	BEGIN CATCH 
	SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_Idiom_sp]
	@iIdiomId INT,
	@iIdiom VARCHAR(50)
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		UPDATE  [Idiom] 
		SET Idiom = @iIdiom
		WHERE IdiomId = @iIdiomId
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [delete_Idiom_sp]
	@iIdiomId INT
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		DELETE FROM [Idiom] WHERE IdiomId = @iIdiomId
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

--

CREATE PROCEDURE [select_Category_sp]
	@iCategoryId INT = NULL
AS BEGIN
	SET NOCOUNT OFF
	BEGIN TRY
	IF (@iCategoryId is NULL)
		SELECT * FROM [Category]
	ELSE
		SELECT * FROM [Category] WHERE CategoryId = @iCategoryId
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [insert_Category_sp]
	@iCategory VARCHAR(50)
AS BEGIN
	SET NOCOUNT OFF
	BEGIN TRY
		INSERT INTO [Category](Category) values (@iCategory)
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_Category_sp]
	@iCategoryId INT,
	@iCategory VARCHAR(50)
AS BEGIN
	SET NOCOUNT OFF
	BEGIN TRY
		UPDATE [Category] 
		SET Category = @iCategory
		WHERE CategoryId = @iCategoryId
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [delete_Category_sp]
	@iCategoryId INT
AS BEGIN
	SET NOCOUNT OFF
	BEGIN TRY
		DELETE FROM [Category] WHERE CategoryId = @iCategoryId
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END


GO



CREATE PROCEDURE [rm_inserta_Country_sp]
@iCountry VARCHAR(50)
AS 
BEGIN SET NOCOUNT OFF 
BEGIN TRY
Insert INTO [Country] (Country)
values (@iCountry)
END TRY
BEGIN CATCH
SELECT error_message()
END CATCH
END





GO

--

CREATE PROCEDURE [select_Country_sp]
	@iCountryId INT = NULL
AS BEGIN 
	SET NOCOUNT OFF 
	BEGIN TRY
		IF (@iCountryId is NULL)
			SELECT * FROM [Country];
		ELSE
			SELECT * FROM [Country] WHERE CountryId = @iCountryId;
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_Country_sp]
	@iCountryId INT,
	@iCountry VARCHAR(50)
AS BEGIN 
	SET NOCOUNT OFF 
	BEGIN TRY
		UPDATE [Country] 
		SET Country = @iCountry
		WHERE CountryId = @iCountryId
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [delete_Country_sp]
	@iCountryId INT
AS BEGIN 
	SET NOCOUNT OFF 
	BEGIN TRY
		DELETE FROM [Country] WHERE CountryId = @iCountryId 
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END

GO

--

CREATE PROCEDURE [select_artist_sp]
	@iartist_id INT = NULL
AS BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
	IF (@iartist_id is NULL)
		SELECT * FROM [artists_t]
	ELSE
		SELECT * FROM [artists_t] WHERE artist_id = @iartist_id
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [insert_artist_sp]
	@iName VARCHAR(50),
	@iLastName VARCHAR(50), 	
	@iCountryId INT 
AS BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		INSERT INTO [artists_t] (Name,LastName, CountryId) VALUES (@iName, @iLastName, @iCountryId)
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_artist_sp]
	@iartist_id INT,
	@iName VARCHAR(50),
	@iLastName VARCHAR(50), 	
	@iCountryId INT 
AS BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		UPDATE  [artists_t] 
		SET Name = @iName,
			LastName = @iLastName,
			CountryId = @iCountryId
		WHERE artist_id = @iartist_id
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [delete_artist_sp]
	@iartist_id INT
AS BEGIN 
	SET NOCOUNT OFF;
	BEGIN TRY
		DELETE FROM [artists_t] WHERE artist_id = @iartist_id
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END


GO



CREATE PROCEDURE [rm_consulta_song_sp]
@iSongId INT = NULL
AS
BEGIN
SET NOCOUNT OFF;
BEGIN TRY
IF (@iSongId is NULL)
	SELECT * FROM rm_songes_t
ELSE
	SELECT * FROM rm_songes_t WHERE SongId = @iSongId
END TRY
BEGIN CATCH 
SELECT error_message()
END CATCH
END

GO

--

CREATE PROCEDURE [insert_song_sp]
@isong VARCHAR(50),
@iLyrics TEXT, 
@iAuthor VARCHAR(50), 
@iCategoryId INT, 
@iIdiomId INT 
AS 
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		INSERT INTO [Song] ( song, Lyrics, Author, CategoryId, IdiomId) 
		VALUES ( @isong, @iLyrics, @iAuthor, @iCategoryId, @iIdiomId)
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_song_sp]
	@iSongId INT,
	@isong VARCHAR(50),
	@iLyrics TEXT, 
	@iAuthor VARCHAR(50), 
	@iCategoryId INT, 
	@iIdiomId INT 
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		UPDATE  [Song] 
		SET song = @isong,
		Lyrics = @iLyrics,
		Author = @iAuthor,
		CategoryId = @iCategoryId,
		IdiomId = @iIdiomId
		WHERE SongId = @iSongId
	END TRY
	BEGIN CATCH 
		SELECT error_message()
END CATCH
END

GO

CREATE PROCEDURE [delete_song_sp]
@iSongId INT
AS
	BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		DELETE FROM [Song] WHERE SongId = @iSongId
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

--

CREATE PROCEDURE [select_Album_sp]
	@iAlbumId INT = nul
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		IF (@iAlbumId is NULL)
			SELECT * FROM rm_dicografia_t
		ELSE
			SELECT * FROM [Album] WHERE AlbumId = @iAlbumId
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [insert_Album_sp]
	@iartist_id INT,
	@iSongId INT,
	@iAlbumId INT,
	@iAlbum VARCHAR(50),
	@iTrackNum INT,
	@iLength TIME
AS
BEGIN 
	SET NOCOUNT OFF
	BEGIN TRY
		INSERT INTO [Album] ([ArtistId,[SongId],[AlbumId], [Album],[TrackNum],[Length]) 
		VALUES (@iartist_id,@iSongId,@iAlbumId,@iAlbum,@iTrackNum,@iLength)
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_Album_sp]
	@iartist_id INT,
	@iSongId INT,
	@iAlbumId INT,
	@iAlbum VARCHAR(50),
	@iTrackNum INT,
	@iLength TIME
AS
BEGIN 
	SET NOCOUNT OFF
	BEGIN TRY
		UPDATE  [Album] 
		SET artist_id = @iartist_id,
		SongId = @iSongId,
		Album = @iAlbum,
		TrackNum = @iTrackNum,
		Length = @iLength
		WHERE AlbumId = @iAlbumId
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [delete_Album_sp]
	@iAlbumId INT
AS
	BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		DELETE FROM [Album] WHERE AlbumId = @iAlbumId
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO
