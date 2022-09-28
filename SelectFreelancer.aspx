<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="SelectFreelancer.aspx.cs" Inherits="SelectFreelancer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row heading">
        <h2>Applicant Selection Form</h2>
        <p>Please fill up all text box!</p>
    </div>
    
  
                    <fieldset>
                      
                        <div class="form-group">
                            <label class="col-md-4 control-label">Freelancer Name</label>
                            <div class="col-md-8 inputGroupContainer">
                                <div class="input-group"><%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                                  <asp:Label id="txtContactPerson" runat="server" class="form-control"  /></div>
                            </div>
                        </div>
                       <div class="form-group">
                            <label class="col-md-4 control-label">Project Title</label>
                            <div class="col-md-8 inputGroupContainer">
                                <div class="input-group"><%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                                  <asp:textbox id="Textbox1" runat="server" class="form-control" Enabled="false" /></div>
                            </div>
                        </div>
                            
                         <div class="form-group">
                                        <label class="col-md-4 control-label">Remarks</label>
                                        <div class="col-md-8 inputGroupContainer">
                                            <div class="input-group">
                                                <%--<span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>--%>
                                                <asp:TextBox ID="txtRemarks" runat="server" class="form-control" TextMode="MultiLine" />
                                            </div>
                                        </div>
                                    </div>
                        <div class="form-group">

                            <div class="col-md-8 inputGroupContainer">
                                <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" class="btn" Height="50px" Width="100px" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />

                            </div>
                        </div>
                    </fieldset>
</asp:Content>

