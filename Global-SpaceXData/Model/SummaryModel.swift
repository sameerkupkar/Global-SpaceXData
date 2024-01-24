//
//  SummaryModel.swift
//  Global-SpaceXData
//
//  Created by Sameer Kupkar on 23/01/24.
//

import Foundation


struct SummaryModel : Codable {
    let flight_number : Int?
    let mission_name : String?
    let mission_id : [String]?
    let upcoming : Bool?
    let launch_year : String?
    let launch_date_unix : Int?
    let launch_date_utc : String?
    let launch_date_local : String?
    let is_tentative : Bool?
    let tentative_max_precision : String?
    let tbd : Bool?
    let launch_window : Int?
    let rocket : Rocket?
    let ships : [String]?
    let telemetry : Telemetry?
    let launch_site : Launch_site?
    let launch_success : Bool?
    let launch_failure_details : Launch_failure_details?
    let links : Links?
    let details : String?
    let static_fire_date_utc : String?
    let static_fire_date_unix : Int?
    let timeline : Timeline?
    let crew : [String]??

    enum CodingKeys: String, CodingKey {

        case flight_number = "flight_number"
        case mission_name = "mission_name"
        case mission_id = "mission_id"
        case upcoming = "upcoming"
        case launch_year = "launch_year"
        case launch_date_unix = "launch_date_unix"
        case launch_date_utc = "launch_date_utc"
        case launch_date_local = "launch_date_local"
        case is_tentative = "is_tentative"
        case tentative_max_precision = "tentative_max_precision"
        case tbd = "tbd"
        case launch_window = "launch_window"
        case rocket = "rocket"
        case ships = "ships"
        case telemetry = "telemetry"
        case launch_site = "launch_site"
        case launch_success = "launch_success"
        case launch_failure_details = "launch_failure_details"
        case links = "links"
        case details = "details"
        case static_fire_date_utc = "static_fire_date_utc"
        case static_fire_date_unix = "static_fire_date_unix"
        case timeline = "timeline"
        case crew = "crew"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        flight_number = try values.decodeIfPresent(Int.self, forKey: .flight_number)
        mission_name = try values.decodeIfPresent(String.self, forKey: .mission_name)
        mission_id = try values.decodeIfPresent([String].self, forKey: .mission_id)
        upcoming = try values.decodeIfPresent(Bool.self, forKey: .upcoming)
        launch_year = try values.decodeIfPresent(String.self, forKey: .launch_year)
        launch_date_unix = try values.decodeIfPresent(Int.self, forKey: .launch_date_unix)
        launch_date_utc = try values.decodeIfPresent(String.self, forKey: .launch_date_utc)
        launch_date_local = try values.decodeIfPresent(String.self, forKey: .launch_date_local)
        is_tentative = try values.decodeIfPresent(Bool.self, forKey: .is_tentative)
        tentative_max_precision = try values.decodeIfPresent(String.self, forKey: .tentative_max_precision)
        tbd = try values.decodeIfPresent(Bool.self, forKey: .tbd)
        launch_window = try values.decodeIfPresent(Int.self, forKey: .launch_window)
        rocket = try values.decodeIfPresent(Rocket.self, forKey: .rocket)
        ships = try values.decodeIfPresent([String].self, forKey: .ships)
        telemetry = try values.decodeIfPresent(Telemetry.self, forKey: .telemetry)
        launch_site = try values.decodeIfPresent(Launch_site.self, forKey: .launch_site)
        launch_success = try values.decodeIfPresent(Bool.self, forKey: .launch_success)
        launch_failure_details = try values.decodeIfPresent(Launch_failure_details.self, forKey: .launch_failure_details)
        links = try values.decodeIfPresent(Links.self, forKey: .links)
        details = try values.decodeIfPresent(String.self, forKey: .details)
        static_fire_date_utc = try values.decodeIfPresent(String.self, forKey: .static_fire_date_utc)
        static_fire_date_unix = try values.decodeIfPresent(Int.self, forKey: .static_fire_date_unix)
        timeline = try values.decodeIfPresent(Timeline.self, forKey: .timeline)
        crew = try values.decodeIfPresent([String].self, forKey: .crew)
    }

}

struct Rocket : Codable {
    let rocket_id : String?
    let rocket_name : String?
    let rocket_type : String?
    let first_stage : First_stage?
    let second_stage : Second_stage?
    let fairings : Fairings?

    enum CodingKeys: String, CodingKey {

        case rocket_id = "rocket_id"
        case rocket_name = "rocket_name"
        case rocket_type = "rocket_type"
        case first_stage = "first_stage"
        case second_stage = "second_stage"
        case fairings = "fairings"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rocket_id = try values.decodeIfPresent(String.self, forKey: .rocket_id)
        rocket_name = try values.decodeIfPresent(String.self, forKey: .rocket_name)
        rocket_type = try values.decodeIfPresent(String.self, forKey: .rocket_type)
        first_stage = try values.decodeIfPresent(First_stage.self, forKey: .first_stage)
        second_stage = try values.decodeIfPresent(Second_stage.self, forKey: .second_stage)
        fairings = try values.decodeIfPresent(Fairings.self, forKey: .fairings)
    }

}

