<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="WebApplication5.Course" MasterPageFile="~/Site.Master"%>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        
          <style>
            
.add-course-form {
    text-align: center;
    background-color: black;
    padding: 20px;
    color: white;
}
    .form-group {
        margin-bottom: 15px;
        border: 1px solid #ced4da;
        padding: 10px;
        border-radius: 5px;
    }
    .form-container {
    border: 1px solid #ced4da;
    border-radius: 5px;
    padding: 20px;
    display: inline-block;
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
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" Text="Course" Font-Names="Arial"></asp:Label>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
    
    <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE ID" ReadOnly="True" SortExpression="COURSE_ID" >
    <ControlStyle BackColor="#FF99CC" BorderColor="#003300" BorderStyle="Solid" BorderWidth="2px" Font-Names="Arial" ForeColor="White" />
    <ItemStyle HorizontalAlign="Center" BackColor="White" BorderColor="Black" Wrap="False" />
    </asp:BoundField>
    <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE TITLE" SortExpression="COURSE_TITLE" >
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;COURSE&quot; WHERE &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;COURSE&quot; (&quot;COURSE_ID&quot;, &quot;COURSE_TITLE&quot;) VALUES (:COURSE_ID, :COURSE_TITLE)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;" UpdateCommand="UPDATE &quot;COURSE&quot; SET &quot;COURSE_TITLE&quot; = :COURSE_TITLE WHERE &quot;COURSE_ID&quot; = :COURSE_ID">
            <DeleteParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="COURSE_TITLE" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="COURSE_TITLE" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="COURSE_ID" DataSourceID="SqlDataSource1">
            
            <EditItemTemplate>
                COURSE_ID:
                <asp:Label ID="COURSE_IDLabel1" runat="server" Text='<%# Eval("COURSE_ID") %>' />
                <br />
                COURSE_TITLE:
                <asp:TextBox ID="COURSE_TITLETextBox" runat="server" Text='<%# Bind("COURSE_TITLE") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            
            <InsertItemTemplate>
                           <div class="add-course-form">
<h2 class="form-heading">Add Course</h2>
</div>
                    <div class="form-container">

            <div class="form-group">
                <label for="COURSE_ID">COURSE_ID:</label>
                <asp:TextBox ID="COURSE_IDTextBox" runat="server" CssClass="form-control" Text='<%# Bind("COURSE_ID") %>' />
                <asp:RequiredFieldValidator ID="COURSE_IDRequiredValidator" runat="server" ControlToValidate="COURSE_IDTextBox" ErrorMessage="* Please enter a value" />

            </div>
            <div class="form-group">
                <label for="COURSE_TITLE">COURSE_TITLE:</label>
                <asp:TextBox ID="COURSE_TITLETextBox" runat="server" CssClass="form-control" Text='<%# Bind("COURSE_TITLE") %>' />
                <asp:RequiredFieldValidator ID="COURSE_TITLERequiredFieldValidator1" runat="server" ControlToValidate="COURSE_TITLETextBox" ErrorMessage="* Please enter a value" />

            </div>
            <br />
            <div class="form-group">
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
            </div>
           </div>
            </InsertItemTemplate>

            <ItemTemplate>
               
              <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-primary"/>

            </ItemTemplate>
        </asp:FormView>
    </form>
</asp:content>
