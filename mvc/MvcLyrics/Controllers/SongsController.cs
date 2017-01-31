using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web.Mvc;
using MvcLyrics.Models;

namespace MvcLyrics.Controllers
{
    public class SongsController : Controller
    {
        private LyricsDbContext db = new LyricsDbContext();

        // GET: Songs
        public async Task<ActionResult> Index()
        {
            var songs = db.Songs.Include(s => s.Category).Include(s => s.Idiom);
            return View(await songs.ToListAsync());
        }

        // GET: Songs/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Song song = await db.Songs.FindAsync(id);
            if (song == null)
            {
                return HttpNotFound();
            }
            return View(song);
        }

        // GET: Songs/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName");
            ViewBag.IdiomId = new SelectList(db.Idioms, "IdiomId", "IdiomName");
            return View();
        }

        // POST: Songs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "SongId,SongName,Lyrics,Author,CategoryId,IdiomId,CreatedDate,CreatedBy,LastUpdate,UpdatedBy")] Song song)
        {
            if (ModelState.IsValid)
            {
                db.Songs.Add(song);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", song.CategoryId);
            ViewBag.IdiomId = new SelectList(db.Idioms, "IdiomId", "IdiomName", song.IdiomId);
            return View(song);
        }

        // GET: Songs/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Song song = await db.Songs.FindAsync(id);
            if (song == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", song.CategoryId);
            ViewBag.IdiomId = new SelectList(db.Idioms, "IdiomId", "IdiomName", song.IdiomId);
            return View(song);
        }

        // POST: Songs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "SongId,SongName,Lyrics,Author,CategoryId,IdiomId,CreatedDate,CreatedBy,LastUpdate,UpdatedBy")] Song song)
        {
            if (ModelState.IsValid)
            {
                db.Entry(song).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "CategoryName", song.CategoryId);
            ViewBag.IdiomId = new SelectList(db.Idioms, "IdiomId", "IdiomName", song.IdiomId);
            return View(song);
        }

        // GET: Songs/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Song song = await db.Songs.FindAsync(id);
            if (song == null)
            {
                return HttpNotFound();
            }
            return View(song);
        }

        // POST: Songs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Song song = await db.Songs.FindAsync(id);
            db.Songs.Remove(song);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        public async Task<ActionResult> Show(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }


            SongViewModel song = new SongViewModel();
            song.Song = await db.Songs.FindAsync(id);

            if (song == null)
            {
                return HttpNotFound();
            }
            
            ViewBag.Title = song.Song.SongName;

            song.Discography = await db.Discographies
                .Include(d => d.Album)
                .Include(d => d.Artist)
                .Include(d => d.Song)
                .Where(a => a.SongId == id)
                .ToListAsync();

            return View(song);
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
