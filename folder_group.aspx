<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="folder_group.aspx.cs" Inherits="DocShare.folder_group" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .showDiv {
            display: block !important;
        }
    </style>

    <div class="px-7 pt-5" style="width: 100%; background: rgb(246, 247, 251); height: calc(100vh - 3.5rem);">
        <div class="w-full pt-20">
            <div class="max-w-5xl w-full mx-auto">
                <asp:TextBox runat="server" ID="text" placeholder="Create Folder : " class="w-full focus:border-none focus:ring-none border-none border-gray-500" Style="border-width: 2px; border-bottom: 2px solid #868686"></asp:TextBox>
            </div>
        </div>
        <div class="max-w-5xl w-full mx-auto">
            <asp:Button runat="server" Text="Save" class="cursor-pointer my-4 py-1 px-10 bg-indigo-600 hover:bg-indigo-700 focus:ring-indigo-500 focus:ring-offset-indigo-200 text-white transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-sm" OnClick="save_Click" />
        </div>
        <div class="max-w-5xl w-full mx-auto flex flex-wrap">
            <asp:DataList ID="datalist1" runat="server" RepeatColuumnns="4" RepeatDirection="Horizontal">
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
                                <li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="folder-view.aspx?folderid=<%# Eval("id") %>">Preview</a></li>
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

        function GenerateQr(QrId) {
            $.ajax({
                type: "POST",
                url: "folder_group.aspx/makeQr",
                data: '{folderId: "' + QrId + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () {
                    window.location = "QrCodeGenerator.aspx";
                },
                failure: function () {
                    alert("Qr couldn't be created properly...");
                }
            });
        }
    </script>
</asp:Content>
