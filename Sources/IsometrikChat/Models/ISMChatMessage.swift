//
//  ISMMessage.swift
//  ISMChatSdk
//
//  Created by Rahul Sharma on 09/03/23.
//

import Foundation
import ISMSwiftCall

public struct ISMChatMessages : Codable{
    public var messages : [ISMChatMessage]? = []
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        messages = try? container.decode([ISMChatMessage].self, forKey: .messages)
    }
    public init(){
        
    }
}

public struct ISMChatMessage : Codable,Identifiable{
    public let id = UUID()
    public var sentAt : Double?
    public var senderInfo : ISMChatUser?
    public var body : String?
    public var messageId : String?
    public var mentionedUsers : [ISMChatMentionedUser]?
    public var deliveredToAll : Bool?
    public var readByAll : Bool?
    public var customType : String?
    public var action : String?
    public var readBy : [ISMChatUserStatus]?
    public var deliveredTo  : [ISMChatUserStatus]?
    public var messageType : Int?
    public var parentMessageId : String?
    public var metaData : ISMChatMetaData?
    public var attachments : [ISMChatAttachment]?
    public var initiatorIdentifier : String?
    public var initiatorId : String?
    public var initiatorName : String?
    public var conversationId : String?
    public var groupcastId : String?
    public var userName : String?
    public var userIdentifier : String?
    public var userId : String?
    public var members : [ISMChatMemberAdded]?
    public var memberName : String?
    public var memberId : String?
    public var memberIdentifier : String?
    public var messageUpdated : Bool?
    public var reactions : [String: [String]]?
    //callkit params
    public var missedByMembers : [String]?
    public var meetingId : String?
    public var callDurations : [ISMCallMeetingDuration]?
    public var audioOnly : Bool?
    public var autoTerminate : Bool?
    public var config : ISMCallConfig?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        senderInfo = try? container.decode(ISMChatUser.self, forKey: .senderInfo)
        body = try? container.decode(String.self, forKey: .body)
        sentAt = try? container.decode(Double.self, forKey: .sentAt)
        messageId = try? container.decode(String.self, forKey: .messageId)
        mentionedUsers = try? container.decode([ISMChatMentionedUser].self, forKey: .mentionedUsers)
        deliveredToAll = try? container.decode(Bool.self, forKey: .deliveredToAll)
        readByAll = try? container.decode(Bool.self, forKey: .readByAll)
        customType = try? container.decode(String.self, forKey: .customType)
        action = try? container.decode(String.self, forKey: .action)
        readBy = try? container.decode([ISMChatUserStatus].self, forKey: .readBy)
        deliveredTo = try? container.decode([ISMChatUserStatus].self, forKey: .deliveredTo)
        messageType = try? container.decode(Int.self, forKey: .messageType)
        parentMessageId = try? container.decode(String.self, forKey: .parentMessageId)
        metaData = try? container.decodeIfPresent(ISMChatMetaData.self, forKey: .metaData)
        attachments = try? container.decode([ISMChatAttachment].self, forKey: .attachments)
        initiatorIdentifier = try? container.decode(String.self, forKey: .initiatorIdentifier)
        initiatorId  = try? container.decode(String.self, forKey: .initiatorId)
        initiatorName  = try? container.decode(String.self, forKey: .initiatorName)
        conversationId = try? container.decode(String.self, forKey: .conversationId)
        groupcastId = try? container.decode(String.self, forKey: .groupcastId)
        userName = try? container.decode(String.self, forKey: .userName)
        userId = try? container.decode(String.self, forKey: .userId)
        userIdentifier = try? container.decode(String.self, forKey: .userIdentifier)
        members = try? container.decode([ISMChatMemberAdded].self, forKey: .members)
        memberName = try? container.decode(String.self, forKey: .memberName)
        memberId = try? container.decode(String.self, forKey: .memberId)
        memberIdentifier = try? container.decode(String.self, forKey: .memberIdentifier)
        messageUpdated = try? container.decode(Bool.self, forKey: .messageUpdated)
        reactions = try? container.decode([String: [String]].self, forKey: .reactions)
        
        missedByMembers = try? container.decode([String].self, forKey: .missedByMembers)
        meetingId  = try? container.decode(String.self, forKey: .meetingId)
        callDurations  = try? container.decode([ISMCallMeetingDuration].self, forKey: .callDurations)
        audioOnly  = try? container.decode(Bool.self, forKey: .audioOnly)
        autoTerminate  = try? container.decode(Bool.self, forKey: .autoTerminate)
        config  = try? container.decode(ISMCallConfig.self, forKey: .config)
       
    }
    public init(sentAt : Double? = nil, body : String? = nil,messageId : String? = nil,mentionedUsers : [ISMChatMentionedUser]? = nil,metaData : ISMChatMetaData? = nil,customType : String? = nil,initiatorIdentifier : String? = nil,action : String? = nil,attachment : [ISMChatAttachment]? = nil,conversationId : String? = nil,userName : String? = nil,initiatorId : String? = nil,initiatorName : String? = nil,memberName : String? = nil,memberId : String? = nil, memberIdentifier : String? = nil,senderInfo : ISMChatUser? = nil,members : [ISMChatMemberAdded]? = nil,messageUpdated : Bool? = nil,reactions : [String: [String]]? = nil,missedByMembers : [String]? = nil,meetingId : String? = nil,callDurations : [ISMCallMeetingDuration]? = nil,audioOnly : Bool? = false,autoTerminate : Bool? = nil,config : ISMCallConfig? = nil,messageType : Int? = nil){
        self.sentAt = sentAt
        self.body = body
        self.messageId = messageId
        self.mentionedUsers = mentionedUsers
        self.metaData = metaData
        self.customType = customType
        self.action = action
        self.initiatorIdentifier = initiatorIdentifier
        self.attachments = attachment
        self.conversationId = conversationId
        self.userName = userName
        self.initiatorId = initiatorId
        self.initiatorName = initiatorName
        self.memberName = memberName
        self.memberId = memberId
        self.memberIdentifier = memberIdentifier
        self.senderInfo = senderInfo
        self.members = members
        self.messageUpdated = messageUpdated
        self.reactions = reactions
        self.missedByMembers = missedByMembers
        self.meetingId  = meetingId
        self.callDurations  = callDurations
        self.audioOnly  = audioOnly
        self.autoTerminate  = autoTerminate
        self.config  = config
        self.messageType = messageType
    }
    public init(){
        
    }
}

