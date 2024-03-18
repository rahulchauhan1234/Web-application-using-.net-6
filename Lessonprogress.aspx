<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lessonprogress.aspx.cs" Inherits="WebApplication5.Lessonprogress" MasterPageFile="~/Site.Master" %>
    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
                  <style>
            
.add-student-form {
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

    <form id="form1" >
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="20pt" Text="Lesson Progress"></asp:Label>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;LESSON_PROGRESS&quot; WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;LESSON_ID&quot; = :LESSON_ID AND &quot;COURSE_ID&quot; = :COURSE_ID" InsertCommand="INSERT INTO &quot;LESSON_PROGRESS&quot; (&quot;STUDENT_ID&quot;, &quot;LESSON_ID&quot;, &quot;LESSON_STATUS&quot;, &quot;LAST_ACCESSED_DATE&quot;, &quot;COURSE_ID&quot;) VALUES (:STUDENT_ID, :LESSON_ID, :LESSON_STATUS, :LAST_ACCESSED_DATE, :COURSE_ID)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;LESSON_PROGRESS&quot;" UpdateCommand="UPDATE &quot;LESSON_PROGRESS&quot; SET &quot;LESSON_STATUS&quot; = :LESSON_STATUS, &quot;LAST_ACCESSED_DATE&quot; = :LAST_ACCESSED_DATE WHERE &quot;STUDENT_ID&quot; = :STUDENT_ID AND &quot;LESSON_ID&quot; = :LESSON_ID AND &quot;COURSE_ID&quot; = :COURSE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                    <asp:Parameter Name="LESSON_ID" Type="String" />
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                    <asp:Parameter Name="LESSON_ID" Type="String" />
                    <asp:Parameter Name="LESSON_STATUS" Type="String" />
                    <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="LESSON_STATUS" Type="String" />
                    <asp:Parameter Name="LAST_ACCESSED_DATE" Type="DateTime" />
                    <asp:Parameter Name="STUDENT_ID" Type="String" />
                    <asp:Parameter Name="LESSON_ID" Type="String" />
                    <asp:Parameter Name="COURSE_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STUDENT_ID,LESSON_ID,COURSE_ID" DataSourceID="SqlDataSource1">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

                <Columns>
                    <asp:BoundField DataField="STUDENT_ID" HeaderText="STUDENT_ID" ReadOnly="True" SortExpression="STUDENT_ID">
</asp:BoundField>
<asp:BoundField DataField="LESSON_ID" HeaderText="LESSON_ID" ReadOnly="True" SortExpression="LESSON_ID">
</asp:BoundField>
<asp:BoundField DataField="LESSON_STATUS" HeaderText="LESSON_STATUS" SortExpression="LESSON_STATUS">
</asp:BoundField>
<asp:BoundField DataField="LAST_ACCESSED_DATE" HeaderText="LAST_ACCESSED_DATE" SortExpression="LAST_ACCESSED_DATE">
</asp:BoundField>
<asp:BoundField DataField="COURSE_ID" HeaderText="COURSE_ID" ReadOnly="True" SortExpression="COURSE_ID" />
                    <asp:TemplateField HeaderText="STUDENT NAME">
                        <ItemTemplate>
                            <asp:DropDownList Enabled="False" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_NAME&quot;, &quot;STUDENT_ID&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LESSON TITLE">
                        <ItemTemplate>
                            <asp:DropDownList  Enabled="False" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="LESSON_TITLE" DataValueField="LESSON_ID" SelectedValue='<%# Bind("LESSON_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_ID&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="COURSE NAME">
                        <ItemTemplate>
                            <asp:DropDownList  Enabled="False" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;"></asp:SqlDataSource>
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
            <br />
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="STUDENT_ID,LESSON_ID,COURSE_ID" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    STUDENT_ID:
                    <asp:Label ID="STUDENT_IDLabel1" runat="server" Text='<%# Eval("STUDENT_ID") %>' />
                    <br />
                    LESSON_ID:
                    <asp:Label ID="LESSON_IDLabel1" runat="server" Text='<%# Eval("LESSON_ID") %>' />
                    <br />
                    LESSON_STATUS:
                    <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' />
                    <br />
                    LAST_ACCESSED_DATE:
                    <asp:TextBox ID="LAST_ACCESSED_DATETextBox" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' />
                    <br />
                    COURSE_ID:
                    <asp:Label ID="COURSE_IDLabel1" runat="server" Text='<%# Eval("COURSE_ID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                     
 <div class="add-student-form">
     <h2 class="form-heading">Add Lesson Progress</h2>
     </div>
    <div class="form-container">
     <div class="form-group">
                     <label for="STUDENT_ID">STUDENT_ID:</label>
         <asp:DropDownList ID="DropDownList4" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="STUDENT_NAME" DataValueField="STUDENT_ID" SelectedValue='<%# Bind("STUDENT_ID") %>'>
         </asp:DropDownList> 
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;STUDENT_ID&quot;, &quot;STUDENT_NAME&quot; FROM &quot;STUDENT&quot;"></asp:SqlDataSource>
</div>
         <div class="form-group">
            <label for="LESSON_ID">LESSON_ID:</label>
         <asp:DropDownList ID="DropDownList5" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="LESSON_TITLE" DataValueField="LESSON_ID" SelectedValue='<%# Bind("LESSON_ID") %>'>
         </asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT &quot;LESSON_ID&quot;, &quot;LESSON_TITLE&quot; FROM &quot;LESSON&quot;"></asp:SqlDataSource>
        </div>
        <div class="form-group">
            <label for="LESSON_STATUS">LESSON_STATUS:</label>
         <asp:TextBox ID="LESSON_STATUSTextBox" runat="server" Text='<%# Bind("LESSON_STATUS") %>' />
        <asp:RequiredFieldValidator ID="LESSON_STATUSRequiredValidator" runat="server" ControlToValidate="LESSON_STATUSTextBox" ErrorMessage="* Please enter a value" />
 
        </div>
         <div class="form-group">
            <label for="LAST_ACCESSED_DATE">LAST_ACCESSED_DATE:<br />
             <asp:TextBox ID="LAST_ACCESSED_DATETextBox" runat="server" Text='<%# Bind("LAST_ACCESSED_DATE") %>' />
             <asp:RequiredFieldValidator ID="LAST_ACCESSED_DATERequiredFieldValidator1" runat="server" ControlToValidate="LAST_ACCESSED_DATETextBox" ErrorMessage="* Please enter a value" Font-Bold="False" />
             </label>
             &nbsp;</div>
         <div class="form-group">
            <label for="COURSE_ID">COURSE_ID:</label>
         <asp:DropDownList ID="DropDownList6" runat="server" CssClass="form-control" DataSourceID ="SqlDataSource4" DataTextField="COURSE_TITLE" DataValueField="COURSE_ID" SelectedValue='<%# Bind("COURSE_ID") %>'>
         </asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;COURSE&quot;"></asp:SqlDataSource>
         </div>
        <div class="form-group">
    <asp:LinkButton ID="InsertButton" runat="server"  CausesValidation="True" CommandName="Insert" Text="Insert" CssClass="btn btn-primary" />
    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-secondary" />
</div>
 </div>
                </InsertItemTemplate>
                <ItemTemplate>
                   <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="INSERT" CssClass="btn btn-primary" />

                </ItemTemplate>
            </asp:FormView>
            <br />
            <br />
        </div>
    </form>
</asp:content>
