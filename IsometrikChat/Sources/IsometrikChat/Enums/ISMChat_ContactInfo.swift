//
//  ISMContactInfo.swift
//  ISMChatSdk
//
//  Created by Rahul Iphone123 on 20/06/23.
//

import Foundation

public enum ISMChat_ContactInfo: Int, CaseIterable {
    case ClearChat, DeleteUser, BlockUser, UnBlockUser, ExitGroup, MuteNotification, UnMuteNotification
    
    var title: String {
        switch self {
        case .ClearChat: return "Clear Chat"
        case .DeleteUser: return "Delete Chat"
        case .BlockUser: return "Block User"
        case .UnBlockUser: return "UnBlock User"
        case .ExitGroup: return "Exit Group"
        case .MuteNotification: return "Disable Notifications"
        case .UnMuteNotification: return "Enable Notification"
        }
    }
    static func options(blocked : Bool,unmuted : Bool,singleConversation : Bool? = true,onlyInfo : Bool? = false) -> [ISMChat_ContactInfo]{
        var menu : [ISMChat_ContactInfo] = []
        if singleConversation == true{
            if onlyInfo == true{
                menu =  [blocked ?.UnBlockUser : .BlockUser]
            }else{
                menu =  [.ClearChat,.DeleteUser,/*unmuted ? .MuteNotification : .UnMuteNotification,*/blocked ?.UnBlockUser : .BlockUser]
            }
        }else{
            menu = [.ClearChat,/*unmuted ? .MuteNotification : .UnMuteNotification,*/.ExitGroup]
        }
        return menu
    }
}
