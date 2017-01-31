namespace MvcLyrics.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Discography")]
    public partial class Discography
    {
        [Key]
        public Guid DiscoId { get; set; }

        public int? ArtistId { get; set; }

        public int? SongId { get; set; }


        public int? AlbumId { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? LastUpdate { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }

        public virtual Album Album { get; set; }

        public virtual Artist Artist { get; set; }

        public virtual Song Song { get; set; }
    }
}
