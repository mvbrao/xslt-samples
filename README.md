# xslt-samples
1. Make sure java 8 or later is installed. check the current version by 'java -version'
2. download SaxonHE9-9-1-5J.zip from https://sourceforge.net/projects/saxon/files/latest/download
3. Extract above zip and check if the extract has saxon9he.jar file - XSLT2.0 parser 
4. Goto extracted dir (ex:SaxonHE9-9-1-5J) and run below command
5. java -jar saxon9he.jar -o:temp.out EmployeesData.xml EmployeesData.xsl

Note: -o:temp.out is required to avoid the error - ERROR [main] JAXPSAXProcessorInvoker  - The system identifier of the principal output file is unknown;
