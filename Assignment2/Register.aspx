<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Assignment2.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!--content-->
<div class=" container">
    <div class=" register">
	    <h1>Register</h1>

        <div class="col-md-8 col-centered">
            <div class="form-group">
                <span>Email:</span>
                <asp:TextBox ID="email1" runat="server" class="form-control"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="email1" validationgroup="PersonalInfoGroup" ErrorMessage="Invalid Email Format"/>
            </div>

            <div class="form-group">
                <span>Confirm Email:</span>
                <asp:TextBox ID="email2" runat="server" class="form-control"></asp:TextBox>
                <asp:CompareValidator id="compareEmails" runat="server" ControlToCompare="email1" ControlToValidate="email2" ErrorMessage="***Your email addresses do not match" validationgroup="PersonalInfoGroup" />
            </div>
            
            <div class="form-group">
                <span>Password:</span>
                <asp:TextBox ID="password1" TextMode="password" runat="server" class="form-control">></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password1"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup"/>
            </div>

            <div class="form-group">
                <span>Confirm Password:</span>
                <asp:TextBox ID="password2" TextMode="password" runat="server" class="form-control">></asp:TextBox>
                <asp:CompareValidator id="comparePasswords" runat="server" ControlToCompare="password1" ControlToValidate="password2" ErrorMessage="***Your passwords do not match" validationgroup="PersonalInfoGroup" />
            </div>

            <a class="news-letter" href="#"><label class="checkbox"><input type="checkbox" name="checkbox" checked=""><i> </i>Sign Up for Newsletter</label></a>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Register" onClick="createUser" validationgroup="PersonalInfoGroup" />
            <asp:Label ID="errorLabel" runat="server" Text=""></asp:Label>
        </div>

        <div class="clearfix"></div>

    </div>
</div>
<!--//content-->
 </asp:Content>