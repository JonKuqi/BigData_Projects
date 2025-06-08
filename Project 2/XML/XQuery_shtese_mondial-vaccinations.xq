(: Qellimi: Gjetja e e top 20 shteteve me te vakcinuara nga COVID 19. Popullata dhe shtete merren nga mondial, kurse numri i vakcinimeve eshte marre nga vaccinations.xml :)

let $all:=
  for $c in //country
  for $cv in doc("C:\Users\jonku\Desktop\BigData Pytthon\resources\vaccinations.xml")//country  (: Konvertuar me python nga json ne xml :)
    where $c/name/text() = $cv/@name
      let $days := $cv/record
      let $total_vaccinations := max($days/people_fully_vaccinated/xs:double(.))
      let $population := $c/population[last()]
      let $vaccination_percentage := 
        if ($population > 0) then round(($total_vaccinations div $population) * 100, 2) else 0
    order by $vaccination_percentage descending 
    return
    <result>
      <country>{ $c/name/text() }</country>
      <population>{ $population/text() }</population>
      <people_fully_vaccinated>{ format-number($total_vaccinations, '#,###') }</people_fully_vaccinated>
      <vaccination_percentage>{ $vaccination_percentage }%</vaccination_percentage>
    </result>
  
  
(: Rezultati del te disa shtete mbi 100% pasi keto jane shtete te vogla me shume turiste.  :)

let $html :=
<html>
  <head>
    <title>Top 20 Countries by People Fully Vaccinated</title>
    <style>
      table {{ border-collapse: collapse; width: 90%; margin: 20px auto; }}
      th, td {{ border: 1px solid #ccc; padding: 8px; text-align: center; }}
      th {{ background-color: #f2f2f2; }}
    </style>
  </head>
  <body>
    <h2 style="text-align:center;">Top 20 Countries by People Fully Vaccinated per Population</h2>
    <table>
      <tr>
        <th>Rank</th>
        <th>Country</th>
        <th>Population</th>
        <th>People Fully Vaccinated</th>
        <th>Vaccination %</th>
      </tr>
      {
        for $r at $i in subsequence($all, 1, 20)
        return <tr>
          <td>{ $i}</td>
          <td>{ $r/country/text() }</td>
          <td>{ $r/population/text() }</td>
          <td>{ $r/people_fully_vaccinated/text() }</td>
          <td>{ $r/vaccination_percentage/text() }</td>
        </tr>
      }
    </table>
  </body>
</html>


let $file := file:write("C:/Users/jonku/Desktop/vaccination_report.html", $html)

return
  <Top20>{ $all[position() <= 20] }</Top20>


