<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="WebApplication5.Instructor" MasterPageFile="~/Site.Master"%>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <style>
                        .add-instructor-form {
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
    <form id="form1" >
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" HorizontalAlign="Center" Font-Names="Arial" Text="Instructor"></asp:Label>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;INSTRUCTOR&quot; WHERE &quot;COURSE_INSTRUCTOR_ID&quot; = :COURSE_INSTRUCTOR_ID" InsertCommand="INSERT INTO &quot;INSTRUCTOR&quot; (&quot;COURSE_INSTRUCTOR_ID&quot;, &quot;INSTRUCTOR_NAME&quot;, &quot;CONTACT&quot;, &quot;EMAIL_ADDRESS&quot;, &quot;COURSE_ID&quot;) VALUES (:COURSE_INSTRUCTOR_ID, :INSTRUCTOR_NAME, :CONTACT, :EMAIL_ADDRESS, :COURSE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;INSTRUCTOR&quot;" UpdateCommand="UPDATE &quot;INSTRUCTOR&quot; SET &quot;INSTRUCTOR_NAME&quot; = :INSTRUCTOR_NAME, &quot;CONTACT&quot; = :CONTACT, &quot;EMAIL_ADDRESS&quot; = :EMAIL_ADDRESS, &quot;COURSE_ID&quot; = :COURSE_ID WHERE &quot;COURSE_INSTRUCTOR_ID&quot; = :COURSE_INSTRUCTOR_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_INSTRUCTOR_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_INSTRUCTOR_ID" Type="String" />
                <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="INSTRUCTOR_NAME" Type="String" />
                <asp:Parameter Name="CONTACT" Type="String" />
                <asp:Parameter Name="EMAIL_ADDRESS" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="COURSE_INSTRUCTOR_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
      
        <asp:GridView ID="GridView1" runat="server"  AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="COURSE_INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
<Columns>
    <asp:BoundField DataField="COURSE_INSTRUCTOR_ID" HeaderText="COURSE INSTRUCTOR ID" ReadOnly="True" SortExpression="COURSE_INSTRUCTOR_ID" >
    <ControlStyle Width="50px" />
    <ItemStyle HorizontalAlign="Center" Font-Names="Arial" />
    </asp:BoundField>
    <asp:BoundField DataField="INSTRUCTOR_NAME" HeaderText="INSTRUCTOR NAME" SortExpression="INSTRUCTOR_NAME" >
    <ControlStyle BackColor="Aqua" BorderColor="Aqua" BorderStyle="Solid" />
    <ItemStyle HorizontalAlign="Center" Font-Names="Arial" />
    </asp:BoundField>
    <asp:BoundField DataField="CONTACT" HeaderText="CONTACT" SortExpression="CONTACT" >
    <ItemStyle HorizontalAlign="Center" Font-Names="Arial" />
    </asp:BoundField>
    <asp:BoundField DataField="EMAIL_ADDRESS" HeaderText="EMAIL ADDRESS" SortExpression="EMAIL_ADDRESS" >
    <ItemStyle HorizontalAlign="Center" Font-Names="Arial" />
    </asp:BoundField>
    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE ID" SortExpression="COURSE_ID" >
    <ItemStyle HorizontalAlign="Center" Font-Names="Arial" />
    </asp:BoundField>
    

    <asp:TemplateField HeaderText="COURSE TITLE">
            <ItemTemplate>
                <asp:DropDownList Enabled ="False" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                </ItemTemplate>
    <ControlStyle Height="30px" />
</asp:TemplateField>
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
        <br />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_INSTRUCTOR_ID" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                COURSE_INSTRUCTOR_ID:
                <asp:Label ID="COURSE_INSTRUCTOR_IDLabel1" runat="server" Text='<%# Eval("COURSE_INSTRUCTOR_ID") %>' />
                <br />
                INSTRUCTOR_NAME:
                <asp:TextBox ID="INSTRUCTOR_NAMETextBox" runat="server" Text='<%# Bind("INSTRUCTOR_NAME") %>' />
                <br />
                CONTACT:
                <asp:TextBox ID="CONTACTTextBox" runat="server" Text='<%# Bind("CONTACT") %>' />
                <br />
                EMAIL_ADDRESS:
                <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" Text='<%# Bind("EMAIL_ADDRESS") %>' />
                <br />
                COURSE_ID:
                <asp:TextBox ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                                                            <div class="add-instructor-form">
<h2 class="form-heading">Add Instructor</h2>
</div>
               <div class ="form-container">
<div class="form-group">
    <label for="COURSE_INSTRUCTOR_ID">COURSE_INSTRUCTOR_ID:</label>
    <asp:TextBox ID="COURSE_INSTRUCTOR_IDTextBox" runat="server" CssClass="form-control" Text='<%# Bind("COURSE_INSTRUCTOR_ID") %>' />
    <asp:RequiredFieldValidator ID="COURSE_INSTRUCTOR_IDRequiredFieldValidator1" runat="server" ControlToValidate="COURSE_INSTRUCTOR_IDTextBox" ErrorMessage="* Please enter a value" />

</div>
<div class="form-group">
    <label for="INSTRUCTOR_NAME">INSTRUCTOR_NAME:</label>
    <asp:TextBox ID="INSTRUCTOR_NAMETextBox" runat="server" CssClass="form-control" Text='<%# Bind("INSTRUCTOR_NAME") %>' />
    <asp:RequiredFieldValidator ID="INSTRUCTOR_NAMERequiredFieldValidator1" runat="server" ControlToValidate="INSTRUCTOR_NAMETextBox" ErrorMessage="* Please enter a value" />
</div>
<div class="form-group">
    <label for="CONTACT">CONTACT:</label>
    <asp:TextBox ID="CONTACTTextBox" runat="server" CssClass="form-control" Text='<%# Bind("CONTACT") %>' />
    <asp:RequiredFieldValidator ID="CONTACTRequiredFieldValidator1" runat="server" ControlToValidate="CONTACTTextBox" ErrorMessage="* Please enter a value" />
</div>
<div class="form-group">
    <label for="EMAIL_ADDRESS">EMAIL_ADDRESS:</label>
    <asp:TextBox ID="EMAIL_ADDRESSTextBox" runat="server" CssClass="form-control" Text='<%# Bind("EMAIL_ADDRESS") %>' />
    <asp:RequiredFieldValidator ID="EMAIL_ADDRESSRequiredFieldValidator1" runat="server" ControlToValidate="EMAIL_ADDRESSTextBox" ErrorMessage="* Please enter a value" />
</div>
                <div class="form-group">
    <label for="COURSE_ID">COURSE_ID:</label>
                   <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;"></asp:SqlDataSource>
               </div>
                   <div class="form-group">
    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
</div>
                   </div>
            </InsertItemTemplate>

            <ItemTemplate>
             <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-primary" />

            </ItemTemplate>
        </asp:FormView>
    </form>
         </asp:Content>
