<%@ page import="java.util.List" %>
<%@ page import="com.example.social.model.Post" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    @SuppressWarnings("unchecked")
    List<Post> posts = (List<Post>) request.getAttribute("posts");

    // If user came directly to /context/ and not through /feed,
    // redirect to /feed so servlet can load posts.
    if (posts == null) {
        response.sendRedirect(request.getContextPath() + "/feed");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mini Social Media (JSP)</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f5f7;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background: #24292e;
            color: #fff;
            padding: 10px 20px;
            font-size: 18px;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
        }
        .card {
            background: #fff;
            border-radius: 6px;
            padding: 15px;
            margin-bottom: 15px;
            box-shadow: 0 2px 4px rgba(0,0,0,.05);
        }
        .card-header {
            font-weight: bold;
            margin-bottom: 5px;
        }
        .card-footer {
            margin-top: 10px;
            font-size: 12px;
            color: #555;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .post-form textarea {
            width: 100%;
            height: 80px;
            padding: 8px;
            box-sizing: border-box;
            resize: none;
        }
        .post-form input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 6px;
            box-sizing: border-box;
        }
        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-primary {
            background: #2d8cff;
            color: white;
        }
        .btn-like {
            background: #ff4757;
            color: white;
        }
    </style>
</head>
<body>
<div class="navbar">
    Mini Social Media (JSP)
</div>

<div class="container">

    <!-- Create Post Form -->
    <div class="card post-form">
        <h3>Create a Post</h3>
        <form action="<%= request.getContextPath() %>/feed" method="post">
            <input type="hidden" name="action" value="create"/>
            <input type="text" name="authorName" placeholder="Your name"/>
            <br/>
            <textarea name="content" placeholder="What's on your mind?"></textarea>
            <br/><br/>
            <button type="submit" class="btn btn-primary">Post</button>
        </form>
    </div>

    <!-- Posts Feed -->
    <%
        for (Post p : posts) {
    %>
    <div class="card">
        <div class="card-header">
            <%= p.getAuthorName() %>
        </div>
        <div class="card-body">
            <%= p.getContent() %>
        </div>
        <div class="card-footer">
            <span>
                <!-- Just show time as raw LocalDateTime.toString() -->
                <%= p.getCreatedAt() %>
            </span>
            <span>
                <form action="<%= request.getContextPath() %>/feed" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="like"/>
                    <input type="hidden" name="postId" value="<%= p.getId() %>"/>
                    <button type="submit" class="btn btn-like">
                        ❤️ Like (<%= p.getLikes() %>)
                    </button>
                </form>
            </span>
        </div>
    </div>
    <%
        }
    %>

</div>
</body>
</html>
