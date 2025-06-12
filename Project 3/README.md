# Big Data Project – MongoDB, Apache Spark dhe Social Network Analysis

Ky projekt trajton manipulimin dhe analizën e të dhënave të mëdha duke përdorur teknologji moderne si NoSQL (MongoDB), Apache Spark dhe analiza e rrjeteve sociale (Social Network Analysis – SNA). Projekti është ndarë në tri pjesë:

1. Ruajtja dhe manipulimi i të dhënave me MongoDB duke transformuar skema relacionale në JSON dhe duke ekzekutuar query pa JOIN.
2. Përpunimi i dataset-eve të mëdha me Apache Spark në Google Colab, përmes DataFrame API dhe SparkSQL.
3. Analiza vizuale dhe algoritmike e rrjeteve sociale përmes ORA Lite dhe Gephi duke përdorur dataset-in Enron Email dhe rrjete bashkë-autorie.

---

## Project Structure



```text
Project 3/
│
├── Big Data - Spark/
│   ├── Spark_Flight_dataset_results.pdf
│   ├── Spark_Flight_Dataset.ipynb
│   ├── Spark_Mondial_results.pdf
│   └── Spark_Mondial.ipynb
│
├── Documents/
│   ├── Dokumentimi_BigData_Project_3.pdf
│   └── Prezantimi_Big_Data_Project_3.pdf
│
├── NOSQL/
│   ├── query2_mongodb.js
│   ├── query4_mongodb.js
│   ├── Query2_result.json
│   └── Query4_result.json
│
├── Resources/
│   └── Datasets/
│       ├── mondial/
│       ├── enron_dataset.csv
│       ├── enron_edges.csv
│       ├── enron_nodes.csv
│       ├── flight_data.txt
│       ├── poetry-little-review-edges.csv
│       └── poetry-little-review-nodes.csv
│
├── SocialNetworkAnalysis/
│   ├── CentralityReports/
│   ├── ExportedPNGFormats/
│   └── SNA_workspaces/
│
└── util/
    └── SQL_to_csv.py
```

---

## Teknologji të përdorura

- **MongoDB** – për ruajtjen fleksibile të të dhënave në format dokumentesh.
- **Apache Spark (3.4.1)** – për analizën e dataset-eve të mëdha në memorie.
- **Google Colab** – si ambient cloud për zhvillim dhe analizë me Spark.
- **ORA Lite & Gephi** – për analizën dhe vizualizimin e rrjeteve komplekse.
- **Python & Pandas** – për transformime dhe konvertime të të dhënave.

---

## Hapat për ekzekutim


### 1. MongoDB

- Instaloni MongoDB ose përdorni MongoDB Atlas
- Ekzekutoni skriptat `query2_mongodb.js` dhe `query4_mongodb.js` përmes `mongosh`
- Shikoni rezultatet në `Query2_result.json` dhe `Query4_result.json`

### 2. Spark në Google Colab

- Hap `Spark_Mondial.ipynb` ose `Spark_Flight_Dataset.ipynb`
- Në fillim të notebook-ut gjenden komandat për instalim të Spark dhe Java
- Ekzekuto rend pas rendi komandat dhe shiko rezultatet.
- Dataset-et ruhen në Google Drive ose nga github
- Analizat bëhen përmes `spark.read.csv(...)` dhe `spark.sql(...)`


### 3. Analiza e Rrjeteve Sociale (SNA)

Hapni file `OraLiteSocial-NetworkAnalysis.xml` në Graphi

Ose nga fillimi:

- Importoni `enron_nodes.csv` dhe `enron_edges.csv` në ORA Lite
- Vizualizoni rrjetin dhe kalkuloni metrikat (degree, closeness, betweenness)
- Raportet ndodhen në `CentralityReports/`
- Vizualizimet janë të eksportuara në `ExportedPNGFormats/`

Hapni file `GephiSocial-NetworkAnalysis.gephi` në Graphi

Ose nga fillimi:
- Importoni `poetry-little-review-edges.csv` dhe `poetry-little-review-nodes.csv` në Graphi
- Vizualizoni rrjetin dhe kalkuloni metrikat (degree, closeness, betweenness)
- Raportet ndodhen në `CentralityReports/`
- Vizualizimet janë të eksportuara në `ExportedPNGFormats/`
---

## Dataset-e të përdorura

- **Mondial** – të dhëna për shtete, qytete, lumenj dhe organizata ndërkombëtare
- **Flight Data with 1M+ Records** – [link](https://www.kaggle.com/datasets/polartech/flight-data-with-1-million-or-more-records)
- **Enron Email Dataset** – rrjet komunikimi mes punonjësve të Enron
- **Poetry Author Dataset** – lidhja mes shkrimtarëve dhe veprave të tyre në poezi
---

## Si të konvertoni të dhëna SQL në CSV

Shih `util/SQL_to_csv.py` – ky skript mund të përdoret për të nxjerrë tabela nga një bazë relacionale MySQL dhe t’i ruajë si CSV për analizë në Spark.

---

Nëse dëshironi të kontribuoni ose keni nevojë për më shumë informata, mund të kontaktoni anëtarët e ekipit përmes adresave të email-it në dokumentim.
