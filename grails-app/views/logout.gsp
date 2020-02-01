
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="application/javascript">
    $(document).ready(function () {
        $.ajax({
            cache: true,
            type: "POST",
            url: "http://localhost:8000/logout",
            contentType: "application/json;charset=UTF-8",
            headers: {"Authorization": "Bearer " + localStorage.getItem('token')},
            dataType: "json",
            async: false,
            error: function (request) {
                localStorage.removeItem("token")
                localStorage.removeItem("user-info")
                window.location.href = "http://localhost:8000/"
            },
            success: function (data) {
                localStorage.removeItem("token")
                localStorage.removeItem("user-info")
                window.location.href = "http://localhost:8000/"
            }
        })
    });
</script>
</body>
</html>