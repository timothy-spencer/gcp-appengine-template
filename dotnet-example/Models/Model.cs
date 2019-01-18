using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System.Collections.Generic;
using System;

namespace dotnet_example.PostgreSQL
{
    public class VisitorContext : DbContext
    {
        public DbSet<VisitorLogEntry> Visitors { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
            => optionsBuilder.UseNpgsql("Uid=postgres;Pwd=;Host=localhost;Port=5432;Database=dotnet-test");
    }

    public class VisitorLogEntry {
        public string IpAddress { get; set; }
        public DateTime TimeStamp { get; set; }
    }
}
