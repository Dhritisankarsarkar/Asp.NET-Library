using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication24.Models;

namespace WebApplication24.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer

        FinalProjectEntities db = new FinalProjectEntities();
        public ActionResult Index()
        {
            string d = Convert.ToString(Session["Email"]);
            ViewBag.Message = d + " ,Welcome Back";
            var result = db.Customer1.ToList();

            return View(result);
        }
        public ActionResult BookView()
        {
            var result = db.Book.ToList();
            string d = Convert.ToString(Session["Email"]);
            ViewBag.Message = d + " ,Welcome";
            return View(result);
        }
        // GET: Customer/Create
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
                var result = db.Customer1.Where(test => test.Name == c1.Name || test.Email == c1.Email).FirstOrDefault();
                if (result != null)
                {
                    ViewBag.Message = "Username/Email already exists";

                }
                else
                {
                    db.Customer1.Add(c1);
                    db.SaveChanges();
                    Session["Email"] = c1.Email;
                    return RedirectToAction("BookView");
                    //ViewBag.Message = "Succeessfully Created";

                }
                return View();
                // TODO: Add insert logic here


            }
            catch
            {
                return RedirectToAction("Create");
            }
        }
        public ActionResult Login(int id = 0)
        {
            Customer1 c1 = new Customer1();
            return View(c1);
        }
        [HttpPost]
        public ActionResult Login(Customer1 c1)
        {
            var result = db.Customer1.Where(test => test.Email == c1.Email && test.Password == c1.Password).FirstOrDefault();
            if (result != null)
            {

                if (result.Admin == true)
                {
                    Session["Email"] = c1.Email;
                    Session["Admin"] = "Admin";

                    return RedirectToAction("BookView", "Borrow");

                }
                else
                {
                    Session["UserName"] = c1.Name;
                    Session["Email"] = c1.Email;
                   
                    return RedirectToAction("BookView", "Borrow");
                }
            }
            ViewBag.Message = "Email Not Registered";
            return View();

        }

        public ActionResult logout()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }



    }
}
