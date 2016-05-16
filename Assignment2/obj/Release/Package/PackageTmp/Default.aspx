<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Assignment2.Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <!--Banner
    <div class="banner">-->
		<div class="container">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
              </ol>

              <!-- Wrapper for slides -->
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                  <img src="images/123.jpg" alt="...">
                  <div class="carousel-caption">
                    <p>The TECHSTORE will match any online retailer including amazon.com and tigerdirect.ca </p>
                    <button type="button" class="btn btn-danger">More Info</button>
                  </div>
                </div>

                <div class="item">
                  <img src="images/123.jpg" alt="...">
                  <div class="carousel-caption">
                    <p>Store wide sale on all laptops! Save up to 25% on all in stock laptops for the month of May.</p>
                     <button type="button" class="btn btn-danger">More Info</button>
                  </div>
                </div>

                <div class="item">
                  <img src="images/123.jpg" alt="...">
                  <div class="carousel-caption">
                    <p>The TECHSTORE has over 15 items in stock and continues to grow every day!</p>
                    <button type="button" class="btn btn-danger">More Info</button>
                  </div>
                </div>

              </div>

              <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
           </div>

	   </div>
	<!--</div>-->
    <!--End of Banner-->

    <!--SALE CONTENT-->
    <div class="content">
	    <div class="container">
	    <div class="content-top">
		    <h1>ON SALE</h1>

                    <asp:ListView runat="server" ID="ProductsSaleView" GroupItemCount="3" >
                      
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
                        <tr runat="server" id="productRow" style="height:80px">
                          <td runat="server" id="itemPlaceholder">
                          </td>
                        </tr>
                      </GroupTemplate>

                      <ItemTemplate>
                        <td valign="top" align="center" style="width:100" runat="server">
                            <a href='<%# Eval("ProductId", "ProductDetails.aspx?product={0}") %>' ><asp:Image ID="Label2" runat="server" width="150" height="150" ImageURL='<%# "~/GetFileHandler.ashx?productid=" + Eval("ProductId") %>' /></a> 
                            <a href='<%# Eval("ProductId", "ProductDetails.aspx?product={0}") %>' ><br /><b><%#Eval("Name")%></b></a>
                            <br />Regular Price:<%# String.Format("{0:C}", Eval("Price") ) %>
                            <br />Sale Price:<%# String.Format("{0:C}", Eval("SalePrice") ) %>
                        </td>
                      </ItemTemplate>

                    </asp:ListView>



	    </div>
	    <!----->

	    <!--FEATURED ITEMS-->
	    <div class="content-top-bottom">
		    <h2>Featured Items</h2>
		    <div class="col-md-6 men">
			    <a href="single.html" class="b-link-stripe thickbox"><img class="img-responsive" src="images/t1.jpg" alt="">
				    <div class="b-wrapper">
                        <h3 class="b-animate b-from-top top-in   b-delay03 ">
                            <span>Plasma TV's</span>
                        </h3>
                    </div>
			    </a>
		    </div>
		    <div class="col-md-6">
			    <div class="col-md1 ">
				    <a href="#" class="b-link-stripe thickbox"><img class="img-responsive" src="images/t2.jpg" alt="">
					    <div class="b-wrapper">
                            <h3 class="b-animate b-from-top top-in1   b-delay03 ">
                                <span>Lorem</span>
                            </h3>
                        </div>
				    </a>
			    </div>
			    <div class="col-md2">
				    <div class="col-md-6 men1">
					    <a href="#" class="b-link-stripe thickbox"><img class="img-responsive" src="images/t3.jpg" alt="">
							    <div class="b-wrapper">
									    <h3 class="b-animate b-from-top top-in2   b-delay03 ">
										    <span>Lorem</span>	
									    </h3>
								    </div>
					    </a>
					
				    </div>
				    <div class="col-md-6 men2">
					    <a href="#" class="b-link-stripe   thickbox"><img class="img-responsive" src="images/t4.jpg" alt="">
							    <div class="b-wrapper">
									    <h3 class="b-animate b-from-top top-in2   b-delay03 ">
										    <span>Lorem</span>	
									    </h3>
								    </div>
					    </a>
					
				    </div>
				    <div class="clearfix"> </div>
			    </div>
		    </div>
		    <div class="clearfix"> </div>
	    </div>
	    </div>
	    <!---->
	    <div class="content-bottom">
		    <ul>
			    <li class="fixAcer"><a href="#"><img class="img-responsive" src="images/lo.png"  height="65" width="170" alt=""></a></li>
			    <li><a href="#"><img class="img-responsive" src="images/lo1.png" height="65" width="170" alt=""></a></li>
			    <li><a href="#"><img class="img-responsive" src="images/lo2.png" height="64" width="170" alt=""></a></li>
			    <li><a href="#"><img class="img-responsive" src="images/lo3.png" height="65" width="170" alt=""></a></li>
			    <li><a href="#"><img class="img-responsive" src="images/lo4.png" height="65" width="170" alt=""></a></li>
			    <li><a href="#"><img class="img-responsive" src="images/lo5.png" height="65" width="170" alt=""></a></li>
		    <div class="clearfix"> </div>
		    </ul>
	    </div>
    </div>
</asp:Content>