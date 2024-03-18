<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Top3Enrollement.aspx.cs" Inherits="WebApplication5.Top3Enrollement" MasterPageFile="~/Site.Master"%>


  <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <webopt:bundlereference runat="server" path="~/Content/css" />

    <form id="form1">
        <div>
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20pt" Text="Top 3 Enrollements" Font-Names="Arial"></asp:Label>
            <br />
            <br />
           <asp:Label ID="Label2" runat="server" Font-Size="17pt" Text="SELECT MONTH : - "></asp:Label>

            &nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="months" DataValueField="months" AutoPostBack="True">
            </asp:DropDownList>

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
           <asp:Label ID="Label3" runat="server" Font-Size="17pt" Text="SELECT YEAR : - "></asp:Label>

            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="YEARS" DataValueField="YEARS">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT TO_CHAR(enroll_date, 'YYYY') AS &quot;YEARS&quot;
FROM course_enrolled"></asp:SqlDataSource>

            <br /><br />

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="select UNIQUE(to_char(enroll_date, 'MONTH')) AS &quot;MONTHS&quot; from course_enrolled"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
                 <Columns>
     <asp:BoundField DataField="COURSE_ID" HeaderText="COURSE ID" ReadOnly="True" SortExpression="COURSE_ID" />
     <asp:BoundField DataField="COURSE_TITLE" HeaderText="COURSE TITLE" SortExpression="COURSE_TITLE" />
     <asp:BoundField DataField="TOTALSTUDENTSENROLLED" HeaderText="TotalStudentsEnrolled" SortExpression="TotalStudentsEnrolled" />
    
 </Columns>
            </asp:GridView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT *
FROM (
    SELECT ce.COURSE_ID, c.COURSE_TITLE, COUNT(ce.STUDENT_ID) AS TotalStudentsEnrolled
    FROM course_enrolled ce
    JOIN course c ON ce.COURSE_ID = c.COURSE_ID
    WHERE TO_CHAR(ce.enroll_date, 'MONTH') = :months
AND TO_CHAR(ce.enroll_date,'YYYY')=:years
    GROUP BY ce.COURSE_ID, c.COURSE_TITLE
    ORDER BY TotalStudentsEnrolled DESC
)
WHERE ROWNUM &lt;= 3">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="months" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="DropDownList2" Name="years" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
    </form>
    
     </asp:Content>

