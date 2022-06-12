<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="DocShare.History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .showDiv {
            display: block !important;
        }
    </style>

    <div class="px-7 pt-5" style="width: 100%; background: rgb(246, 247, 251); height: calc(100vh - 3.5rem);">
        <div class="w-full p-5 bg-white shadow-md" style="height: 97%;">
            <p class="text-black font-bold text-md">Files Shared Log</p>
            <div class="mt-4 flex justify-between items-center">
                <div class="flex flex-wrap">
                    <div class="w-full sm:w-6/12 md:w-4/12">
                        <div class="relative inline-flex align-middle w-full">
                            <div class="hidden bg-white text-base z-50 float-left py-2 list-none text-left rounded shadow-lg mt-1 text-blue-500" style="min-width: 12rem">
                                <a href="#pablo" class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700">Action</a><a href="#pablo" class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700">Another action</a><a href="#pablo" class="text-sm py-2 px-4 font-normal block w-full whitespace-nowrap bg-transparent text-blueGray-700">Something else here</a>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<div class="filters flex justify-end" style="width: 50%">
                    <label class="w-1/4">
                        <span class="text-xs text-gray-400 font-medium">Student Type</span><select name="" class="w-full text-xs py-2 border-b-2 border-gray-400 outline-none text-black focus:border-blue-400" id="">
                            <option value="all">ALL</option>
                            <option value="employee">Employee</option>
                            <option value="student">Student</option>
                        </select>
                    </label>
                    <label class="flex justify-between items-end ml-4">
                        <input type="text" name="" placeholder="Search" class="w-full py-2 border-b-2 border-gray-400 outline-none focus:border-blue-400" id="" />
                    </label>
                </div>
            </div>--%>
                <div class="w-full mt-5">
                    <div class="overflow-y-auto" style="height: 35rem">
                        <asp:DataList runat="server" ID="fileSharedLogs">
                            <HeaderTemplate>
                                <table class="text-left p-4 bg-white shadow rounded-lg" style="width: 187%">
                                    <thead>
                                        <tr>
                                            <th class="border p-4 dark:border-dark-5 whitespace-nowrap font-bold text-gray-900">File Name</th>
                                            <th class="border p-4 dark:border-dark-5 whitespace-nowrap font-bold text-gray-900">File Path</th>
                                            <th class="border p-4 dark:border-dark-5 whitespace-nowrap font-bold text-gray-900">Created On</th>
                                            <th class="border p-4 dark:border-dark-5 whitespace-nowrap font-bold text-gray-900">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr class="text-gray-700">
                                    <td class="border px-4 py-1 dark:border-dark-5" style="width: 20.875rem">
                                        <div class="flex items-center">
                                            <div class="w-10 h-10">
                                                <img src="/static/media/s1.48fb8dad127c7f622c37.png" alt="" class="rounded-full" />
                                            </div>
                                            <div class="p-2">
                                                <p class="text-xl font-normal"><%# Eval("FileName") %></p>
                                                <p class="text-xs">Folder ID : <%# Eval("FolderId") %></p>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="border align-middle px-4 dark:border-dark-5">
                                        <p><%# Eval("filePath") %></p>
                                    </td>
                                    <td class="border align-middle px-4 dark:border-dark-5">
                                        <p><%# Eval("createdOn") %></p>
                                    </td>
                                    <td class="border p-4 align-middle dark:border-dark-5 relative">
                                        <a href="#" id="moreinfo" onclick="popup('<%# Eval("FolderId") %>')">
                                            <img class="cursor-pointer" alt="No Image" src="https://img.icons8.com/material-rounded/20/f3f3f3f/menu-2.png" />
                                        </a>
                                        <div class="infobox hidden absolute top-[25%] left-[20%] z-10 bg-white shadow-lg" id="<%# Eval("FolderId") %>">
                                            <ul class="w-full">
                                                <li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="folder-view.aspx?folderid=<%# Eval("FolderId") %>">Preview</a></li>
                                                <li class="p-2 hover:bg-gray-300 transiton-all text-lg"><a href="#" onclick="Remove('<%# Eval("ID") %>','<%# Eval("FolderId") %>')">Delete</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                </tbody>
                                </table>
                            </FooterTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function popup(val) {
            $("#" + val).toggleClass("showDiv");
        }

        function Remove(id, folderId) {
            /*alert("Id : " + id + " FolderId: " + folderId);*/
            $.ajax({
                type: "POST",
                url: "History.aspx/Delete",
                data: '{id:"' + id + '",folderid: "' + folderId + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: response,
                failure: function () {
                    alert("File with " + folderId + " couldn't be removed...");
                }
            });
        }

        function response() {
            window.location.reload();
        }
    </script>
</asp:Content>
