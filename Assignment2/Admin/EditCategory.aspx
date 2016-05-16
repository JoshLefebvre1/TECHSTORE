<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPageAdminMenu.master" AutoEventWireup="true" CodeBehind="EditCategory.aspx.cs" Inherits="Assignment2.EditCategory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	    <div class="account">
		    <h1>Categories</h1>
		    <div class="Add a Category">
		    
                <div class="col-md-6  account-top col-centered">
                    <div class="form-group">
                        <h2 class="intro-text text-center">Edit Category</h2>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameEdit"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup"/>
                        <asp:TextBox type="text" class="form-control" id="NameEdit" Text="" runat="server"/>
                    </div>
                    <asp:button type="submit" validationgroup="PersonalInfoGroup" class="btn btn-default" Text="Edit" runat="server" OnClick="editCategory" />
                    <asp:label ID="ErrorLabel" Text="" runat="server" />
		        </div>

	            <div class="clearfix"> </div>
	        </div>
	    </div>

    </div>
</asp:Content>
