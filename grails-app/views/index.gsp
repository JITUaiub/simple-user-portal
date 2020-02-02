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
    .button {
        display: inline-block;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        outline: none;
        color: black;
        border: 1.5px solid black;
        box-shadow: 2.5px 2.5px black;
    }

    .button:active {
        box-shadow: 0 5px #666;
        transform: translateY(4px);
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
                    <button id="btnLogin" class="button mr-5">Login</button>
                    <button type="reset" class="button">Clear</button>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-growl/1.0.0/jquery.bootstrap-growl.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-growl/1.0.0/jquery.bootstrap-growl.min.js"></script>

<script type="application/javascript">
    function validateEmail(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }
    $("#btnLogin").click(function () {
        var username=$("#email").val();
        var password=$("#password").val();
        var notificationObject = {
            ele: 'body', // which element to append to
            type: 'danger', // (null, 'info', 'danger', 'success')
            offset: {from: 'top', amount: 20}, // 'top', or 'bottom'
            align: 'right', // ('left', 'right', or 'center')
            width: 'auto', // (integer, or 'auto')
            delay: 1000, // Time while the message will be displayed. It's not equivalent to the *demo* timeOut!
            allow_dismiss: true, // If true then will display a cross to close the popup.
            stackup_spacing: 10 // spacing between consecutively stacked growls.
        };

        if (username == ""){
            $.bootstrapGrowl("Please enter an email.", notificationObject);
            return
        }
        if(!validateEmail(username)){
            $.bootstrapGrowl("Please enter an valid email.", notificationObject);
            return
        }
        if (password == ""){
            $.bootstrapGrowl("Please enter an password.", notificationObject);
            return
        }


        $.ajax({
            cache: true,
            type: "POST",
            url: "http://localhost:8000/api/login",
            contentType: "application/json;charset=UTF-8",
            data:JSON.stringify({"username":username ,"password" : password}),
            dataType: "json",
            async: false,
            error: function (request) {
                $.bootstrapGrowl("Email or Password is incorrect. Try again.", notificationObject);
                return
            },
            success: function (data) {
                //Save Token
                localStorage.setItem("token", data.access_token);
                localStorage.setItem("user-role", data.roles[0]);
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
