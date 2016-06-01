using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using MvcLyrics.Models;

namespace MvcLyrics.Controllers
{
    public class ArtistsController : Controller
    {
        private LyricsDbContext db = new LyricsDbContext();

        // GET: Artists
        public async Task<ActionResult> Index()
        {
            var artists = db.Artists.Include(a => a.Country).Take(10);
            return View(await artists.ToListAsync());
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
