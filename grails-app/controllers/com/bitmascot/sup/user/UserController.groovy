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

    @Secured("ROLE_USER")
    def profile() {
        def res = userService.profile("jitu@bm.com")
        render res as JSON
    }

    def register() {
        // Extract body from request
        def jsonSlurper = new JsonSlurper()
        def format = new SimpleDateFormat("yyyy-mm-dd")
        def body = jsonSlurper.parseText(request.reader.text)
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
            render contentType: "text/json", text: '{"message":"Email not Exist"}'
        }else {
            render contentType: "text/json", text: '{"message":"Email Exist"}'
        }
    }

}
