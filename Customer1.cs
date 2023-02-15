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

    public partial class Customer1
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Customer1()
        {
            this.Borrow = new HashSet<Borrow>();
        }
    
        public int ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }


        [DataType(DataType.Password)]

        public string Password { get; set; }

        [DisplayName("Confirm Password")]

        [DataType(DataType.Password)]

        public string ConfirmPassword { get; set; }
        public Nullable<bool> Admin { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Borrow> Borrow { get; set; }
    }
}
