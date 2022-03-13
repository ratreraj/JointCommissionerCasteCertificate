using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Repository.Migrations
{
    public partial class intial004 : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<DateTime>(
                name: "VCCompltedDate",
                table: "educations",
                type: "DateTime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "DateTime");

            migrationBuilder.AlterColumn<DateTime>(
                name: "HearingDate",
                table: "educations",
                type: "DateTime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "DateTime");

            migrationBuilder.AddColumn<int>(
                name: "NextRoleId",
                table: "actionStatus",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "NextRoleId",
                table: "actionStatus");

            migrationBuilder.AlterColumn<DateTime>(
                name: "VCCompltedDate",
                table: "educations",
                type: "DateTime",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified),
                oldClrType: typeof(DateTime),
                oldType: "DateTime",
                oldNullable: true);

            migrationBuilder.AlterColumn<DateTime>(
                name: "HearingDate",
                table: "educations",
                type: "DateTime",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified),
                oldClrType: typeof(DateTime),
                oldType: "DateTime",
                oldNullable: true);
        }
    }
}
