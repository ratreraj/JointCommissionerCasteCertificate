using Microsoft.EntityFrameworkCore.Migrations;

namespace Repository.Migrations
{
    public partial class intial001 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Remark",
                table: "educations",
                type: "Varchar(250)",
                nullable: false);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Remark",
                table: "educations");
        }
    }
}
