<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" CodeBehind="Cart.aspx.cs" Inherits="Assignment2.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
	    <div class="check">	 
		    <h1>My Shopping Bag</h1>


            <!--Start of Items-->
            <div class="col-md-9 cart-items">
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                        <script>$(document).ready(function(c) {
					        $('.close2').on('click', function(c){
							    $('.cart-header2').fadeOut('slow', function(c){
						            $('.cart-header2').remove();
					                });
					            });	  
					        });
			            </script>

                        <div class="cart-header2">
				             <div class="close2"> </div>
				              <div class="cart-sec simpleCart_shelfItem">
						            <div class="cart-item cyc">
							             <img src='<%# "/GetFileHandler.ashx?productid=" + Eval("ProductId") %>' />
						            </div>
					               <div class="cart-item-info">
						            <h3><a href="#">'<%#Eval("Name")%>'</a><span>Model No: '<%#Eval("ProductId") %>'</span></h3>
						            <ul class="qty">
							            <li><p>Size : N/A</p></li>
							            <li><p>Qty : 1</p></li>
						            </ul>
							             <div class="delivery">
							             <p>Service Charges : N/A</p>
							             <span>Delivered in 5-7 bussiness days</span>
							             <div class="clearfix"></div>
				                    </div>	
					               </div>
					               <div class="clearfix"></div>
											
				              </div>
			              </div>
                      </ItemTemplate>   
                </asp:Repeater>		
		    </div>
            <!--END OF ITEMS-->

            <!-- CART CHECKOUT-->
		    <div class="col-md-3">
			    <div>
				     <h3>Price Details</h3>
                     <table>
                         <tr>
				            <td><b>Total:</b></td> 
                             <td><asp:Label ID="total" runat="server" Text="" /></td>
				         </tr>
                         <tr>
                             <td><b>Taxes:</b></td> <td><asp:Label ID="taxes" runat="server" Text="" /></td>
                         </tr>
				         <tr>
                             <td><b>Delivery:</b></td> <td>11.99</td> 
                         </tr>
                         <tr> 
			                <td><h4>TOTAL:</h4></td><td>	<asp:Label ID="subTotal" runat="server" Text="" /></td>
                         <tr />
			        </table>	  
                  <br />
                  <a class="order" href="Checkout.aspx">Place Order</a>
	            <div class="clearfix"> </div>
	         </div>
	      </div>

       </div>
    </div>

<!--//content-->
</asp:Content>