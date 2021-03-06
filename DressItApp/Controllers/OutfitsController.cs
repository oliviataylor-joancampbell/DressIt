﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DressItApp.Models;

namespace DressItApp.Controllers
{
    public class OutfitsController : Controller
    {
        private DressItDBEntities db = new DressItDBEntities();

        // GET: Outfits
        public ActionResult Index()
        {
            var outfits = db.Outfits.Include(o => o.Top).Include(o => o.Bottom).Include(o => o.Shoes);
            return View(outfits.ToList());
        }

        // GET: Outfits/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Outfit outfit = db.Outfits.Find(id);
            if (outfit == null)
            {
                return HttpNotFound();
            }
            return View(outfit);
        }

        // GET: Outfits/Create
        public ActionResult Create()
        {
            var possibleTops = from item in db.WardrobeItems
                               where item.TypeID == 1
                               select item;
            ViewBag.TopID = new SelectList(possibleTops, "WardrobeItemID", "Name");

            var possibleBottoms = from item in db.WardrobeItems
                               where item.TypeID == 2
                               select item;
            ViewBag.BottomID = new SelectList(possibleBottoms, "WardrobeItemID", "Name");

            var possibleShoes = from item in db.WardrobeItems
                               where item.TypeID == 3
                               select item;
            ViewBag.ShoeID = new SelectList(possibleShoes, "WardrobeItemID", "Name");

            var possibleAccessories = from item in db.WardrobeItems
                                where item.TypeID == 4
                                select item;
            ViewBag.AccessoryID = new MultiSelectList(possibleAccessories, "WardrobeItemID", "Name");
            return View();
        }

        // POST: Outfits/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OutfitID,TopID,BottomID,ShoeID,OutfitName,")] Outfit outfit, int[] AccessoryID)
        {
            if (ModelState.IsValid)
            {
                if (AccessoryID != null)
                {
                    foreach (var item in AccessoryID)
                    {
                        outfit.Accessories.Add(db.WardrobeItems.Find(item));
                    }

                }
                db.Outfits.Add(outfit);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

          
            ViewBag.TopID = new SelectList(db.WardrobeItems, "WardrobeItemID", "Name", outfit.TopID);
            ViewBag.BottomID = new SelectList(db.WardrobeItems, "WardrobeItemID", "Name", outfit.BottomID);
            ViewBag.ShoeID = new SelectList(db.WardrobeItems, "WardrobeItemID", "Name", outfit.ShoeID);
         
            
            return View(outfit);
        }

        // GET: Outfits/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Outfit outfit = db.Outfits.Find(id);
            if (outfit == null)
            {
                return HttpNotFound();
            }

            var possibleTops = from item in db.WardrobeItems
                               where item.TypeID == 1
                               select item;
            ViewBag.TopID = new SelectList(possibleTops, "WardrobeItemID", "Name", outfit.TopID);

            var possibleBottoms = from item in db.WardrobeItems
                                  where item.TypeID == 2
                                  select item;
            ViewBag.BottomID = new SelectList(possibleBottoms, "WardrobeItemID", "Name", outfit.BottomID);

            var possibleShoes = from item in db.WardrobeItems
                               where item.TypeID == 3
                               select item;
            ViewBag.ShoeID = new SelectList(possibleShoes, "WardrobeItemID", "Name", outfit.ShoeID);

            var possibleAccessories = from item in db.WardrobeItems
                                      where item.TypeID == 4
                                      select item;
            ViewBag.AccessoryID = new MultiSelectList(possibleAccessories, "WardrobeItemID", "Name",outfit.Accessories);

            return View(outfit);
        }

        // POST: Outfits/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OutfitID,TopID,BottomID,ShoeID,OutfitName")] Outfit outfit,int[] AccessoryID)
        {
            if (ModelState.IsValid)
            {
                if (AccessoryID != null)
                {
                foreach(int accessoryID in AccessoryID)
                {
                    outfit.Accessories.Add(db.WardrobeItems.Find(accessoryID));
                }
                }
                db.Entry(outfit).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TopID = new SelectList(db.WardrobeItems, "WardrobeItemID", "Name", outfit.TopID);
            ViewBag.BottomID = new SelectList(db.WardrobeItems, "WardrobeItemID", "Name", outfit.BottomID);
            ViewBag.ShoeID = new SelectList(db.WardrobeItems, "WardrobeItemID", "Name", outfit.ShoeID);

            return View(outfit);
        }

        // GET: Outfits/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Outfit outfit = db.Outfits.Find(id);
            if (outfit == null)
            {
                return HttpNotFound();
            }
            return View(outfit);
        }

        // POST: Outfits/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Outfit outfit = db.Outfits.Find(id);

            outfit.Accessories.Clear();

            db.Outfits.Remove(outfit);
            db.SaveChanges();
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
