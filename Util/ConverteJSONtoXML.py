import ijson
import xml.etree.ElementTree as ET

class ConverteJSONtoXML:

    @staticmethod
    def record_to_element(tag, data):
        """Convert a record dict into a flat <record> XML element."""
        elem = ET.Element(tag)
        for key, val in data.items():
            child = ET.SubElement(elem, key)
            child.text = str(val)
        return elem

    @staticmethod
    def convert(json_path, xml_path, root_tag="records", country_tag="country", record_tag="record"):
        with open(json_path, 'r', encoding='utf-8') as json_file, open(xml_path, 'w', encoding='utf-8') as xml_file:
            xml_file.write(f"<{root_tag}>\n")

            parser = ijson.items(json_file, 'item')  # parse top-level array

            for country in parser:
                country_name = country.get("country")
                iso_code = country.get("iso_code")
                data = country.get("data", [])

                country_elem = ET.Element(country_tag, attrib={
                    "name": country_name,
                    "iso_code": iso_code
                })

                for record in data:
                    record_elem = ConverteJSONtoXML.record_to_element(record_tag, record)
                    country_elem.append(record_elem)

                xml_file.write(ET.tostring(country_elem, encoding="unicode") + "\n")

            xml_file.write(f"</{root_tag}>\n")


ConverteJSONtoXML.convert("Resources/vaccinations.json", "Resources/vaccinations.xml", root_tag="country")