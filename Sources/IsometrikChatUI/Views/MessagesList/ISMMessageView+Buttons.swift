//
//  ISMMessageView+Buttons.swift
//  ISMChatSdk
//
//  Created by Rasika on 15/04/24.
//

import Foundation
import SwiftUI
import ISMSwiftCall
import IsometrikChat


extension ISMMessageView{
    
    //MARK: - AUDIO MESSAGE BUTTON
    func AudioMessageButton(height : CGFloat) -> some View{
        HStack{
            Button(action: {
                ISMChatHelper.print("recording done")
                if isClicked == true{
                    viewModel.isRecording = false
                    self.isClicked = false
                    viewModel.stopRecording { url in
                        viewModel.audioUrl = url
                    }
                }
            }) {
                ZStack {
                    themeImages.addAudio
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding(.horizontal,5)
                }
            }
            .simultaneousGesture(
                LongPressGesture(minimumDuration: 0.1)
                    .onEnded { value in
                        ISMChatHelper.print("Tap currently holded")
                        if isMessagingEnabled() == true && viewModel.isBusy == false{
                            if audioPermissionCheck == true{
                                isClicked = true
                                viewModel.isRecording = true
                                viewModel.startRecording()
                            }else{
                                ISMChatHelper.print("Access Denied for audio permission")
                            }
                        }
                    }
                    .sequenced(before:
                                DragGesture(minimumDistance: 2)
                        .onEnded { value in
                            if value.translation.width < -50 {
                                UINotificationFeedbackGenerator().notificationOccurred(.warning)
                                if isClicked == true{
                                    viewModel.isRecording = false
                                    self.isClicked = false
                                    viewModel.stopRecording { url in
                                    }
                                }
                            }else if viewModel.isRecording && value.translation.height < -50 {
                                UINotificationFeedbackGenerator().notificationOccurred(.success)
                                print("Dragged up")
                                audioLocked = true
                            }
                        }
                              )
            )
        }
    }
    
