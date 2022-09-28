<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="requirementcompletion.aspx.cs" Inherits="addcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row heading">
        <h2>Requirement Completion Form</h2>
        <p>Please fill up all text box!</p>
    </div>
    
  
                    <fieldset>
                      
                        <div class="form-group">
                            <label class="col-md-4 control-label">Remark/s</label>
                            <div class="col-md-8 inputGroupContainer">
                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                  <asp:textbox id="txtContactPerson" runat="server" class="form-control" TextMode="MultiLine" placeholder="Remark/s here"/></div>
                            </div>
                        </div>
                       
                        
                        <div class="form-group">

                            <div class="col-md-8 inputGroupContainer">
                                <asp:Button ID="btnReg" runat="server" Text="Complete" type="button" class="btn btn-primary" Height="50px" Width="100px" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
                                <asp:Button ID="Button1" runat="server" Text="Cancel" type="button" class="btn btn-warning" Height="50px" Width="100px"  OnClientClick="return confirm('Do you wish to continue?')" OnClick="Button1_Click" />
                            </div>
                        </div>
                    </fieldset>
</asp:Content>

