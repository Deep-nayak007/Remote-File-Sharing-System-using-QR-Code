<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="QrCodeGenerator.aspx.cs" Inherits="DocShare.QrCodeGenerator" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="mt-[50px]">
        <asp:DataList runat="server" ID="qrIdDataList" class="max-w-5xl mx-auto">
            <ItemTemplate>
                <div class=" border border-gray-300 rounded-xl p-1 shadow-xl cursor-pointer">
                    <asp:Image runat="server" Height="150px" Width="150px" ImageUrl='<%# Eval("QrPath") %>' />
                </div>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>
