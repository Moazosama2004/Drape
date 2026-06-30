//
//  SignInView.swift
//  Drape
//

import SwiftUI

struct SignInView: View {

    @State private var email = ""
    @State private var password = ""

    @State private var emailState: TextFieldState = .normal
    @State private var passwordState: TextFieldState = .normal

    private var isLoginEnabled: Bool {
        emailState == .success &&
        passwordState == .success
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            headerSection
            formSection
            createButton
            dividerSection
            socialButtons
            Spacer()
            goToSignUpSection
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 28)

        
        .onChange(of: email) { _, _ in
            validateEmail()
        }

        .onChange(of: password) { _, _ in
            validatePassword()
        }
    }

    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Login to your account")
                .font(.system(size: 32, weight: .bold))

            Text("It's great to see you again.")
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
    }

    private var formSection: some View {
        VStack(alignment: .leading, spacing: 16) {

            VStack(alignment: .leading, spacing: 4) {

                CustomTextField(
                    title: "Email",
                    placeHolder: "Enter your email address",
                    textFieldValue: $email,
                    state: $emailState
                )
                .padding(.bottom, 15)

                CustomTextField(
                    title: "Password",
                    isPassword: true,
                    placeHolder: "Enter your password",
                    textFieldValue: $password,
                    state: $passwordState
                )
                .padding(.bottom, 15)
            }
        }
    }

    private var createButton: some View {

        CustomButton(
            type: .primary,
            text: "Login",
            action: {

                print("Login")

            },

            status: isLoginEnabled ? .enable : .disable
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
                type: .custom(
                    textColor: .black,
                    buttonColor: .white
                ),
                text: "Login with Google",
                action: {

                },
                leading: Image(systemName: "google.logo")
            )
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            }
            .padding(.bottom, 15)

            CustomButton(
                type: .custom(
                    textColor: .white,
                    buttonColor: .blue
                ),
                text: "Login with Facebook",
                action: {

                },
                leading: Image(systemName: "facebook.logo")
            )
        }
    }
    
    private var goToSignUpSection: some View {
        HStack (spacing: 0){
            

            Text("Don't have an account? ")
                .font(.system(size: 16))
                .foregroundColor(.gray)
            Button {
                       print("Join tapped")
                   } label: {
                       Text("Join")
                           .font(.system(size: 14, weight: .semibold))
                           .foregroundColor(.black)
                           .underline()
                   }
                   .buttonStyle(.plain)
                

            
        }.frame(maxWidth: .infinity, alignment: .center)
    
    }

    // Email Validation
    private func validateEmail() {

        guard !email.isEmpty else {
            emailState = .normal
            return
        }

        let emailRegex =
        "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"

        let isValid = NSPredicate(
            format: "SELF MATCHES %@",
            emailRegex
        ).evaluate(with: email)

        emailState = isValid ? .success : .error
    }

    // Password Validation
    private func validatePassword() {

        // لو فاضي يبقى الحالة Normal
        guard !password.isEmpty else {
            passwordState = .normal
            return
        }

        passwordState = password.count >= 6 ? .success : .error
    }
}

#Preview {
    SignInView()
}
