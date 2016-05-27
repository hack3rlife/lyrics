using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using MvcLyrics.Models;
using PagedList.EntityFramework;

namespace MvcLyrics.Controllers
{
    public class SearchController : Controller
    {
        private LyricsDbContext db = new LyricsDbContext();

        // GET: Search
        public async Task<ActionResult> Index(string id, string sortOrder, string currentFilter, string searchString, int? page)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            IQueryable<Artist> artists;

            if (searchString != null)
            {
                page = 1;
            }
            else
            {
                searchString = currentFilter;
            }

            ViewBag.Title = id;
            ViewBag.SortOrder = string.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.CurrentFilter = searchString;


            if (!string.IsNullOrEmpty(searchString))
            {
                artists = db.Artists.Where(s => s.FirstName.Contains(searchString));
            }
            else
            {
                artists = db.Artists.Where(s => s.FirstName.StartsWith(id));
            }

            switch (sortOrder)
            {
                case "name_desc":
                    artists = artists.OrderByDescending(s => s.FirstName);
                    break;

                default:
                    artists = artists.OrderBy(s => s.FirstName);
                    break;
            }

            int pageSize = 10;
            int pageNumber = (page ?? 1);

            return View(await artists.ToPagedListAsync(pageNumber, pageSize));
        }

        public async Task<ActionResult> Artists(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var artists = db.Artists.Where(s => s.FirstName.StartsWith(id)).OrderBy(s => s.FirstName).Take(10);
            return View(await artists.ToListAsync());
        }


        public async Task<ActionResult> Songs(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            var songs = db.Songs.Where(s => s.SongName.StartsWith(id)).OrderBy(s => s.SongName).Take(10);
            return View(await songs.ToListAsync());
        }

        public ActionResult Search(string searchBy, string searchString)
        {
            SearchViewModel result = new SearchViewModel();

            switch (searchBy)
            {
                case "Album":
                    result.Albums = db.Albums.Where(s => s.AlbumName.Contains(searchString)).ToList();
                    return View("SearchByAlbum", result.Albums);
                case "Artist":
                    result.Artists = db.Artists.Where(s => s.FirstName.Contains(searchString)).ToList();
                    return View("SearchByArtist", result.Artists);
                case "Song":
                    result.Songs = db.Songs.Where(s => s.SongName.Contains(searchString)).ToList();
                    return View("SearchBySong", result.Songs);
                default:
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult SearchByArtist(IList<Artist> artists)
        {
            return View(artists);
        }
    }
}
