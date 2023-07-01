using System;
using System.Collections.Generic;

namespace KSP.Models
{
    public partial class Empleado
    {
        public Empleado()
        {
            Beneficiarios = new HashSet<Beneficiario>();
        }

        public int Id { get; set; }
        public byte[]? FotoEmpleado { get; set; }
        public string? NombreEmpleado { get; set; }
        public string? ApellidoPaternoEmpleado { get; set; }
        public string? ApellidoMaternoEmpleado { get; set; }
        public string? PuestoTrabajo { get; set; }
        public decimal? Salario { get; set; }
        public bool? Estatus { get; set; }
        public DateTime? FechaContratacion { get; set; }

       
        public virtual ICollection<Beneficiario> Beneficiarios { get; set; }
    }
}
