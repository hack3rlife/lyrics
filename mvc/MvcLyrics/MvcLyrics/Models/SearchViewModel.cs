using System;
using System.Collections.Generic;

namespace MvcLyrics.Models
{
    [Serializable]
    public class SearchViewModel
    {
        public IList<Album> Albums
        {
            get; set;
        }

        public IList<Artist> Artists
        {
            get; set;
        }

        public IList<Song> Songs
        {
            get; set;
        }

    }
}