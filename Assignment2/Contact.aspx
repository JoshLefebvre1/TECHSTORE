<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"CodeBehind="Contact.aspx.cs" Inherits="Assignment2.Contact" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--content-->
<div class="contact">
			
			<div class="container">
                <h1>Contact</h1>
                <div class="contact-form">

                    <div class="col-md-8 contact-grid">
                            <input type="text" value="Name" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Name';}">

                            <input type="text" value="Email" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Email';}">
                            <input type="text" value="Subject" onfocus="this.value='';" onblur="if (this.value == '') {this.value ='Subject';}">

                            <textarea cols="77" rows="6" value=" " onfocus="this.value='';" onblur="if (this.value == '') {this.value = 'Message';}">Message</textarea>
                            <div class="send">
                                <input type="submit" value="Send">
                            </div>
                    </div>
                    <div class="col-md-4 contact-in">

                        <div class="address-more">
                            <h4>Address</h4>
                            <p>Josh's Shop,</p>
                            <p>1385 Woodroffe Ave,</p>
                            <p>Ottawa, ON K2G 1V8 </p>
                        </div>
                        <div class="address-more">
                            <h4>Address1</h4>
                            <p>Tel:1-(111)-111-1111</p>
                            <p>Fax:1-(111)-111-1111</p>
                            <p>Email:<a href="mailto:lefe0162@algonquinlive.com"> lefe0162@algonquinlive.com</a></p>
                        </div>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d37494223.23909492!2d103!3d55!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x453c569a896724fb%3A0x1409fdf86611f613!2sRussia!5e0!3m2!1sen!2sin!4v1415776049771"></iframe>
                </div>
            </div>

    </div>
<!--//content-->
</asp:Content>