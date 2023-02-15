using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication24.Models;

namespace WebApplication24.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin

        FinalProjectEntities db= new FinalProjectEntities();
        public ActionResult Index()

        {
            string d = Convert.ToString(Session["UserName"]);
            ViewBag.Message = d + " ,Welcome Back Admin";
            var result = db.Customer1.ToList();

            return View(result);
        }
        public ActionResult Create(int id = 0)
        {
            Customer1 c1 = new Customer1();
            return View(c1);
        }

        // POST: Customer/Create
        [HttpPost]
        public ActionResult Create(Customer1 c1)
        {
            try
            {
                var result = db.Customer1.Where(test => test.Name == c1.Name).FirstOrDefault();
                if (result != null)
                {
                    ViewBag.Message = "Username already exists";
                }
                else
                {
                    db.Customer1.Add(c1);
                    db.SaveChanges();
                    Session["Name"] = c1.Name;
                    return RedirectToAction("Index");
                }
                return View();
            }
            catch
            {
                return RedirectToAction("Index");
            }
        }
        public ActionResult Edit(int id)
        {
            var result = db.Customer1.Where(test => test.ID == id).FirstOrDefault();
            return View(result);
        }

        // POST: Book/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Customer1 c1, FormCollection collection)
        {
            try
            {
                c1.ID = id;
                db.Entry(c1).State = EntityState.Modified;
                db.SaveChanges();
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Book/Delete/5
        public ActionResult Delete(int id)
        {
            var result = db.Customer1.Where(test => test.ID == id).FirstOrDefault();
            return View(result);
        }

        // POST: Book/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var result = db.Customer1.Where(test => test.ID == id).FirstOrDefault();
                db.Customer1.Remove(result);
                db.SaveChanges();
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        public ActionResult Details(int id)
        {
            var result = db.Customer1.Where(test => test.ID == id).FirstOrDefault();
            return View(result);
        }
    }
}