using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Repository.Migrations
{
    public partial class intial01234 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "EntryBy",
                table: "educations",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<DateTime>(
                name: "EntryDate",
                table: "educations",
                type: "DateTime",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<string>(
                name: "PurpuseType",
                table: "educations",
                type: "Varchar(100)",
                nullable: true);

            migrationBuilder.CreateTable(
                name: "applicationStatuses",
                columns: table => new
                {
                    EntityTranstionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ApplicationId = table.Column<int>(type: "int", nullable: false),
                    Status = table.Column<string>(type: "Varchar(20)", nullable: true),
                    EntryBy = table.Column<int>(type: "int", nullable: false),
                    EntryDate = table.Column<DateTime>(type: "DateTime", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_applicationStatuses", x => x.EntityTranstionId);
                });

            migrationBuilder.CreateTable(
                name: "dDLMasters",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ValueFields = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DisplayFields = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Categroy = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    EntryBy = table.Column<int>(type: "int", nullable: false),
                    EntryDate = table.Column<DateTime>(type: "DateTime", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_dDLMasters", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "districts",
                columns: table => new
                {
                    DistrictID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    DistictName = table.Column<string>(type: "nvarchar(max)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_districts", x => x.DistrictID);
                });

            migrationBuilder.CreateTable(
                name: "statusMasters",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Status = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    EntryBy = table.Column<int>(type: "int", nullable: false),
                    EntryDate = table.Column<DateTime>(type: "DateTime", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_statusMasters", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "talukas",
                columns: table => new
                {
                    TalukaId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    TalukaName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    DistrictID = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_talukas", x => x.TalukaId);
                });

            migrationBuilder.CreateTable(
                name: "villages",
                columns: table => new
                {
                    VillageId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    VillageName = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TalukaId = table.Column<int>(type: "int", nullable: false),
                    DistrictID = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_villages", x => x.VillageId);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "applicationStatuses");

            migrationBuilder.DropTable(
                name: "dDLMasters");

            migrationBuilder.DropTable(
                name: "districts");

            migrationBuilder.DropTable(
                name: "statusMasters");

            migrationBuilder.DropTable(
                name: "talukas");

            migrationBuilder.DropTable(
                name: "villages");

            migrationBuilder.DropColumn(
                name: "EntryBy",
                table: "educations");

            migrationBuilder.DropColumn(
                name: "EntryDate",
                table: "educations");

            migrationBuilder.DropColumn(
                name: "PurpuseType",
                table: "educations");
        }
    }
}
