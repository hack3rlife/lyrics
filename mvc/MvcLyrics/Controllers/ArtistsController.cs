using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using MvcLyrics.Models;
using PagedList.EntityFramework;

namespace MvcLyrics.Controllers
{
    public class ArtistsController : Controller
    {
        private LyricsDbContext db = new LyricsDbContext();

        // GET: Artists
        public async Task<ActionResult> Index(string sortOrder = "name_desc", string currentFilter = "", string searchString = "", int? page = 1)
        {
            var split = sortOrder.Split(new[] { '_' });

            var curr = split[1] != "desc" ? "_desc" : "_asc";

            ViewBag.SortOrder = curr;
            ViewBag.CurrentFilter = searchString;

            if (searchString == null)
            {
                searchString = currentFilter;
            }

            int pageSize = 10;
            int pageNumber = (page ?? 1);

            var artists = db.Artists.Include(a => a.Country);

            switch (sortOrder)
            {
                case "country_desc":
                    artists = artists.OrderByDescending(s => s.Country.CountryName);
                    break;
                case "name_desc":
                    artists = artists.OrderByDescending(s => s.FirstName);
                    break;
                case "created_date_desc":
                    artists = artists.OrderByDescending(s => s.CreatedDate);
                    break;
                case "updated_date_desc":
                    artists = artists.OrderByDescending(s => s.LastUpdate);
                    break;
                case "country_asc":
                    artists = artists.OrderBy(s => s.Country.CountryName);
                    break;
                case "name_asc":
                    artists = artists.OrderBy(s => s.FirstName);
                    break;
                case "created_date_asc":
                    artists = artists.OrderBy(s => s.CreatedDate);
                    break;
                case "updated_date_asc":
                    artists = artists.OrderBy(s => s.CreatedDate);
                    break;
                default:
                    artists = artists.OrderBy(s => s.LastUpdate);
                    break;
            }

            return View(await artists.ToPagedListAsync(pageNumber, pageSize));
        }

        // GET: Artists/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Artist artist = await db.Artists.FindAsync(id);
            if (artist == null)
            {
                return HttpNotFound();
            }
            return View(artist);
        }

        // GET: Artists/Create
        public ActionResult Create()
        {
            ViewBag.CountryId = new SelectList(db.Countries, "CountryId", "CountryName");
            return View();
        }

        // POST: Artists/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "ArtistId,FirstName,LastName,CountryId,CreatedDate,CreatedBy,LastUpdate,UpdatedBy")] Artist artist)
        {
            if (ModelState.IsValid)
            {
                db.Artists.Add(artist);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.CountryId = new SelectList(db.Countries, "CountryId", "CountryName", artist.CountryId);
            return View(artist);
        }

        // GET: Artists/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Artist artist = await db.Artists.FindAsync(id);
            if (artist == null)
            {
                return HttpNotFound();
            }
            ViewBag.CountryId = new SelectList(db.Countries, "CountryId", "CountryName", artist.CountryId);
            return View(artist);
        }

        // POST: Artists/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "ArtistId,FirstName,LastName,CountryId,CreatedDate,CreatedBy,LastUpdate,UpdatedBy")] Artist artist)
        {
            if (ModelState.IsValid)
            {
                db.Entry(artist).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.CountryId = new SelectList(db.Countries, "CountryId", "CountryName", artist.CountryId);
            return View(artist);
        }

        // GET: Artists/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Artist artist = await db.Artists.FindAsync(id);
            if (artist == null)
            {
                return HttpNotFound();
            }
            return View(artist);
        }

        // POST: Artists/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Artist artist = await db.Artists.FindAsync(id);
            db.Artists.Remove(artist);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        public async Task<ActionResult> Show(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            ArtistViewModel artist = new ArtistViewModel();
            artist.Artist = await db.Artists.FindAsync(id);

            if (artist.Artist == null)
            {
                return HttpNotFound();
            }

            ViewBag.Title = artist.Artist.FirstName;

            artist.Discography = await db.Discographies
                .Include(d => d.Album)
                .Include(d => d.Artist)
                .Include(d => d.Song)
                .Where(a => a.ArtistId == id)
                .ToListAsync();

            return View(artist);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
