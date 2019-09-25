<?xml version="1.0"?>
<xsl:stylesheet version="2.0" 
                exclude-result-prefixes="ws xsi"
                xmlns:ws="urn:com.workday/workersync"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output indent="yes" method="text" encoding="utf-8" omit-xml-declaration="yes"/>
    <xsl:variable name="date" select="format-dateTime(current-dateTime(), '[Y0001][M01][D01]')"/>
    <xsl:template match="*">
        <xsl:result-document href="Demo_Person_File_{$date}.txt" method="text">
            <xsl:text>Full Name,Employee Status,Employee Number,Last Name,First Name,Middle Name,Gender,Business Email,Business Title,Hire Date,Business Unit,Department</xsl:text>
            <xsl:text>&#xa;</xsl:text>
            <xsl:for-each select="/ws:Worker_Sync/ws:Worker">
                <xsl:if test="(ws:Status/ws:Employee_Status[text()='Active']) and (ws:Position/ws:Organization_Data[1]/ws:Organization[contains(text(),'ESI')])" >
                    <xsl:value-of select="ws:Summary/ws:Name"/>,A,<xsl:value-of select="ws:Summary/ws:Employee_ID"/>,<xsl:value-of select="ws:Personal/ws:Name_Data[1]/ws:Last_Name"/>,<xsl:value-of select="ws:Personal/ws:Name_Data[1]/ws:First_Name"/>,<xsl:value-of select="ws:Personal/ws:Name_Data/ws:Middle_Name"/>,<xsl:value-of select="ws:Personal/ws:Gender"/>,<xsl:value-of select="ws:Personal/ws:Email_Data/ws:Email_Address"/>,<xsl:value-of select="ws:Position/ws:Business_Title"/>, <xsl:value-of select="ws:Status/ws:Original_Hire_Date"/>,<xsl:value-of select="ws:Position/ws:Organization_Data[1]/ws:Organization"/>,<xsl:value-of select="ws:Position/ws:Organization_Data[2]/ws:Organization"/>
                    <xsl:text>&#xa;</xsl:text>
                </xsl:if>
             </xsl:for-each>
        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
