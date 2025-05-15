(: Qellimi: gjen lumenjte qe kalojne ne shtetet te cilat jane antare te NATO dhe EU. Bazuar ne Query 5 nga pjesa 1:)  
  
let $validCountries :=
  for $c in //country
  let $orgs := tokenize($c/@memberships, '\s+')
  let $isNATO := some $o in $orgs satisfies $o = 'org-NATO'
  let $isEU := some $o in $orgs satisfies $o = 'org-EU'
  where $isNATO and $isEU and not($c/@car_code = ('S', 'F'))
  return $c
   
   
(: XML output result returned here :)
let $xmlResult :=
  <rivers_in_EU-Nato_countries>{
    for $r in //river
    let $riverName := $r/name[1]/text()
    let $codes := tokenize($r/@country, '\s+')
    let $validNames :=
      for $code in $codes
      where $code = $validCountries/@car_code
      let $n := //country[@car_code = $code]/name[1]
      return $n
    where exists($validNames)
    order by $riverName
    return
      <river>
        <name>{ $riverName }</name>
        {
          for $vn in $validNames
          order by $vn
          return <country>{ $vn }</country>
        }
      </river>
  }</rivers_in_EU-Nato_countries>

(: HTML list version :)
let $html :=
  <html>
    <head><title>Rivers in EU+NATO Countries</title></head>
    <body>
      <h2>Rivers in EU and NATO Countries</h2>
      <ul>{
        for $r in //river
        let $riverName := $r/name[1]/text()
        let $codes := tokenize($r/@country, '\s+')
        let $validNames :=
          for $code in $codes
          where $code = $validCountries/@car_code
          let $n := //country[@car_code = $code]/name[1]/text()
          return $n
        where exists($validNames)
        order by $riverName
        return
          <li>{ $riverName }
            <ul>{
              for $n in $validNames
              order by $n
              return <li>{ $n }</li>
            }</ul>
          </li>
      }</ul>
    </body>
  </html>


(: Write HTML to file :)
let $path := "C:/Users/jonku/Desktop/BigData Resources/xquery1_result.html"
return (
  file:write($path, $html),
  $xmlResult
)
 

  