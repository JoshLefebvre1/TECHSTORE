<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="Assignment2.ProductDetails" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="product col-centered">
        <div class="container col-centered">	
            <div class="col-md-10 product-price1 col-centered">
                <asp:FormView runat="server" ID="FormView1">
                  <ItemTemplate>
                        <!--IMAGES-->
				        <div class="col-md-5 single-top">	
			                <div class="flexslider">
                                <ul class="slides">
                                    <li runat="server" data-thumb='<%# "/GetFileHandler.ashx?productid=" + Eval("ProductId") %>'> <img runat="server" src='<%# "/GetFileHandler.ashx?productid=" + Eval("ProductId") %>' />  </li>
                                    <li runat="server" data-thumb='<%# "/GetFileHandler.ashx?productid=" + Eval("ProductId") %>'> <img runat="server" src='<%# "/GetFileHandler.ashx?productid=" + Eval("ProductId") %>' />  </li>
                                    <li runat="server" data-thumb='<%# "/GetFileHandler.ashx?productid=" + Eval("ProductId") %>'> <img runat="server" src='<%# "/GetFileHandler.ashx?productid=" + Eval("ProductId") %>' />  </li>
                                    <li runat="server" data-thumb='<%# "/GetFileHandler.ashx?productid=" + Eval("ProductId") %>'> <img runat="server" src='<%# "/GetFileHandler.ashx?productid=" + Eval("ProductId") %>' />  </li>
                                </ul>
                            </div>
                            <!-- FlexSlider -->
                            <script defer src="js/jquery.flexslider.js"></script>
                            <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />

                            <script>
                                // Can also be used with $(document).ready()
                                $(window).load(function() {
                                  $('.flexslider').flexslider({
                                    animation: "slide",
                                    controlNav: "thumbnails"
                                  });
                                });
                            </script>
                        </div>
				        <!--END OF IMAGE-->

                        <!--PRODUCT INFO-->
			            <div class="col-md-7 single-top-in simpleCart_shelfItem">
					        
                            <div class="single-para ">
						        <h4><asp:Label ID="pName" runat="server" Text='<%#Eval("Name")%>'></asp:Label></h4>
							        <div class="star-on">
								        <ul class="star-footer">
										        <li><a href="#"><i> </i></a></li>
										        <li><a href="#"><i> </i></a></li>
										        <li><a href="#"><i> </i></a></li>
										        <li><a href="#"><i> </i></a></li>
										        <li><a href="#"><i> </i></a></li>
									        </ul>
								        <div class="review">
									        <a href="#"> 1 customer review </a>
									
								        </div>
							        <div class="clearfix"> </div>
							        </div>
							        <h6 class="item_price">Regular Price: <asp:Label ID="Label4" runat="server" Text='<%# String.Format("{0:C}", Eval("Price") ) %>'></asp:Label></h6>
							        <h5 class="item_price">Sale Price: <asp:Label ID="pPrice" runat="server" Text='<%# String.Format("{0:C}", Eval("SalePrice") ) %>'></asp:Label></h5>
							        <p><asp:Label ID="pSDescription" runat="server" Text='<%#Eval("ShortDescription")%>'></asp:Label></p>
                                    <asp:Button ID="addCart" runat="server" Text="ADD TO CART" class="add-cart item_add btn btn-primary btn-md" OnClick="addToCart" commandArgument='<%#Eval("ProductId")%>'  />
                                    
							        
                                    <div class="available">   
								        <div class="clearfix"> </div>
						            </div>
						        </div>
			            </div>
                        </ItemTemplate>
                        </asp:FormView>
				        <div class="clearfix"> </div>
                        <!--END OF PRODUCT INFO-->
			    
                        <!--AJAX TABS-->
			            <div class="cd-tabs">
	                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                             <ajaxToolkit:TabContainer ID="TabContainer1" runat="server">
                        
                                <!--PRODUCT DETAILS-->
                                <ajaxToolkit:TabPanel ID="TabContainer2" HeaderText="Product Info" runat="server">
                                    <ContentTemplate>
                                        <b><h3>PRODUCT DETAILS</h3></b>
                                        <br />
                                        <asp:FormView runat="server" ID="FormView2">
                                            <ItemTemplate>
                                                <asp:Label id="pDescription" runat="server" Text='<%#Eval("LongDescription")%>' />
                                            </ItemTemplate>
                                        </asp:FormView>
                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>
                                 <!--END OF PRODUCT DETAILS--> 

                                <!--PRODUCT REVIEWS-->
                                <ajaxToolkit:TabPanel ID="TabPanel1" HeaderText="Reviews" runat="server">
                                    <ContentTemplate>
                                        <h4>Customer Reviews of <%#Eval("Name")%></h4>
                                        <br />
                                        <button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModal"> Write a Review  </button>
                                        <br />
                                        <br />
                                         <asp:Repeater ID="repeater1" runat="server">
                                            <HeaderTemplate>
                                                <table class="table table-bordered">
                                            </HeaderTemplate>

                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <b><asp:Label ID="Label1" runat="server" Text='<%#Eval("Name")%>'></asp:Label> </b>
                                                        <br /><asp:Label ID="Label3" runat="server" Text='<%#Eval("Review_Date")%>'></asp:Label>
                                                        <br /> <ajaxToolkit:Rating ID="Rating2" runat="server" RatingDirection="LeftToRightTopToBottom" CurrentRating='<%#Eval("Stars")%>' MaxRating="5" 
                                                         StarCssClass="ratingStar2" WaitingStarCssClass="SavedRatingStar" FilledStarCssClass="FilledRatingStar"
                                                        EmptyStarCssClass="EmptyRatingStar" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("UserReview")%>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </ItemTemplate>

                                            <FooterTemplate>
                                                </table>
                                                <br />
                                            </FooterTemplate>
                       
                                        </asp:Repeater>

                                    </ContentTemplate>
                                </ajaxToolkit:TabPanel>

                            </ajaxToolkit:TabContainer>
                        </div> 
                        <!--END OF AJAX TABS-->
                    </div>

		            <div class="clearfix"> </div>
	            </div>

    </div>



    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Write a Review</h4>
          </div>

          <div class="modal-body">

               <div class="form-group">
				 <b><asp:Label runat="server" text="Name:"/></b>
                 <asp:TextBox ID="name" runat="server" class="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup"/>
			  </div>

              <div class="form-group"> 	
		        <b><asp:Label runat="server" text="Rating:"/></b>
                  <ajaxToolkit:Rating ID="Rating1" runat="server" BehaviorID="RatingBehaviour1" RatingDirection="LeftToRightTopToBottom"
                    StarCssClass="ratingStar" WaitingStarCssClass="SavedRatingStar" FilledStarCssClass="FilledRatingStar"
                    EmptyStarCssClass="EmptyRatingStar" />
			  </div>

			   <div class="form-group">
                 <br /> 
                 <br /> 
                 <br /> 
				 <b><asp:Label runat="server" text="Review:"/></b>
                 <asp:TextBox ID="reviewText" runat="server" TextMode="Multiline" class="form-control"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="reviewText"  ErrorMessage="***Field Cannot be empty" validationgroup="PersonalInfoGroup"/>
			  </div>

           </div>		
           <asp:Label ID="errorLabel" runat="server" Text=""></asp:Label>

          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            <asp:button runat="server" Text="Submit" class="btn btn-primary" onClick="writeReview" validationgroup="PersonalInfoGroup"/>
          </div>
        </div>
        </div>
      </div>


</asp:Content>