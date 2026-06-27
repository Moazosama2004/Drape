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
            VStack(alignment: .leading, spacing: 4) {
                Text("Full Name")
                    .font(.system(size: 16, weight: .medium))
                
                //TODO will replace it after Moaz finish Textfields
                TextField("Enter your full name", text: $fullName)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                    )
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Email")
                    .font(.system(size: 16, weight: .medium))
                
                //TODO will replace it after Moaz finish Textfields
                TextField("Enter your email address", text: $email)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                    )
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Password")
                    .font(.system(size: 16, weight: .medium))
                
                //TODO will replace it after Moaz finish Textfields
                TextField("Enter your password", text: $password)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                    )
                
            }
        }
    }
    
    private var termsSection: some View {
        Text("By signing up you agree to our Terms, Privacy Policy, and Cookie Use") // underline from terms !!!
            .font(.system(size: 13))
            .foregroundColor(.gray)
            .fixedSize(horizontal: false, vertical: true)
    }
    
    //TODO will replace it after yusif finish buttons
    private var createButton: some View {
        Button(action: {
            
        }) {
            Text("Create an Account")
                .font(.system(size: 17, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.gray.opacity(0.45))
                .cornerRadius(10)
        }
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
            Button(action: {
                
            }) {
                
                Text("Sign Up with Google")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.25), lineWidth: 1)
                    )
            }
            
            Button(action: {
                
            }) {
                Text("Sign Up with Facebook")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
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
