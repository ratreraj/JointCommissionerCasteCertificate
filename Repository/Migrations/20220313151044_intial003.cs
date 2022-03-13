using Microsoft.EntityFrameworkCore.Migrations;

namespace Repository.Migrations
{
    public partial class intial003 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Status",
                table: "dashboardSetting",
                type: "Varchar(20)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "RoleName",
                table: "dashboardSetting",
                type: "Varchar(50)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Status",
                table: "dashboardSetting",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "Varchar(20)",
                oldNullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "RoleName",
                table: "dashboardSetting",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "Varchar(50)",
                oldNullable: true);
        }
    }
}
