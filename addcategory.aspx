<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addcategory.aspx.cs" Inherits="addcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row heading">
        <h2 class="text-primary"><b>New Category Form</b></h2>
    </div>
    <hr />
    
  
                    <fieldset>
                      
                        <div class="form-group">
                            <label class="col-md-4 control-label">Category Name</label>
                            <div class="col-md-8 inputGroupContainer">
                                <asp:textbox id="txtContactPerson" runat="server" class="form-control" placeholder="Category Name here" required/>
                            </div>
                        </div>
                       
                        
                        <div class="form-group">
                            <label class="col-md-4 control-label"></label>
                            <div class="col-md-8 inputGroupContainer">
                                <asp:Button ID="btnReg" runat="server" Text="Save" type="button" class="btn btn-success" Width="100%" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />

                            </div>
                        </div>
                    </fieldset>
</asp:Content>

