<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDefault.master" AutoEventWireup="true" CodeFile="joblistdefault.aspx.cs" Inherits="joblistdefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <section class="jobs">
        <div class="container">
            
			<div class="row heading">
                  <h2>Results for: <asp:Label ID="lblresults" runat="server"></asp:Label></h2>
            </div>
                  <div class="form-inline">
						<asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Project Name here..."/>
						<asp:DropDownList ID="ddlCategory" runat="server" class="selectpicker form-control" data-live-search="true"
                                            AutoPostBack="true"/>
					  <br />
						<asp:Button ID="Button1" Text="Search" runat="server" class="btn btn-primary" onclick="Button1_Click1"/>
					</div>
            <div class="row top-pad">
				<h2 class="text-primary"><b>Job Listings</b></h2>
                <div class="filter">
                    <div class="col-md-2 col-sm-3">
                        <%--<p>Search here:</p>--%>
                    </div>

                    <%--<div class="col-md-10 col-sm-9 pull-right">
							<ul class="filter-list">
								<li>
									<input id="checkbox-1" class="checkbox-custom" name="checkbox-1" type="checkbox" checked="">
									<label for="checkbox-1" class="part-time checkbox-custom-label">Part Time</label>
								</li>
								
								<li>
									<input id="checkbox-2" class="checkbox-custom" name="checkbox-2" type="checkbox">
									<label for="checkbox-2" class="full-time checkbox-custom-label">Full Time</label>
								</li>
								
								<li>
									<input id="checkbox-3" class="checkbox-custom" name="checkbox-3" type="checkbox">
									<label for="checkbox-3" class="freelancing checkbox-custom-label">Freelancing</label>
								</li>
								
								<li>
									<input id="checkbox-4" class="checkbox-custom" name="checkbox-4" type="checkbox">
									<label for="checkbox-4" class="internship checkbox-custom-label">Internship</label>
								</li>

							</ul>	
						</div>--%>
                </div>
            </div>
            <asp:UpdatePanel ID="upInv" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="lbprojects" EventName="PagePropertiesChanging" />
                </Triggers>
                <ContentTemplate>
                    <asp:ListView ID="lbprojects" runat="server" OnPagePropertiesChanging="lbprojects_PagePropertiesChanging" OnItemCommand="lstprojects_ItemCommand">
                        <ItemTemplate>
							<div class="row">
								<div class="col-md-12" style="padding:10px">
									<div class="panel panel-default box">
									  <div class="panel-body">
										  <div class="row text-primary">
											  <div class="col-md-6 text-left">
													  <h3><b><%# Eval("Jobtitle") %></b></h3>
												  </div>
												  <div class="col-md-6 text-right">
													  <h3><b><%# Eval("amt", "{0:c}") %></b></h3>
												  </div>			
										  </div>
										  <div class="row">
											  <div class="col-md-12">
												   <i class="fa fa-list-alt"></i> <asp:Label ID="Label3" runat="server" Text='<%# Eval("categoryname") %>'></asp:Label>
												  <i class="fa fa-clock-o"></i> <asp:Label ID="Label1" runat="server" Text='<%# Eval("timeframe") %>'></asp:Label> <asp:Label ID="Label2" runat="server" Text='<%# Eval("timecat") %>'></asp:Label>
											  </div>
										  </div>
										  <div class="row">
											  <div class="col-md-12">
												  <h4 class="text-primary"><%# Eval("JobDescription") %></h4>
											  </div>
										  </div>
										  <div class="row">
											  <div class="col-md-12 text-right">
												  <asp:Button ID="btnSubmit" runat="server" class="btn btn-sm btn-round btn-primary" Text="View" CommandName="Edit" CommandArgument='<%# Eval("jobid") %>' />
											  </div>
										  </div>
									  </div>
									</div>
								</div>
							</div>
                        </ItemTemplate>
                        <EmptyDataTemplate>
                            <tr>
                                <td colspan="5">
                                    <center><h2>No records found!</h2></center>
                                </td>
                            </tr>
                        </EmptyDataTemplate>
                    </asp:ListView>
                    <div class="pagination-area">
                        <ul>
                            <asp:DataPager ID="dpProjects" runat="server" PageSize="20" PagedControlID="lbprojects">
                                <Fields>
                                    <asp:NextPreviousPagerField FirstPageText="<<" PreviousPageText="<" ShowFirstPageButton="True" ShowNextPageButton="false" ButtonType="Button" ButtonCssClass="btn" />
                                    <asp:NumericPagerField NumericButtonCssClass="Button" CurrentPageLabelCssClass="btn" NextPreviousButtonCssClass="btn" />
                                    <asp:NextPreviousPagerField NextPageText=">" LastPageText=">>" ShowLastPageButton="True" ShowPreviousPageButton="false" ButtonType="Button" ButtonCssClass="btn" />
                                </Fields>
                            </asp:DataPager>
                        </ul>
                    </div>

                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <%--		<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/microsoft.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>Back-End developer</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
					
					<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/apple.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>UI/UX Developer</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
					
					<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/wipro.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>IOS developer</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
					
					<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/twitter.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>Market Holder</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
									<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/microsoft.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>Back-End developer</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
					
					<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/apple.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>UI/UX Developer</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
					
					<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/wipro.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>IOS developer</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
					
					<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/twitter.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>Market Holder</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
									<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/microsoft.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>Back-End developer</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
					
					<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/apple.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>UI/UX Developer</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
					
					<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/wipro.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>IOS developer</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
					
					<div class="company-list">
						<div class="row">
							<div class="col-md-2 col-sm-2">
								<div class="company-logo">
									<img src="img/twitter.png" class="img-responsive" alt="" />
								</div>
							</div>
							<div class="col-md-8 col-sm-8">
								<div class="company-content">
									<h3>Market Holder</h3>
									<p><span class="company-name"><i class="fa fa-briefcase"></i>Google</span><span class="company-location"><i class="fa fa-map-marker"></i> 7th Avenue, New York, NY, United States</span><span class="package"><i class="fa fa-money"></i>$25,000-$50,000</span></p>
								</div>
							</div>
							<div class="col-md-2 col-sm-2">
								<button type="submit" class="btn view-job" name="View Job">View Job</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<input type="button" class="btn brows-btn" value="Brows All Jobs" />
				</div>--%>
        </div>
    </section>
</asp:Content>

