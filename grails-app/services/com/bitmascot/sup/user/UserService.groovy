package com.bitmascot.sup.user

import grails.gorm.transactions.Transactional
import grails.rest.RestfulController

@Transactional
class UserService extends RestfulController {

    UserService() {
        super(UserInfo)
    }

    def getAllUser() {
        return UserInfo.list()
    }

    UserInfo profile(String email) {
        return UserInfo.where { email == email}?.find()
    }

    def createUser(UserInfo userInfo){
        userInfo.save()
    }
}
