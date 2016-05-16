<%@ Page Language="C#" MasterPageFile="~/Admin/MasterPageAdminMenu.master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Assignment2.AddProduct" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
	    <div class="account">
		    <h1>Enter a Product</h1>
		    <div class="Add a Category">
		    
                <div class="col-md-8  account-top col-centered">
                    <div class="form-group">
                        
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                        <b>Product Name</b>
                        <asp:TextBox type="text" class="form-control" id="pName" placeholder="Enter a product name" runat="server"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pName"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
                        <asp:RegularExpressionValidator Display ="Dynamic" ControlToValidate="pName" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{0,255}$" runat="server" ErrorMessage="****Maximum 255 characters allowed."  validationgroup="PersonalInfoGroup" ForeColor="red"/>

                        <b>Category</b><br />
                        <asp:DropDownList ID="pCategory" runat="server" AppendDataBoundItems="true">
                           <asp:ListItem Text="<Select Categorie>" Value="0" />
                        </asp:DropDownList>

                        <br/><br/><b>Short Description:</b>
                        <asp:TextBox type="text" TextMode="MultiLine" Rows="2" class="form-control" id="sDescription" placeholder="Enter a short description (500 chars max)" runat="server"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="sDescription"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>
                        <asp:RegularExpressionValidator Display ="Dynamic" ControlToValidate = "sDescription" ID="RegularExpressionValidator2" ValidationExpression = "^[\s\S]{0,512}$" runat="server" ErrorMessage="****Maximum 512 characters allowed."  validationgroup="PersonalInfoGroup" ForeColor="red"/>

                         
                        <b>Long Description:</b>
                        <ajaxToolkit:HtmlEditorExtender ID="HtmlEditorExtender1" TargetControlID="lDescription" EnableSanitization="false" runat="server"></ajaxToolkit:HtmlEditorExtender>
                        <asp:TextBox TextMode="MultiLine" Rows="20" id="lDescription" Width="740px" Height="400px"   runat="server"/>
                        <br/><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="lDescription"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>

                        <br/><b>Price:</b>
                        <asp:TextBox type="text" class="form-control" id="pPrice" placeholder="Enter a price" runat="server"/>
                        <ajaxToolKit:FilteredTextBoxExtender ID="FilteredTextBoxExtender7" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="pPrice" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="pPrice"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>

                        <b>Sale Price:</b>
                        <asp:TextBox type="text" class="form-control" id="pSalePrice" placeholder="Enter a price" runat="server"/>
                        <ajaxToolKit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" FilterType="Numbers, Custom" ValidChars="." TargetControlID="pSalePrice" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="pSalePrice"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>

                        <b>Is On Sale:</b>
                        <asp:CheckBox ID="CheckBox1" runat="server" />

                        <br /><br/><b>Upload Image</b><br />
                        <asp:FileUpload id="pUpload" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="pUpload"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup" ForeColor="red"/>


                    </div>
                    <asp:button type="submit" onClick="addProduct" validationgroup="PersonalInfoGroup" class="btn btn-default" Text="Submit" runat="server" OnClientClick="addWord" />
                    <asp:label ID="ErrorLabel" Text="" runat="server" />
		        </div>

	            <div class="clearfix"> </div>
	        </div>
	    </div>

    </div>
</asp:Content>
