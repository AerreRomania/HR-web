using OlimpiasKnitting.Client.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Runtime.Serialization;
using System.Security.Cryptography.X509Certificates;
using System.Web;

/// <summary>
/// Summary description for OYContext
/// </summary>
public class OYContext : DbContext
{
    public OYContext() : base("name=NOYConnectionString") {
        Database.SetInitializer<OYContext>(null);
    }
    public DbSet<Angajati> AngajatiSet { get; set; }
    public DbSet<Realizari> RealizariSet { get; set; }
    public DbSet<Comenzi> CommessaSet { get; set; }
    public DbSet<Operatii> OperatiiSet { get; set; }
    public DbSet<OperatiiArticol> OperatiiArticolSet { get; set; }
    public DbSet<Butoane> ButoaneSet { get; set; }
    public DbSet<Masini> MasiniSet { get; set; }
    public DbSet<Articole> ArticoleSet { get; set; }
    public DbSet<JobEfficiency> JobEfficiencySet { get; set; }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        //modelBuilder.Entity<JobEfficiency>().Ignore(x => x.EntityId);

    }
}