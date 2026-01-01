<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.util.List" %>
        <%@ page import="com.student.model.Student" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Student Records | Database</title>
                <link rel="stylesheet" href="css/style.css">
            </head>

            <body>
                <div class="container wide">
                    <h1>Registered Students</h1>

                    <%-- Database Error Display --%>
                        <% String error=(String) request.getAttribute("error"); if (error !=null) { %>
                            <div class="error-msg">
                                <%= error %>
                            </div>
                            <% } %>

                                <table>
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Full Name</th>
                                            <th>Email</th>
                                            <th>Academic Year</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% List<Student> students = (List<Student>) request.getAttribute("students");
                                                if (students != null && !students.isEmpty()) {
                                                for (Student s : students) {
                                                %>
                                                <tr>
                                                    <td style="color: var(--primary); font-weight: 600;">#<%= s.getId()
                                                            %>
                                                    </td>
                                                    <td style="color: white; font-weight: 500;">
                                                        <%= s.getName() %>
                                                    </td>
                                                    <td>
                                                        <%= s.getEmail() %>
                                                    </td>
                                                    <td>
                                                        <span
                                                            style="background: rgba(99, 102, 241, 0.1); padding: 0.25rem 0.75rem; border-radius: 2rem; border: 1px solid rgba(99, 102, 241, 0.2); font-size: 0.8rem;">
                                                            Year <%= s.getYear() %>
                                                        </span>
                                                    </td>
                                                </tr>
                                                <% } } else { %>
                                                    <tr>
                                                        <td colspan="4"
                                                            style="text-align: center; padding: 4rem; color: var(--text-dim);">
                                                            <div
                                                                style="font-size: 3rem; margin-bottom: 1rem; opacity: 0.5;">
                                                                📂</div>
                                                            No student records found in the database.
                                                        </td>
                                                    </tr>
                                                    <% } %>
                                    </tbody>
                                </table>

                                <a href="index.jsp" class="nav-link">← Back to Registration Portal</a>
                </div>

                <script src="js/main.js"></script>
            </body>

            </html>