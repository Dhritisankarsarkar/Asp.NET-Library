using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using WebApplication24.Models;

namespace WebApplication24.Controllers
{
    public class BorrowController : Controller
    {
        // GET: Borrow
        FinalProjectEntities db = new FinalProjectEntities();
        public ActionResult Index()
        {
            //return View(db.Borrows.ToList());
            List<BorrowClass> historyList = new List<BorrowClass>();
            var result = (from t1 in db.Book
                          join t2 in db.Borrow
                          on t1.Book_ID equals t2.Book_ID
                          join t3 in db.Customer1
                          on t2.Customer_ID equals t3.ID
                          select new { BookName = t1.Book_Name, CustomerName = t3.Name, IssueDate = t2.Borrow_Date, ReturnDate = t2.Return_Date }).ToList();
            //foreach (Borrow br in db.Borrows.ToList())
            foreach (var br in result)
            {
                BorrowClass bh = new BorrowClass();
                bh.BookName = br.BookName;
                bh.CustomerName = br.CustomerName;
                bh.IssueDate = Convert.ToDateTime(br.IssueDate);
                bh.ReturnDate = Convert.ToDateTime(br.ReturnDate);
                historyList.Add(bh);
            }
            return View(historyList);
        }
    

        // GET: Borrow/Details/5
        public ActionResult Details(int id)
        {
            var result = db.Borrow.Where(test => test.ID == id).FirstOrDefault();
            return View(result);
        }

        // GET: Borrow/Create
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Borrow b1)
        {
            db.Borrow.Add(b1);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Borrow/Edit/5
        public ActionResult Edit(int id)
        {
            var result = db.Borrow.Where(test => test.ID == id).FirstOrDefault();
            return View(result);
        }

        // POST: Borrow/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Borrow b1)
        {
            b1.ID = id;
            db.Entry(b1).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Borrow/Delete/5
        public ActionResult Delete(int id)
        {
            var result = db.Borrow.Where(test => test.ID == id).FirstOrDefault();
            return View(result);
        }

        // POST: Borrow/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                var result = db.Borrow.Where(test => test.ID == id).FirstOrDefault();
                db.Borrow.Remove(result);
                db.SaveChanges();
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
       
        public ActionResult BookView(Book b1)
        {
            var result = db.Book.Where(test => test.Available_Books > 0).ToList();
            //var result = db.Book.ToList();
          
            return View(result);

        }
        public ActionResult Borrow(int id)
        {
            var result = db.Book.Where(test => test.Book_ID == id).FirstOrDefault();
            // b1.Available_Books = ;
            result.Available_Books = result.Available_Books - 1;
            //db.Entry(b1).State = EntityState.Modified;
            db.SaveChanges();
            //ViewBag.Message = "Borrowed Successfully";
            Session["BookID"] = result.Book_ID;
            Session["BookName"] = result.Book_Name;
            Borrow b1 = new Borrow();
            b1.Book_ID = Convert.ToInt32(Session["BookID"]);
            b1.Book_Name = Convert.ToString(Session["BookName"]);
            string email = Convert.ToString(Session["Email"]);
            var resul = db.Customer1.Where(test => test.Email == email).FirstOrDefault();
           
            b1.Customer_ID = resul.ID;
            
            b1.Borrow_Date = System.DateTime.Now;
            b1.Return_Date = System.DateTime.Now.AddDays(7);
            db.Borrow.Add(b1);
            db.SaveChanges();
            return View();


        }


        public ActionResult borrowrow()
        {
            return View();
        }
        [HttpPost]
        public ActionResult borrowrow(Borrow b1)
        {
            b1.Book_ID = Convert.ToInt32(Session["BookID"]);
            b1.Book_Name = Convert.ToString(Session["BookName"]);
            var result = db.Customer1.Where(test => test.Name == Convert.ToString(Session["UserName"])).FirstOrDefault();
            b1.Customer_ID = result.ID;
            b1.Borrow_Date = System.DateTime.Now;
            b1.Return_Date = System.DateTime.Now.AddDays(7);
            db.Borrow.Add(b1);
            db.SaveChanges();
            return View();
        }
    }
}
