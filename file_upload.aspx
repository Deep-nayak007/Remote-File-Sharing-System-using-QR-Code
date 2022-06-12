<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="file_upload.aspx.cs" Inherits="DocShare.file_upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .showDiv {
            display: block !important;
        }
    </style>
    <div class="w-1/2 mx-auto my-4">
        <label for="myfile">Select files to upload: </label>
        <div class="pt-2">
            <asp:FileUpload ID="FileUpload1" runat="server" AllowMultiple="true" />
        </div>
        <asp:Button runat="server" Text="Save" class="cursor-pointer my-4 py-1 px-10 bg-indigo-600 hover:bg-indigo-700 focus:ring-indigo-500 focus:ring-offset-indigo-200 text-white transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 rounded-sm" OnClick="Button1_Click" />


        <asp:Label ID="lblSuccess" runat="server" Text="Label"></asp:Label>

    </div>
    <div class="border-b border-gray-700 max-w-6xl mx-auto">
    </div>
    <div>
        <div class="max-w-6xl mx-auto p-2 h-[500px] overflow-auto">
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Vertical" Width="100%">
                <ItemTemplate>
                    <div class="max-w-5xl flex relative mx-auto border border-gray-300 shadow-lg rounded-md">
                        <div class="container max-w-xs flex justify-center p-3">
                            <div class="p-4 h-32 w-36 border border-gray-500 flex justify-center">
                                <img class="" src='<%# Eval("imgpath") %>' />
                            </div>
                        </div>
                        <div class="p-4 mt-5">
                            <span class="text-2xl font-semibold"><%# Eval("imgname") %></span>
                            <div>
                                <span><%# Eval("date1") %></span>
                            </div>
                            <div class="cursor-pointer mt-2" id="moreinfo">
                                <a class='dropdown-trigger' data-beloworigin="true" href='#' onclick="popup('<%# Eval("id") %>')">
                                    <img src="https://img.icons8.com/ios-glyphs/20/000000/menu-2.png" style="margin-left: -6px" />
                                </a>
                            </div>
                            <div class="infobox hidden absolute top-[60%] left-[34%] z-10 bg-white shadow-lg" id='<%# Eval("id") %>'>
                                <ul class="w-full">
                                    <li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="#" onclick="DownloadFile('<%# Eval("imgname") %>')">Download Image</a></li>
                                    <li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="#" onclick="Remove('<%# Eval("id") %>')">Remove</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>

    <script>
        function popup(val) {
            $("#" + val).toggleClass("showDiv");
        }

        function Remove(id) {
            $.ajax({
                type: "POST",
                url: "file_upload.aspx/RemoveById",
                data: '{id: "' + id + '"}',
                contentType: "application/json charset=utf-8",
                dataType: "json",
                success: success,
                failure: function () {
                    alert("File couldn't be deleted...");
                }
            });
        }

        function success() {
            window.location = "file_upload.aspx";
        }

        function DownloadFile(filePath) {
            //alert("hello");
            $.ajax({
                type: "POST",
                url: "file_upload.aspx/DownloadF",
                data: '{path:"' + filePath + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: ifDownloaded,
                failure: function () {
                    alert("File Couldn't be downloaded..");
                }
            });
        }

        function ifDownloaded() {
            //  window.location.reload(true);
        }
    </script>
</asp:Content>
