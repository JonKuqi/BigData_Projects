<p align="center">
  <a href="https://fiek.uni-pr.edu/">
    <img src="/Images/logo1.png" alt="Logo" height="40">
  </a>

<h3 align="center">XML & Vizualizimi i të dhënave</h3>
</p>

## Përmbledhje

Ky projekt ka për qëllim të demonstrojë përdorimin e gjuhës XML për përpunimin e të dhënave dhe vizualizimin e tyre nëpërmjet mjeteve të ndryshme si Power BI dhe Looker Studio. Projekti gjithashtu përfshin shkrimin e pyetjeve në XQuery dhe XPath, konvertimin e të dhënave, dhe pastaj analizimin e tyre përmes dashboards interaktive. <br><br><br>

## Karakteristikat

- **Query në XQuery & XPath:** Përpunimi dhe nxjerrja e informacionit nga dokumentet XML.
- **Konvertimi i të dhënave:** Skripta për konvertim të XML në CSV dhe pastrim të të dhënave.
- **Vizualizim përmes dashboards:** Analiza vizuale me Power BI dhe Looker.
- **Dokumentim teknik & prezantues:** Dokumentacion që mbulon të gjitha fazat e zhvillimit dhe analizës së të dhënave. <br><br><br>

## Struktura/files e Projektit

```
BigData_Porject2
│
├── XML/                         
│   ├── XQuery_mondial_query4.xq
│   ├── XQuery_mondial_query5.xq
|   ├── XQuery_shtese_mondial-vaccinations.xq  
│   ├── XPath_mondial_1.xpath
│   ├── XPath_mondial_2.xpath
│   └── HTML/files
│
├── BI/                          
│   ├── dashboards.pbix
│   ├── looker_links.txt
│   ├── exported_PDFs/
│      ├── dashboard1.pdf
│      └── dashboard2.pdf
│     
│
├── Documents/                  
│   ├── Technical_Documentation.pdf    
│   ├── Challenges_Solutions.pdf       
│   └── slides.pptx                     
│
├── Resources/                 
│   ├── covid_data.csv
│   ├── mondial_dump.sql
│   ├── mondial.csv
│   ├── global_terrorism.csv
│   └── other_extra_data.xlsx/.csv
│
├── Util/                      
│   ├── ConverteJSONtoCSV.py
│   ├── ConverteJSONtoXML.py
│   ├── XMLValidator.py
│
├── Images/(needed for this readme file .markdown)
|
└── README.md
```
<br><br><br>

## Tools/Kërkesat

- Python 3.8+: Nevojitet për të ekzekutuar skriptet ndihmëse.
- Power BI / Looker Studio: Për ndërtimin dhe eksportimin e dashboards.
- Për të instaluar bibliotekat e nevojshme Python:

```sh
pip install -r requirements.txt
```
<br><br><br>

## Screenshots/Shembuj Ekzekutimi

### Dashboard në Power BI:
<img src="/Images/sc1.png" alt="Dashboard" width="700"/>

### Query XPath Rezultati/HTML:
<img src="/Images/sc2.png" alt="XPath Result" width="700" height="400"/>

<br><br><br>

## Punuan:
- Endrit Kastrati, Erza Gashi, Jon Kuçi, Kaltrina Krasniqi dhe Mirgeta Gashi.

<a href="#top">Shko në fillim ↑</a>
