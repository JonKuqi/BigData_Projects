(: Universitetet më të mira për secilin vend:)

let $bestUniversities :=
  for $country in distinct-values(/universities/university/country)
  let $universities := /universities/university[country = $country]
  let $best :=
    for $u in $universities
    order by xs:decimal($u/total_score) descending
    return $u
  return
    <best_university>
      <country>{ $country }</country>
      <university_name>{ $best[1]/university_name/text() }</university_name>
      <score>{ $best[1]/total_score/text() }</score>
    </best_university>


let $html :=
  <html>
    <head>
      <title>Best Universities per Country</title>
      <style>
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid black; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
      </style>
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


let $path := "C:/Users/jonku/Desktop/BigData Resources/best_universities_result.html"

return (
  file:write($path, $html),
  $bestUniversities
)
