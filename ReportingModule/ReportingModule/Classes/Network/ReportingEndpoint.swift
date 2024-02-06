//
//  ReportingEndpoint.swift
//  ReportingModule
//
//  Created by Thang Nguyen on 2/4/24.
//

import NetworkCore
import Alamofire

public enum ReportingEndpoint {
    case getTopicNames
    case getReportsByTopic(topicName: String, from: Int?, to: Int?)
    case getReportsByTopics(topics: [String], from: Int?, to: Int?)
}

extension ReportingEndpoint: NetworkEndpointProtocol {
    public var baseURL: URL {
        guard let url = URL(string: "http://localhost:8787") else {
            fatalError("Please provide correct URL")
        }
        return url
    }
    
    public var path: String {
        switch self {
        case .getTopicNames:
            return "/report/topics"
        case let .getReportsByTopic(topicName, from, to):
            guard let from = from, let to = to else {
                return "/report/topic/\(topicName)"
            }
            return "/report/topic/\(topicName)/time?from=\(from)&to=\(to)"
            
        case let .getReportsByTopics(topics, from, to):
            var report = "/report/topicNames?topicNames="
            topics.forEach {topic in
                report += topic + ","
            }
            report.removeLast()
            
            guard let from = from, let to = to else {
                return report
            }
            return report + "?from=\(from)&to=\(to)"

        }
    }
    
    public var method: Alamofire.HTTPMethod {
        .get
    }
    
    public var parameters: [String : Any]? {
        nil
    }
    
    public var header: [String : String]? {
        nil
    }
    
    public var encoding: ParameterEncoding {
        switch self {
        case .getTopicNames:
            return JSONArrayEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    
    public var fullURL: String {
        switch self {
        case .getReportsByTopic, .getReportsByTopics:
            return baseURL.absoluteString + path
        default:
            return baseURL.appendingPathComponent(path).absoluteString
        }
    }
}