struct Fairings : Codable {
    let reused : Bool?
    let recovery_attempt : Bool?
    let recovered : Bool?
    let ship : String?

    enum CodingKeys: String, CodingKey {

        case reused = "reused"
        case recovery_attempt = "recovery_attempt"
        case recovered = "recovered"
        case ship = "ship"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
        recovery_attempt = try values.decodeIfPresent(Bool.self, forKey: .recovery_attempt)
        recovered = try values.decodeIfPresent(Bool.self, forKey: .recovered)
        ship = try values.decodeIfPresent(String.self, forKey: .ship)
    }

}



struct Launch_site : Codable {
    let site_id : String?
    let site_name : String?
    let site_name_long : String?

    enum CodingKeys: String, CodingKey {

        case site_id = "site_id"
        case site_name = "site_name"
        case site_name_long = "site_name_long"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
        site_name = try values.decodeIfPresent(String.self, forKey: .site_name)
        site_name_long = try values.decodeIfPresent(String.self, forKey: .site_name_long)
    }

}

struct Links : Codable {
    let mission_patch : String?
    let mission_patch_small : String?
    let reddit_campaign : String?
    let reddit_launch : String?
    let reddit_recovery : String?
    let reddit_media : String?
    let presskit : String?
    let article_link : String?
    let wikipedia : String?
    let video_link : String?
    let youtube_id : String?
    let flickr_images : [String]?

    enum CodingKeys: String, CodingKey {

        case mission_patch = "mission_patch"
        case mission_patch_small = "mission_patch_small"
        case reddit_campaign = "reddit_campaign"
        case reddit_launch = "reddit_launch"
        case reddit_recovery = "reddit_recovery"
        case reddit_media = "reddit_media"
        case presskit = "presskit"
        case article_link = "article_link"
        case wikipedia = "wikipedia"
        case video_link = "video_link"
        case youtube_id = "youtube_id"
        case flickr_images = "flickr_images"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mission_patch = try values.decodeIfPresent(String.self, forKey: .mission_patch)
        mission_patch_small = try values.decodeIfPresent(String.self, forKey: .mission_patch_small)
        reddit_campaign = try values.decodeIfPresent(String.self, forKey: .reddit_campaign)
        reddit_launch = try values.decodeIfPresent(String.self, forKey: .reddit_launch)
        reddit_recovery = try values.decodeIfPresent(String.self, forKey: .reddit_recovery)
        reddit_media = try values.decodeIfPresent(String.self, forKey: .reddit_media)
        presskit = try values.decodeIfPresent(String.self, forKey: .presskit)
        article_link = try values.decodeIfPresent(String.self, forKey: .article_link)
        wikipedia = try values.decodeIfPresent(String.self, forKey: .wikipedia)
        video_link = try values.decodeIfPresent(String.self, forKey: .video_link)
        youtube_id = try values.decodeIfPresent(String.self, forKey: .youtube_id)
        flickr_images = try values.decodeIfPresent([String].self, forKey: .flickr_images)
    }

}

struct Telemetry : Codable {
    let flight_club : String?

    enum CodingKeys: String, CodingKey {

        case flight_club = "flight_club"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        flight_club = try values.decodeIfPresent(String.self, forKey: .flight_club)
    }

}
struct Launch_failure_details : Codable {
    let time : Int?
    let altitude : Int?
    let reason : String?

    enum CodingKeys: String, CodingKey {

        case time = "time"
        case altitude = "altitude"
        case reason = "reason"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        time = try values.decodeIfPresent(Int.self, forKey: .time)
        altitude = try values.decodeIfPresent(Int.self, forKey: .altitude)
        reason = try values.decodeIfPresent(String.self, forKey: .reason)
    }

}
struct Timeline : Codable {
    let webcast_liftoff : Int?

    enum CodingKeys: String, CodingKey {

        case webcast_liftoff = "webcast_liftoff"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        webcast_liftoff = try values.decodeIfPresent(Int.self, forKey: .webcast_liftoff)
    }

}

struct First_stage : Codable {
    let cores : [Cores]?

    enum CodingKeys: String, CodingKey {

        case cores = "cores"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cores = try values.decodeIfPresent([Cores].self, forKey: .cores)
    }

}
struct Cores : Codable {
    let core_serial : String?
    let flight : Int?
    let block : Int?
    let gridfins : Bool?
    let legs : Bool?
    let reused : Bool?
    let land_success : Bool?
    let landing_intent : Bool?
    let landing_type : String?
    let landing_vehicle : String?

    enum CodingKeys: String, CodingKey {

