<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="WebApplication5.Student" MasterPageFile="~/Site.Master"  %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
               <style>
            .add-student-form {
    text-align: center;
    background-color: black;
    padding: 20px;
}

.form-heading {
    color: white;
}

.form-container {
    border: 1px solid #ced4da;
    border-radius: 5px;
    padding: 20px;
    display: inline-block;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    font-weight: bold;
    color: black; 
}

.form-control {
    width: 100%;
    padding: 6px 12px;
    border: 1px solid #ced4da;
    border-radius: 4px;
    box-sizing: border-box;
}

.btn {
    display: inline-block;
    padding: 6px 12px;
    margin-bottom: 0;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    cursor: pointer;
    border: 1px solid transparent;
    border-radius: 4px;
}

.btn-primary {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
}

.btn-secondary {
    color: #fff;
    background-color: #6c757d;
    border-color: #6c757d;
}


        </style>
    <form id="form1">
        
        <asp:Label ID="Label1" runat="server" EnableTheming="False" Font-Bold="True" Font-Overline="False" Font-Size="20pt" Text="Student" Font-Names="Arial"></asp:Label>
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
     <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT ID" ReadOnly="True" SortExpression="STUDENT_ID" >
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="STUDENT_NAME" HeaderText="STUDENT NAME" SortExpression="STUDENT_NAME" >
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" >
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" >
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL ADDRESS" SortExpression="EMAIL_ADDRESS" >
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:BoundField DataField="COUNTRY" HeaderText="COUNTRY" SortExpression="COUNTRY" >
     <ItemStyle HorizontalAlign="Center" />
     </asp:BoundField>
     <asp:CommandField  ShowEditButton="True"  HeaderText ="EDIT">

     <ControlStyle BackColor="#33CC33" BorderColor="White" BorderStyle="Solid" BorderWidth="2px" Font-Names="Arial" ForeColor="Black" Width="80px" />
     <ItemStyle BackColor="White" BorderColor="Black" HorizontalAlign="Center" Wrap="False" Width="100px" />
     </asp:CommandField>
     <asp:CommandField ShowDeleteButton="True" HeaderText ="DELETE">
         <ControlStyle BackColor="Red" BorderColor="#003300" BorderStyle="None" Font-Names="Arial" ForeColor="Black" Width="80px" />
             <ItemStyle BackColor="White" BorderColor="Black" HorizontalAlign="Center" Wrap="False" Width="100px" />
         </asp:CommandField>

 </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;STUDENT&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID" InsertCommand="INSERT INTO &quot;STUDENT&quot; (&quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot;, &quot;CONTACT&quot;, &quot;DOB&quot;, &quot;EMAIL_ADDRESS&quot;, &quot;COUNTRY&quot;) VALUES (:STUDENT_ID, :STUDENT_NAME, :CONTACT, :DOB, :EMAIL_ADDRESS, :COUNTRY)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;STUDENT&quot;" UpdateCommand="UPDATE &quot;STUDENT&quot; SET &quot;STUDENT_NAME&quot; = :STUDENT_NAME, &quot;CONTACT&quot; = :CONTACT, &quot;DOB&quot; = :DOB, &quot;EMAIL_ADDRESS&quot; = :EMAIL_ADDRESS, &quot;COUNTRY&quot; = :COUNTRY WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID">
            <DeleteParameters>
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="STUDENT_ID" Type="String" />
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="COUNTRY" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="STUDENT_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="DOB" Type="DateTime" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="COUNTRY" Type="String" />
                <asp:Parameter Name="STUDENT_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                STUDENT_ID:
                <asp:Label ID="STUDENT_IDLabel1" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                <br />
                STUDENT_NAME:
                <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" Text='<%# Bind("STUDENT_NAME") %>' />
                <br />
                CONTACT:
                <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
                <br />
                DOB:
                <asp:TextBox ID="DOBTextBox" runat="server" Text='<%# Bind("DOB") %>' />
                <br />
                EMAIL_ADDRESS:
                <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' />
                <br />
                COUNTRY:
                <asp:TextBox ID="COUNTRYTextBox" runat="server" Text='<%# Bind("COUNTRY") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                        <br /> <br />

<div class="add-student-form">
    <h2 class="form-heading">Add Student</h2>
    </div>
    <div class="form-container">
        <div class="form-group">
            <label for="STUDENT_ID">STUDENT ID:</label>
            <asp:TextBox ID="STUDENT_IDTextBox" runat="server" CssClass="form-control" Text='<%# Bind("STUDENT_ID") %>' />
            <asp:RequiredFieldValidator ID="STUDENT_IDRequiredValidator" runat="server" ControlToValidate="STUDENT_IDTextBox" ErrorMessage="* Please enter a value" />

        </div>
        <div class="form-group">
            <label for="STUDENT_NAME">STUDENT NAME:</label>
            <asp:TextBox ID="STUDENT_NAMETextBox" runat="server" CssClass="form-control" Text='<%# Bind("STUDENT_NAME") %>' />
             <asp:RequiredFieldValidator ID="STUDENT_NAMERequiredFieldValidator1" runat="server" ControlToValidate="STUDENT_NAMETextBox" ErrorMessage="* Please enter a value" />

        </div>
        <div class="form-group">
            <label for="CONTACT">CONTACT:</label>
            <asp:TextBox ID="CONTACTTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CONTACT") %>' />
            <asp:RequiredFieldValidator ID="CONTACTRequiredFieldValidator1" runat="server" ControlToValidate="CONTACTTextBox" ErrorMessage="* Please enter a value" />

        </div>
        <div class="form-group">
            <label for="DOB">DATE OF BIRTH:</label>
            <asp:TextBox ID="DOBTextBox" runat="server" CssClass="form-control" Text='<%# Bind("DOB") %>' />
            <asp:RequiredFieldValidator ID="DOBRequiredFieldValidator1" runat="server" ControlToValidate="DOBTextBox" ErrorMessage="* Please enter a value" />
        </div>
        <div class="form-group">
            <label for="EMAIL_ADDRESS">EMAIL ADDRESS:</label>
            <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" CssClass="form-control" Text='<%# Bind("EMAIL_ADDRESS") %>' />
            <asp:RequiredFieldValidator ID="EMAIL_ADDRESSRequiredFieldValidator1" runat="server" ControlToValidate="EMAIL_ADDRESSTextBox" ErrorMessage="* Please enter a value" />
        </div>
        <div class="form-group">
            <label for="COUNTRY">COUNTRY:</label>
            <asp:TextBox ID="COUNTRYTextBox" runat="server" CssClass="form-control" Text='<%# Bind("COUNTRY") %>' />
            <asp:RequiredFieldValidator ID="COUNTRYRequiredFieldValidator1" runat="server" ControlToValidate="COUNTRYTextBox" ErrorMessage="* Please enter a value" />
        </div>
        <div class="form-group">
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
            <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
        </div>
    </div>
    
    
</InsertItemTemplate>


            <ItemTemplate>
         <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert"  CssClass="btn btn-primary" />
            </ItemTemplate>
        </asp:FormView>
           
    </form>
         </asp:Content>


