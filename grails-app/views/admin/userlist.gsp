<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>User List</title>

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
            <a href="http://localhost:8000/admin" class="list-group-item list-group-item-action" style="border: 2px solid black;">User List</a>
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
                            <b style="color: black;">SUPER ADMIN</b>
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
%{--            <nav class="navbar navbar-expand-lg navbar-dark teal lighten-2 mb-4">--}%
%{--                <label class="font-weight-bold navbar-brand" style="color: black; font-size: 25px;">User List</label>--}%
%{--                <div class="collapse navbar-collapse" style="border-bottom: black">--}%
%{--                    <form class="form-inline ml-auto">--}%
%{--                        <div class="md-form my-0">--}%
%{--                            <input id="searchBox" class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">--}%
%{--                        </div>--}%
%{--                    </form>--}%
%{--                </div>--}%
%{--            </nav>--}%
            <div class="row mt-4">
                <div class="col-sm-12">
                    <div class="mb-0 pl-3" style="text-align: left;"><h3>User List</h3></div>
                    <table id="dtUserList" class="table table-striped table-bordered" cellspacing="0" width="100%" style="border-top: 1.5px solid black;">
                        <thead>
                        <tr>
                            <th class="th-sm">First Name
                            </th>
                            <th class="th-sm">Last Name
                            </th>
                            <th class="th-sm">Email
                            </th>
                            <th class="th-sm">Phone
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Tiger Nixon</td>
                            <td>System Architect</td>
                            <td>Edinburgh</td>
                            <td>61</td>
                        </tr>
                        <tr>
                            <td>Garrett Winters</td>
                            <td>Accountant</td>
                            <td>Tokyo</td>
                            <td>63</td>
                        </tr>
                        <tr>
                            <td>Ashton Cox</td>
                            <td>Junior Technical Author</td>
                            <td>San Francisco</td>
                            <td>66</td>
                        </tr>
                        <tr>
                            <td>Cedric Kelly</td>
                            <td>Senior Javascript Developer</td>
                            <td>Edinburgh</td>
                            <td>22</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="footer fixed-bottom">
    <p>Footer</p>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script type="application/javascript">
    function fillData(dataString) {
        var table = $('#dtUserList').DataTable({
            data : dataString,
            columns : [
                { "data" : "firstName" },
                { "data" : "lastName" },
                { "data" : "email" },
                { "data" : "phone" }
            ],
            paging : false,
            bInfo: false
        });
        $("#searchBox").on('keyup', function () {
            table.search(this.value).draw();
        });
    }
</script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="application/javascript">
    $(document).ready(function () {
        $(document).ready(function () {
            $.ajax({
                cache: true,
                type: "GET",
                url: "http://localhost:8000/api/admin/getAllUser",
                contentType: "application/json;charset=UTF-8",
                headers: {"Authorization": "Bearer " + localStorage.getItem('token')},
                dataType: "json",
                async: false,
                error: function (request) {
                    console.log("Connection error.");
                },
                success: function (data) {
                    //fillData(JSON.stringify(data))
                    fillData(data)
                }
            })
        });
    });

</script>

</body>

</html>