    //MARK: - MULTIPLE FORWARD MESSAGE BUTTON VIEW
    func multipleForwardMessageButtonView(message : MessagesDB) -> some View{
        if forwardMessageSelected.contains(where: { msg in
            msg.messageId == message.messageId
        }){
            return   themeImages.selected
                .resizable()
                .frame(width: 20, height: 20)
        }else{
            return    themeImages.deselected
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
    
    //MARK: - MULTIPLE DELETE MESSAGE BUTTON VIEW
    func multipleDeleteMessageButtonView(message: MessagesDB) -> some View {
        if deleteMessage.contains(where: { msg in
            msg.messageId == message.messageId
        }) {
            return  themeImages.selected
                .resizable()
                .frame(width: 20, height: 20)
        } else {
            return themeImages.deselected
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
    
    //MARK: - SCROLL TO BOTTOM MESSAGE
    func scrollToBottomButton() -> some View {
        return Button(action: {
            realmManager.parentMessageIdToScroll = self.realmManager.messages.last?.last?.id.description ?? ""
        }, label: {
            themeImages.scrollToBottomArrow
                .resizable()
                .frame(width: 32, height: 32)
                .padding()
        })
        .shadow(color: Color.black.opacity(0.3),
                radius: 3,
                x: 3,
                y: 3)
    }
    
    //MARK: - NAVIGATION LEADING BUTTON
    func navigationBarLeadingButtons()  -> some View {
        Button(action : {}) {
            HStack{
                Button(action: {
                    dismiss()
                }) {
                    themeImages.backButton
                        .resizable()
                        .frame(width: 18, height: 18)
                }
                
                Spacer()
                    .frame(width: 15)
                
                if self.fromBroadCastFlow == true{
                    Button {
                        navigateToGroupCastInfo = true
                    } label: {
                        BroadCastAvatarView(size: CGSize(width: 40, height: 40), broadCastImageSize: CGSize(width: 17.7, height: 17.7),broadCastLogo: themeImages.broadCastLogo)
                        if let groupConversationTitle = groupConversationTitle, !groupConversationTitle.isEmpty && groupConversationTitle != "Default"{
                            Text(groupConversationTitle)
                                .foregroundColor(themeColor.messageListHeaderTitle)
                                .font(themeFonts.messageListHeaderTitle)
                        }else{
                            Text("Messages")
                                .foregroundColor(themeColor.messageListHeaderTitle)
                                .font(themeFonts.messageListHeaderTitle)
                        }
                    }
                }else{
                    
                    Button {
                        if conversationDetail != nil{
                            navigateToProfile = true
                        }else{
                            showingNoInternetAlert = true
                        }
                    } label: {
                        UserAvatarView(avatar: isGroup == false ? opponenDetail?.userProfileImageUrl ?? "" : (self.conversationDetail?.conversationDetails?.conversationImageUrl ?? (self.groupImage ?? "")), showOnlineIndicator: opponenDetail?.online ?? false,size: CGSize(width: 40, height: 40), userName: isGroup == false ? (opponenDetail?.userName ?? "") : (self.conversationDetail?.conversationDetails?.conversationTitle ?? "") ,font: .regular(size: 14))
                            .padding(.trailing,5)
                        
                        VStack(alignment: .leading){
                            Text(isGroup == false ? (opponenDetail?.userName ?? "") : (self.conversationDetail?.conversationDetails?.conversationTitle ?? (self.groupConversationTitle ?? "")))
                                .foregroundColor(themeColor.messageListHeaderTitle)
                                .font(themeFonts.messageListHeaderTitle)
                            if isGroup == true{
                                if otherUserTyping == true{
                                    Text("\(typingUserName ?? "") is typing...")
                                        .foregroundColor(themeColor.messageListHeaderDescription)
                                        .font(themeFonts.messageListHeaderDescription)
                                        .transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
                                }else{
                                    if let memberString =  memberString , !memberString.isEmpty{
                                        Text(memberString)
                                            .foregroundColor(themeColor.messageListHeaderDescription)
                                            .font(themeFonts.messageListHeaderDescription)
                                            .lineLimit(1)
                                            .transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
                                    }else{
                                        Text("Tap here for more info")
                                            .foregroundColor(themeColor.messageListHeaderDescription)
                                            .font(themeFonts.messageListHeaderDescription)
                                            .lineLimit(1)
                                            .transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
                                    }
                                }
                            }else{
                                if otherUserTyping == true{
                                    Text("Typing...")
                                        .foregroundColor(themeColor.messageListHeaderDescription)
                                        .font(themeFonts.messageListHeaderDescription)
                                        .transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
                                }else{
                                    if self.conversationDetail?.conversationDetails?.opponentDetails?.online == true{
                                        Text("Online")
                                            .foregroundColor(themeColor.messageListHeaderDescription)
                                            .font(themeFonts.messageListHeaderDescription)
                                            .transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
                                    }else{
                                        if let lastSeen = self.conversationDetail?.conversationDetails?.opponentDetails?.lastSeen, lastSeen != -1 {
                                            //last seen text
                                            if self.conversationDetail?.conversationDetails?.opponentDetails?.metaData?.showlastSeen == true{
                                                let date = NSDate().descriptiveStringLastSeen(time: lastSeen)
                                                Text("Last seen at \(date)")
                                                    .foregroundColor(themeColor.messageListHeaderDescription)
                                                    .font(themeFonts.messageListHeaderDescription)
                                                    .transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
                                            }
                                            
                                        }else if let lastSeen = self.opponenDetail?.lastSeen, lastSeen != -1{
                                            //last seen text
                                            if self.conversationDetail?.conversationDetails?.opponentDetails?.metaData?.showlastSeen == true{
                                                let date = NSDate().descriptiveStringLastSeen(time: lastSeen)
                                                Text("Last seen at \(date)")
                                                    .foregroundColor(themeColor.messageListHeaderDescription)
                                                    .font(themeFonts.messageListHeaderDescription)
                                                    .transition(AnyTransition.opacity.animation(.easeInOut(duration:0.3)))
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    //MARK: - NAVIGATION TRAILING BUTTONS
    
    
    func navigationBarTrailingButtons() -> some View {
        HStack {
            if showforwardMultipleMessage || showDeleteMultipleMessage {
                Button {
                    showforwardMultipleMessage = false
                    forwardMessageSelected.removeAll()
                    showDeleteMultipleMessage = false
                    deleteMessage.removeAll()
                } label: {
                    Text("Cancel")
                }
            }else {
                
                if isGroup == false && opponenDetail?.userId == nil && opponenDetail?.userName == nil{
                    //BroadCast Message
                    EmptyView()
                }else{
                    if self.conversationDetail != nil{
                        //calling Button
                        if showVideoCallingOption == true && isGroup == false{
                            Button {
                                videoCallUser()
                            } label: {
                                themeImages.videoCall
                                    .resizable()
                                    .frame(width: 26, height: 26, alignment: .center)
                            }
                        }
                        
                        if showAudioCallingOption == true && isGroup == false{
                            Button {
                                audioCallUser()
                            } label: {
                                themeImages.audioCall
                                    .resizable()
                                    .frame(width: 26, height: 26, alignment: .center)
                            }
                        }
                        
                        Menu {
                            clearChatButton()
                            if isGroup == false{
                                blockUserButton()
                            }
                        } label: {
                            themeImages.threeDots
                                .rotationEffect(.degrees(-90))
                                .foregroundColor(Color.black)
                        }
                    }
                }
            }
        }.background(NavigationLink("", destination:  ISMBlockUserView(conversationViewModel: self.conversationViewModel), isActive: $navigateToBlockUsers))
    }
    
    func audioCallUser(){
        self.endEditing(true)
        let callsdk = IsometrikCall()
        callsdk.startCall(with: ISMCallMember(memberName: opponenDetail?.userName ?? "", memberIdentifier: opponenDetail?.userIdentifier ?? "", memberId: opponenDetail?.userId ?? "", isPublishing: false, isAdmin: false, memberProfileImageURL: opponenDetail?.userProfileImageUrl ?? ""), callType: .AudioCall)
    }
    
    func videoCallUser(){
        self.endEditing(true)
        let callsdk = IsometrikCall()
        callsdk.startCall(with: ISMCallMember(memberName: opponenDetail?.userName ?? "", memberIdentifier: opponenDetail?.userIdentifier ?? "", memberId: opponenDetail?.userId ?? "", isPublishing: false, isAdmin: false, memberProfileImageURL: opponenDetail?.userProfileImageUrl ?? ""), callType: .VideoCall)
    }
    
    func clearChatButton() -> some View{
        Button {
            clearThisChat = true
        } label: {
            HStack(spacing: 10){
                themeImages.trash
                Text("Clear Chat")
            }
        }
    }
    
    func blockUserButton() -> some View{
        Button {
            if isMessagingEnabled(){
                blockThisChat = true
            }
        } label: {
            HStack(spacing: 10){
                themeImages.blockIcon
                if self.conversationDetail?.conversationDetails?.messagingDisabled == true && realmManager.messages.last?.last?.initiatorId == userSession.getUserId(){
                    Text("UnBlock User")
                }else{
                    Text("Block User")
                }
            }
        }
    }
}
