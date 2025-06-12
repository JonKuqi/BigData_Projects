let seaCountries = db.geo_sea.distinct("Country");
let riverCities = db.located.distinct("City", {
  $and: [
    { River: { $ne: null } },
    { River: { $ne: "" } }
  ]
});

let result1 = db.country.find(
  {
    Code: { $nin: seaCountries },
    Capital: { $nin: riverCities }
  },
  {
    _id: 0,
    Capital: 1,
    Name: 1
  }
).sort({ Capital: 1 }).toArray();