public struct ISMChatUserStatus : Codable{
    var userId : String?
    var timestamp : Double?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try? container.decode(String.self, forKey: .userId)
        timestamp = try? container.decode(Double.self, forKey: .timestamp)
    }
}

public struct ISMChatMentionedUser : Codable {
    public var wordCount : Int?
    public var userId : String?
    public var order : Int?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        wordCount = try? container.decode(Int.self, forKey: .wordCount)
        userId = try? container.decode(String.self, forKey: .userId)
        order = try? container.decode(Int.self, forKey: .order)
    }
    public init(wordCount : Int? = nil,userId : String? = nil,order : Int? = nil){
        self.wordCount = wordCount
        self.userId = userId
        self.order = order
    }
}

//public struct ISMCallConfig: Codable {
//    let pushNotifications: Bool
//}

public struct ISMChatContactMetaData : Codable{
    public var contactName : String?
    public var contactIdentifier : String?
    public var contactImageUrl : String?
    public var contactImageData : Data?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        contactName = try? container.decode(String.self, forKey: .contactName)
        contactIdentifier = try? container.decode(String.self, forKey: .contactIdentifier)
        contactImageUrl = try? container.decode(String.self, forKey: .contactImageUrl)
        contactImageData = try? container.decode(Data.self, forKey: .contactImageData)
    }
    public init(contactName: String? = nil, contactIdentifier: String? = nil,contactImageUrl : String? = nil,contactImageData : Data? = nil){
        self.contactName = contactName
        self.contactIdentifier = contactIdentifier
        self.contactImageUrl = contactImageUrl
        self.contactImageData = contactImageData
    }
}

public struct ISMChatReplyMessageMetaData : Codable{
    public var parentMessageId : String?
    public var parentMessageBody : String?
    public var parentMessageUserId : String?
    public var parentMessageUserName : String?
    public var parentMessageMessageType : String?
    public var parentMessageAttachmentUrl : String?
    public var parentMessageInitiator : Bool?
    public var parentMessagecaptionMessage : String?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        parentMessageId = try? container.decode(String.self, forKey: .parentMessageId)
        parentMessageBody = try? container.decode(String.self, forKey: .parentMessageBody)
        parentMessageUserId = try? container.decode(String.self, forKey: .parentMessageUserId)
        parentMessageUserName = try? container.decode(String.self, forKey: .parentMessageUserName)
        parentMessageMessageType = try? container.decode(String.self, forKey: .parentMessageMessageType)
        parentMessageAttachmentUrl = try? container.decode(String.self, forKey: .parentMessageAttachmentUrl)
        parentMessageInitiator = try? container.decode(Bool.self, forKey: .parentMessageInitiator)
        parentMessagecaptionMessage = try? container.decode(String.self, forKey: .parentMessagecaptionMessage)
    }
    public init(parentMessageId : String? = nil, parentMessageBody : String? = nil, parentMessageUserId : String? = nil, parentMessageUserName : String? = nil, parentMessageMessageType : String? = nil, parentMessageAttachmentUrl : String? = nil, parentMessageInitiator : Bool? = nil,parentMessagecaptionMessage : String? = nil){
        self.parentMessageId = parentMessageId
        self.parentMessageBody = parentMessageBody
        self.parentMessageUserId = parentMessageUserId
        self.parentMessageUserName = parentMessageUserName
        self.parentMessageMessageType = parentMessageMessageType
        self.parentMessageAttachmentUrl = parentMessageAttachmentUrl
        self.parentMessageInitiator = parentMessageInitiator
        self.parentMessagecaptionMessage = parentMessagecaptionMessage
    }
}

public struct ISMChatMetaData : Codable{
    public var replyMessage : ISMChatReplyMessageMetaData?
    public var locationAddress : String?
    public var contacts : [ISMChatContactMetaData]?
    public var captionMessage : String?
    public var isBroadCastMessage : Bool?
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        replyMessage = try? container.decode(ISMChatReplyMessageMetaData.self, forKey: .replyMessage)
        locationAddress = try? container.decode(String.self, forKey: .locationAddress)
        contacts = try? container.decode([ISMChatContactMetaData].self, forKey: .contacts)
        captionMessage = try? container.decode(String.self, forKey: .captionMessage)
        isBroadCastMessage = try? container.decode(Bool.self, forKey: .isBroadCastMessage)
    }
    public init(replyMessage : ISMChatReplyMessageMetaData? = nil, locationAddress : String? = nil ,contacts : [ISMChatContactMetaData]? = nil,captionMessage : String? = nil,isBroadCastMessage : Bool? = nil){
        self.replyMessage = replyMessage
        self.locationAddress = locationAddress
        self.contacts = contacts
        self.captionMessage = captionMessage
        self.isBroadCastMessage = isBroadCastMessage
    }
}
