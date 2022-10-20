<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageEmployer.master" AutoEventWireup="true" CodeFile="AddJob.aspx.cs" Inherits="AddJob" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="row heading">
                <h2><b>Add Project</b></h2>
                <small><i>Please fill up all text box!</i></small>
            </div>
         <fieldset>
                       <asp:TextBox id="hiddentxt" runat="server" hidden/>
                          <div class="form-group">
                            <label class="col-md-4 control-label">Project Title</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtJT" runat="server" class="form-control" placeholder="Project Title" 
                                        MaxLength="300" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Project Description</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtDesc" runat="server" class="form-control" placeholder="Description" TextMode="MultiLine"
                                        MaxLength="300" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Amount Offered</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtamt" runat="server" class="form-control" placeholder="Amount Offered" type="number"
                                        min="0.00" max="10000000.00" step="0.00" required/>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                                    Enabled="True" FilterMode="InvalidChars"
                                    InvalidChars="!#$%^&amp;*()&lt;&gt;?/=|][{}'&quot;~`+\:;,<>qwertyuiopasdfghjklzxcvbnm"
                                    TargetControlID="txtamt">
                                </asp:FilteredTextBoxExtender>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label">Time frame</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txttf" runat="server" class="form-control" placeholder="1-9999" type="number"
                                        min="1" max="30" step="1" required/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label">Time frame Category</label>
                           <div class="col-md-8">
                                <asp:DropDownList runat="server" ID="ddltimecat" class="form-control">
                                    <asp:ListItem Text="Days" Value="Days"></asp:ListItem>
                                    <asp:ListItem Text="Months" Value="Months"></asp:ListItem>
                                    <asp:ListItem Text="Years" Value="Years"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-4 control-label">Category</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="ddlCategory" runat="server" class="custom-select2 form-control" data-live-search="true"
                                        AutoPostBack="true" />
                            </div>
                        </div>
                     
                        <div class="form-group">
                            <div class="col-md-4"></div>
                            <div class="col-md-8 text-center">
                                <asp:Button ID="btnReg" runat="server" Text="Submit" type="button" style="width:100%" class="btn btn-success" OnClick="btnReg_Click" OnClientClick="return confirm('Do you wish to continue?')" /> 
                                <!-- <button id="btnSubmitForm" type="button" class="btn btn-success">Submit</button>-->
                            </div>
                        </div>
                    </fieldset>
    </div>

    <script src="https://unpkg.com/paymaya-js-sdk@2.0.0/dist/bundle.js"></script>
    <script>
        const SUCCESS_URL = window.location.origin + "/checkPayment.aspx?userid=" + $('#ContentPlaceHolder1_hiddentxt').val()
        const FAILURE_URL = window.location.origin + "/joblistfreelancer.aspx?ST=&yrs=&cat="
        const CANCEL_URL = window.location.origin + "/joblistfreelancer.aspx?ST=&yrs=&cat="

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
            "requestReferenceNumber": "1551191039",
            "redirectUrl": {
                "success": SUCCESS_URL,
                "failure": FAILURE_URL,
                "cancel": CANCEL_URL
            }
        }

        PayMayaSDK.init('pk-eo4sL393CWU5KmveJUaW8V730TTei2zY8zE4dHJDxkF', true);
        init()

        console.log(cart)

        function send() {
            
            total = 100
            var self = this

            cart["items"][0]["name"] = $('#ContentPlaceHolder1_txtJT').val()
            cart["items"][0]["amount"]["value"] = total
            cart["items"][0]["amount"]["details"]["subtotal"] = total
            cart["items"][0]["totalAmount"]["value"] = total
            cart["items"][0]["totalAmount"]["details"]["subtotal"] = total
            cart["totalAmount"]["value"] = total
            cart["totalAmount"]["details"]["subtotal"] = total
            cart["requestReferenceNumber"] = Date.now()

            $.ajax({
                headers: {
                    'Authorization': 'Basic cGstZW80c0wzOTNDV1U1S212ZUpVYVc4VjczMFRUZWkyelk4ekU0ZEhKRHhrRjo='
                },
                url: "https://pg-sandbox.paymaya.com/checkout/v1/checkouts",
                method: "POST",
                data: cart
            }).done(function (response) {
                self.addBilling(response);
                //console.log(response)
            })
        }

        function addBilling(objInfo) {
            $.ajax({
                method: "GET",
                url: "addBilling.aspx",
                data: {
                    checkoutid: objInfo.checkoutId,
                    refno: cart["requestReferenceNumber"]
                }
            }).done(function (response) {
                console.log(response)
                window.location.href = "joblist.aspx";
            })
        }

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
    </script>
</asp:Content>

