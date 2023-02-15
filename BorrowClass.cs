using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication24.Models
{
    public class BorrowClass
    {

        public string BookName { get; set; }    
        public string CustomerName { get; set; }

        public DateTime IssueDate { get; set; }
        public DateTime ReturnDate { get; set; }
    }
}