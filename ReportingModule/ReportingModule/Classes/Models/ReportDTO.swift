

import Foundation
struct ReportDTO : Codable {
	let id : String?
	let value : Double?
	let timestamp : Int?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case value = "value"
		case timestamp = "timestamp"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		value = try values.decodeIfPresent(Double.self, forKey: .value)
		timestamp = try values.decodeIfPresent(Int.self, forKey: .timestamp)
	}

}
