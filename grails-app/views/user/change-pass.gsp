<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Change Password</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="application/javascript">
        var accessToken = localStorage.getItem("token")
        if(accessToken == null) window.location.href = "http://localhost:8000/"
    </script>
    <style>
    body {
        overflow-x: hidden;
    }

    #sidebar-wrapper {
        min-height: 100vh;
        margin-left: -15rem;
        -webkit-transition: margin .25s ease-out;
        -moz-transition: margin .25s ease-out;
        -o-transition: margin .25s ease-out;
        transition: margin .25s ease-out;
    }

    #sidebar-wrapper .sidebar-heading {
        padding: 0.875rem 1.25rem;
        font-size: 1.2rem;
    }

    #sidebar-wrapper .list-group {
        width: 15rem;
    }

    #page-content-wrapper {
        min-width: 100vw;
    }

    #wrapper.toggled #sidebar-wrapper {
        margin-left: 0;
    }

    @media (min-width: 768px) {
        #sidebar-wrapper {
            margin-left: 0;
        }

        #page-content-wrapper {
            min-width: 0;
            width: 100%;
        }

        #wrapper.toggled #sidebar-wrapper {
            margin-left: -15rem;
        }
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

    input[type="password"] {
        border: 2px solid black;
    }

    .footer {
        position: fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        background-color: rgba(128, 128, 128, 0.8);
        color: rgba(128, 128, 128, 0);
        text-align: center;
        border: 2px solid black;
    }
    </style>

</head>

<body>

<div class="d-flex" id="wrapper">

    <div id="sidebar-wrapper">
        <div align="right" style="background-color: rgba(128, 128, 128, 0.8); border-top: 2px solid black; border-bottom: 2px solid black;"><h1><i><b>Navigation</b></i></h1> </div>
        <div class="list-group list-group-flush" align="center">
            <a href="http://localhost:8000/profile" class="list-group-item list-group-item-action">Profile Page</a>
            <a href="http://localhost:8000/change-password" class="list-group-item list-group-item-action" style="border: 2px solid black;">Change Password</a>
        </div>
    </div>

    <div id="page-content-wrapper">

        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: rgba(128, 128, 128, 0.8); border-top: 2px solid black; border-bottom: 2px solid black;">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <b style="color: black;"><a href="http://localhost:8000/profile" style="color: black; text-decoration: none;" id="user-name">User Name</a></b>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="http://localhost:8000/change-password">Change password</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="http://localhost:8000/user/logout">Log Out</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <div align="center" style="border-left: 2px solid black; height: 90%;">
            <h1 class="p-4" style="border-bottom: 1.5px solid black;">Change Password</h1>
            <div class="row justify-content-center p-5">
                <div class="col-sm-6" style="text-align: left;">
                    <div class="form-group row">
                        <label for="colFormLabelSm" class="font-weight-bold col-sm-4 col-form-label col-form-label-sm">Previous Password</label>
                        <div class="input-group col-sm-7">
                            <span class="input-group-addon" style="border: none; background-color: white;">:</span>
                            &emsp;<input id="currentPass" type="password" class="form-control form-control-sm">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="colFormLabelSm" class="font-weight-bold col-sm-4 col-form-label col-form-label-sm">New Password</label>
                        <div class="input-group col-sm-7">
                            <span class="input-group-addon" style="border: none; background-color: white;">:</span>
                            &emsp;<input id="newPass" type="password" class="form-control form-control-sm">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="colFormLabelSm" class="font-weight-bold col-sm-4 col-form-label col-form-label-sm">Confirm Password</label>
                        <div class="input-group col-sm-7">
                            <span class="input-group-addon" style="border: none; background-color: white;">:</span>
                            &emsp;<input id="confirmPass" type="password" class="form-control form-control-sm">
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-11" align="right">
                            <button id="btnChangePassword" class="button" style="background-color: white;">Change Password</button>&emsp;<button id="btnReset" class="button" style="background-color: white;">Clear</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <p>Footer</p>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="application/javascript">
    $(document).ready(function () {
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
                updateUser(data)
            }
        })
    });
    function updateUser(data){
        document.getElementById("user-name").innerHTML = localStorage.getItem("user-name")
    }
    $("#btnChangePassword").click(function () {
        var currentPass=$("#currentPass").val();
        var newPass=$("#newPass").val();
        var confirmPass=$("#confirmPass").val();

        $.ajax({
            cache: true,
            type: "POST",
            url: "http://localhost:8000/api/user/change-password",
            headers: {"Authorization": "Bearer " + localStorage.getItem('token')},
            contentType: "application/json;charset=UTF-8",
            data:JSON.stringify({"currentPass":currentPass ,"newPass" : newPass, "confirmPass" : confirmPass}),
            dataType: "json",
            async: false,
            error: function (request) {
                console.log("Login Failed");
            },
            success: function (data) {
                console.log(data.message)
                //window.location.href = "http://localhost:8000/profile"
            }
        })

        function updateUser(data){
            document.getElementById("user-name").innerHTML = localStorage.getItem("user-name")
        }
    });
    $("#btnReset").click(function () {
        clearFields();
    });
    function clearFields() {
        document.getElementById("currentPass").value = ""
        document.getElementById("newPass").value = ""
        document.getElementById("confirmPass").value = ""
    }
</script>

</body>

</html>
