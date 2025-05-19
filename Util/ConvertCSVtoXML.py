import pandas as pd

def read_csv_as_xml_records(inputfile):
    if not inputfile.lower().endswith('.csv'):
        raise ValueError('Expected a CSV file')

    try:
        df = pd.read_csv(inputfile)
    except FileNotFoundError:
        raise FileNotFoundError('CSV file not found')

    xml_output = ''
    for _, row in df.iterrows():
        xml_output += '  <record>\n'
        for col in df.columns:
            safe_col = col.replace(" ", "").replace("(", "").replace(")", "").replace("%", "")
            value = str(row[col]).replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;")
            xml_output += f'    <{safe_col}>{value}</{safe_col}>\n'
        xml_output += '  </record>\n'

    return xml_output

from csv_reader import read_csv_as_xml_records

def CSVtoXML(inputfile, outputfile):
    if not outputfile.lower().endswith('.xml'):
        raise ValueError('Expected an XML file')

    xml_output = '<weatherData>\n'
    xml_output += read_csv_as_xml_records(inputfile)
    xml_output += '</weatherData>'

    with open(outputfile, 'w', encoding='utf-8') as f:
        f.write(xml_output)

    print(f"✅ XML file '{outputfile}' created successfully!")

if __name__ == "__main__":
    CSVtoXML('alcohol-consumption.csv', 'alcohol_output.xml')
