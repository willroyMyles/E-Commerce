using KK.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace KK
{
    public class GV
    {
        public static ApplicationUser user = null;

        
        public static string OnLogin(ApplicationUser user1)
        {
            user = user1;
            return user.Id;
        }
        public static void OnLogout() => user = null;

    }
}