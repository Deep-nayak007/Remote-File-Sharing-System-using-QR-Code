<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="DocShare.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--Dashboard content--%>

    <div class="px-7 pt-5" style="width: 100%; background: rgb(246, 247, 251); height: calc(100vh - 3.5rem);">
        <div class="flex items-center mb-10 justify-between flex-wrap">
            <div class="flex">
                <asp:DataList runat="server" ID="datalist1">
                    <ItemTemplate>
                        <div class="flex items-center mt-2 mx-2 text-white rounded-lg" style="width: fit-content; background: linear-gradient(90deg, rgb(67, 155, 255) 35%, rgb(107, 176, 255) 100%)">
                            <div class="p-4">
                                <img src="https://img.icons8.com/fluency-systems-filled/35/ffffff/commercial-development-management.png" />
                            </div>
                            <div class="text-center py-4 px-7" style="border-left: 2px solid white">
                                <p class="mb-2 text-xl font-bold"><%# Eval("totalFolders") %></p>
                                <p>Total Folders</p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList runat="server" ID="datalist2">
                    <ItemTemplate>
                        <div class="flex items-center mt-2 mx-2 text-white rounded-lg" style="width: fit-content; background: linear-gradient(90deg, rgb(62, 219, 188) 35%, rgb(107, 219, 196) 100%)">
                            <div class="p-4">
                                <img src="https://img.icons8.com/fluency-systems-filled/35/ffffff/login-rounded-right.png" />
                            </div>
                            <div class="text-center py-4 px-7" style="border-left: 2px solid white">
                                <p class="mb-2 text-xl font-bold"><%# Eval("totalFiles") %></p>
                                <p>Total Files</p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList runat="server" ID="datalist3">
                    <ItemTemplate>
                        <div class="flex items-center mt-2 mx-2 text-white rounded-lg" style="width: fit-content; background: linear-gradient(90deg, rgb(255, 188, 92) 35%, rgb(255, 202, 124) 100%)">
                            <div class="p-4">
                                <img src="https://img.icons8.com/fluency-systems-filled/35/ffffff/logout-rounded-left.png" />
                            </div>
                            <div class="text-center py-4 px-7" style="border-left: 2px solid white">
                                <p class="mb-2 text-xl font-bold"><%# Eval("totalQr") %></p>
                                <p>Total QR</p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:DataList runat="server" ID="datalist4">
                    <ItemTemplate>
                        <div class="flex items-center mt-2 mx-2 text-white rounded-lg" style="width: fit-content; background: linear-gradient(90deg, rgb(255, 86, 114) 35%, rgb(255, 131, 152) 100%)">
                            <div class="p-4">
                                <img src="https://img.icons8.com/fluency-systems-filled/35/ffffff/emergency-exit.png" />
                            </div>
                            <div class="text-center py-4 px-7" style="border-left: 2px solid white">
                                <p class="mb-2 text-xl font-bold"><%# Eval("totalScan") %></p>
                                <p>Total Scan</p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <div class="flex items-center mt-2 mx-2 text-white rounded-lg" style="width: fit-content; background: linear-gradient(90deg, rgb(67, 155, 255) 35%, rgb(107, 176, 255) 100%)">
                    <div class="p-4">
                        <img src="https://img.icons8.com/fluency-systems-filled/35/ffffff/high-priority.png" />
                    </div>
                    <div class="text-center py-4 px-7" style="border-left: 2px solid white">
                        <p class="mb-2 text-xl font-bold">1</p>
                        <p>Total Block</p>
                    </div>
                </div>
                <div class="flex items-center mt-2 mx-2 text-white rounded-lg" style="width: fit-content; background: linear-gradient(90deg, rgb(255, 86, 114) 35%, rgb(255, 131, 152) 100%)">
                    <div class="p-4">
                        <img src="https://img.icons8.com/fluency-systems-filled/35/ffffff/75-percents.png" />
                    </div>
                    <div class="text-center py-4 px-7" style="border-left: 2px solid white">
                        <p class="mb-2 text-xl font-bold">10</p>
                        <p>Incomplete</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="w-full p-5 bg-white shadow-md">
            <p class="text-black font-bold text-md">Folder Log</p>
            <div class="mt-4 flex justify-between items-center">
            </div>

            <div class="w-full mt-5">
                <div class="overflow-y-auto " style="height: calc(100vh - 27rem)">
                    <asp:DataList runat="server" ID="table_datalist">
                        <HeaderTemplate>

                            <table class="table text-left p-4 bg-white shadow rounded-lg " style="width: 207%">
                                <thead>
                                    <tr>
                                        <th class="border p-4 dark:border-dark-5 whitespace-nowrap font-bold text-gray-900">Name</th>
                                        <th class="border p-4 dark:border-dark-5 whitespace-nowrap font-bold text-gray-900">Description</th>
                                        <th class="border p-4 dark:border-dark-5 whitespace-nowrap font-bold text-gray-900">Created At</th>
                                        <th class="border p-4 dark:border-dark-5 whitespace-nowrap font-bold text-gray-900">Updated At</th>
                                        <th class="border p-4 dark:border-dark-5 whitespace-nowrap font-bold text-gray-900">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>

                        <ItemTemplate>
                            <tr class="text-gray-700">
                                <td class="border px-4 py-1 dark:border-dark-5">
                                    <div class="flex items-center">
                                        <div class="w-10 h-10">
                                            <img src="/static/media/s1.48fb8dad127c7f622c37.png" alt="" class="rounded-full" />
                                        </div>
                                        <div class="p-2">
                                            <p class="text-xl font-normal"><%# Eval("Name") %></p>
                                            <p class="text-xs">Folder ID : <%# Eval("id") %></p>
                                        </div>
                                    </div>
                                </td>
                                <td class="border align-middle px-4 dark:border-dark-5">
                                    <p><%# Eval("Descr") %></p>
                                </td>

                                <td class="border align-middle p-4 dark:border-dark-5"><%# Eval("created_on") %></td>
                                <td class="border align-middle p-4 dark:border-dark-5"><%# Eval("updated_on") %></td>
                                <td class="border p-4 align-middle dark:border-dark-5 relative cursor-pointer" onclick="popup('<%# Eval("id") %>')">
                                    <img src="https://img.icons8.com/material-rounded/20/f3f3f3f/menu-2.png" />
                                    <div class="shadow-lg bg-white absolute top-[20px] left-[25%] hidden " id="<%# Eval("id") %>">
                                        <a class=" text-black px-6 py-3 hover:bg-gray-300 " href="folder-view.aspx?folderid=<%# Eval("id") %>">Preview</a>
                                        <p class=" px-6 py-3 border-black text-black hover:bg-gray-300" onclick="Delete('<%# Eval("id") %>')">Delete</p>
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

    <script>
        function show(id) {
            $("#" + id).toggleClass("showDiv");
        }

        function popup(id) {
            $("#" + id).toggleClass("showDiv");
        }

        function Delete(id) {
            $.ajax({
                type: "POST",
                url: "dashboard.aspx/Deleteid",
                data: '{folderid:"' + id + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess,
                failure: function (response) {
                    alert(response.data);
                }
            });
        }

        function OnSuccess(response) {
            window.location = "folder_group.aspx";
        }
    </script>

</asp:Content>
