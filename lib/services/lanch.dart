// Parse JSON nested data to dart model.

import 'dart:convert';

List<Lanches> lanchesFromJson(String str) =>
    List<Lanches>.from(json.decode(str).map((x) => Lanches.fromJson(x)));

class Lanches {
  Lanches({
    required this.flightNumber,
    required this.missionName,
    this.missionId,
    this.upcoming,
    this.launchYear,
    this.launchDateUnix,
    this.launchDateUtc,
    this.launchDateLocal,
    this.isTentative,
    this.tentativeMaxPrecision,
    this.tbd,
    this.rocket,
    this.ships,
    this.launchSite,
    this.launchSuccess,
    this.details,
  });

  int flightNumber;
  String missionName;
  List<String>? missionId;
  bool? upcoming;
  String? launchYear;
  int? launchDateUnix;
  DateTime? launchDateUtc;
  DateTime? launchDateLocal;
  bool? isTentative;
  String? tentativeMaxPrecision;
  bool? tbd;

  Rocket? rocket;
  List<String>? ships;

  LaunchSite? launchSite;
  bool? launchSuccess;

  String? details;

  factory Lanches.fromJson(Map<String, dynamic> json) => Lanches(
        flightNumber: json["flight_number"],
        missionName: json["mission_name"],
        missionId: List<String>.from(json["mission_id"].map((x) => x)),
        upcoming: json["upcoming"],
        launchYear: json["launch_year"],
        launchDateUnix: json["launch_date_unix"],
        launchDateUtc: DateTime.parse(json["launch_date_utc"]),
        launchDateLocal: DateTime.parse(json["launch_date_local"]),
        isTentative: json["is_tentative"],
        tentativeMaxPrecision: json["tentative_max_precision"],
        tbd: json["tbd"],
        rocket: Rocket.fromJson(json["rocket"]),
        ships: List<String>.from(json["ships"].map((x) => x)),
        launchSite: LaunchSite.fromJson(json["launch_site"]),
        launchSuccess:
            json["launch_success"] == null ? null : json["launch_success"],
        details: json["details"] == null ? null : json["details"],
      );
}

enum LaunchDateSource { WIKI, LAUNCH_LIBRARY }

final launchDateSourceValues = EnumValues({
  "launch_library": LaunchDateSource.LAUNCH_LIBRARY,
  "wiki": LaunchDateSource.WIKI
});

class LaunchSite {
  LaunchSite({
    this.siteId,
    this.siteName,
    this.siteNameLong,
  });

  SiteId? siteId;
  SiteName? siteName;
  SiteNameLong? siteNameLong;

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        siteId: siteIdValues.map[json["site_id"]],
        siteName: siteNameValues.map[json["site_name"]],
        siteNameLong: siteNameLongValues.map[json["site_name_long"]],
      );

  Map<String, dynamic> toJson() => {
        "site_id": siteIdValues.reverse[siteId],
        "site_name": siteNameValues.reverse[siteName],
        "site_name_long": siteNameLongValues.reverse[siteNameLong],
      };
}

enum SiteId { KWAJALEIN_ATOLL, CCAFS_SLC_40, VAFB_SLC_4_E, KSC_LC_39_A }

final siteIdValues = EnumValues({
  "ccafs_slc_40": SiteId.CCAFS_SLC_40,
  "ksc_lc_39a": SiteId.KSC_LC_39_A,
  "kwajalein_atoll": SiteId.KWAJALEIN_ATOLL,
  "vafb_slc_4e": SiteId.VAFB_SLC_4_E
});

enum SiteName { KWAJALEIN_ATOLL, CCAFS_SLC_40, VAFB_SLC_4_E, KSC_LC_39_A }

final siteNameValues = EnumValues({
  "CCAFS SLC 40": SiteName.CCAFS_SLC_40,
  "KSC LC 39A": SiteName.KSC_LC_39_A,
  "Kwajalein Atoll": SiteName.KWAJALEIN_ATOLL,
  "VAFB SLC 4E": SiteName.VAFB_SLC_4_E
});

enum SiteNameLong {
  KWAJALEIN_ATOLL_OMELEK_ISLAND,
  CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40,
  VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E,
  KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A
}

