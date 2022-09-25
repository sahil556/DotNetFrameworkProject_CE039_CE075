<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeData.aspx.cs" Inherits="Employee_Hourly_Attendance.EmployeeData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your EMployee Records</title>
    <script src="Content/bootstrap.css"></script>
    <script src="Content/bootstrap-theme.css"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
        <div style="border: thick double #000000; font-style: oblique; font-variant: normal; text-align: center;">
            <br />
            <asp:Label ID="lblheader" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Employee Records"></asp:Label>
            <br />
            <br />
        </div>
            <br />
            <br />
            <asp:GridView ID="GridViewEmp" runat="server" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" BorderColor="#009933" BorderStyle="Groove" Font-Names="Times New Roman" HorizontalAlign="Center" Width="735px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Eid" HeaderText="Eid" SortExpression="Eid" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Barcode" HeaderText="Barcode" SortExpression="Barcode" />
                    <asp:BoundField DataField="Intime" HeaderText="Intime" SortExpression="Intime" />
                    <asp:BoundField DataField="Outtime" HeaderText="Outtime" SortExpression="Outtime" />
                    <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#999999" BorderColor="#0066FF" BorderStyle="Ridge" BorderWidth="3px" Font-Size="X-Large" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" Font-Names="Arial Black" HorizontalAlign="Center" VerticalAlign="Middle" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Employee] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Employee] ([Eid], [Name], [Email], [Intime], [Outtime], [Hours], [Barcode]) VALUES (@Eid, @Name, @Email, @Intime, @Outtime, @Hours, @Barcode)" SelectCommand="SELECT * FROM [Employee]" UpdateCommand="UPDATE [Employee] SET [Eid] = @Eid, [Name] = @Name, [Email] = @Email, [Intime] = @Intime, [Outtime] = @Outtime, [Hours] = @Hours, [Barcode] = @Barcode WHERE [Id] = @Id">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Eid" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter DbType="Time" Name="Intime" />
                    <asp:Parameter DbType="Time" Name="Outtime" />
                    <asp:Parameter Name="Hours" Type="Int32" />
                    <asp:Parameter Name="Barcode" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Eid" Type="String" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter DbType="Time" Name="Intime" />
                    <asp:Parameter DbType="Time" Name="Outtime" />
                    <asp:Parameter Name="Hours" Type="Int32" />
                    <asp:Parameter Name="Barcode" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <div style="text-align: center; font-size: large;">
            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add Employee" BorderColor="#006600" BorderStyle="Double" BorderWidth="5px" Font-Bold="True" Font-Size="Large" Height="46px" Width="197px" />
            <asp:Button ID="btnlogout" runat="server" OnClick="btnlogout_Click" Text="Logout" BorderColor="#006600" BorderStyle="Double" BorderWidth="5px" Font-Bold="True" Font-Size="Large" Height="46px" Width="197px" />
            </div>
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
        </div>
    </form>
</body>
</html>
