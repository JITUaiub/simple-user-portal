package simple.user.portal

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
//
//        "/"(view:"/index")
//        "500"(view:'/error')
//        "404"(view:'/notFound')

        // API
        "/api/user/profile"(controller: "user", action: "profile")
        "/api/admin/getAllUser"(controller: "admin", action: "getAllUser")
        "/registration"(controller: "user", action: "register")
        "/isEmailExist"(controller: "user", action: "isEmailExist")
        "/api/user/change-password"(controller: "user", action: "changePassword")

        //Front - end
        "/"(view: "/index")
        "/registration"(view: "/registration")
        "/change-password"(view: "/user/change-pass")
        "/profile"(view: "/user/profile")
        "/user/logout"(view: "/logout")
    }
}
