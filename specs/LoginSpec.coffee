define [
    'cs!app/views/LoginView'
], ->
    
    LoginView = require 'cs!app/views/LoginView'

    describe "Login screen", ->

        it "should accept form submit calls.", ->
            loginView = new LoginView
            sinon.spy loginView, 'formSubmitted'

            loginView.render()

            loginView.formSubmitted
                preventDefault: ->

            expect(loginView.formSubmitted.called).toBe true


        it "should accept matching email/token-key pair, and reject unmatching ones.", ->
            loginView = new LoginView
            loginView.render()

            loginView.form.submit()

