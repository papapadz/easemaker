<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="addrating.aspx.cs" Inherits="addrating" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row heading">
        <h2 class="text-primary"><b>Rating & Comment for Project # 
            <asp:Label ID="Label1" runat="server" class="form-control" Enabled="false" /></b></h2>
       
        <hr />
        <p>
            1 <span class="glyphicon glyphicon-star text-warning"></span> novice |
            2 <span class="glyphicon glyphicon-star text-warning"></span> amateur |
            3 <span class="glyphicon glyphicon-star text-warning"></span> proficient |
            4 <span class="glyphicon glyphicon-star text-warning"></span> Advance Understanding |
            5 <span class="glyphicon glyphicon-star text-warning"></span> Professional
        </p>
    </div>


    <fieldset>
        <asp:Panel id="panelRating" runat="server" Visible="true">
            <div class="form-group text-center row">
            <div class="col-md-4 text-right"><b><asp:Label ID="txtContactPerson" runat="server" Enabled="false" /> Rating</b></div>
            <div class="col-md-8">
                <asp:DropDownList runat="server" ID="ddlund" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlund_SelectedIndexChanged">
                        <asp:ListItem Text="5 Professional" Value="5"></asp:ListItem>
                        <asp:ListItem Text="4 Advanced Undestanding" Value="4"></asp:ListItem>
                        <asp:ListItem Text="3 Proficient" Value="3"></asp:ListItem>
                        <asp:ListItem Text="2 Amateur" Value="2"></asp:ListItem>
                        <asp:ListItem Text="1 Novice" Value="1"></asp:ListItem>

                    </asp:DropDownList>
            </div>
        </div>
        
        <div class="form-group row">
            <label class="col-md-4 text-right">Comment</label>
            <div class="col-md-8 inputGroupContainer">
                
                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-4"></div>
            <div class="col-md-8 inputGroupContainer">
                <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" class="btn btn-success col-md-6" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
                <asp:Button ID="Button1" runat="server" Text="Return" type="button" class="btn btn-warning col-md-6" OnClientClick="return confirm('Do you wish to continue?')" OnClick="Button1_Click" />

            </div>
        </div>
        </asp:Panel>
        
        <div class="form-group row text-center">
            <div class="col-md-12">
                <h4><b><asp:Label ID="Label2" runat="server" Enabled="false" /></b></h4>
            </div>
            <hr />
            <div class="col-md-12">
                <asp:Image ID="Image2" runat="server" Width="150" /><br />
                <asp:Label ID="lblComment" runat="server" class="form-control" Enabled="false" />
            </div>
        </div>
    </fieldset>
</asp:Content>

