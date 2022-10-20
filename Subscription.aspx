<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="Subscription.aspx.cs" Inherits="Subscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="row heading">
        <h2 class="text-primary"><b>Subscription Pricing</b></h2>
        <%--<p>Unlimited Projects for Employers!</p>--%>
    </div>
    <hr />
    <asp:TextBox id="hiddentxt" runat="server" hidden></asp:TextBox>
    <asp:TextBox id="hiddenrefnotxt" runat="server" hidden></asp:TextBox>
  
    <div class="container">
        <fieldset>
        <div class="row">
            <div class="col-md-6">
                <asp:Panel id="mypanel1" runat="server" class="panel panel-warning">
                    <div class="panel-heading text-center"><h3><b>Yearly</b></h3></div>
                    <div class="panel-body">
                        <ul>
                            <li>Verifified Icon <i class="fa fa-check-circle-o text-primary"></i></li>
                            <li>Subscribed in Year</li>
                            <li>Price: 1,2000.00</li>
                        </ul>
                        <div class="row text-center">
                            <asp:Button id="btnSelect1" runat="server" class="btn btn-info" OnClick="select1" Text="Select" visible=true/>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-md-6">
                <asp:Panel id="mypanel2" runat="server" class="panel panel-warning">
                    <div class="panel-heading text-center"><h3><b>Monthly</b></h3></div>
                    <div class="panel-body">
                        <ul>
                            <li>Verifified Icon <i class="fa fa-check-circle-o text-primary"></i></li>
                            <li>Subscribed Monthly</li>
                            <li>Price: 100.00</li>
                        </ul>
                        <div class="row text-center">
                            <asp:button id="btnSelect2" runat="server" class="btn btn-info" OnClick="select2" Text="Select" visible=true/>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 text-center">
                <b>Price </b>
                <br />
                <asp:Label id="lblPackage" runat="server"/>
                Php <asp:Label id="lblPrice" runat="server"/> <asp:Label id="lblQty" runat="server"/> <asp:Label id="Label1" runat="server"/>
            </div>
            <div class="col-md-4"></div>
        </div>
        <hr />
       <asp:Panel ID="Panel1" runat="server">
           <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 text-center">
                <b>Quantity</b><br /><asp:textbox id="txtQty" runat="server" value="1" type="number" class="form-control"/>
            </div>
            <div class="col-md-4"></div>
        </div>
       </asp:Panel>
        <div class="row">
             <div class="col-md-4"></div>
            <div class="col-md-4">
                <asp:Button ID="btnReg" Visible=true runat="server" Text="Subscribe!" type="button" class="btn btn-success"  Width="100%" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" />
                <asp:Button ID="btnPay" Visible=false runat="server" Text="Generate Payment Stub" type="button" class="btn btn-warning"  Width="100%" OnClick="payNow" />
            </div>
             <div class="col-md-4">
                 <asp:TextBox id="checkOutID" runat="server" hidden/>
             </div>
        </div>
    </fieldset>
    </div>
    
    <!-- Paymaya -->
    <script src="https://unpkg.com/paymaya-js-sdk@2.0.0/dist/bundle.js"></script>
    <script>

        const SUCCESS_URL = window.location.origin + "/checkPayment.aspx?userid=" + $('#ContentPlaceHolder1_hiddentxt').val()
        const FAILURE_URL = window.location.origin + "/Subscriptionlist.aspx"
        const CANCEL_URL = window.location.origin + "/Subscriptionlist.aspx"
        const refno = Date.now()

        var cart = {
            "totalAmount": {
                "value": 100,
                "currency": "PHP",
                "details": {
                    "discount": 0,
                    "serviceCharge": 0,
                    "shippingFee": 0,
                    "tax": 0,
                    "subtotal": 100
                }
            },
            "items": [
                {
                    "name": "Canvas Slip Ons",
                    "quantity": 1,
                    "code": "XXXX",
                    "description": "Subscription",
                    "amount": {
                        "value": 100,
                        "details": {
                            "discount": 0,
                            "serviceCharge": 0,
                            "shippingFee": 0,
                            "tax": 0,
                            "subtotal": 100
                        }
                    },
                    "totalAmount": {
                        "value": 100,
                        "details": {
                            "discount": 0,
                            "serviceCharge": 0,
                            "shippingFee": 0,
                            "tax": 0,
                            "subtotal": 100
                        }
                    }
                }
            ],
            "requestReferenceNumber": refno,
            "redirectUrl": {
                "success": SUCCESS_URL,
                "failure": FAILURE_URL,
                "cancel": CANCEL_URL
            }
        }
        PayMayaSDK.init('pk-eo4sL393CWU5KmveJUaW8V730TTei2zY8zE4dHJDxkF', true);
        init()
        $('#ContentPlaceHolder1_hiddenrefnotxt').val() = refno
        //console.log(PayMayaSDK)
        //PayMayaSDK.createCheckout(myExampleObject);

        function checkOut() {
            var amt = 350
            var qty = parseFloat(document.getElementById("ContentPlaceHolder1_lblQty").textContent)
            
            var name = document.getElementById("ContentPlaceHolder1_lblPackage").textContent
            if (name == "Yearly")
                amt = 4500

            var total = parseFloat(qty * amt)
            console.log(qty, amt, name, total)

            cart["items"][0]["name"] = name + " Package"
            cart["items"][0]["quantity"] = qty
            cart["items"][0]["amount"]["value"] = amt
            cart["items"][0]["amount"]["details"]["subtotal"] = amt
            cart["items"][0]["totalAmount"]["value"] = total
            cart["items"][0]["totalAmount"]["details"]["subtotal"] = total
            cart["totalAmount"]["value"] = total
            cart["totalAmount"]["details"]["subtotal"] = total

            send()
            //PayMayaSDK.createCheckout(cart)
        } //end function

        function init() {
            
            $.ajax({
                headers: {
                    'Authorization': 'Basic c2stS2ZtZkxKWEZkVjV0MWluWU44bElPd1NydWVDMUcyN1NDQWtsQnFZQ2RyVTo='
                },
                url: "https://pg-sandbox.paymaya.com/checkout/v1/customizations",
                type: "POST",
                data: {
                    logoUrl: window.location.host + "/img/logo.png",
                    iconUrl: window.location.host + "/img/logo.png",
                    appleTouchIconUrl: "https://cdn3.iconfinder.com/data/icons/diagram_v2/PNG/96x96/diagram_v2-12.png",
                    customTitle: "EaseMaker",
                    colorScheme: "#5bc0de",
                }
            }).done(function (response) {
                console.log(response)
            })
        }

        function send() {
            $.ajax({
                headers: {
                    'Authorization': 'Basic cGstZW80c0wzOTNDV1U1S212ZUpVYVc4VjczMFRUZWkyelk4ekU0ZEhKRHhrRjo='
                },
                url: "https://pg-sandbox.paymaya.com/checkout/v1/checkouts",
                type: "POST",
                data: cart
            }).done(function (response) {
                console.log(response.checkoutId)
                document.getElementById("ContentPlaceHolder1_checkOutID").value = response.checkoutId
            })
            
        }
    </script>
</asp:Content>

