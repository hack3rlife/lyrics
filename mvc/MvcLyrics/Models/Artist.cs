namespace MvcLyrics.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    [Table("Artist")]
    public partial class Artist
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Artist()
        {
            Discographies = new HashSet<Discography>();
        }

        public int ArtistId
        {
            get; set;
        }

        [StringLength(100)]
        [Display(Name = "Name")]
        public string FirstName
        {
            get; set;
        }

        [StringLength(50)]
        [Display(Name = "Featuring")]
        public string LastName
        {
            get; set;
        }

        [Display(Name = "Country")]
        public int? CountryId
        {
            get; set;
        }

        [Display(Name = "Created Date")]
        public DateTime? CreatedDate
        {
            get; set;
        }

        [StringLength(100)]
        [Display(Name = "Created By")]
        public string CreatedBy
        {
            get; set;
        }

        [Display(Name = "Last Update")]
        public DateTime? LastUpdate
        {
            get; set;
        }

        [StringLength(50)]
        [Display(Name = "Updated By")]
        public string UpdatedBy
        {
            get; set;
        }

        [Display(Name = "Country")]
        public virtual Country Country
        {
            get; set;
        }

        public virtual ICollection<Discography> Discographies
        {
            get; set;
        }
    }
}
