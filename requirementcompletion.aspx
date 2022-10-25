<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="requirementcompletion.aspx.cs" Inherits="addcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row heading">
        <h2 class="text-primary"><b>Requirement Completion Form</b></h2>
        <p><small><i>Please fill up all text box!</i></small></p>
    </div>
    
  
                    <fieldset>
                      
                        <div class="form-group row">
                            <label class="col-md-4 control-label">Remark/s</label>
                            <div class="col-md-8">
                                <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                  <asp:textbox id="txtContactPerson" runat="server" class="form-control" TextMode="MultiLine" placeholder="Remark/s here"/></div>
                            </div>
                        </div>
                       
                        
                        <div class="form-group row">
                            <div class="col-md-4"></div>
                            <div class="col-md-8">
                                <asp:Button ID="btnReg" runat="server" Text="Complete" type="button" class="btn btn-success col-md-12" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
                                
                            </div>
                        </div>
                        <hr />
                        <asp:Button ID="Button1" runat="server" Text="Back" type="button" class="btn btn-info col-md-12"  OnClientClick="return confirm('Do you wish to continue?')" OnClick="Button1_Click" />
                    </fieldset>
</asp:Content>

