<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageDefault.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Register.aspx.cs" Inherits="Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <div class="container" style="margin: 0 auto">
       <div class="row">
           <div class="col-md-6">
               <img style="width: 100%" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCJmaAVzRs6ePMF70eiKPsAywdcbrrC0PzWg&usqp=CAU"/>
           </div>
           <div class="col-md-6">
               <h3 class="text-primary"><b>Get business going with someone you can rely on!</b></h3>
               <p>Register to EASE today.</p>
               <a href="RegisterFreelancer.aspx" class="btn btn-success">I'm a Freelancer</a>
               <a href="RegisterEmployer.aspx" class="btn btn-primary">I'm a Employer</a>
           </div>
       </div>
   </div>
</asp:Content>

