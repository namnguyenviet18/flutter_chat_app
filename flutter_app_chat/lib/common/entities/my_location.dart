//
//
// class MyLocation {
//   MyLocation({this.results, this.status});
//   final List<Results>? results;
//   final String status;
//
//   factory MyLocation.fromJson(Map<String, dynamic> json) =>
//       MyLocation(
//         results: json["results"] == null ? null : List<Result>.from(json["results"].map((x) => x.));
//         status: json["status"] == null ? null : json["status"],
//       );
//
//   Map<String, dynamic> toJson() => {
//     "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toJson));
//     "status": status == null ? null : status
//   };
//
//
// }
//
// class Result {
//   Result({
//     this.addressComponent,
//     this.formattedAddress,
//     this.geometry,
//     this.placedId,
//     this.types
//   })
//   final List<AddressComponent>? addressComponent;
//   final String? formattedAddress;
//   final Geometry? geometry;
//   final String? placedId;
//   final List<String>? types;
//
//   factory Result.fromJson(Map<String, dynamic> json) {
//
//   }
// }
//
// class AddressComponent {
//   AddressComponent({this.longName, this.shortName, this.types});
//
//   final String? longName;
//   final String? shortName;
//   final List<String>? types;
//
//   factory AddressComponent.fromJson(Map<String, dynamic> json) {
//     return AddressComponent(
//       longName: json["long_name"],
//       shortName: json["short_name"],
//       types: json["types"] == null ? null : List<String>.from(json["types"].map((x) => x))
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "long_name": longName,
//     "short_name": shortName,
//     "types": types == null ? null : List<dynamic>.from(types!.map((x) => x))
//   };
// }
//
// class Geometry {
//   Geometry({this.location, this.locationType, this.viewport, this.bounds});
//   final MyLocationClass? location;
//   final String? locationType;
//   final Bounds? viewport;
//   final Bounds? bounds;
//
//   factory Geometry.fromJson(Map<String, dynamic> json) {
//     return Geometry(
//       location: json["location"] == null ? MyLocationClass.fromJson(json["location"]),
//       locationType: json["location_type"],
//       viewport: json["viewport"] == null ? null Bounds.fromJson(json["viewport"]),
//       bounds: json["bounds"] == null ? Bounds.fromJson(json["bounds"])
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "location": location == null ? null : location!.toJson(),
//     "location_type": locationType,
//
//   }
// }