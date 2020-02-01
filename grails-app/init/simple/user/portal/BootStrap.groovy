package simple.user.portal

import com.bitmascot.sup.security.Role
import com.bitmascot.sup.security.User
import com.bitmascot.sup.security.UserRole
import com.bitmascot.sup.user.UserInfo

class BootStrap {

    def init = { servletContext ->
        new UserInfo(firstName: "Md. Nashid Kamal", lastName: "Jitu", address: "Dhaka", phone: "12345", email: "jitu@bm.com", birthDate: new Date()).save(flush: true)

        def adminRole = new Role('ROLE_ADMIN').save()
        def userRole = new Role('ROLE_USER').save()

        def testUser = new User('user@localhost.local', 'user').save()
        def adminUser = new User('admin@localhost.local', 'admin').save()

        UserRole.create testUser, userRole
        UserRole.create adminUser, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }
    }
    def destroy = {
    }
}
