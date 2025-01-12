//
//  ChatsViewModelReactions.swift
//  ISMChatSdk
//
//  Created by Rasika on 12/06/24.
//

import Foundation

extension ChatsViewModel{
    
    //MARK: - send reaction
    public func sendReaction(conversationId : String,messageId : String,emojiReaction : String,completion:@escaping(Bool?)->()){
        var body : [String : Any]
        body = ["conversationId" : conversationId ,
                "messageId" : messageId,
                "reactionType" : emojiReaction] as [String : Any]
        ismChatSDK?.getChatClient().getApiManager().requestService(serviceUrl: ISMChatNetworkServices.Urls.emojiReaction,httpMethod: .post,params: body) { (result : ISMChatResponse<ISMChatCreateConversationResponse?,ISMChatErrorData?>) in
            switch result{
            case .success(let data):
                ISMChatHelper.print("Send reaction Api succedded -----> \(String(describing: data?.msg))")
                completion(true)
            case .failure(let error):
                ISMChatHelper.print("Send reaction Api failed -----> \(String(describing: error))")
                completion(true)
            }
        }
    }
    
    //MARK: - get reactions
    public func getReaction(conversationId : String,messageId : String,emojiReaction : String,completion:@escaping(ISMChatReactionsData?)->()){
        var body : [String : Any]
        body = ["conversationId" : conversationId ,
                "messageId" : messageId] as [String : Any]
        let url = ISMChatNetworkServices.Urls.emojiReaction + "/\(emojiReaction)"
        ismChatSDK?.getChatClient().getApiManager().requestService(serviceUrl: url,httpMethod: .get,params: body) { (result : ISMChatResponse<ISMChatReactionsData?,ISMChatErrorData?>) in
            switch result{
            case .success(let data):
                ISMChatHelper.print("Get reaction Api succedded -----> \(String(describing: data?.msg))")
                completion(data)
            case .failure(let error):
                ISMChatHelper.print("Get reaction Api failed -----> \(String(describing: error))")
            }
        }
    }
    
    //MARK: - remove reaction
    public func removeReaction(conversationId : String,messageId : String,emojiReaction : String,completion:@escaping(Bool?)->()){
        var body : [String : Any]
        body = ["conversationId" : conversationId ,
                "messageId" : messageId] as [String : Any]
        let url = ISMChatNetworkServices.Urls.emojiReaction + "/\(emojiReaction)"
        ismChatSDK?.getChatClient().getApiManager().requestService(serviceUrl: url,httpMethod: .delete,params: body) { (result : ISMChatResponse<ISMChatCreateConversationResponse?,ISMChatErrorData?>) in
            switch result{
            case .success(let data):
                ISMChatHelper.print("Send reaction Api succedded -----> \(String(describing: data?.msg))")
                completion(true)
            case .failure(let error):
                ISMChatHelper.print("Send reaction Api failed -----> \(String(describing: error))")
                completion(true)
            }
        }
    }
}
