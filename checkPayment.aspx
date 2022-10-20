<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkPayment.aspx.cs" Inherits="checkPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

    <div class="panel panel-info">
        Checking Please Wait ...
    </div>

    <asp:TextBox id="txt1" runat="server" hidden/>

    <script>
       
        var UPDATE_URL = window.location.origin + "/checkOutSuccess.aspx?"
        var SUBSLIST_URL = window.location.origin + "/billinglist.aspx"

        function check() {
            console.log($('#ContentPlaceHolder1_txt1').val())
            $.ajax({
                headers: { 'Authorization': 'Basic c2stS2ZtZkxKWEZkVjV0MWluWU44bElPd1NydWVDMUcyN1NDQWtsQnFZQ2RyVTo=' },
                url: "https://pg-sandbox.paymaya.com/checkout/v1/checkouts/" + $('#ContentPlaceHolder1_txt1').val()
            }).done(function (response) {
                console.log(response)
                if (response.paymentStatus == "PAYMENT_SUCCESS")
                    window.location.href = UPDATE_URL + "checkoutid=" + response.id + "&datepaid=" + response.updatedAt
                else
                    window.location.href = SUBSLIST_URL
            })
        }

    </script>
</asp:Content>

