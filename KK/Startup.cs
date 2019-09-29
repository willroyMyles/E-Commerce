using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(KK.Startup))]
namespace KK
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
