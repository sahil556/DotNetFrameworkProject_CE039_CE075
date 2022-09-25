<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Employee_Hourly_Attendance.SignUp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 342px;
        }
        .auto-style3 {
            width: 156px;
        }
        .auto-style4 {
            width: 156px;
            height: 24px;
        }
        .auto-style5 {
            width: 342px;
            height: 24px;
        }
        .auto-style6 {
            height: 24px;
        }
        .auto-style7 {
            width: 156px;
            height: 32px;
        }
        .auto-style8 {
            width: 342px;
            height: 32px;
        }
        .auto-style9 {
            height: 32px;
        }
        .auto-style10 {
            width: 156px;
            height: 28px;
        }
        .auto-style11 {
            width: 342px;
            height: 28px;
        }
        .auto-style12 {
            height: 28px;
        }
        .auto-style13 {
            margin-top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2" style="text-align: center">
                        <asp:Label ID="signuptitle" runat="server" Font-Bold="True" Font-Size="XX-Large" Text=" Register Here  " BorderColor="Blue" BorderStyle="Solid" Font-Strikeout="False" Height="50px" CssClass="auto-style1" TabIndex="-1" Width="303px"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: center">
                        <asp:Label ID="lblEid" runat="server" Text="Employee Id :" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbEid" runat="server" Height="23px" Width="175px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEid" runat="server" ControlToValidate="tbEid" ErrorMessage="Employee id is Required ." ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3" style="text-align: center">
                        <asp:Label ID="lblName" runat="server" Text="Name :" ToolTip="Enter Your Full Name" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="tbName" runat="server" Height="23px" Width="175px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="tbName" ErrorMessage="Name is Required ." ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4" style="text-align: center">
                        <asp:Label ID="lblEmail" runat="server" Text="Email :" ToolTip="Enter Your Email Here" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style5">
                        <asp:TextBox ID="tbEmail" runat="server" TextMode="Email" Height="24px" Width="175px"></asp:TextBox>
                    </td>
                    <td class="auto-style6">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" BorderColor="Red" ControlToValidate="tbEmail" ErrorMessage="Email is Required ." ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Button ID="btnViewEmp" runat="server" CausesValidation="False" OnClick="btnViewEmp_Click" Text="View Records" UseSubmitBehavior="False" Font-Bold="True" Font-Size="Large" Height="40px" Width="183px" />
                    </td>
                    <td class="auto-style8">
                        <asp:Button ID="btnsubmit" runat="server" Text="Generate Barcode" Height="40px" OnClick="btnsubmit_Click" Width="210px" Font-Bold="True" Font-Size="Large" />
                    &nbsp;<asp:Button ID="btnsignout" runat="server" CausesValidation="False" Height="40px" OnClick="btnsignout_Click" Text="Logout" Width="119px" Font-Bold="True" Font-Size="Large" />
                    </td>
                    <td class="auto-style9">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style10"></td>
                    <td class="auto-style11"></td>
                    <td class="auto-style12"></td>
                </tr>
                <tr>
                    <td class="auto-style3">&nbsp;</td>
                    <td class="auto-style2">
                        <asp:Label ID="lblmsg" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#006600" Text="message" Visible="False"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="Panel1" runat="server" CssClass="auto-style13">
            <br />
        </asp:Panel>
    </form>
</body>
</html>
