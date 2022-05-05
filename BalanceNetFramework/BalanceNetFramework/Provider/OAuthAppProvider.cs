using BalanceNetFramework.Models;
using BalanceNetFramework.Services;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.OAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace BalanceNetFramework.Provider
{
    public class OAuthAppProvider: OAuthAuthorizationServerProvider
    {

        public override Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            return Task.Factory.StartNew(() =>
            {
                var username = context.UserName;
                var password = context.Password;
                var userService = new UserService();
                Users user = userService.GetUserByCredential(username, password);

                if (user != null)
                {
                    var claims = new List<Claim>()
                    {
                        new Claim(ClaimTypes.Name, user.Utente),
                        new Claim("UserID", Convert.ToString(user.Id))
                    };

                    ClaimsIdentity oAutIdentity = new ClaimsIdentity(claims, Startup.OAuthOptions.AuthenticationType);
                    context.Validated(new AuthenticationTicket(oAutIdentity, new AuthenticationProperties() { }));
                }
                else
                {
                    context.SetError("invalid_grant", "Error");
                }
            }
            );
        }

        public override Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {

            if(context.ClientId == null)
            {
                context.Validated();
            }
            return base.ValidateClientAuthentication(context);
        }
    }
}
