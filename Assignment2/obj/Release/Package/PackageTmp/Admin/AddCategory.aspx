<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPageAdminMenu.master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="Assignment2.AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	    <div class="account">
		    <h1>Categories</h1>
		    <div class="Add a Category">
		    
                <div class="col-md-6 account-top">
                    <div class="form-group">
                        <h2 class="intro-text text-center">Enter a Category</h2>
                        <asp:TextBox type="text" class="form-control" id="BlockedWord" placeholder="Enter a new category" runat="server"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BlockedWord"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup"/>
                        <asp:RegularExpressionValidator Display ="Dynamic" ControlToValidate="BlockedWord" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{0,255}$" runat="server" ErrorMessage="****Maximum 255 characters allowed."  validationgroup="PersonalInfoGroup"></asp:RegularExpressionValidator>
                    </div>
                    <asp:button type="submit" onClick="addWord" validationgroup="PersonalInfoGroup" class="btn btn-default" Text="Submit" runat="server" OnClientClick="addWord" />
                    <asp:label ID="ErrorLabel" Text="" runat="server" />
		        </div>

		        <div class="col-md-6 left-account ">
                    <h2 class="intro-text text-center">List of Current Categories</h2>
                    <div class="col-centered" style="height:200px; width:350px; overflow:auto;">
                    <asp:GridView ID="allWords" showHeader="true" runat="server" AutoGenerateColumns="false" DataKeyNames="CategoryID" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Category Name" />
                        </Columns>
                   </asp:GridView>
                    </div>
		        </div>

	            <div class="clearfix"> </div>
	        </div>
	    </div>

    </div>
</asp:Content>
