<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="addrating.aspx.cs" Inherits="addrating" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row heading">
        <h2>Rating & Comment for Project #  <asp:Label ID="Label1" runat="server" class="form-control" Enabled="false"/></h2>
        <p>Please fill up all text box!</p>
         <p>
        1 - novice
            </p>
         <p>
2 - amateur
              </p>
         <p>
3 - proficient
              </p>
         <p>
4 - Advance Understanding
         </p>
        
         <p>
5 - Professional
         </p>
    </div>


    <fieldset>
        
        <div class="form-group">
            <label class="col-md-4 control-label">Employer Name</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                 <%--   <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                    <asp:Label ID="txtContactPerson" runat="server" class="form-control" Enabled="false"/>
                    <%--  <asp:Label ID="txtEmail" runat="server" class="form-control" />--%>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-4 control-label">Rating</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                    <asp:DropDownList runat="server" ID="ddlund" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlund_SelectedIndexChanged">
                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>

                    </asp:DropDownList>
                </div>
            </div>
        </div>
        
      
          
          
       
         <div class="form-group">
            <label class="col-md-4 control-label">Comment/s</label>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                    <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
        </div>
          <div class="form-group">
            <%--<label class="col-md-4 control-label">Rating Score</label>--%>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                     <asp:Image ID="Image2" runat="server" Width="150"  />
          
                    <%--  <asp:Label ID="txtEmail" runat="server" class="form-control" />--%>
                </div>
            </div>
        </div> <div class="form-group">
            <%--<label class="col-md-4 control-label">Comment/s</label>--%>
            <div class="col-md-8 inputGroupContainer">
                <div class="input-group">
                              <asp:Label ID="lblComment" runat="server" class="form-control" Enabled="false"/>
                    <%--<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>--%>
                    <%--  <asp:Label ID="txtEmail" runat="server" class="form-control" />--%>
                </div>
            </div>
        </div>
        <div class="form-group">

            <div class="col-md-8 inputGroupContainer">
                <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" class="btn" Height="50px" Width="100px" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
                 <asp:Button ID="Button1" runat="server" Text="Return" type="button" class="btn" Height="50px" Width="100px"  OnClientClick="return confirm('Do you wish to continue?')" OnClick="Button1_Click" />

            </div>
        </div>
    </fieldset>
</asp:Content>

