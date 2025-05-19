
let $doc := doc('C:\Users\kaltr\Downloads\alcohol_output.xml')


let $records := 
  for $r in $doc//record
  where $r/Year = 2018
    and $r/AlcoholConsumption != 'nan'
    and $r/GDPPerCapita != 'nan'
    and $r/Populationhistoricalestimates != 'nan'
  order by xs:decimal($r/AlcoholConsumption) descending
  return $r


let $top10 := subsequence($records, 1, 10)


let $html :=
  <html>
    <head>
      <title>Top 10 Countries by Alcohol Consumption (2018)</title>
      <style><![CDATA[
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2 { color: darkred; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background-color: #f2f2f2; }
      ]]></style>
    </head>
    <body>
      <h2>Top 10 Countries by Alcohol Consumption in 2018</h2>
      <table>
        <tr>
          <th>Country</th>
          <th>Continent</th>
          <th>Alcohol Consumption (liters)</th>
          <th>GDP per Capita</th>
          <th>Population</th>
        </tr>
        {
          for $r in $top10
          return <tr>
            <td>{ $r/Entity/text() }</td>
            <td>{ $r/Continent/text() }</td>
            <td>{ $r/AlcoholConsumption/text() }</td>
            <td>{ format-number(xs:decimal($r/GDPPerCapita), '#,##0.00') }</td>
            <td>{ format-number(xs:decimal($r/Populationhistoricalestimates), '#,##0') }</td>
          </tr>
        }
      </table>
    </body>
  </html>


let $path := "C:\Users\kaltr\Desktop\xquery_result.html"
return (
  file:write($path, $html),
  $html
)
