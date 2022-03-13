using Microsoft.EntityFrameworkCore.Migrations;

namespace Repository.Migrations
{
    public partial class intial002 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "RoleName",
                table: "dashboardSetting",
                type: "nvarchar(max)",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "RoleName",
                table: "dashboardSetting");
        }
    }
}
