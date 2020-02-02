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
    <title>Registration Page</title>
</head>

<body>
<div class="container h-100">
    <div class="row h-100 justify-content-center align-items-center">
        <div class="text-center">
            <i class="fa fa-address-book" style="font-size:40px"></i>
            <h3>Registration Panel</h3>
            <div class="p-4 border border-dark text-left">
                <div class="row pb-2">
                    <div class="col-sm-4">First Name</div>
                    <div class="col-sm-8"><input type="text" class="input-sm border-dark" id="firstName"></div>
                </div>
                <div class="row pb-2">
                    <div class="col-sm-4">Last Name</div>
                    <div class="col-sm-8"><input type="text" class="input-sm border-dark" id="lastName"></div>
                </div>
                <div class="row pb-2">
                    <div class="col-sm-4">Address</div>
                    <div class="col-sm-8"><input type="text" class="input-sm border-dark" id="address"></div>
                </div>
                <div class="row pb-2">
                    <div class="col-sm-4">Phone</div>
                    <div class="col-sm-8"><input type="text" class="input-sm border-dark" id="phone"></div>
                </div>
                <div class="row pb-2">
                    <div class="col-sm-4">Email</div>
                    <div class="col-sm-8"><input type="email" class="input-sm border-dark" id="email"><div id="isEmailExistFlag"></div></div>
                </div>
                <div class="row">
                    <div class="col-sm-4">Birthdate</div>
                    <div class="col-sm-8">
                        <div class="input-group pb-2">
                            <input type="date" class="w-75 input-sm border-dark" id="birthDate" value="1990-10-12">
                            <div class="input-group-append">
                                <i class="pl-3 fa fa-calendar" style="font-size:26px"></i>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">Password</div>
                    <div class="col-sm-8"><input type="password" class="input-sm border-dark" id="password"></div>
                </div>

                <div class="p-4">
                    <button id="btnRegistration" type="submit" class="button ml-4">Register</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <button id="btnReset" type="reset" class="button mr-5">Cancel</button>
                </div>
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
    $("#email").on('keyup', function () {
        $.ajax({
            cache: false,
            type: "POST",
            url: "http://localhost:8000/isEmailExist",
            contentType: "application/json;charset=UTF-8",
            data:JSON.stringify({"email" : email}),
            dataType: "json",
            async: true,
            error: function (request) {
                console.log("Connection error.");
            },
            success: function (data) {
                $("#isEmailExistFlag").html(data.message)
                if($("#email").val() == ""){
                    $("#isEmailExistFlag").html("")
                }
            }
        })
    });
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

    $("#btnRegistration").click(function () {
        var firstName=$("#firstName").val();
        var lastName=$("#lastName").val();
        var address=$("#address").val();
        var phone=$("#phone").val();
        var email=$("#email").val();
        var birthDate=$("#birthDate").val();
        var password=$("#password").val();
        var notificationSuccess = {
            ele: 'body', // which element to append to
            type: 'success', // (null, 'info', 'danger', 'success')
            offset: {from: 'top', amount: 20}, // 'top', or 'bottom'
            align: 'right', // ('left', 'right', or 'center')
            width: 'auto', // (integer, or 'auto')
            delay: 1000, // Time while the message will be displayed. It's not equivalent to the *demo* timeOut!
            allow_dismiss: true, // If true then will display a cross to close the popup.
            stackup_spacing: 10 // spacing between consecutively stacked growls.
        };

        if(firstName == ""){
            $.bootstrapGrowl("Please enter first name.", notificationObject);
            return
        }
        if(lastName == ""){
            $.bootstrapGrowl("Please enter last name.", notificationObject);
            return
        }
        if(address == ""){
            $.bootstrapGrowl("Please enter address.", notificationObject);
            return
        }
        if(phone == ""){
            $.bootstrapGrowl("Please enter phone.", notificationObject);
            return
        }
        if(email == ""){
            $.bootstrapGrowl("Please enter email.", notificationObject);
            return
        }
        if(password == ""){
            $.bootstrapGrowl("Please enter password.", notificationObject);
            return
        }

        $.ajax({
            cache: false,
            type: "POST",
            url: "http://localhost:8000/register",
            contentType: "application/json;charset=UTF-8",
            data:JSON.stringify({"firstName":firstName ,"lastName" : lastName, "address" : address, "phone":phone ,"email" : email, "password" : password, "birthDate":birthDate}),
            dataType: "json",
            async: false,
            success: function (data) {
                if(data.message == "Email already in use."){
                    $.bootstrapGrowl(data.message, notificationObject);
                    return
                }
                var msg = data.message + ". You can login now."
                $.bootstrapGrowl(msg, notificationSuccess);
                return
            }
        })

        function updateUser(data){
            document.getElementById("user-name").innerHTML = localStorage.getItem("user-name")
        }
    });
    $("#btnReset").click(function () {
        cancel();
    });
    function cancel() {
        window.location.href = "http://localhost:8000/"
    }
</script>

</body>

</html>
