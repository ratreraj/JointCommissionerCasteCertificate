using System.Data.Common;

namespace Repository.Helper
{
    public static class DataReader
    {
        public static string SafeGetString(this DbDataReader dr, bool value, string colName)
        {
            if (!value)
            {
                return dr[$"{colName}"].ToString();
            }

            return string.Empty;
        }


    }
}
