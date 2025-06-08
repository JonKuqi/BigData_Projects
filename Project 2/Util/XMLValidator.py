from lxml import etree

class XMLValidator:
    @staticmethod
    def syntax_well_formed(xmlPath):
        try:
            etree.parse(xmlPath)
            print(" XML is well-formed.")
            return True
        except etree.XMLSyntaxError as e:
            print(" XML is NOT well-formed.")
            print(e)
            return False


    @staticmethod
    def validate_dtd(xmlPath, dtdPath=None):
        try:
            with open(xmlPath, "rb") as xml_file:
                XMLValidator.syntax_well_formed(xmlPath)
                xml_doc = etree.parse(xml_file)

            if dtdPath:
                with open(dtdPath, "rb") as dtd_file:
                    dtd = etree.DTD(dtd_file)
            else:
                # Try extracting DTD from XML (inline or SYSTEM)
                dtd = etree.DTD(xml_doc)

            if dtd.validate(xml_doc):
                print(" XML is valid against the DTD.")
                return True
            else:
                print(" XML is NOT valid.")
                print(dtd.error_log.filter_from_errors())
                return False

        except etree.DTDParseError as e:
            print(" Failed to parse DTD:", e)
            return False
        except etree.XMLSyntaxError as e:
            print(" XML Syntax Error:", e)
            return False
        except Exception as e:
            print(" Unexpected error:", e)
            return False

XMLValidator.validate_dtd("Resources/XML/mondial.xml", "Resources/XML/mondial.dtd")
XMLValidator.syntax_well_formed("Resources/XML/vaccinations.xml")