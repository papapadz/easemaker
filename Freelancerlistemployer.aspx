<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="Freelancerlistemployer.aspx.cs" Inherits="Freelancerlistemployer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script src="js/bootsnav.js"></script>

    <div class="container">
        <h2 class="text-primary"><b>Freelancer List</b></h2>
        <div class="row form-inline">
            <asp:TextBox ID="txtSearch" Text="" runat="server" class="form-control" Width="200" Placeholder="Type Name here..." />
                      
                  
            <asp:Button ID="Button1" Text="Search" runat="server" class="btn btn-primary" OnClick="Button1_Click1" />
        </div>
        <asp:UpdatePanel ID="upInv" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="lvaccounts" EventName="PagePropertiesChanging" />
            </Triggers>
            <ContentTemplate>
                <%--<table class="table table-bordered cart_summary" overflow: hidden>--%>
                <%--  <div class="table-responsive-sm">--%>
                
                    <tbody>
                        <asp:ListView ID="lvaccounts" runat="server" OnPagePropertiesChanging="lvaccounts_PagePropertiesChanging">
                            <ItemTemplate>
							    <div class="row">
								    <div class="col-md-12" style="padding:10px">
									    <div class="panel panel-default box">
									      <div class="panel-body">
										      <div class="row text-primary">
											      <div class="col-md-6 text-left">
													      <h3><b><%# Eval("PersonName") %></b></h3>
												      </div>
												      <div class="col-md-6 text-right">
													      <h3><b><%# Eval("amt", "{0:c}") %></b></h3>
												      </div>			
										      </div>
										      <div class="row">
											      <div class="col-md-12">
												       <i class="fa fa-envelope"></i> <asp:Label ID="Label3" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
												       <i class="fa fa-phone"></i> <asp:Label ID="Label1" runat="server" Text='<%# Eval("ContactNo") %>'></asp:Label>
											      </div>
										      </div>
										      <div class="row">
											      <div class="col-md-12">
												      <h4 class="text-primary"><%# Eval("jobdescription") %></h4>
											      </div>
										      </div>
                                              <div class="row">
                                                   <div class="col-md-12 form-inline text-right">
                                                      <asp:Button runat="server" class="btn btn-success" Text="Accept" OnClick="btnAccept_Click" data-jobid='<%#Eval("jobid")%>' data-userid='<%#Eval("userid")%>'/>
                                                 
                                                      <a class="btn btn-primary" href='employerportfolio.aspx?ID=<%# Eval("userid") %>'>View Profile</a>
                                                  </div>
                                              </div>
										    </div>
									    </div>
								    </div>
							    </div>
                            </ItemTemplate>
                            <EmptyDataTemplate>
                                <h3>No Record</h3>
                            </EmptyDataTemplate>
                        </asp:ListView>
                <asp:DataPager ID="dpAccounts" runat="server" PageSize="20" PagedControlID="lvaccounts">
                    <Fields>
                        <asp:NextPreviousPagerField FirstPageText="<<" PreviousPageText="<" ShowFirstPageButton="True" ShowNextPageButton="false" ButtonType="Button" ButtonCssClass="btn" />
                        <asp:NumericPagerField NumericButtonCssClass="Button" CurrentPageLabelCssClass="btn" NextPreviousButtonCssClass="btn" />
                        <asp:NextPreviousPagerField NextPageText=">" LastPageText=">>" ShowLastPageButton="True" ShowPreviousPageButton="false" ButtonType="Button" ButtonCssClass="btn" />
                    </Fields>
                </asp:DataPager>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

