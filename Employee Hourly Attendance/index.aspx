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
            padding-left:35px;
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
        .auto-style36 {
            width: 716px;
        }
        #lblheader{
            font-size:7vh;
            color:white;
        }
        .mainbtn{
            align-items:center;
            margin-left:42%;
            margin-top:9px;
            width:320px;
            height:38px;
            border : solid 2px #6c757d;
            background-color : #6c757d;
            border-radius:20px;
            color:white
        }
        .panel{
            margin-left:42%;
            margin-top:7px;
            width:320px;
            height:220px;
            border:solid #6c757d 1px;
            border-radius:5px;


            background-color:#28a745!important;
            color:white;
        }
        .scanbtn{
            width:120px;
            height:38px;
            border-radius:20px;
            border:solid 1px #6c757d; 
            margin-left:5vh;
        }
        .uploadbtn{
            margin-left:5vh;
            height:36px;
            width:408px;
        }
        .emailpass{
            border-radius:15px;
            border:solid 1px #6c757d;
        }
        .Loginbtn
        {
            height:45px;
            width:214px;
            border: solid 2px #007bff;
            border-radius:15px;
            border:solid 1px #6c757d; 
        }

    </style>
     <script src="Content/bootstrap.css"></script>
    <script src="Content/bootstrap-theme.css"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="border: thick #000000; font-style: oblique; background-color:#17a2b8!important; font-variant: normal; text-align: center;">
            <br />
            <asp:Label ID="lblheader" runat="server" Font-Bold="True" Text="Welcome To YourAttendance"></asp:Label>
            <br />
            <br />
        </div>
               <asp:Button ID="btnLogin" runat="server" CssClass="mainbtn" OnClick="login_click" Text="Admin Login" CausesValidation="False"  Font-Size="Large"  />
                    <br />
                    <asp:Button ID="btnAttendance" runat="server" CssClass="mainbtn" OnClick="btnAttendance_Click" Text="Mark Your Attendance" CausesValidation="False" Font-Size="Large" />
            
        <table class="auto-style30">
            <tr>
                <td class="auto-style32">
                    <asp:Panel ID="panelLogin" class="panel" runat="server" Visible="False">
                        <table class="auto-style11">
                            <tr>
                                <td class="auto-style9"></td>
                                <td class="auto-style25">
                                    <asp:Label ID="logintitle" runat="server" Font-Bold="True" Font-Size="Larger" Text="Login Here"></asp:Label>
                                </td>
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
                                    <asp:TextBox ID="tbEmail" runat="server" CssClass="emailpass" placeholder="Enter Your Email Here" TextMode="Email" Height="27px" Width="236px" AutoCompleteType="Enabled"></asp:TextBox>
                                </td>
                                <td class="auto-style18">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="tbEmail" ErrorMessage="Email is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style20" style="text-align: center">
                                    <asp:Label ID="lblPassword" runat="server" Text="Password" Font-Size="Large"></asp:Label></td>
                                <td class="auto-style28">
                                    <asp:TextBox ID="tbPassword" runat="server" CssClass="emailpass" TextMode="Password" Height="27px" Width="236px"></asp:TextBox>
                                </td>
                                <td class="auto-style21">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style24">&nbsp;</td>
                                <td class="auto-style29">
                                    <asp:Button ID="btnsubmit" runat="server" Text="login" OnClick="btnsubmit_Click" CssClass="Loginbtn" Font-Size="Large" />
                                </td>
                                <td class="auto-style2">&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                </tr>
            <tr>
                <td>
                    <asp:Panel ID="panelAttendance"  class="panel" runat="server" Visible="False">
                        &nbsp;<br /> &nbsp;&nbsp;
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="uploadbtn" onchange="IsFileSelected()" FileName="nofile" accept=".png" />
                        &nbsp;&nbsp;<table class="auto-style30">
                           
                           <asp:RequiredFieldValidator ID="RequiredFieldValidatorfile" runat="server" Font-Bold="True" ErrorMessage="Please select barcode(.png)" ForeColor="#FF3300" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                               
                            <tr>
                                <td class="auto-style34">&nbsp; &nbsp;<asp:Button ID="btnupload" runat="server" CssClass="scanbtn" OnClick="btnupload_Click" Text="Scan" Font-Size="Large" Height="38px" Width="200px" /></td>
                            </tr>
                            <tr>
                                 <td class="auto-style34">&nbsp; &nbsp;<asp:Button ID="btnViewAttendence" runat="server" CssClass="scanbtn" OnClick="btnViewAttendence_Click" Text="View your attendence" Font-Size="Large" Height="38px" Width="200px" /></td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;<br />&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblfilenotfound" runat="server" Text="Label" Visible="False" Font-Size="Large" ForeColor="Red" Font-Bold="true"></asp:Label>
                        <br />&nbsp;
                        <asp:Label ID="lblresult" runat="server" Text=" " Visible="False" Font-Size="X-Large" ForeColor="Green" ></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
        </table>
&nbsp;</form>
</body>
</html>
