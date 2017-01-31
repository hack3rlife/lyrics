using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MvcLyrics.Models;

namespace MvcLyrics.Controllers
{
    public class IdiomsController : Controller
    {
        private LyricsDbContext db = new LyricsDbContext();

        // GET: Idioms
        public async Task<ActionResult> Index()
        {
            return View(await db.Idioms.ToListAsync());
        }

        // GET: Idioms/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Idiom idiom = await db.Idioms.FindAsync(id);
            if (idiom == null)
            {
                return HttpNotFound();
            }
            return View(idiom);
        }

        // GET: Idioms/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Idioms/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "IdiomId,IdiomName,CreatedDate,CreatedBy,LastUpdate,UpdatedBy")] Idiom idiom)
        {
            if (ModelState.IsValid)
            {
                db.Idioms.Add(idiom);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(idiom);
        }

        // GET: Idioms/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Idiom idiom = await db.Idioms.FindAsync(id);
            if (idiom == null)
            {
                return HttpNotFound();
            }
            return View(idiom);
        }

        // POST: Idioms/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "IdiomId,IdiomName,CreatedDate,CreatedBy,LastUpdate,UpdatedBy")] Idiom idiom)
        {
            if (ModelState.IsValid)
            {
                db.Entry(idiom).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(idiom);
        }

        // GET: Idioms/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Idiom idiom = await db.Idioms.FindAsync(id);
            if (idiom == null)
            {
                return HttpNotFound();
            }
            return View(idiom);
        }

        // POST: Idioms/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Idiom idiom = await db.Idioms.FindAsync(id);
            db.Idioms.Remove(idiom);
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
