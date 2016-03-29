using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MvcLyrics.Startup))]
namespace MvcLyrics
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
