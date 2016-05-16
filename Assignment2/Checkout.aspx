<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="Assignment2.Checkout" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!--CONTENT-->
<div class=" container">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <!--SHIPPING INFO-->
    <div class="account">
        <h1>Checkout</h1>
	    <div class="account-pass">
            <div class="col-md-8 account-top">
                <h3>Shipping Infomation</h3>
                <div>
                    <span>First Name</span>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
                </div>
                <div>
                    <span>Last Name</span>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
                </div>
                <div>
                    <span>Address</span>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
                </div>
                <div>
                    <span>Apt./Suite #</span>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </div>
                <div>
                    <span>Country</span>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>Canada</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <span>Province</span>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>SELECT PROVINCE</asp:ListItem>
                        <asp:ListItem>ON</asp:ListItem>
                        <asp:ListItem>QC</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div>
                    <span>City</span>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
                </div>
                <div>
                    <span>Postal Code</span>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox7"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
                </div>
                <div>
                    <span>Phone</span>
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                </div>
            </div>
            <!--END SHIPPING INFO-->

            <!-- CART CHECKOUT-->
	        <div class="col-md-4 left-account ">
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
			                <td><h4>TOTAL</h4></td><td><asp:Label ID="subTotal" runat="server" Text="" /></td>
                        </tr>		
                     </table>
			         <div class="clearfix"> </div>
	            </div>
           </div>
	    </div>
    </div>



    <!--CC INFO-->
    <div class=" register">
        <div class="col-md-8 register-top-grid col-centered">
            <br />
            <br />
            <br />           
            <h3>Payement Infomation</h3>
            *****DO NOT ENTER REAL INFORMATION-THIS IS A DUMMY SITE******
            <div>
                <span>Card Type</span>
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem>SELECT CARD</asp:ListItem>
                    <asp:ListItem>VISA</asp:ListItem>
                    <asp:ListItem>MASTER CARD</asp:ListItem>
                    <asp:ListItem>AMERICAN EXPRESS</asp:ListItem>
                 </asp:DropDownList>
            </div>
            <div>
                <span>Card Number</span>
                <asp:TextBox ID="TextBox9" runat="server" MaxLength="9"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox9"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
                <ajaxToolKit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers, Custom" TargetControlID="TextBox9" />

            </div>
            <div>
                <span>CID</span>
                <asp:TextBox ID="TextBox10" MaxLength="3" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox9"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
                <ajaxToolKit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers, Custom" TargetControlID="TextBox10" />
            </div>

            <div>
                <span>Expiry Month</span>
                <asp:TextBox ID="TextBox11" MaxLength="2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox9"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
                <ajaxToolKit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" FilterType="Numbers, Custom" TargetControlID="TextBox11" />
            </div>
            <div>
                <span>Expiry Year</span>
                <asp:TextBox ID="TextBox6" MaxLength="4" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox6"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
                <ajaxToolKit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" FilterType="Numbers, Custom" TargetControlID="TextBox6" />
            </div>
            <div>
                <span>Name On Card</span>
                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox6"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
            </div>
            <asp:Button ID="Button1" runat="server" Text="Place Order" OnClick="placeOrder" validationgroup="PersonalInfoGroup" />
        </div>
		<div class="clearfix"> </div>
    </div>
    
     <!--END CC INFO-->

</div>
<!--//content-->

</asp:Content>