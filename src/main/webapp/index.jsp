<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Social Media Page</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background: #f4f4f4;
        }
        .card {
            background: white;
            padding: 15px;
            margin: 20px auto;
            width: 60%;
            border-radius: 8px;
            box-shadow: 0 3px 6px rgba(0,0,0,0.15);
        }
        .header {
            font-size: 20px;
            font-weight: bold;
        }
        .content {
            margin-top: 10px;
            font-size: 16px;
        }
    </style>
</head>
<body>

<h2 style="text-align:center;">Welcome to Social Media</h2>

<div class="card">
    <div class="header">Sample Post</div>
    <div class="content">
        This is a static JSP post. You can replace this content anytime.
    </div>
</div>

<div class="card">
    <div class="header">Another Post</div>
    <div class="content">
        JSP is working without any Java classes or backend!
    </div>
</div>

</body>
</html>
