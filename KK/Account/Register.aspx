<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="KK.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="alert alert-danger" />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="fname" CssClass="col-md-2 control-label">First Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="fname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="fname"
                    CssClass="alert alert-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="lname" CssClass="col-md-2 control-label">Last Name</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="lname" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="lname"
                    CssClass="alert alert-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="dob" CssClass="col-md-2 control-label mute">Date of Birth</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="dob" CssClass="form-control col-md-3" TextMode="Date" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="dob"
                    CssClass="alert alert-danger" ErrorMessage="The date of field is required." />
                <asp:CompareValidator ID="dobc" Operator="LessThan" CssClass="alert alert-danger" runat="server" ControlToValidate="dob" Type="Date" ErrorMessage="must be 18 or older" Display="Dynamic"></asp:CompareValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Phone" CssClass="col-md-2 control-label">Pnone Number</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Phone" CssClass="form-control" OnTextChanged="Phone_TextChanged" AutoPostBack="true"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Phone"
                    CssClass="alert alert-danger my-3" ErrorMessage="The phone number field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="alert alert-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="alert alert-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="alert alert-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>

         <div class="form-group">
            <div class="col-md-10">
                <asp:Label runat="server" AssociatedControlID="isadmin" CssClass="col-md-2 control-label">Administrator</asp:Label>
                <asp:CheckBox ID="isadmin" runat="server" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>

    <script>

}
    </script>
</asp:Content>
