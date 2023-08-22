# Atlanta-Crime-Analysis-Graph-DataBase
The Atlanta Crime project delves into understanding crime trends and patterns in Atlanta using sophisticated data analysis techniques. The foundation of our analysis comes from raw crime data, which is provided in the CSVfiles_1000.zip. This data undergoes an initial cleansing and preprocessing phase, as detailed in the Data Processing.ipynb Jupyter notebook.

Post this preprocessing, the data is primed for insertion into a structured storage, specifically, a data warehouse. SQL scripts such as BuildLoad Tables.sql, InsertData.sql, and CreateViews.sql are leveraged in SSMS (Visual Studio) to structure, insert, and create the necessary views for our data in the warehouse environment.

For visualization and detailed interpretation, reports such as AtlantaCrimeProject Report.pdf and Association Rule Mining Report.pdf are prepared. The AtlantaCrimeProject.pbix is a Power BI file that provides interactive visualizations, allowing users to navigate through the data insights dynamically.

In parallel, we explore the potential of graph databases to uncover relationships and patterns that might not be evident in traditional relational databases. The DataProcessingP2.ipynb notebook offers tailored data processing to prepare the data for the graph database. Subsequently, the BuildLoad Tables.sql for DataGrip and Cypher script.txt for Neo4j help in constructing the nodes and relationships inherent in the crime data. The findings from the graph database are elegantly summarized in the Project2_GraphDB.pdf report and Project2_Presentation.pdf.
