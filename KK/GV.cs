using KK.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace KK
{
    public class GV
    {
        public static ApplicationUser user = null;

        public static void OnLogin(ApplicationUser user1) => user = user1;
        public static void OnLogout() => user = null;

    }
}