<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Employee_Hourly_Attendance.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home - Attendance</title>
    <style type="text/css">
        .auto-style2 {
            height: 55px;
        }
        .auto-style30 {
            width: 100%;
        }
        .auto-style11 {
            width: 93%;
            height: 216px;
        }
        .auto-style9 {
            width: 152px;
            height: 39px;
        }
        .auto-style25 {
            width: 250px;
            height: 39px;
        }
        .auto-style10 {
            width: 452px;
            height: 39px;
        }
        .auto-style16 {
            width: 152px;
            height: 23px;
        }
        .auto-style26 {
            height: 23px;
            width: 250px;
        }
        .auto-style15 {
            height: 23px;
        }
        .auto-style19 {
            width: 152px;
            height: 38px;
        }
        .auto-style27 {
            height: 38px;
            width: 250px;
        }
        .auto-style18 {
            height: 38px;
        }
        .auto-style20 {
            width: 152px;
            height: 34px;
        }
        .auto-style28 {
            height: 34px;
            width: 250px;
        }
        .auto-style21 {
            height: 34px;
        }
        .auto-style24 {
            width: 152px;
        }
        .auto-style29 {
            height: 55px;
            width: 250px;
        }
        .auto-style32 {
            width: 765px;
        }
        .auto-style34 {
            width: 215px;
        }
        .auto-style35 {
            margin-left: 0px;
        }
        .auto-style36 {
            width: 716px;
        }
    </style>
     <script src="Content/bootstrap.css"></script>
    <script src="Content/bootstrap-theme.css"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="border: thick double #000000; font-style: oblique; font-variant: normal; text-align: center;">
            <br />
            <asp:Label ID="lblheader" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Welcome To YourAttendance"></asp:Label>
            <br />
            <br />
        </div>
        <table class="auto-style30">
            <tr>
                <td class="auto-style36">
                    <br />
                    <asp:Button ID="btnLogin" runat="server" OnClick="login_click" Text="Admin Login" CausesValidation="False" Font-Bold="True" Font-Size="Large" Height="38px" Width="154px" />
                </td>
                <td>
                    <br />
                    <asp:Button ID="btnAttendance" runat="server" OnClick="btnAttendance_Click" Text="Mark Your Attendance" Width="273px" CausesValidation="False" Font-Bold="True" Font-Size="Large" Height="39px" />
                </td>
            </tr>
        </table>
        <table class="auto-style30">
            <tr>
                <td class="auto-style32">
                    <asp:Panel ID="panelLogin" runat="server" BorderColor="#336600" BorderStyle="Solid" Height="220px" Visible="False" Width="714px">
                        <table class="auto-style11">
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style25" style="text-align: center">
                                    <asp:Label ID="logintitle" runat="server" Font-Bold="True" Font-Size="Larger" Text="Login Here"></asp:Label>
                                </td>
                                <td class="auto-style10">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style16"></td>
                                <td class="auto-style26">
                                    <asp:Label ID="lblerror" runat="server" Font-Bold="True" Font-Size="Larger" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                                </td>
                                <td class="auto-style15"></td>
                            </tr>
                            <tr>
                                <td class="auto-style19" style="text-align: center">
                                    <asp:Label ID="lblEmail" runat="server" Text="Email :" ToolTip="Enter Your Email Here" Font-Size="Large"></asp:Label>
                                </td>
                                <td class="auto-style27">
                                    <asp:TextBox ID="tbEmail" runat="server" TextMode="Email" Height="27px" Width="236px" AutoCompleteType="Disabled"></asp:TextBox>
                                </td>
                                <td class="auto-style18">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Email is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style20" style="text-align: center">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password" Font-Size="Large"></asp:Label>
                                    &nbsp;:</td>
                                <td class="auto-style28">
                                    <asp:TextBox ID="tbPassword" runat="server" TextMode="Password" Height="27px" Width="236px"></asp:TextBox>
                                </td>
                                <td class="auto-style21">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style29">
                                    <asp:Button ID="btnsubmit" runat="server" Text="login" OnClick="btnsubmit_Click" Width="214px" Height="45px" Font-Size="Large" />
                                </td>
                                <td class="auto-style2">&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    <asp:Panel ID="panelAttendance" runat="server" BorderColor="#FF0066" BorderStyle="Solid" Height="218px" Visible="False" Width="791px">
                        &nbsp;<br /> &nbsp;&nbsp;
                        <asp:FileUpload ID="FileUpload1" runat="server" onchange="IsFileSelected()" FileName="nofile" accept=".png" Height="36px" Width="308px" />
                        &nbsp;&nbsp;<table class="auto-style30">
                            <tr>
                                <td class="auto-style34">&nbsp; &nbsp;<asp:Button ID="btnupload" runat="server" CssClass="auto-style35" OnClick="btnupload_Click" Text="Scan" Font-Size="Large" Height="44px" Width="124px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorfile" runat="server" ErrorMessage="Please select barcode(.png)" ForeColor="#FF3300" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblfilenotfound" runat="server" Text="Label" Visible="False"></asp:Label>
                        <br />&nbsp;
                        <asp:Label ID="lblresult" runat="server" Text=" " Visible="False"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
        </table>
&nbsp;</form>
</body>
</html>
