(: Qellimi: Gjen kryeqytetet e shteteve qe nuk jane antare te asnje organizate boterore. Bazuar ne Query 4 nga pjesa 1:)

let $doc := doc('C:/Users/endri/OneDrive/Desktop/BigData_Project2/Resources/XML/mondial.xml')
let $validCountries :=
  for $c in $doc//country
  where not($c/@memberships) or $c/@memberships = ''
  return $c

(: XML output result returned here :)
let $xmlResult :=
  <non_member_countries>{
    for $country in $validCountries
    let $countryName := $country/name[1]/text()
    let $capitalName := ($doc//city[@id = $country/@capital]/name[1]/text(), 'Unknown')[1]
    order by $countryName
    return
      <country>
        <name>{ $countryName }</name>
        <capital>{ $capitalName }</capital>
      </country>
  }</non_member_countries>

(: HTML list version :)
let $html :=
  <html>
    <head>
      <title>Capitals of Non-Member Countries</title>
      <style><![CDATA[
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2 { color: navy; }
        ul { list-style-type: square; }
        li { margin: 10px 0; }
      ]]></style>
    </head>
    <body>
      <h2>Countries Not in Any Organization and Their Capitals</h2>
      <ul>{
        for $country in $validCountries
        let $countryName := $country/name[1]/text()
        let $capitalName := ($doc//city[@id = $country/@capital]/name[1]/text(), 'Unknown')[1]
        order by $countryName
        return
          <li>{ $countryName }
            <ul>
              <li>Capital: { $capitalName }</li>
            </ul>
          </li>
      }</ul>
    </body>
  </html>

(: Write HTML to file :)
let $path := "C:/Users/endri/OneDrive/Desktop/BigData_Project2/XML/XQuery results in HTML/xquery2_result.html"
return (
  file:write($path, $html),
  $xmlResult
)