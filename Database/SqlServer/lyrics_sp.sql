CREATE PROCEDURE [select_languages_sp]
	@ilanguage_id INT = NULL
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		IF (@ilanguage_id is NULL)
			SELECT * FROM [languages_t]
		ELSE
			SELECT * FROM [languages_t] WHERE @ilanguage_id = @ilanguage_id
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END
GO

CREATE PROCEDURE [insert_language_sp]
	@ilanguage VARCHAR(50)
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		INSERT INTO [languages_t] (language) VALUES (@ilanguage)
	END TRY
	BEGIN CATCH 
	SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_language_sp]
	@ilanguage_id INT,
	@ilanguage VARCHAR(50)
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		UPDATE  [languages_t] 
		SET language = @ilanguage
		WHERE language_id = @ilanguage_id
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [delete_language_sp]
	@ilanguage_id INT
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		DELETE FROM [languages_t] WHERE language_id = @ilanguage_id
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

--

CREATE PROCEDURE [select_category_sp]
	@icategory_id INT = NULL
AS BEGIN
	SET NOCOUNT OFF
	BEGIN TRY
	IF (@icategory_id is NULL)
		SELECT * FROM [categories_t]
	ELSE
		SELECT * FROM [categories_t] WHERE category_id = @icategory_id
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [insert_category_sp]
	@icategory VARCHAR(50)
AS BEGIN
	SET NOCOUNT OFF
	BEGIN TRY
		INSERT INTO [categories_t](category) values (@icategory)
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_category_sp]
	@icategory_id INT,
	@icategory VARCHAR(50)
AS BEGIN
	SET NOCOUNT OFF
	BEGIN TRY
		UPDATE [categories_t] 
		SET category = @icategory
		WHERE category_id = @icategory_id
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [delete_category_sp]
	@icategory_id INT
AS BEGIN
	SET NOCOUNT OFF
	BEGIN TRY
		DELETE FROM [categories_t] WHERE category_id = @icategory_ID
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END


GO



CREATE PROCEDURE [rm_inserta_country_sp]
@icountry VARCHAR(50)
AS 
BEGIN SET NOCOUNT OFF 
BEGIN TRY
Insert INTO [countries_t] (country)
values (@icountry)
END TRY
BEGIN CATCH
SELECT error_message()
END CATCH
END





GO

--

CREATE PROCEDURE [select_country_sp]
	@icountry_id INT = NULL
AS BEGIN 
	SET NOCOUNT OFF 
	BEGIN TRY
		IF (@icountry_id is NULL)
			SELECT * FROM [countries_t];
		ELSE
			SELECT * FROM [countries_t] WHERE country_id = @icountry_id;
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_country_sp]
	@icountry_id INT,
	@icountry VARCHAR(50)
AS BEGIN 
	SET NOCOUNT OFF 
	BEGIN TRY
		UPDATE [countries_t] 
		SET country = @icountry
		WHERE country_id = @icountry_id
	END TRY
	BEGIN CATCH
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [delete_country_sp]
	@icountry_id INT
AS BEGIN 
	SET NOCOUNT OFF 
	BEGIN TRY
		DELETE FROM [countries_t] WHERE country_id = @icountry_id 
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
	@ifirst_name VARCHAR(50),
	@ilast_name VARCHAR(50), 	
	@icountry_id INT 
AS BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		INSERT INTO [artists_t] (first_name,last_name, country_id) VALUES (@ifirst_name, @ilast_name, @icountry_id)
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_artist_sp]
	@iartist_id INT,
	@ifirst_name VARCHAR(50),
	@ilast_name VARCHAR(50), 	
	@icountry_id INT 
AS BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		UPDATE  [artists_t] 
		SET first_name = @ifirst_name,
			last_name = @ilast_name,
			country_id = @icountry_id
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
@isong_id INT = NULL
AS
BEGIN
SET NOCOUNT OFF;
BEGIN TRY
IF (@isong_id is NULL)
	SELECT * FROM rm_songes_t
ELSE
	SELECT * FROM rm_songes_t WHERE song_id = @isong_id
END TRY
BEGIN CATCH 
SELECT error_message()
END CATCH
END

GO

--

CREATE PROCEDURE [insert_song_sp]
@isong VARCHAR(50),
@ilyrics TEXT, 
@iauthor VARCHAR(50), 
@icategory_id INT, 
@ilanguage_id INT 
AS 
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		INSERT INTO [songs_t] ( song, lyrics, author, category_id, language_id) 
		VALUES ( @isong, @ilyrics, @iauthor, @icategory_id, @ilanguage_id)
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_song_sp]
	@isong_id INT,
	@isong VARCHAR(50),
	@ilyrics TEXT, 
	@iauthor VARCHAR(50), 
	@icategory_id INT, 
	@ilanguage_id INT 
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		UPDATE  [songs_t] 
		SET song = @isong,
		lyrics = @ilyrics,
		author = @iauthor,
		category_id = @icategory_id,
		language_id = @ilanguage_id
		WHERE song_id = @isong_id
	END TRY
	BEGIN CATCH 
		SELECT error_message()
END CATCH
END

GO

CREATE PROCEDURE [delete_song_sp]
@isong_id INT
AS
	BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		DELETE FROM [songs_t] WHERE song_id = @isong_id
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

--

CREATE PROCEDURE [select_discography_sp]
	@idiscography_id INT = nul
AS
BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		IF (@idiscography_id is NULL)
			SELECT * FROM rm_dicografia_t
		ELSE
			SELECT * FROM [discography_t] WHERE discography_id = @idiscography_id
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [insert_discography_sp]
	@iartist_id INT,
	@isong_id INT,
	@idiscography_id INT,
	@idiscography VARCHAR(50),
	@itrack_number INT,
	@ilength TIME
AS
BEGIN 
	SET NOCOUNT OFF
	BEGIN TRY
		INSERT INTO [discography_t] ([artist_id],[song_id],[discography_id], [discography],[track_number],[length]) 
		VALUES (@iartist_id,@isong_id,@idiscography_id,@idiscography,@itrack_number,@ilength)
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [update_discography_sp]
	@iartist_id INT,
	@isong_id INT,
	@idiscography_id INT,
	@idiscography VARCHAR(50),
	@itrack_number INT,
	@ilength TIME
AS
BEGIN 
	SET NOCOUNT OFF
	BEGIN TRY
		UPDATE  [discography_t] 
		SET artist_id = @iartist_id,
		song_id = @isong_id,
		discography = @idiscography,
		track_number = @itrack_number,
		length = @ilength
		WHERE discography_id = @idiscography_id
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO

CREATE PROCEDURE [delete_discography_sp]
	@idiscography_id INT
AS
	BEGIN
	SET NOCOUNT OFF;
	BEGIN TRY
		DELETE FROM [discography_t] WHERE discography_id = @idiscography_id
	END TRY
	BEGIN CATCH 
		SELECT error_message()
	END CATCH
END

GO
