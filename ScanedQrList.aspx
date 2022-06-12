<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ScanedQrList.aspx.cs" Inherits="DocShare.ScanedQrList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .showDiv {
            display: block !important;
        }
    </style>

    <div class="px-7 pt-5" style="width: 100%; background: rgb(246, 247, 251); height: calc(100vh - 3.5rem);">
        <div class="max-w-5xl w-full mx-auto flex flex-wrap">
            <asp:DataList ID="scanedQrDataList" runat="server" RepeatColuumnns="4" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <div class="pl-3">
                        <div class="w-full rounded-tl-lg rounded-tr-lg p-2 bg-gray-100" style="border: 1px solid rgb(194, 194, 194)">
                            <img src="assets/file-icon.png" class="h-[110px] rounded-tl-lg rounded-tr-lg w-full" alt="" />
                        </div>
                        <div class="w-full px-4 flex items-center justify-between rounded-bl-lg rounded-br-lg bg-white py-4" style="border: 1px solid rgb(194, 194, 194); border-top: none">
                            <div>
                                <div class="flex items-center">
                                    <img class="mr-2" src="https://img.icons8.com/external-those-icons-fill-those-icons/20/000000/external-folder-folders-those-icons-fill-those-icons-1.png" />
                                    <p class="text-md text-gray-700 font-bold"><%# Eval("Name") %></p>
                                </div>
                                <div class="w-full text-gray-600 text-sm text-left">
                                    <p>You created on <%# Eval("created_on") %></p>
                                </div>
                            </div>
                            <div class="cursor-pointer pb-5" id="moreinfo">
                                <a href="#" class='dropdown-trigger' onclick="popDiv('<%# Eval("id") %>')">
                                    <img src="https://img.icons8.com/ios-glyphs/20/000000/menu-2.png" />
                                </a>
                            </div>
                        </div>
                        <div class="infobox hidden relative top-[-70px] left-[205px] z-10 bg-white shadow-lg" id='<%# Eval("id") %>'>
                            <ul class="w-full">
                                <li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="folder-view.aspx?folderid=<%# Eval("id") %>" ">Preview</a></li>
                                <li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="file_upload.aspx?folderid=<%# Eval("id") %>">Upload Files</a></li>
                                <li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="#" onclick="GenerateQr('<%# Eval("id") %>')">Generate QR code</a></li>
                                <li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="#" onclick="Delete('<%# Eval("id") %>')">Delete</a></li>
                            </ul>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
    

    <script>
        function popDiv(val) {
            $("#" + val).toggleClass("showDiv");
            //console.log(val);
        }

        function Delete(id) {
            $.ajax({
                type: "POST",
                url: "folder_group.aspx/DeleteById",
                data: '{folderid:"' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    window.location = "folder_group.aspx";
                },
                failure: function (response) {
                    alert(response.data);
                }
            });
        }
        
    </script>
</asp:Content>
