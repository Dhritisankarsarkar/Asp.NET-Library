//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApplication24.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;

    public partial class Book
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Book()
        {
            this.Borrow = new HashSet<Borrow>();
            this.Borrow1 = new HashSet<Borrow>();
        }

        [Key]
    
        public int Book_ID { get; set; }

        [DisplayName("Book Name")]
        public string Book_Name { get; set; }

        [DisplayName("Author")]
        public string Book_Author { get; set; }

        [DisplayName("Date Added")]
        public Nullable<System.DateTime> Date_Added { get; set; }

        [DisplayName("Books Available")]
        public Nullable<int> Available_Books { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Borrow> Borrow { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Borrow> Borrow1 { get; set; }
    }
}