        case core_serial = "core_serial"
        case flight = "flight"
        case block = "block"
        case gridfins = "gridfins"
        case legs = "legs"
        case reused = "reused"
        case land_success = "land_success"
        case landing_intent = "landing_intent"
        case landing_type = "landing_type"
        case landing_vehicle = "landing_vehicle"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        core_serial = try values.decodeIfPresent(String.self, forKey: .core_serial)
        flight = try values.decodeIfPresent(Int.self, forKey: .flight)
        block = try values.decodeIfPresent(Int.self, forKey: .block)
        gridfins = try values.decodeIfPresent(Bool.self, forKey: .gridfins)
        legs = try values.decodeIfPresent(Bool.self, forKey: .legs)
        reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
        land_success = try values.decodeIfPresent(Bool.self, forKey: .land_success)
        landing_intent = try values.decodeIfPresent(Bool.self, forKey: .landing_intent)
        landing_type = try values.decodeIfPresent(String.self, forKey: .landing_type)
        landing_vehicle = try values.decodeIfPresent(String.self, forKey: .landing_vehicle)
    }

}
struct Second_stage : Codable {
    let block : Int?
    let payloads : [Payloads]?

    enum CodingKeys: String, CodingKey {

        case block = "block"
        case payloads = "payloads"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        block = try values.decodeIfPresent(Int.self, forKey: .block)
        payloads = try values.decodeIfPresent([Payloads].self, forKey: .payloads)
    }

}
struct Payloads : Codable {
    let payload_id : String?
    let norad_id : [Int]?
    let reused : Bool?
    let customers : [String]?
    let nationality : String?
    let manufacturer : String?
    let payload_type : String?
    let payload_mass_kg : Double?
    let payload_mass_lbs : Double?
    let orbit : String?
    let orbit_params : Orbit_params?

    enum CodingKeys: String, CodingKey {

        case payload_id = "payload_id"
        case norad_id = "norad_id"
        case reused = "reused"
        case customers = "customers"
        case nationality = "nationality"
        case manufacturer = "manufacturer"
        case payload_type = "payload_type"
        case payload_mass_kg = "payload_mass_kg"
        case payload_mass_lbs = "payload_mass_lbs"
        case orbit = "orbit"
        case orbit_params = "orbit_params"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        payload_id = try values.decodeIfPresent(String.self, forKey: .payload_id)
        norad_id = try values.decodeIfPresent([Int].self, forKey: .norad_id)
        reused = try values.decodeIfPresent(Bool.self, forKey: .reused)
        customers = try values.decodeIfPresent([String].self, forKey: .customers)
        nationality = try values.decodeIfPresent(String.self, forKey: .nationality)
        manufacturer = try values.decodeIfPresent(String.self, forKey: .manufacturer)
        payload_type = try values.decodeIfPresent(String.self, forKey: .payload_type)
        payload_mass_kg = try values.decodeIfPresent(Double.self, forKey: .payload_mass_kg)
        payload_mass_lbs = try values.decodeIfPresent(Double.self, forKey: .payload_mass_lbs)
        orbit = try values.decodeIfPresent(String.self, forKey: .orbit)
        orbit_params = try values.decodeIfPresent(Orbit_params.self, forKey: .orbit_params)
    }

}
struct Orbit_params : Codable {
    let reference_system : String?
    let regime : String?
    let longitude : Double?
    let semi_major_axis_km : Double?
    let eccentricity : Double?
    let periapsis_km : Double?
    let apoapsis_km : Double?
    let inclination_deg : Double?
    let period_min : Double?
    let lifespan_years : Double?
    let epoch : String?
    let mean_motion : Double?
    let raan : Double?
    let arg_of_pericenter : Double?
    let mean_anomaly : Double?

    enum CodingKeys: String, CodingKey {

        case reference_system = "reference_system"
        case regime = "regime"
        case longitude = "longitude"
        case semi_major_axis_km = "semi_major_axis_km"
        case eccentricity = "eccentricity"
        case periapsis_km = "periapsis_km"
        case apoapsis_km = "apoapsis_km"
        case inclination_deg = "inclination_deg"
        case period_min = "period_min"
        case lifespan_years = "lifespan_years"
        case epoch = "epoch"
        case mean_motion = "mean_motion"
        case raan = "raan"
        case arg_of_pericenter = "arg_of_pericenter"
        case mean_anomaly = "mean_anomaly"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reference_system = try values.decodeIfPresent(String.self, forKey: .reference_system)
        regime = try values.decodeIfPresent(String.self, forKey: .regime)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        semi_major_axis_km = try values.decodeIfPresent(Double.self, forKey: .semi_major_axis_km)
        eccentricity = try values.decodeIfPresent(Double.self, forKey: .eccentricity)
        periapsis_km = try values.decodeIfPresent(Double.self, forKey: .periapsis_km)
        apoapsis_km = try values.decodeIfPresent(Double.self, forKey: .apoapsis_km)
        inclination_deg = try values.decodeIfPresent(Double.self, forKey: .inclination_deg)
        period_min = try values.decodeIfPresent(Double.self, forKey: .period_min)
        lifespan_years = try values.decodeIfPresent(Double.self, forKey: .lifespan_years)
        epoch = try values.decodeIfPresent(String.self, forKey: .epoch)
        mean_motion = try values.decodeIfPresent(Double.self, forKey: .mean_motion)
        raan = try values.decodeIfPresent(Double.self, forKey: .raan)
        arg_of_pericenter = try values.decodeIfPresent(Double.self, forKey: .arg_of_pericenter)
        mean_anomaly = try values.decodeIfPresent(Double.self, forKey: .mean_anomaly)
    }

}
