<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication5._Default" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container-fluid" style="background-color: #f8f9fa; margin-top: 100px;">

   <div class="row mt-3">
        <div class="col-md-2">
            <div class="card" style="background: linear-gradient(to right, #4e54c8, #8f94fb);">
                <div class="card-body">
                    <a href ="Student"> <h5 class="card-title" style="color: black; text-decoration: underline;"><i class="fas fa-user-graduate"></i>Student</h5></a>
                    <h6 class="card-subtitle mb-2 text-muted" style="color: black;">Total Students</h6>
                    
                    <p>15</p>
                </div>
             
            </div>

        </div>
                     
        <div class="col-md-2">
            <div class="card" style="background: linear-gradient(to right, #ff416c, #ff4b2b);">
                <div class="card-body">
                    <a href ="Instructor"> <h5 class="card-title" style="color: black; text-decoration: underline;"><i class="fas fa-chalkboard-teacher"></i>Instructor</h5></a>
                    <h6 class="card-subtitle mb-2 text-muted">Total Instructors</h6>
                    <p>15</p>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card" style="background: linear-gradient(to right, #ff416c, #ff4b2b);">
                <div class="card-body">
                    <a href ="Course"> <h5 class="card-title" style="color: black; text-decoration: underline;"><i class="fas fa-book"></i>Course</h5></a>
                    <h6 class="card-subtitle mb-2 text-muted">Total Courses</h6>
                    <p>15</p>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card" style="background: linear-gradient(to right, #8f94fb, #00d2ff);">
                <div class="card-body">
                    <a href ="Lesson"> <h5 class="card-title" style="color: black; text-decoration: underline;"><i class="fas fa-book-open"></i>Lessons</h5></a>
                    <h6 class="card-subtitle mb-2 text-muted">Total Lessons</h6>
                    <p>30</p>
                </div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card" style="background: linear-gradient(to right, #8f94fb, #00d2ff);">
                <div class="card-body">
                    <a href ="Lessonprogress"> <h5 class="card-title" style="color: black; text-decoration: underline;"><i class="fas fa-tasks"></i> Lesson Progress</h5></a>
                    <h6 class="card-subtitle mb-2 text-muted">Total Progress</h6>
                </div>
            </div>
        </div>
    </div>
    <br /> <br />
    <div class="row mt-3">
        <div class="col-md-4">
            <div class="card" style="background: linear-gradient(to right, #4e54c8, #8f94fb);">
                <div class="card-body">
                    <a href ="StudentEnrollement"> <h5 class="card-title" style="color: black; text-decoration: underline;"><i class="fas fa-user"></i>Student Enrollement</h5></a>
                    <h6 class="card-subtitle mb-2 text-muted">Total Enrollment</h6>
                    <p>30</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" style="background: linear-gradient(to right, #ff416c, #ff4b2b);">
                <div class="card-body">
                     <a href ="CourseInstructor"> <h5 class="card-title" style="color: black; text-decoration: underline;"><i class="fas fa-user"></i>Course Instructor</h5></a>
                    <h6 class="card-subtitle mb-2 text-muted">Total Enrollment</h6>
                    <p>30</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card" style="background: linear-gradient(to right, #8f94fb, #00d2ff);">
                <div class="card-body">
                     <a href ="Top3Enrollement"> <h5 class="card-title" style="color: black; text-decoration: underline;"><i class="fas fa-trophy"></i>Top 3 Enrollements</h5></a>
                    <h6 class="card-subtitle mb-2 text-muted">Most Enrolled Courses</h6>
                    <ol>
                        <li>Java</li>
                        <li>Advanced DataBase</li>
                        <li>Smart Data Discovery</li>
                    </ol>
                </div>
            </div>

            <br />
            <br />
            <br />

        </div>
</div>
    <br /><br />
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="25pt" Text="Data Visulations"  style="text-align: center;"></asp:Label>
        <br />
    <br />
    <br />
    <br />
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" Text="Total Student  Enrolled in a Course"></asp:Label>
        <br /><br />

            <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource2">
                <series>
                    <asp:Series Name="Series1" XValueMember="COURSE_ID" YValueMembers="TOTALSTUDENTSENROLLED">
                    </asp:Series>
                </series>
                <chartareas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </chartareas>
    </asp:Chart>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT ce.COURSE_ID, c.COURSE_TITLE, COUNT(ce.STUDENT_ID) AS TotalStudentsEnrolled
    FROM course_enrolled ce
    JOIN course c ON ce.COURSE_ID = c.COURSE_ID
    GROUP BY ce.COURSE_ID, c.COURSE_TITLE
    ORDER BY TotalStudentsEnrolled DESC"></asp:SqlDataSource>
        
   
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" Text="Total Lessons in a Course"></asp:Label>
    <br />
        
   
    <asp:Chart ID="Chart5" runat="server" DataSourceID="SqlDataSource3">
        <series>
            <asp:Series ChartType="Doughnut" Name="Series1" XValueMember="COURSE_TITLE" YValueMembers="TOTALLESSONS">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT c.COURSE_TITLE, COUNT(l.LESSON_ID) AS TotalLessons
FROM course c
JOIN lesson l ON c.COURSE_ID = l.COURSE_ID
GROUP BY c.COURSE_TITLE
ORDER BY TotalLessons DESC"></asp:SqlDataSource>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" Text="Total Feedbacks given by a Instructor"></asp:Label>
    <br />

    <asp:Chart ID="Chart6" runat="server" DataSourceID="SqlDataSource4" OnLoad="Chart6_Load">
        <series>
            <asp:Series ChartType="Bar" Name="Series1" XValueMember="INSTRUCTOR_NAME" YValueMembers="TOTALFEEDBACKS">
            </asp:Series>
        </series>
        <chartareas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </chartareas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT i.INSTRUCTOR_NAME, COUNT(f.FEEDBACK_ID) AS TotalFeedbacks
FROM instructor i
LEFT JOIN feedbacks f ON i.COURSE_INSTRUCTOR_ID = f.INSTRUCTOR_ID
GROUP BY i.INSTRUCTOR_NAME
ORDER BY TotalFeedbacks DESC"></asp:SqlDataSource>
    <br />
        
</main>
        


</asp:Content>
