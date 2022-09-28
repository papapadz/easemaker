<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" enableEventValidation="false" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="main-banner" style="background: #242c36 url() no-repeat">
        <div class="container">
            <div class="caption">
                <h2>Welcome!</h2>
               <form id="form1">
                    <fieldset>
                        <div class="col-md-7 col-sm-7 no-pad">
                            <%--	<input type="text" class="form-control border-right" placeholder="Skills, Designation, Companies" />--%>
                            <asp:TextBox ID="txtSearch" runat="server" class="form-control border-righ" type="text" placeholder="Type Here.." MaxLength="50" oncopy="return false" onpaste="return false" oncut="return false" />

                        </div>
                        <%--<div class="col-md-3 col-sm-3 no-pad">
                          <asp:DropDownList ID="ddlCategory" runat="server" class="selectpicker" data-live-search="true"
                                            AutoPostBack="true"/>--%>
                            <%--	<select class="selectpicker border-right">
								  <option>Experience</option>
								  <option>0 Year</option>
								  <option>1 Year</option>
								  <option>2 Year</option>
								  <option>3 Year</option>
								  <option>4 Year</option>
								  <option>5 Year</option>
								  <option>6 Year</option>
								  <option>7 Year</option>
								  <option>8 Year</option>
								  <option>9 Year</option>
								 <option>10 Year</option>
								</select>--%>
                        <%--</div>--%>
                        <div class="col-md-3 col-sm-3 no-pad">
                              
                               <asp:DropDownList ID="ddlCategory" runat="server" class="selectpicker" data-live-search="true"
                                            AutoPostBack="true"/>
                        </div>
                        <div class="col-md-2 col-sm-2 no-pad">
                           <%-- <input type="submit" class="btn seub-btn" value="submit" />--%>
                             <asp:Button ID="btnsubmit" runat="server" class="btn seub-btn" Text="Search" OnClick="btnsubmit_Click" style="color:white" />
                        </div>
                    </fieldset>
               </form>
            </div>
        </div>
    </section>
     <section class="features">
        <div class="container">
             <div class="col-md-4 col-sm-4">
                <div class="features-content">
                    <span class="box1"><span aria-hidden="true" class="icon-dial"></span></span>
                    <h3>Create Applicant Account</h3>
                    <p>Create your account now in order to apply your desired job.</p>
                </div>
            </div>

            <div class="col-md-4 col-sm-4">
                <div class="features-content">
                    <span class="box1"><span aria-hidden="true" class="icon-search"></span></span>
                    <h3>Search Desired Job</h3>
                    <p>All available job offers can be found in one place.</p>
                </div>
            </div>

            <%--<div class="col-md-4 col-sm-4">
                <div class="features-content">
                    <span class="box1"><span aria-hidden="true" class="icon-printer"></span></span>
                    <h3>Send Your Resume</h3>
                    <p>Create and submit your resume conveniently online.</p>
                </div>
            </div>--%>

            <div class="col-md-4 col-sm-4">
                <div class="features-content">
                    <span class="box1"><span aria-hidden="true" class="icon-dial"></span></span>
                    <h3>Create Client Account</h3>
                    <p>Create a client account to post available job orders.</p>
                </div>
            </div>

            <%--<div class="col-md-4 col-sm-4">
                <div class="features-content">
                    <span class="box1"><span aria-hidden="true" class="icon-phone"></span></span>
                    <h3>Contact Details</h3>
                    <p>0917-866-9690
                    <br />alrafedain_manpower@yahoo.com</p>
                </div>
            </div>--%>

            <%--<div class="col-md-4 col-sm-4">
                <div class="features-content">
                    <span class="box1"><span aria-hidden="true" class="icon-map"></span></span>
                    <h3>Address</h3>
                    <p>2654-D Leveriza Street Corner P. Ocampo Street (Vito Cruz) Malate Manila</p>
                </div>
            </div>--%>

        </div>
    </section>
</asp:Content>

