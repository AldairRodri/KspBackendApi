using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace KSP.Models
{
    public partial class KspExamenContext : DbContext
    {
        public KspExamenContext()
        {
        }

        public KspExamenContext(DbContextOptions<KspExamenContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Beneficiario> Beneficiarios { get; set; } = null!;
        public virtual DbSet<Empleado> Empleados { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=KspExamen.mssql.somee.com;DataBase=KspExamen;user id=AldairRodriguez_SQLLogin_1;password=c32rgbtsqn;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Beneficiario>(entity =>
            {
                entity.ToTable("Beneficiario");

                entity.Property(e => e.ApellidoMaternoBeneficiario)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ApellidoPaternoBeneficiario)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.EmpleadoId).HasColumnName("Empleado_Id");

                entity.Property(e => e.FechaNacimiento).HasColumnType("date");

                entity.Property(e => e.NombreBeneficiario)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Parentesco)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Sexo)
                    .HasMaxLength(10)
                    .IsUnicode(false);

                entity.HasOne(d => d.Empleado)
                    .WithMany(p => p.Beneficiarios)
                    .HasForeignKey(d => d.EmpleadoId)
                    .HasConstraintName("FK_Beneficiario_Empleado");
            });

            modelBuilder.Entity<Empleado>(entity =>
            {
                entity.ToTable("Empleado");

                entity.Property(e => e.ApellidoMaternoEmpleado)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.ApellidoPaternoEmpleado)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.FechaContratacion).HasColumnType("date");

                entity.Property(e => e.FotoEmpleado)
                    .HasMaxLength(1)
                    .IsFixedLength();

                entity.Property(e => e.NombreEmpleado)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.PuestoTrabajo)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Salario).HasColumnType("money");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
