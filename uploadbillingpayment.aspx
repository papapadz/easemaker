<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="uploadbillingpayment.aspx.cs" Inherits="uploadbillingpayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section>
         
            <div class="container">
         <div class="row heading">
                <h2 class="text-primary"><b>Upload Payment</b></h2>
         </div>
         <hr />
         <fieldset>
                 <div class="row">
                <label class="col-md-4 text-right">Job Order #</label>
                <div class="col-md-8">
                    <asp:Label ID="txtONO" runat="server" Enabled="false"/>
                </div>
            </div>

             <div class="row">
                    <label class="col-md-4 text-right">Date</label>
                    <div class="col-md-8">
                        <asp:Label ID="txtDate" runat="server" class="form-control" />
                    </div>
                </div>

             <div class="row">
                    <label class="col-md-4 text-right">Upload</label>
                    <div class="col-md-8">
                        <asp:FileUpload ID="fuImage" accept="image/png, image/jpeg" runat="server" class="form-control" required/>
                    </div>
                </div>

             <div class="row">
                 <label class="col-md-4"></label>
                <div class="col-md-8">
                 <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" class="btn btn-success" width="100%" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
                    </div>
            </div>
         </fieldset>
                
            </div>   
     </section>
</asp:Content>

