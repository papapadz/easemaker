<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageUser.master" AutoEventWireup="true" CodeFile="MyPortfolio.aspx.cs" Inherits="MyProfileApplicant" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        img {
          max-width: 100%;
          display: block;
        }

        figure {
          margin: 0;
          display: grid;
          grid-template-rows: 1fr auto;
          margin-bottom: 10px;
          break-inside: avoid;
        }

        figure > img {
          grid-row: 1 / -1;
          grid-column: 1;
        }

        figure a {
          color: black;
          text-decoration: none;
        }

        figcaption {
          grid-row: 2;
          grid-column: 1;
          background-color: rgba(255,255,255,.5);
          padding: .2em .5em;
          justify-self: start;
        }

        .masonry-container {
          column-count: 4;
          column-gap: 10px;
        }
    </style>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="text-primary"><b><asp:Label ID="txtContactPerson" runat="server"/>'s Portfolio</b></h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 form-inline">
                <asp:FileUpload ID="fuImage" runat="server" class="form-control" accept="image/png, image/gif, image/jpeg" />
                <asp:Button ID="btnReg" runat="server" Text="Add" type="button" class="btn btn-sm btn-success" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 masonry-container">
                <asp:ListView ID="lvInventory" runat="server" OnPagePropertiesChanging="lvInventory_PagePropertiesChanging">
                    <ItemTemplate>
                        <figure>
                            <img class="img-rounded" src='<%# string.Concat("img/", Eval("Image")) %>'/>
                            <figcaption><a class="btn btn-sm btn-danger" href="deleteportfolio.aspx?ID=<%# Eval("PortfolioID") %>" onclick="return confirm('Are you sure you want to delete this image?')">Delete</a></figcaption>
                        </figure>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <h2>No Images Yet</h2>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>

</asp:Content>

