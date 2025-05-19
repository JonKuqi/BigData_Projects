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
