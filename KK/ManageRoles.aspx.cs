using KK.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KK
{
    public partial class ManageRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                DisplayRolesInGrid();
        }

        protected void CreateRoleButton_Click(object sender, EventArgs e)
        {
            string newRoleName = RoleName.Text.Trim();
            var userRole = Context.GetOwinContext().Get<ApplicationRoleManager>();
            var user = Context.GetOwinContext().Get<ApplicationUserManager>();

            var u = user.FindByEmail(User.Identity.Name);

            if (!userRole.RoleExists(newRoleName))
                // Create the role
                userRole.Create(new ApplicationRole(newRoleName, u, 1));

            RoleName.Text = string.Empty;
        }

        private void DisplayRolesInGrid()
        {
            var userRole = Context.GetOwinContext().Get<ApplicationRoleManager>();

            GridView1.DataSource = userRole.Roles.ToList<Models.ApplicationRole>();
            System.Diagnostics.Debug.WriteLine(userRole.Roles);
            GridView1.DataBind();
        }
    }
}