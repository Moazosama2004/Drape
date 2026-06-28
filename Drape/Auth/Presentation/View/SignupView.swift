//
//  SignupView.swift
//  Drape
//
//  Created by TaqieAllah on 27/06/2026.
//

import SwiftUI

struct SignupView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var password = ""
    
    @State private var fullNameState: TextFieldState = .normal
    @State private var emailState: TextFieldState = .normal
    @State private var passwordState: TextFieldState = .normal
    
    @State private var fullNameError = "Please enter your full name"
    @State private var emailError = "Please enter a valid email address"
    @State private var passwordError = "Password must be at least 8 characters"
    
    private var isFormValid: Bool {
        fullNameState == .success && emailState == .success && passwordState == .success
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            headerSection
            formSection
            termsSection
            createButton
            dividerSection
            socialButtons
            loginSection
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 28)
    }
    
    // Validation -- move to VM later
    private func validateFullName() {
        let trimmed = fullName.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty {
            fullNameState = .error
            fullNameError = "Please enter your full name"
        } else if trimmed.count < 2 {
            fullNameState = .error
            fullNameError = "Name must be at least 2 characters"
        } else {
            fullNameState = .success
        }
    }
    
    private func validateEmail() {
        let regex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        if email.isEmpty {
            emailState = .error
            emailError = "Please enter your email address"
        } else if email.range(of: regex, options: .regularExpression) == nil {
            emailState = .error
            emailError = "Please enter a valid email address"
        } else {
            emailState = .success
        }
    }
    
    private func validatePassword() {
        if password.isEmpty {
            passwordState = .error
            passwordError = "Please enter a password"
        } else if password.count < 8 {
            passwordState = .error
            passwordError = "Password must be at least 8 characters"
        } else {
            passwordState = .success
        }
    }
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Create an account")
                .font(.system(size: 32, weight: .bold))
            
            Text("Let’s create your account.")
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
    }
    
    private var formSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            CustomTextField(
                title: "Full Name",
                errorMessage: fullNameError,
                placeHolder: "Enter your full name",
                textFieldValue: $fullName,
                state: $fullNameState
            )
            .onChange(of: fullName) { validateFullName() }

            CustomTextField(
                title: "Email",
                errorMessage: emailError,
                placeHolder: "Enter your email address",
                textFieldValue: $email,
                state: $emailState
            )
            .onChange(of: email) { validateEmail() }

            CustomTextField(
                title: "Password",
                isPassword: true,
                errorMessage: passwordError,
                placeHolder: "Enter your password",
                textFieldValue: $password,
                state: $passwordState
            )
            .onChange(of: password) { validatePassword() }

        }
    }
    
    private var termsSection: some View {
        Text("By signing up you agree to our Terms, Privacy Policy, and Cookie Use")
            .font(.system(size: 13))
            .foregroundColor(.gray)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    private var createButton: some View {
        return CustomButton(
            type: .primary,
            text: "Create an Account",
            action: {
                
            },
            status: isFormValid ? .enable : .disable
        )
    }
    
    private var dividerSection: some View {
        HStack {
            Rectangle()
                .fill(Color.gray.opacity(0.25))
                .frame(height: 1)
            
            Text("Or")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Rectangle()
                .fill(Color.gray.opacity(0.25))
                .frame(height: 1)
        }
    }
    
    private var socialButtons: some View {
        VStack(spacing: 14) {
            CustomButton(
                type: .custom(textColor: .black, buttonColor: .white),
                text: "Sign Up with Google",
                action: {
                    
                },
                status: .enable,
                leading: Image("google")
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.25), lineWidth: 1)
            )
            
            CustomButton(
                type: .custom(textColor: .white, buttonColor: .blue),
                text: "Sign Up with Facebook",
                action: {
                    
                },
                status: .enable,
                leading: Image("facebook")
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray.opacity(0.25), lineWidth: 1)
            )
        }
    }
    
    private var loginSection: some View {
        HStack(spacing: 4) {
            Text("Already have an account? ")
                .foregroundColor(.gray)
            
            Button(action: {
                
            }) {
                Text("Log In")
                    .foregroundColor(.black)
                    .underline()
            }
        }
        .font(.system(size: 15))
        .frame(maxWidth: .infinity)
        .padding(.top, 18)
    }
}

#Preview {
    SignupView()
}
