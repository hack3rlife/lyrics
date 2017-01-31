using System.Linq;
using System.Web.Mvc;
using MvcLyrics.Models;

namespace MvcLyrics.Controllers
{
    public class HomeController : Controller
    {
        private LyricsDbContext db = new LyricsDbContext();

        public ActionResult Index()
        {
            LatestViewModel latest = new LatestViewModel();
            latest.LatestAlbums = db.Albums.OrderByDescending(s => s.CreatedDate).Take(10).ToList();
            latest.LatestArtists = db.Artists.OrderByDescending(s => s.CreatedDate).Take(10).ToList();
            latest.LatestSongs = db.Songs.OrderByDescending(s => s.CreatedDate).Take(10).ToList();


            return View(latest);
        }

        public ActionResult Search()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Building .NET Enterprise Applications.";            

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Contact Us.";

            return View();
        }

       
    }
}