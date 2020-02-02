package com.bitmascot.sup.user

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

import java.text.SimpleDateFormat

class AdminController {

    def userService

    @Secured("ROLE_ADMIN")
    def getAllUser() {
        def res = userService.getAllUser().collect {[
                'firstName' : it.firstName,
                'lastName' : it.lastName,
                'address' : it.address,
                'phone' : it.phone,
                'email' : it.email,
                'birthDate' : it.birthDate
        ]}
        render res as JSON
    }
}
