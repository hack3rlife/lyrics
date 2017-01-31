using System;
using System.Collections;
using System.Collections.Generic;

namespace MvcLyrics.Models
{
    public class AlbumViewModel : IEqualityComparer
    {
        public Album Album
        {
            get; set;
        }

        public IList<Discography> Discography
        {
            get; set;
        }

        public new bool Equals(object x, object y)
        {
            throw new NotImplementedException();
        }

        public int GetHashCode(object obj)
        {
            throw new NotImplementedException();
        }
    }
}