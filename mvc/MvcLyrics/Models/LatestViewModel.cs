using System.Collections.Generic;

namespace MvcLyrics.Models
{
    public class LatestViewModel
    {
        public IList<Album> LatestAlbums
        {
            get; set;
        }

        public IList<Artist> LatestArtists
        {
            get; set;
        }

        public IList<Song> LatestSongs
        {
            get; set;
        }

    }
}