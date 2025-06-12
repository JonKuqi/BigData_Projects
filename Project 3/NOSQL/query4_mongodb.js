let memberCountries = db.isMember.distinct("country");

let result = db.country.find(
  { code: { $nin: memberCountries } },
  { _id: 0, name: 1, capital: 1 }
).sort({ name: 1 }).toArray();

result;
