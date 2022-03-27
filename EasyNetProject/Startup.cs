using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EasyNetProject.Startup))]
namespace EasyNetProject
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