final siteNameLongValues = EnumValues({
  "Cape Canaveral Air Force Station Space Launch Complex 40":
      SiteNameLong.CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40,
  "Kennedy Space Center Historic Launch Complex 39A":
      SiteNameLong.KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A,
  "Kwajalein Atoll Omelek Island": SiteNameLong.KWAJALEIN_ATOLL_OMELEK_ISLAND,
  "Vandenberg Air Force Base Space Launch Complex 4E":
      SiteNameLong.VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E
});

class Rocket {
  Rocket({
    this.rocketId,
    required this.rocketName,
    required this.rocketType,
    this.firstStage,
    this.secondStage,
    this.fairings,
  });

  String? rocketId;
  String rocketName;
  String rocketType;
  FirstStage? firstStage;
  SecondStage? secondStage;
  Fairings? fairings;

  factory Rocket.fromJson(Map<String, dynamic> json) => Rocket(
        rocketId: json["rocket_id"],
        rocketName: json["rocket_name"],
        rocketType: json["rocket_type"],
        firstStage: FirstStage.fromJson(json["first_stage"]),
        secondStage: SecondStage.fromJson(json["second_stage"]),
        fairings: json["fairings"] == null
            ? null
            : Fairings.fromJson(json["fairings"]),
      );
}

class Fairings {
  Fairings({
    this.reused,
    this.recoveryAttempt,
    this.recovered,
    this.ship,
  });

  bool? reused;
  bool? recoveryAttempt;
  bool? recovered;
  Ship? ship;

  factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json["reused"] == null ? null : json["reused"],
        recoveryAttempt:
            json["recovery_attempt"] == null ? null : json["recovery_attempt"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        ship: json["ship"] == null ? null : shipValues.map[json["ship"]],
      );
}

enum Ship { GOMSTREE, GOSEARCHER, GOMSCHIEF }

final shipValues = EnumValues({
  "GOMSCHIEF": Ship.GOMSCHIEF,
  "GOMSTREE": Ship.GOMSTREE,
  "GOSEARCHER": Ship.GOSEARCHER
});

class FirstStage {
  FirstStage({
    this.cores,
  });

  List<Core>? cores;

  factory FirstStage.fromJson(Map<String, dynamic> json) => FirstStage(
        cores: List<Core>.from(json["cores"].map((x) => Core.fromJson(x))),
      );
}

class Core {
  Core({
    required this.coreSerial,
    this.flight,
    this.block,
    this.gridfins,
    this.legs,
    this.reused,
    this.landSuccess,
    this.landingIntent,
    required this.landingType,
    this.landingVehicle,
  });

  String coreSerial;
  int? flight;
  int? block;
  bool? gridfins;
  bool? legs;
  bool? reused;
  bool? landSuccess;
  bool? landingIntent;
  String landingType;
  LandingVehicle? landingVehicle;

  factory Core.fromJson(Map<String, dynamic> json) => Core(
        coreSerial:
            json["core_serial"] == null ? 'Invalid' : json["core_serial"],
        flight: json["flight"] == null ? null : json["flight"],
        block: json["block"] == null ? null : json["block"],
        gridfins: json["gridfins"] == null ? null : json["gridfins"],
        legs: json["legs"] == null ? null : json["legs"],
        reused: json["reused"] == null ? null : json["reused"],
        landSuccess: json["land_success"] == null ? null : json["land_success"],
        landingIntent:
            json["landing_intent"] == null ? null : json["landing_intent"],
        landingType: json["landing_type"] == null
            ? 'No Landing Type'
            : json["landing_type"],
        landingVehicle: json["landing_vehicle"] == null
            ? null
            : landingVehicleValues.map[json["landing_vehicle"]],
      );
}

enum LandingType { OCEAN, ASDS, RTLS }

final landingTypeValues = EnumValues({
  "ASDS": LandingType.ASDS,
  "Ocean": LandingType.OCEAN,
  "RTLS": LandingType.RTLS
});

enum LandingVehicle { JRTI_1, OCISLY, LZ_1, JRTI, LZ_2, LZ_4 }

final landingVehicleValues = EnumValues({
  "JRTI": LandingVehicle.JRTI,
  "JRTI-1": LandingVehicle.JRTI_1,
  "LZ-1": LandingVehicle.LZ_1,
  "LZ-2": LandingVehicle.LZ_2,
  "LZ-4": LandingVehicle.LZ_4,
  "OCISLY": LandingVehicle.OCISLY
});

