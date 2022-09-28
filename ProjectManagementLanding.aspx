<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="ProjectManagementLanding.aspx.cs" Inherits="ProjectManagementLanding" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="container">
        <div class="row" style="margin: 30px">
            <div class="col-md-6 text-center">
                <div class="panel panel-default box" style="padding:10px">
                    <img width="100px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT25P-_LRKvuM_a6FWAV9F5Jh1xoPVg4qRF1EILZuYlajrNp6Vl5a5EgvDfM0w4kjrWCls&usqp=CAU" />
                    <h3 class="text-primary"><b>On-going Projects</b></h3>
                    <asp:HyperLink id="hyperlink1" 
                          class="btn btn-primary"
                          Text="View All"
                          NavigateUrl=""
                          runat="server"/> 
                </div>
            </div>
            <div class="col-md-6 text-center">
                <div class="panel panel-default box" style="padding:10px">
                    <img width="100px" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzO739kWHhDmSHfsytZ3sY3NxWjx5gCWum_zs5H2RNDycmCvoABr6WoB1UWR_53ahjcs8&usqp=CAU" />
                    <h3 class="text-primary"><b>Completed Projects</b></h3>
                    <asp:HyperLink id="hyperlink2" 
                          class="btn btn-primary"
                          Text="View All"
                          NavigateUrl=""
                          runat="server"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

