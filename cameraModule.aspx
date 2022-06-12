<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="cameraModule.aspx.cs" Inherits="DocShare.cameraModule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .otpBox {
            border-bottom: 2px solid black;
            padding: 10px;
            outline: none;
        }
    </style>

    <div class="mt-10">
        <div class="max-w-5xl mx-auto">
            <div class="w-1/2 mx-auto" id="reader"></div>
        </div>
    </div>
    <div class="mt-10">
        <div class="max-w-lg mx-auto">
            <asp:TextBox class="otpBox bg-gray-200 border-0 text-gray-600 text-sm focus:border-0" type="number" runat="server" ID="otp" placeholder="Enter OTP"></asp:TextBox>
            <div class="mt-7">
                <asp:Button class="cursor-pointer w-[30%] text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" OnClick="verify_Click" type="button" runat="server" ID="SubmitOtp" Text="Verify" />
            </div>
        </div>
    </div>


    <script src="html5-qrcode.min.js" type="text/javascript"></script>
    <script>

        function onScanSuccess(response) {
            console.log(response);
            $.ajax({
                type: "POST",
                url: "cameraModule.aspx/generateOtp",
                data: '{id:' + response + '}',
                contentType: "application/json; chartset=utf-8",
                dataType: "json",
                success: function (response) {
                    console.log(response.d);
                },
                failure: function () {
                    alert("Email couldn't be sent successfully..");
                }
            });
        }

        var html5QrcodeScanner = new Html5QrcodeScanner(
            "reader", { fps: 10, qrbox: 250 });
        html5QrcodeScanner.render(onScanSuccess);

    </script>
</asp:Content>
