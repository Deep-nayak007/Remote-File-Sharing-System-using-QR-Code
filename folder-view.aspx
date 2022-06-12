<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="folder-view.aspx.cs" Inherits="DocShare.folder_view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .showDiv {
            display: block !important;
        }
    </style>
    <div class="max-w-6xl mx-auto p-2">
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" RepeatDirection="Horizontal" class="w-full">
            <ItemTemplate>
                <div class="max-w-5xl relative flex mx-auto border border-gray-300 mt-2 shadow-lg rounded-md">
                    <div class="container max-w-xs flex justify-center p-3">
                        <div class="p-4 h-32 w-36 border border-gray-500 flex justify-center">
                            <img src="./Docs/<%# Eval("imgpath") %>" />
                        </div>
                    </div>
                    <div class="p-4 mt-5">
                        <span class="text-2xl font-semibold"><%# Eval("imgname") %></span>
                        <div>
                            <span><%# Eval("date1") %></span>
                        </div>
                        <div class="cursor-pointer mt-2" id="moreinfo">
                            <a class='dropdown-trigger' onclick="popup('<%# Eval("id") %>')" data-beloworigin="true" href='#'>
                                <img src="https://img.icons8.com/ios-glyphs/20/000000/menu-2.png" style="margin-left: -6px" />
                            </a>
                        </div>
                        <div class="infobox hidden absolute top-[60%] left-[34%] z-10 bg-white shadow-lg" id='<%# Eval("id") %>'>
                            <ul class="w-full">
                                <%--<li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="#" onclick="DownloadFile('<%# Eval("imgpath") %>')">Download Image</a></li>--%>

                                 <li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="#" onclick="DownloadFile('<%# Eval("imgname") %>')">Download Image</a></li>
                                <li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="#" onclick="Delete('<%# Eval("id") %>')">Remove</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>
        
    </div>
    <script>
        function popup(val) {
            $("#" + val).toggleClass("showDiv");
            //alert(val);
        }

        function Delete(id) {
            $.ajax({
                type: "POST",
                url: "folder_view.aspx/Remove",
                data: '{id: "' + id + '"}',
                contentType: "application/json charset=utf-8",
                dataType: "json",
                success: function () {
                    alert("file removed successfully...");
                    window.location.reload();
                },
                failure: function () {
                    alert("File couldn't be properly removed...");
                }
            });
        }


        function DownloadFile(filePath) {
            //alert("hello");

            window.location.href = "WebForm1.aspx?file=" + filePath;

            //$.ajax({
            //    type: "POST",
            //    url: "file_upload.aspx/DownloadF",
            //    data: '{path:"' + filePath + '"}',
            //    contentType: "application/json; charset=utf-8",
            //    dataType: "json",
            //    success: ifDownloaded,
            //    failure: function () {
            //        alert("File Couldn't be downloaded..");
            //    }
            //});
        }

        function ifDownloaded() {
            //  window.location.reload(true);
            alert("hello")
        }
    </script>
</asp:Content>
