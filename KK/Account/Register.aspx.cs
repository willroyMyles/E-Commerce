using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using KK.Models;

namespace KK.Account
{
    public partial class Register : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dobc.ValueToCompare = DateTime.Now.AddYears(-18).ToString("d");
                System.Diagnostics.Debug.WriteLine(DateTime.Now.AddYears(-18).ToString("d"));
                Phone.Text = String.Format("{0:(###)###-####}", Phone.Text);

            }
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var userRole = Context.GetOwinContext().Get<ApplicationRoleManager>();
            System.DateTime dt = System.DateTime.Parse(dob.Text);
            var user = new ApplicationUser()
            {
                UserName = Email.Text,
                Email = Email.Text,
                PhoneNumber = Phone.Text,
                FirstName = fname.Text,
                LastName = lname.Text,
                Dob = dt,
                IsAdmin = isadmin.Checked
            };
            
            IdentityResult result = manager.Create(user, Password.Text);
            manager.AddToRole(user.Id, "Admin");

            // should change to customer !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            var res = userRole.Create(new ApplicationRole("Admin", user, 0));
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");
                GV.OnLogin(user);
                Session["userId"] = GV.user.Id;
                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
            }
        }

        protected void Phone_TextChanged(object sender, EventArgs e)
        {
            Phone.Text = String.Format("{0:(###)###-####}", Phone.Text);
            System.Diagnostics.Debug.WriteLine(Phone.Text);
        }
    }
}