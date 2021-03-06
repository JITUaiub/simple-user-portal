

// Added by the Spring Security Core plugin:
grails.plugin.springsecurity.userLookup.userDomainClassName = 'com.bitmascot.sup.security.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'com.bitmascot.sup.security.UserRole'
grails.plugin.springsecurity.authority.className = 'com.bitmascot.sup.security.Role'
grails.plugin.springsecurity.controllerAnnotations.staticRules = [
	[pattern: '/**',                  access: ['permitAll']],
	[pattern: '/error',               access: ['permitAll']],
	[pattern: '/index',               access: ['permitAll']],
	[pattern: '/index.gsp',           access: ['permitAll']],
	[pattern: '/shutdown',            access: ['permitAll']],
	[pattern: '/assets/**',           access: ['permitAll']],
	[pattern: '/**/js/**',            access: ['permitAll']],
	[pattern: '/**/css/**',           access: ['permitAll']],
	[pattern: '/**/images/**',        access: ['permitAll']],
	[pattern: '/**/favicon.ico',      access: ['permitAll']],
	[pattern: '/register/**', 	  access: ['permitAll']],
	[pattern: '/logout/**', 	      access: ['permitAll']]
]

//grails.plugin.springsecurity.filterChain.chainMap = [
//	[pattern: '/assets/**',      filters: 'none'],
//	[pattern: '/**/js/**',       filters: 'none'],
//	[pattern: '/**/css/**',      filters: 'none'],
//	[pattern: '/**/images/**',   filters: 'none'],
//	[pattern: '/**/favicon.ico', filters: 'none'],
//	[pattern: '/**',             filters: 'JOINED_FILTERS']
//]

grails.plugin.springsecurity.filterChain.chainMap = [
		//Stateless chain
		[ pattern: '/api/**', filters: 'JOINED_FILTERS,-anonymousAuthenticationFilter,-exceptionTranslationFilter,-authenticationProcessingFilter,-securityContextPersistenceFilter,-rememberMeAuthenticationFilter'],

		//Traditional chain
		//[ pattern: '/**', filters: 'JOINED_FILTERS,-restTokenValidationFilter,-restExceptionTranslationFilter']
]

grails.plugin.springsecurity.rest.token.storage.useGorm = true
grails.plugin.springsecurity.rest.token.storage.gorm.tokenDomainClassName = 'com.bitmascot.sup.security.AuthenticationToken'

grails.plugin.springsecurity.logout.postOnly = false
grails.plugin.springsecurity.rest.logout.endpointUrl='/logout'