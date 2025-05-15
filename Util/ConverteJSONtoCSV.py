import ijson
import csv
import os

print(os.path.exists("Resources/XML/vaccinations.json"))  # should be True
print(os.path.getsize("Resources/XML/vaccinations.json"))  # should be > 0

class ConvertJSONtoCSV:

    @staticmethod
    def convert(input_path: str, output_path: str):
        """
        Converts a nested JSON file (country with daily data) to a flat CSV.

        Args:
            input_path (str): Path to the input JSON file.
            output_path (str): Path to the output CSV file.
        """
        with open(output_path, "w", newline='', encoding="utf-8") as csvfile:
            writer = None
            with open(input_path, "rb") as f:
                objects = ijson.items(f, "item")
                for obj in objects:
                    country = obj.get("country")
                    iso_code = obj.get("iso_code")
                    for entry in obj.get("data", []):
                        row = {
                            "country": country,
                            "iso_code": iso_code,
                            **entry
                        }
                        if writer is None:
                            fieldnames = list(row.keys())
                            writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                            writer.writeheader()
                        writer.writerow(row)

ConvertJSONtoCSV.convert("Resources/XML/vaccinations.json", "Resources/Datasets/Converted_vaccination.csv")