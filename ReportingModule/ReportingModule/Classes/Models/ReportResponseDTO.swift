import Foundation
 struct ReportResponseDTO : Codable {
	let topicName : String?
	let data : [ReportDTO]?

	enum CodingKeys: String, CodingKey {

		case topicName = "topicName"
		case data = "data"
	}

    init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		topicName = try values.decodeIfPresent(String.self, forKey: .topicName)
		data = try values.decodeIfPresent([ReportDTO].self, forKey: .data)
	}

}
