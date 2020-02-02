<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style type="text/css">
    html,
    body {
        height: 100%;
    }
    </style>
    <title>Login Page</title>
</head>

<body>
<div class="container h-100">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="text-center">
            <i class="fa fa-address-book" style="font-size:40px"></i>
            <h3>Login Panel</h3>
            <div class="p-4 border border-dark">
                <h5>Email Address</h5>
                <input type="email" class="form-control border-dark" id="email">
                <h5 class="mt-3">Password</h5>
                <input type="password" class="form-control border-dark" id="password">
                <div class="p-4">
                    <button id="btnLogin" class="mr-4 pl-4 pr-4 btn btn-light border-dark shadow">Login</button>
                    <button type="reset" class="ml-4 pl-4 pr-4 btn btn-light border-dark shadow">Clear</button>
                </div>
                <h6 class="">Are you new here? <a href="http://localhost:8000/registration">Register Now</a></h6>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script type="application/javascript">
    $("#btnLogin").click(function () {
        var username=$("#email").val();
        var password=$("#password").val();

        $.ajax({
            cache: true,
            type: "POST",
            url: "http://localhost:8000/api/login",
            contentType: "application/json;charset=UTF-8",
            data:JSON.stringify({"username":username ,"password" : password}),
            dataType: "json",
            async: false,
            error: function (request) {
                console.log("Login Failed");
            },
            success: function (data) {
                //Save Token
                localStorage.setItem("token", data.access_token);
                redirect(data.roles[0]);
            }
        })
        $.ajax({
            cache: true,
            type: "GET",
            url: "http://localhost:8000/api/user/profile",
            contentType: "application/json;charset=UTF-8",
            headers: {"Authorization": "Bearer " + localStorage.getItem('token')},
            dataType: "json",
            async: false,
            error: function (request) {
                console.log("Connection error.");
            },
            success: function (data) {
                localStorage.setItem("user-name", data.firstName)
            }
        })
    });
    function redirect(role) {
        if(role == "ROLE_USER"){
            window.location.href = "http://localhost:8000/profile"
        }else if(role == "ROLE_ADMIN"){
            window.location.href = "http://localhost:8000/admin"
        }else {
            window.location.href = "http://localhost:8000/"
        }
    }
</script>

</body>

</html>
