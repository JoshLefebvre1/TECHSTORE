<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment2.Login" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="container">
        <div class="account col-centered">
		    <h1>Login</h1>
		    <div class="account-pass col-centered">
		        <div class="col-md-8 col-centered account-top">
                    ****FOR GRADING PURPOSES: Username=admin@admin.com Password=admin*****
			        <div> 	
				        <span>Email</span>
                        <asp:TextBox ID="inputEmail1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="inputEmail1"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup"/> 
			        </div>
			        <div> 
				        <span >Password</span>
                        <asp:TextBox ID="inputPassword1" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="inputPassword1"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup"/>
			        </div>				
                        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="loginSubmit" validationgroup="PersonalInfoGroup"/>
                        <asp:Label ID="errorLabel" runat="server" Text="" />
		        </div>
	            <div class="clearfix"> </div>
	        </div>
	    </div>

    </div>
</asp:Content>
