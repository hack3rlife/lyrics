namespace MvcLyrics.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Song")]
    public partial class Song
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Song()
        {
            Discographies = new HashSet<Discography>();
        }

        public int SongId { get; set; }

        [StringLength(255)]
        public string SongName { get; set; }

        [Column(TypeName = "text")]
        [Required]
        public string Lyrics { get; set; }

        [StringLength(50)]
        public string Author { get; set; }

        public int? CategoryId { get; set; }

        public int? IdiomId { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? LastUpdate { get; set; }

        [StringLength(50)]
        public string UpdatedBy { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Discography> Discographies { get; set; }

        public virtual Idiom Idiom { get; set; }
    }
}
