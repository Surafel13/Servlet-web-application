<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Registration | Portal</title>
        <link rel="stylesheet" href="css/style.css">
    </head>

    <body>
        <div class="container">
            <h1>Student Portal</h1>

            <%-- Error Message Display --%>
                <% String error=(String) request.getAttribute("error"); if (error !=null) { %>
                    <div class="error-msg">
                        <%= error %>
                    </div>
                    <% } %>

                        <form action="register" method="POST">
                            <div class="form-group">
                                <label for="name">Full Name</label>
                                <input type="text" id="name" name="name" placeholder="Enter your full name" required
                                    autocomplete="name">
                            </div>

                            <div class="form-group">
                                <label for="email">Email Address</label>
                                <input type="email" id="email" name="email" placeholder="email@university.edu" required
                                    autocomplete="email">
                            </div>

                            <div class="form-group">
                                <label for="year">Academic Year</label>
                                <input type="number" id="year" name="year" placeholder="1" min="1" max="5" required>
                            </div>

                            <button type="submit">
                                <span>Register Student</span>
                                <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                    stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <line x1="5" y1="12" x2="19" y2="12"></line>
                                    <polyline points="12 5 19 12 12 19"></polyline>
                                </svg>
                            </button>
                        </form>

                        <a href="show_all" class="nav-link">View Database Records</a>
        </div>

        <script src="js/main.js"></script>
    </body>

    </html>