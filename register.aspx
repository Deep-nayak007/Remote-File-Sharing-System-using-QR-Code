<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="DocShare.register" %>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="DocShare.register" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Page</title>
    <script src="https://cdn.tailwindcss.com?plugins=forms,typography,aspect-ratio,line-clamp"></script>
</head>
<body>
    <div class="w-screen h-screen grid place-content-center" style="background: rgb(230, 238, 255)">


        <div id="message" class=" hidden flex p-4 mb-1 text-sm text-red-700 bg-red-100 rounded-lg dark:bg-red-200 dark:text-red-800" role="alert">
            <svg class="inline flex-shrink-0 mr-3 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path></svg>
            <div>
                <span class="font-medium">Login alert!</span> Sorry,you are not authorized to login.
            </div>
        </div>
        <div id="failmessage_box" runat="server" class="flex p-4 mb-1 text-sm text-red-700 bg-red-100 rounded-lg dark:bg-red-200 dark:text-red-800">
            <svg class="inline flex-shrink-0 mr-3 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z" clip-rule="evenodd"></path></svg>
            <div class="font-medium" runat="server" id="Fmessage"></div>
        </div>
        <!-- Small Modal -->
        <div class="hidden overflow-y-auto overflow-x-hidden fixed right-0 left-0 top-4 z-50 justify-center items-center md:inset-0 h-modal sm:h-full" id="small-modal">
            <div class="relative px-4 w-full max-w-md h-full md:h-auto">
                <!-- Modal content -->
                <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
                    <!-- Modal header -->
                    <div class="flex justify-between items-center p-5 rounded-t border-b dark:border-gray-600">
                        <h3 class="text-xl font-medium text-gray-900 dark:text-white">Login Message
                        </h3>

                    </div>
                    <!-- Modal body -->
                    <div class="p-6 space-y-6">
                        <p class="text-base leading-relaxed text-gray-500 dark:text-gray-400">
                            Sorry,you are not authorized to login
                        </p>

                    </div>
                    <!-- Modal footer -->
                    <div class="flex items-center p-6 space-x-2 rounded-b border-t border-gray-200 dark:border-gray-600">
                        <button data-modal-toggle="small-modal" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">I accept</button>
                        <button data-modal-toggle="small-modal" type="button" class="text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:ring-gray-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600">Decline</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="w-full h-full">
            <div class="mb-8">
                <img src="download.png" class="mx-auto" alt="" />
            </div>
            <div class="p-4 rounded-md max-w-4xl bg-white text-center" style="padding: 34px 80px">
                <div class="mb-5">
                    <p class="font-bold text-2xl mb-2" style="color: rgb(50, 69, 103)">Welcome Back</p>
                    <p class="text-md mb-4" style="color: rgb(161, 179, 210)">Enter Your Credentials to register your account.</p>
                </div>
                <div class="opacity-0 transition-all hidden" role="alert">
                    <p class="font-bold"></p>
                </div>
                <div>
                    <form id="form1" runat="server">

                        <div class="flex relative  mb-5">
                            <div class="flex">
                                <span class="rounded-l-md inline-flex items-center px-3 border-t bg-white border-l border-b border-gray-300 text-gray-500 shadow-sm text-sm" style="color: rgb(31, 75, 153)">
                                    <img class="h-[18px] w-[18px]" src="https://img.icons8.com/ios-filled/50/1F4B99/name.png" />

                                </span>
                                <asp:TextBox ID="textname" runat="server" class="rounded-r-md flex-1 appearance-none border border-gray-300 w-full py-2 px-4 bg-white shadow-sm text-base outline-none" placeholder="Enter your Name" value="" Style="color: rgb(90, 113, 157)"></asp:TextBox>
                                <div class="flex flex-col">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="textname" runat="server" ErrorMessage="Please Enter Name"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>

                        <div class="flex relative mb-5">
                            <div class="flex">
                                <span class="rounded-l-md inline-flex items-center px-3 border-t bg-white border-l border-b border-gray-300 text-gray-500 shadow-sm text-sm" style="color: rgb(31, 75, 153)">
                                    <svg width="15" height="15" fill="currentColor" viewBox="0 0 1792 1792" xmlns="http://www.w3.org/2000/svg">
                                        <path
                                            d="M1792 710v794q0 66-47 113t-113 47h-1472q-66 0-113-47t-47-113v-794q44 49 101 87 362 246 497 345 57 42 92.5 65.5t94.5 48 110 24.5h2q51 0 110-24.5t94.5-48 92.5-65.5q170-123 498-345 57-39 100-87zm0-294q0 79-49 151t-122 123q-376 261-468 325-10 7-42.5 30.5t-54 38-52 32.5-57.5 27-50 9h-2q-23 0-50-9t-57.5-27-52-32.5-54-38-42.5-30.5q-91-64-262-182.5t-205-142.5q-62-42-117-115.5t-55-136.5q0-78 41.5-130t118.5-52h1472q65 0 112.5 47t47.5 113z">
                                        </path></svg>

                                </span>
                                <asp:TextBox ID="txtemail" runat="server" type="text" class="rounded-r-md flex-1 appearance-none border border-gray-300 w-full py-2 px-4 bg-white shadow-sm text-base outline-none" placeholder="Enter your email" value="" Style="color: rgb(90, 113, 157)"></asp:TextBox>
                                <div class="flex flex-col">
                                    <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator1" ControlToValidate="txtemail" runat="server" ErrorMessage="Please enter email addresss"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ForeColor="Red" ID="RegularExpressionValidator1" ControlToValidate="txtemail" runat="server" ErrorMessage="Please enter valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                        </div>
                        <div class="flex relative mb-5">

                            <div class="flex">
                                <span class="rounded-l-md inline-flex items-center px-3 border-t bg-white border-l border-b border-gray-300 text-gray-500 shadow-sm text-sm" style="color: rgb(31, 75, 153)">

                                    <img src="https://img.icons8.com/material/18/1F4B99/phone--v1.png" />

                                </span>

                                <asp:TextBox ID="txtmobile" MaxLength="10" runat="server" class="rounded-r-md flex-1 appearance-none border border-gray-300 w-full py-2 px-4 bg-white shadow-sm text-base outline-none" placeholder="Enter your Mobile no." value="" Style="color: rgb(90, 113, 157)"></asp:TextBox>
                                <div class="flex flex-col">
                                    <asp:RequiredFieldValidator ForeColor="Red" ID="RequiredFieldValidator2" ControlToValidate="txtmobile" runat="server" ErrorMessage="Please enter mobile number"></asp:RequiredFieldValidator>
                                </div>
                            </div>

                        </div>
                        <div class="flex relative mb-5">

                            <div class="flex">
                                <span class="rounded-l-md inline-flex items-center px-3 border-t bg-white border-l border-b border-gray-300 text-gray-500 shadow-sm text-sm" style="color: rgb(31, 75, 153)">
                                    <img src="https://img.icons8.com/fluency-systems-filled/15/1F4B99/password--v1.png" />

                                </span>
                                <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" class="rounded-r-md flex-1 appearance-none border border-gray-300 w-full py-2 px-4 bg-white shadow-sm text-base outline-none" placeholder="Enter your Password" value="" Style="color: rgb(90, 113, 157)"></asp:TextBox>
                                <div class="flex flex-col">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtpassword" runat="server" ErrorMessage="Please Enter a password"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="flex relative">

                            <div class="flex">
                                <span class="rounded-l-md inline-flex items-center px-3 border-t bg-white border-l border-b border-gray-300 text-gray-500 shadow-sm text-sm" style="color: rgb(31, 75, 153)">
                                    <img src="https://img.icons8.com/fluency-systems-filled/15/1F4B99/password--v1.png" />

                                </span>
                                <asp:TextBox ID="txtconpassword" TextMode="Password" runat="server" class="rounded-r-md flex-1 appearance-none border border-gray-300 w-full py-2 px-4 bg-white shadow-sm text-base outline-none" placeholder="Enter your Confirm Password" value="" Style="color: rgb(90, 113, 157)"></asp:TextBox>
                                <div class="flex flex-col">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtconpassword" runat="server" ErrorMessage="Please confirm your password"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <asp:Button runat="server" Text="Register" ID="loginbtn" class="py-2 px-4 mt-6 bg-indigo-600 hover:bg-indigo-700 text-white w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md outline-none rounded-lg" Style="background: linear-gradient(to left, rgb(31, 75, 153) 10%, rgb(14, 38, 80))" OnClick="loginbtn_Click" />
                        <a href="login.aspx" class="mt-4 text-blue-500">Already Register ? Login</a>

                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
