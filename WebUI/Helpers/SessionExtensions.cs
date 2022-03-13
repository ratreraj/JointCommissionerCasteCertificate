using Microsoft.AspNetCore.Http;
using System.Text.Json;

namespace WebUI.Helpers
{
    public static class SessionExtensions
    {

        public static T GetComplexData<T>(this ISession session, string Key)
        {
            var data = session.GetString(Key);
            if (data == null)
            {

                return default(T);
            }

            return JsonSerializer.Deserialize<T>(data);
        }

        public static void SetComplexData(this ISession session, string key, object data)
        {

            session.SetString(key, JsonSerializer.Serialize(data));

        }
    }
}
