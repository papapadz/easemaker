<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="addcategory.aspx.cs" Inherits="addcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row heading">
        <h2>New Category Form</h2>
        <p>Please fill up all text box!</p>
    </div>
    
  
                    <fieldset>
                      
                        <div class="form-group">
                            <label class="col-md-4 control-label">Category Name</label>
                            <div class="col-md-8 inputGroupContainer">
                                <div class="input-group"><%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                                  <asp:textbox id="txtContactPerson" runat="server" class="form-control" placeholder="Category Name here" required/></div>
                            </div>
                        </div>
                       
                        
                        <div class="form-group">

                            <div class="col-md-8 inputGroupContainer">
                                <asp:Button ID="btnReg" runat="server" Text="Register" type="button" class="btn" Height="50px" Width="100px" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />

                            </div>
                        </div>
                    </fieldset>
</asp:Content>

