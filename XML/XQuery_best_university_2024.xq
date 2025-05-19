(: Universitetet më të mira për secilin vend 2024:)

let $bestUniversities :=
  for $country in distinct-values(/universities/university/location)
  let $universities := 
    /universities/university[
      location = $country 
      and normalize-space(scores2_overall) != '' 
      and not(matches(scores2_overall, '^[\.,]*$'))
    ]
  let $best :=
    for $u in $universities
    order by xs:decimal(replace($u/scores2_overall, ',', '.')) descending
    return $u
  return
    <best_university>
      <country>{ $country }</country>
      <university_name>{ $best[1]/uname/text() }</university_name>
      <score>{ $best[1]/scores2_overall/text() }</score>
    </best_university>


let $html :=
  <html>
    <head>
      <title>Best Universities per Country</title>
      <style><![CDATA[
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2 { color: darkred; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ddd; padding: 8px; }
        th { background-color: #f2f2f2; }
      ]]></style>
    </head>
    <body>
      <h2>Best Universities per Country</h2>
      <table>
        <thead>
          <tr>
            <th>Rank</th>
            <th>Country</th>
            <th>University Name</th>
            <th>Score</th>
          </tr>
        </thead>
        <tbody>{
          for $i in 1 to count($bestUniversities)
          let $bu := $bestUniversities[$i]
          return
            <tr>
              <td>{ $i }</td>
              <td>{ $bu/country/text() }</td>
              <td>{ $bu/university_name/text() }</td>
              <td>{ $bu/score/text() }</td>
            </tr>
        }</tbody>
      </table>
    </body>
  </html>


let $path := "C:/Users/PC/OneDrive/Desktop/best_universities_result.html"

return (
  file:write($path, $html),
  $bestUniversities
)
