
let $doc := doc("C:/Users/kaltr/Downloads/weather_output.xml")


let $types := distinct-values($doc//record/CloudCover[. != 'nan'])


let $html :=
  <html>
    <head>
      <title>Mesatarja e Temperaturës dhe Lagështisë sipas Vranësirës</title>
      <style><![CDATA[
        body { font-family: Arial; margin: 20px; }
        h2 { color: navy; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background-color: #f0f0f0; }
      ]]></style>
    </head>
    <body>
      <h2>Average Temperature and Humidity per Cloud Cover Type</h2>
      <table>
        <tr>
          <th>Cloud Cover</th>
          <th>Avg. Temperature (°C)</th>
          <th>Avg. Humidity (%)</th>
        </tr>
        {
          for $type in $types
          let $records := $doc//record[CloudCover = $type and Temperature != 'nan' and Humidity != 'nan']
          let $avgTemp := avg(for $r in $records return xs:decimal($r/Temperature))
          let $avgHum := avg(for $r in $records return xs:decimal($r/Humidity))
          order by $avgTemp descending
          return <tr>
            <td>{ $type }</td>
            <td>{ format-number($avgTemp, "#0.0") }</td>
            <td>{ format-number($avgHum, "#0.0") }</td>
          </tr>
        }
      </table>
    </body>
  </html>


let $path := "C:/Users/kaltr/Desktop/weather_cloud_analysis.html"
return (
  file:write($path, $html),
  $html
)
