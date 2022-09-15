using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace EXamenAPI.Models
{
    [Table("persona")]
    public partial class persona
    {
        [Key]
        public int id { get; set; }
        public string? nombre { get; set; }
        public string? apellido { get; set; }
        public string? dni { get; set; }
        public string? fecNacimiento { get; set; }
        public DateTime? fecRegistro { get; set; }
        public string? direccion { get; set; }
        public bool estado { get; set; }
        
        public DateTime? fecUltAct { get; set; }
    }
}
