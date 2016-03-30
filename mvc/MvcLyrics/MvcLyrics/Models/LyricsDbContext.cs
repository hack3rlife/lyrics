namespace MvcLyrics.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class LyricsDbContext : DbContext
    {
        public LyricsDbContext()
            : base("name=LyricsDbContext")
        {
        }

        public virtual DbSet<Album> Albums { get; set; }
        public virtual DbSet<Artist> Artists { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Country> Countries { get; set; }
        public virtual DbSet<Idiom> Idioms { get; set; }
        public virtual DbSet<Song> Songs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Album>()
                .Property(e => e.AlbumName)
                .IsUnicode(false);

            modelBuilder.Entity<Album>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Album>()
                .Property(e => e.UpdatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Artist>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<Artist>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<Artist>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Artist>()
                .Property(e => e.UpdatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Artist>()
                .HasMany(e => e.Albums)
                .WithRequired(e => e.Artist)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.CategoryName)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.UpdatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Country>()
                .Property(e => e.CountryName)
                .IsUnicode(false);

            modelBuilder.Entity<Country>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Country>()
                .Property(e => e.UpdatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Idiom>()
                .Property(e => e.IdiomName)
                .IsUnicode(false);

            modelBuilder.Entity<Idiom>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Idiom>()
                .Property(e => e.UpdatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Song>()
                .Property(e => e.SongName)
                .IsUnicode(false);

            modelBuilder.Entity<Song>()
                .Property(e => e.Lyrics)
                .IsUnicode(false);

            modelBuilder.Entity<Song>()
                .Property(e => e.Author)
                .IsUnicode(false);

            modelBuilder.Entity<Song>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Song>()
                .Property(e => e.UpdatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Song>()
                .HasMany(e => e.Albums)
                .WithRequired(e => e.Song)
                .WillCascadeOnDelete(false);
        }
    }
}
