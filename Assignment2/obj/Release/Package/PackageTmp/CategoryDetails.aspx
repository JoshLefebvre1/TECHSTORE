<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="CategoryDetails.aspx.cs" Inherits="Assignment2.CategoryDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	    <div class="account">
		    <h1><asp:Label ID="lCategoryName" Text="" runat="server" /></h1>
		    <div class="Add a Category">
		    
                <div class="col-md-12  account-top col-centered">

                    <asp:ListView runat="server" ID="ProductsListView" GroupItemCount="4" >
                      
                      <LayoutTemplate>
                        <table cellpadding="2" runat="server" id="tblProducts" style="height:320px">
                          <tr runat="server" id="groupPlaceholder"></tr>
                        </table>
                        <asp:DataPager runat="server" ID="DataPager" PageSize="9">
                           <Fields>
                             <asp:NumericPagerField ButtonCount="3"
                                  PreviousPageText="<--"
                                  NextPageText="-->" />
                           </Fields>
                        </asp:DataPager>
                      </LayoutTemplate>


                      <GroupTemplate>
                        <tr runat="server" id="productRow"
                            style="height:80px">
                          <td runat="server" id="itemPlaceholder">
                          </td>
                        </tr>
                      </GroupTemplate>

                      <ItemTemplate>
                        <td valign="top" align="center" style="width:100" runat="server">
                            <asp:Image ID="Label2" runat="server" width="150" height="150" ImageURL='<%# "~/GetFileHandler.ashx?productid=" + Eval("ProductId") %>' />  
                            <br /><asp:HyperLink ID="Link1" runat="server" CssClass="BlogHeadline" NavigateUrl='<%# Eval("ProductId", "~/ProductDetails.aspx?product={0}") %>' Text='<%#Eval("Name")%>' />
                            <br />Regular Price:<%# String.Format("{0:C}", Eval("Price") ) %>
                            <br />Sale Price:<%# String.Format("{0:C}", Eval("SalePrice") ) %>
                        </td>
                      </ItemTemplate>

                    </asp:ListView>

		        </div>

	            <div class="clearfix"> </div>
	        </div>
	    </div>

    </div>
</asp:Content>