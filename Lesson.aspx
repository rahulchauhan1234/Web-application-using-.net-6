<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lesson.aspx.cs" Inherits="WebApplication5.Lesson" MasterPageFile="~/Site.Master"%>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                <style>
                   .add-lesson-form {
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
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" Text="Lesson Details" Font-Names="Arial"></asp:Label>
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="LESSON_ID" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="LESSON_ID" HeaderText="LESSON_ID" ReadOnly="True" SortExpression="LESSON_ID" >
                </asp:BoundField>
                <asp:BoundField DataField="LESSON_NO" HeaderText="LESSON_NO" SortExpression="LESSON_NO" >
                </asp:BoundField>
                <asp:BoundField DataField="LESSON_TITLE" HeaderText="LESSON_TITLE" SortExpression="LESSON_TITLE" >
                </asp:BoundField>
                <asp:BoundField DataField="CONTENT_TYPE" HeaderText="CONTENT_TYPE" SortExpression="CONTENT_TYPE" >
                </asp:BoundField>
                <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" SortExpression="COURSE_ID" >
                </asp:BoundField>
                

                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <asp:DropDownList Enabled ="False" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                    </ItemTemplate>
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LESSON&quot; WHERE &quot;LESSON_ID&quot; = :LESSON_ID" InsertCommand="INSERT INTO &quot;LESSON&quot; (&quot;LESSON_ID&quot;, &quot;LESSON_NO&quot;, &quot;LESSON_TITLE&quot;, &quot;CONTENT_TYPE&quot;, &quot;COURSE_ID&quot;) VALUES (:LESSON_ID, :LESSON_NO, :LESSON_TITLE, :CONTENT_TYPE, :COURSE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LESSON&quot;" UpdateCommand="UPDATE &quot;LESSON&quot; SET &quot;LESSON_NO&quot; = :LESSON_NO, &quot;LESSON_TITLE&quot; = :LESSON_TITLE, &quot;CONTENT_TYPE&quot; = :CONTENT_TYPE, &quot;COURSE_ID&quot; = :COURSE_ID WHERE &quot;LESSON_ID&quot; = :LESSON_ID">
            <DeleteParameters>
                <asp:Parameter Name="LESSON_ID" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="LESSON_ID" Type="String" />
                <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                <asp:Parameter Name="LESSON_TITLE" Type="String" />
                <asp:Parameter Name="CONTENT_TYPE" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LESSON_NO" Type="Decimal" />
                <asp:Parameter Name="LESSON_TITLE" Type="String" />
                <asp:Parameter Name="CONTENT_TYPE" Type="String" />
                <asp:Parameter Name="COURSE_ID" Type="String" />
                <asp:Parameter Name="LESSON_ID" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="LESSON_ID" DataSourceID="SqlDataSource1">
            
            <EditItemTemplate>
                LESSON_ID:
                <asp:Label ID="LESSON_IDLabel1" runat="server" Text='<%# Eval("LESSON_ID") %>' />
                <br />
                LESSON_NO:
                <asp:TextBox ID="LESSON_NOTextBox" runat="server" Text='<%# Bind("LESSON_NO") %>' />
                <br />
                LESSON_TITLE:
                <asp:TextBox ID="LESSON_TITLETextBox" runat="server" Text='<%# Bind("LESSON_TITLE") %>' />
                <br />
                CONTENT_TYPE:
                <asp:TextBox ID="CONTENT_TYPETextBox" runat="server" Text='<%# Bind("CONTENT_TYPE") %>' />
                <br />
                COURSE_ID:
                <asp:TextBox ID="COURSE_IDTextBox" runat="server" Text='<%# Bind("COURSE_ID") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            
            <InsertItemTemplate>
                           <div class="add-lesson-form">
<h2 class="form-heading">Add Lesson</h2>
</div>
            <div class = "form-container">
            <div class="form-group">
                <label for="LESSON_ID">LESSON_ID:</label>
                <asp:TextBox ID="LESSON_IDTextBox" runat="server" CssClass="form-control" Text='<%# Bind("LESSON_ID") %>' />
                <asp:RequiredFieldValidator ID="LESSON_IDRequiredFieldValidator1" runat="server" ControlToValidate="LESSON_IDTextBox" ErrorMessage="* Please enter a value" />

            </div>
            <div class="form-group">
                <label for="LESSON_NO">LESSON_NO:</label>
                <asp:TextBox ID="LESSON_NOTextBox" runat="server" CssClass="form-control" Text='<%# Bind("LESSON_NO") %>' />
                <asp:RequiredFieldValidator ID="LESSON_NORequiredFieldValidator1" runat="server" ControlToValidate="LESSON_NOTextBox" ErrorMessage="* Please enter a value" />
            </div>
            <div class="form-group">
                <label for="LESSON_TITLE">LESSON_TITLE:</label>
                <asp:TextBox ID="LESSON_TITLETextBox" runat="server" CssClass="form-control" Text='<%# Bind("LESSON_TITLE") %>' />
                <asp:RequiredFieldValidator ID="LESSON_TITLERequiredFieldValidator1" runat="server" ControlToValidate="LESSON_TITLETextBox" ErrorMessage="* Please enter a value" />
            </div>
            <div class="form-group">
                <label for="CONTENT_TYPE">CONTENT_TYPE:</label>
                <asp:TextBox ID="CONTENT_TYPETextBox" runat="server" CssClass="form-control" Text='<%# Bind("CONTENT_TYPE") %>' />
                 <asp:RequiredFieldValidator ID="CONTENT_TYPERequiredFieldValidator1" runat="server" ControlToValidate="CONTENT_TYPETextBox" ErrorMessage="* Please enter a value" />
            </div>
               <div class="form-group">
                     <label for="COURSE_ID">COURSE_ID:</label>
                     <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("Course_id") %>'>
                     </asp:DropDownList>
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;"></asp:SqlDataSource>
                <br />
                 <div class="form-group">
     <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
     &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
 </div>
            </InsertItemTemplate>

            <ItemTemplate>
              <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Insert" CssClass="btn btn-primary" />

            </ItemTemplate>
        </asp:FormView>
    </form>
</asp:Content>