enum RocketId { FALCON1, FALCON9, FALCONHEAVY }

final rocketIdValues = EnumValues({
  "falcon1": RocketId.FALCON1,
  "falcon9": RocketId.FALCON9,
  "falconheavy": RocketId.FALCONHEAVY
});

enum RocketName { FALCON_1, FALCON_9, FALCON_HEAVY }

final rocketNameValues = EnumValues({
  "Falcon 1": RocketName.FALCON_1,
  "Falcon 9": RocketName.FALCON_9,
  "Falcon Heavy": RocketName.FALCON_HEAVY
});

enum RocketType { MERLIN_A, MERLIN_C, V1_0, V1_1, FT }

final rocketTypeValues = EnumValues({
  "FT": RocketType.FT,
  "Merlin A": RocketType.MERLIN_A,
  "Merlin C": RocketType.MERLIN_C,
  "v1.0": RocketType.V1_0,
  "v1.1": RocketType.V1_1
});

class SecondStage {
  SecondStage({
    this.block,
    this.payloads,
  });

  int? block;
  List<Payload>? payloads;

  factory SecondStage.fromJson(Map<String, dynamic> json) => SecondStage(
        block: json["block"] == null ? null : json["block"],
        payloads: List<Payload>.from(
            json["payloads"].map((x) => Payload.fromJson(x))),
      );
}

class Payload {
  Payload({
    required this.payloadId,
    this.noradId,
    this.reused,
    this.customers,
    required this.nationality,
    this.manufacturer,
    this.payloadType,
    this.payloadMassKg,
    this.payloadMassLbs,
    this.orbit,
    this.orbitParams,
    this.capSerial,
    this.massReturnedKg,
    this.massReturnedLbs,
    this.flightTimeSec,
    this.cargoManifest,
    this.uid,
  });

  String payloadId;
  List<int>? noradId;
  bool? reused;
  List<String>? customers;
  String nationality;
  String? manufacturer;
  PayloadType? payloadType;
  double? payloadMassKg;
  double? payloadMassLbs;
  String? orbit;
  OrbitParams? orbitParams;
  String? capSerial;
  double? massReturnedKg;
  double? massReturnedLbs;
  int? flightTimeSec;
  String? cargoManifest;
  String? uid;

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
        payloadId: json["payload_id"],
        noradId: List<int>.from(json["norad_id"].map((x) => x)),
        reused: json["reused"],
        customers: List<String>.from(json["customers"].map((x) => x)),
        nationality:
            json["nationality"] == null ? 'Invalid' : json["nationality"],
        manufacturer:
            json["manufacturer"] == null ? null : json["manufacturer"],
        payloadType: payloadTypeValues.map[json["payload_type"]],
        payloadMassKg: json["payload_mass_kg"] == null
            ? null
            : json["payload_mass_kg"].toDouble(),
        payloadMassLbs: json["payload_mass_lbs"] == null
            ? null
            : json["payload_mass_lbs"].toDouble(),
        orbit: json["orbit"],
        orbitParams: OrbitParams.fromJson(json["orbit_params"]),
        capSerial: json["cap_serial"] == null ? null : json["cap_serial"],
        massReturnedKg: json["mass_returned_kg"] == null
            ? null
            : json["mass_returned_kg"].toDouble(),
        massReturnedLbs: json["mass_returned_lbs"] == null
            ? null
            : json["mass_returned_lbs"].toDouble(),
        flightTimeSec:
            json["flight_time_sec"] == null ? null : json["flight_time_sec"],
        cargoManifest:
            json["cargo_manifest"] == null ? null : json["cargo_manifest"],
        uid: json["uid"] == null ? null : json["uid"],
      );
}

class OrbitParams {
  OrbitParams({
    this.referenceSystem,
    this.regime,
    this.longitude,
    this.semiMajorAxisKm,
    this.eccentricity,
    this.periapsisKm,
    this.apoapsisKm,
    this.inclinationDeg,
    this.periodMin,
    this.lifespanYears,
    this.epoch,
    this.meanMotion,
    this.raan,
    this.argOfPericenter,
    this.meanAnomaly,
  });

  ReferenceSystem? referenceSystem;
  Regime? regime;
  double? longitude;
  double? semiMajorAxisKm;
  double? eccentricity;
  double? periapsisKm;
  double? apoapsisKm;
  double? inclinationDeg;
  double? periodMin;
  double? lifespanYears;
  DateTime? epoch;
  double? meanMotion;
  double? raan;
  double? argOfPericenter;
  double? meanAnomaly;

