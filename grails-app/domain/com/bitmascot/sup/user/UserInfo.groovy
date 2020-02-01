package com.bitmascot.sup.user

class UserInfo {

    String firstName
    String lastName
    String address
    String phone
    String email
    Date birthDate = new Date()

    static constraints = {
        email(unique: true, blank: false)
        firstName(blank: false)
        lastName(blank: false)
        address(blank: false)
        phone(blank: false)
        birthDate(blank: false)
    }
}
