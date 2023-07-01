 using System;
using System.Collections.Generic;

namespace KSP.Models
{
    public partial class Beneficiario
    {
        public int Id { get; set; }
        public string? NombreBeneficiario { get; set; }
        public string? ApellidoPaternoBeneficiario { get; set; }
        public string? ApellidoMaternoBeneficiario { get; set; }
        public string? Parentesco { get; set; }
        public DateTime? FechaNacimiento { get; set; }
        public string? Sexo { get; set; }
        public int? EmpleadoId { get; set; }

        
        public virtual Empleado? Empleado { get; set; }
    }
}
