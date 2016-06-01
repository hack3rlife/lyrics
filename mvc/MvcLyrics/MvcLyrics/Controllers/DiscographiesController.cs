using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MvcLyrics.Models
{
    public class DiscographiesController : Controller
    {
        private LyricsDbContext db = new LyricsDbContext();

        // GET: Discographies
        public async Task<ActionResult> Index()
        {
            var discographies = db.Discographies.Include(d => d.Album).Include(d => d.Artist).Include(d => d.Song);
            return View(await discographies.ToListAsync());
        }

        // GET: Discographies/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Discography discography = await db.Discographies.FindAsync(id);
            if (discography == null)
            {
                return HttpNotFound();
            }
            return View(discography);
        }

        // GET: Discographies/Create
        public ActionResult Create()
        {
            ViewBag.AlbumId = new SelectList(db.Albums, "AlbumId", "AlbumName");
            ViewBag.ArtistId = new SelectList(db.Artists, "ArtistId", "FirstName");
            ViewBag.SongId = new SelectList(db.Songs, "SongId", "SongName");
            return View();
        }

        // POST: Discographies/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "ArtistId,SongId,AlbumId,CreatedDate,CreatedBy,LastUpdate,UpdatedBy")] Discography discography)
        {
            if (ModelState.IsValid)
            {
                db.Discographies.Add(discography);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.AlbumId = new SelectList(db.Albums, "AlbumId", "AlbumName", discography.AlbumId);
            ViewBag.ArtistId = new SelectList(db.Artists, "ArtistId", "FirstName", discography.ArtistId);
            ViewBag.SongId = new SelectList(db.Songs, "SongId", "SongName", discography.SongId);
            return View(discography);
        }

        // GET: Discographies/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Discography discography = await db.Discographies.FindAsync(id);
            if (discography == null)
            {
                return HttpNotFound();
            }
            ViewBag.AlbumId = new SelectList(db.Albums, "AlbumId", "AlbumName", discography.AlbumId);
            ViewBag.ArtistId = new SelectList(db.Artists, "ArtistId", "FirstName", discography.ArtistId);
            ViewBag.SongId = new SelectList(db.Songs, "SongId", "SongName", discography.SongId);
            return View(discography);
        }

        // POST: Discographies/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "ArtistId,SongId,AlbumId,CreatedDate,CreatedBy,LastUpdate,UpdatedBy")] Discography discography)
        {
            if (ModelState.IsValid)
            {
                db.Entry(discography).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.AlbumId = new SelectList(db.Albums, "AlbumId", "AlbumName", discography.AlbumId);
            ViewBag.ArtistId = new SelectList(db.Artists, "ArtistId", "FirstName", discography.ArtistId);
            ViewBag.SongId = new SelectList(db.Songs, "SongId", "SongName", discography.SongId);
            return View(discography);
        }

        // GET: Discographies/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Discography discography = await db.Discographies.FindAsync(id);
            if (discography == null)
            {
                return HttpNotFound();
            }
            return View(discography);
        }

        // POST: Discographies/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Discography discography = await db.Discographies.FindAsync(id);
            db.Discographies.Remove(discography);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
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