  factory OrbitParams.fromJson(Map<String, dynamic> json) => OrbitParams(
        referenceSystem: json["reference_system"] == null
            ? null
            : referenceSystemValues.map[json["reference_system"]],
        regime:
            json["regime"] == null ? null : regimeValues.map[json["regime"]],
        longitude:
            json["longitude"] == null ? null : json["longitude"].toDouble(),
        semiMajorAxisKm: json["semi_major_axis_km"] == null
            ? null
            : json["semi_major_axis_km"].toDouble(),
        eccentricity: json["eccentricity"] == null
            ? null
            : json["eccentricity"].toDouble(),
        periapsisKm: json["periapsis_km"] == null
            ? null
            : json["periapsis_km"].toDouble(),
        apoapsisKm:
            json["apoapsis_km"] == null ? null : json["apoapsis_km"].toDouble(),
        inclinationDeg: json["inclination_deg"] == null
            ? null
            : json["inclination_deg"].toDouble(),
        periodMin:
            json["period_min"] == null ? null : json["period_min"].toDouble(),
        lifespanYears: json["lifespan_years"] == null
            ? null
            : json["lifespan_years"].toDouble(),
        epoch: json["epoch"] == null ? null : DateTime.parse(json["epoch"]),
        meanMotion:
            json["mean_motion"] == null ? null : json["mean_motion"].toDouble(),
        raan: json["raan"] == null ? null : json["raan"].toDouble(),
        argOfPericenter: json["arg_of_pericenter"] == null
            ? null
            : json["arg_of_pericenter"].toDouble(),
        meanAnomaly: json["mean_anomaly"] == null
            ? null
            : json["mean_anomaly"].toDouble(),
      );
}

enum ReferenceSystem { GEOCENTRIC, HELIOCENTRIC, HIGHLY_ELLIPTICAL }

final referenceSystemValues = EnumValues({
  "geocentric": ReferenceSystem.GEOCENTRIC,
  "heliocentric": ReferenceSystem.HELIOCENTRIC,
  "highly-elliptical": ReferenceSystem.HIGHLY_ELLIPTICAL
});

enum Regime {
  LOW_EARTH,
  GEOSTATIONARY,
  L1_POINT,
  GEOSYNCHRONOUS,
  SUN_SYNCHRONOUS,
  HIGH_EARTH,
  SEMI_SYNCHRONOUS,
  HIGHLY_ELLIPTICAL,
  VERY_LOW_EARTH,
  MEDIUM_EARTH,
  SUB_ORBITAL
}

final regimeValues = EnumValues({
  "geostationary": Regime.GEOSTATIONARY,
  "geosynchronous": Regime.GEOSYNCHRONOUS,
  "highly-elliptical": Regime.HIGHLY_ELLIPTICAL,
  "high-earth": Regime.HIGH_EARTH,
  "L1-point": Regime.L1_POINT,
  "low-earth": Regime.LOW_EARTH,
  "medium-earth": Regime.MEDIUM_EARTH,
  "semi-synchronous": Regime.SEMI_SYNCHRONOUS,
  "sub-orbital": Regime.SUB_ORBITAL,
  "sun-synchronous": Regime.SUN_SYNCHRONOUS,
  "very-low-earth": Regime.VERY_LOW_EARTH
});

enum PayloadType {
  SATELLITE,
  DRAGON_BOILERPLATE,
  DRAGON_10,
  DRAGON_11,
  LANDER,
  CREW_DRAGON,
  DRAGON_20
}

final payloadTypeValues = EnumValues({
  "Crew Dragon": PayloadType.CREW_DRAGON,
  "Dragon 1.0": PayloadType.DRAGON_10,
  "Dragon 1.1": PayloadType.DRAGON_11,
  "Dragon 2.0": PayloadType.DRAGON_20,
  "Dragon Boilerplate": PayloadType.DRAGON_BOILERPLATE,
  "Lander": PayloadType.LANDER,
  "Satellite": PayloadType.SATELLITE
});

enum TentativeMaxPrecision { HOUR }

final tentativeMaxPrecisionValues =
    EnumValues({"hour": TentativeMaxPrecision.HOUR});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
