package com.bitmascot.sup.user

import com.bitmascot.sup.security.Role
import com.bitmascot.sup.security.User
import com.bitmascot.sup.security.UserRole
import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured
import groovy.json.JsonSlurper

import java.text.SimpleDateFormat

class UserController {

    def userService
    def springSecurityService
    def passwordEncoder

    @Secured("ROLE_USER")
    def profile() {
        User loggedUser = springSecurityService.currentUser
        def res = userService.profile(loggedUser.username)
        render res as JSON
    }

    def register() {
        // Extract body from request
        def jsonSlurper = new JsonSlurper()
        def format = new SimpleDateFormat("yyyy-mm-dd")
        def body = jsonSlurper.parseText(request.reader.text)

        // Check emails
        UserInfo tmpUser = UserInfo.findByEmail(body.email)
        if(tmpUser != null){
            render contentType: "text/json", text: '{"message":"Email already in use."}'
            return
        }

        def user = new UserInfo(firstName: body.firstName, lastName: body.lastName, address: body.address,
                phone: body.phone, email: body.email, birthDate: format.parse(body.birthDate))

        // Add User info to DB
        userService.createUser(user)

        // Create User Login Info
        def userRole = Role.findByAuthority('ROLE_USER')
        def testUser = new User(body.email, body.password).save()
        UserRole.create testUser, userRole
        UserRole.withSession {
            it.flush()
            it.clear()
        }
        // Response
        render contentType: "text/json", text: '{"message":"Registration Successful"}'
    }

    def isEmailExist() {
        def jsonSlurper = new JsonSlurper()
        def body = jsonSlurper.parseText(request.reader.text)

        def email = body.email

        def result = User.findByUsername(email)

        if (result == null){
            render contentType: "text/json", text: '{"message":"Email not in use."}'
        }else {
            render contentType: "text/json", text: '{"message":"Email in use."}'
        }
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN"])
    def changePassword() {
        def jsonSlurper = new JsonSlurper()
        def body = jsonSlurper.parseText(request.reader.text)

        User loggedUser = springSecurityService.currentUser

        if (!springSecurityService.passwordEncoder.matches(body.currentPass, loggedUser.getPassword())) {
            render contentType: "text/json", text: '{"message":"Incorrect current password."}'
        }else if(body.newPass == body.confirmPass) {
            User user = springSecurityService.currentUser
            user.password = body.newPass
            user.save(flush: true)

            render contentType: "text/json", text: '{"message":"Password Changed."}'
        }
    }

}
