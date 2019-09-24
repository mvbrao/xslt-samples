from lxml import etree

data = open('EmployeesData.xsl')
xslt_content = data.read()
xslt_root = etree.XML(xslt_content)
dom = etree.parse('EmployeesData.xml')
transform = etree.XSLT(xslt_root)
result = transform(dom)
f = open('active_employees_at_esi.csv', 'w')
f.write(str(result))
f.close()
