//
//  FrameworkDeatailView.swift
//  swiftUI-Modal
//
//  Created by ram on 2023/03/02.
//

import SwiftUI

struct FrameworkDeatailView: View {
    @Binding var framework: AppleFramework? //optional
    //바인딩으로 애플프레임워크를 받아와준다.
    @Environment(\.presentationMode)
    var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack{
            if let framework = framework{
                Image(framework.imageName)
                Text(framework.name)
                Text(framework.description)
            } else {
                Text("Nothing selected")
            }
            
            Button{
                print("-->Tapped")
                presentationMode.wrappedValue.dismiss()
            }label: {
                Text("Button")
            }
        }
        .onAppear {
            //뷰가 어디서 왔는지,어떻게 변했는지
            print("Detail View - on appear \(presentationMode.wrappedValue.isPresented)")
        }
        .onDisappear {
            print("Detail View - on disappear\(presentationMode.wrappedValue.isPresented)")
                  
        }
                
       
    }
}

struct FrameworkDeatailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDeatailView(framework: .constant(AppleFramework.list[0]))
    }
}
