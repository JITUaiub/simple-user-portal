package simple.user.portal

import com.bitmascot.sup.security.Role
import com.bitmascot.sup.security.User
import com.bitmascot.sup.security.UserRole
import com.bitmascot.sup.user.UserInfo

class BootStrap {

    def init = { servletContext ->
        def adminRole = new Role('ROLE_ADMIN').save()
        def adminUser = new User('admin@localhost.local', 'admin').save()
        UserRole.create adminUser, adminRole

        UserRole.withSession {
            it.flush()
            it.clear()
        }
    }
    def destroy = {
    }
}
