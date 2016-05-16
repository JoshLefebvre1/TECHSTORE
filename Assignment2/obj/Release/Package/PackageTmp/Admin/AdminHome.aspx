<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPageAdminMenu.master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="Assignment2.AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	    <div class="account">
		    <h1>Admin Home </h1>
		    <div class="Add a Category">


                <div class="col-md-6 account-top">
                    <h2 class="intro-text text-center">Current Categories</h2>
                    <div class="col-centered" style="height:200px; width:350px; overflow:auto;">
                    <asp:GridView ID="allWords2" showHeader="true" runat="server" OnRowCommand="EditDeleteCategory" AutoGenerateColumns="false" DataKeyNames="CategoryID" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Category Name" />
                            <asp:ButtonField ButtonType="button"  HeaderText=" " Text="Edit" CommandName="editCategory"/>
                            <asp:ButtonField ButtonType="button"  HeaderText=" " Text="Delete" CommandName="deleteCategory" />
                        </Columns>
                    </asp:GridView>
		            </div>
                </div>


		        <div class="col-md-6 left-account ">
                    <h2 class="intro-text text-center">Current Products</h2>
                    <div class="col-centered" style="height:200px; width:350px; overflow:auto;">
                    <asp:GridView ID="allWords3" showHeader="true" runat="server" OnRowCommand="EditDeleteProduct" AutoGenerateColumns="false" DataKeyNames="ProductID" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Product Name" />
                            <asp:ButtonField ButtonType="button"  HeaderText=" " Text="Edit" CommandName="editProduct"/>
                            <asp:ButtonField ButtonType="button"  HeaderText=" " Text="Delete" CommandName="deleteProduct" />
                        </Columns>
                   </asp:GridView>
                    </div>
		        </div>


	            <div class="clearfix"> </div>
	        </div>
	    </div>
    </div>
</asp:Content>
