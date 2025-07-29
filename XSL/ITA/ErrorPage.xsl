<?xml version="1.0" encoding="ISO8859-1"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template match="/">
    <xsl:output method="html" indent="no"/>
    <html>
      <head><title>Errore</title></head>
			
      <body>																		

        <!-- =====[[ DEBUG ]]===== -->

        <xsl:apply-templates select="ROOT/EXCEPTION"/>
        <table>
                <xsl:apply-templates select="ROOT/PARAMETERS/*"/>
        </table>	
        <br/><br/>
        <table>
                <xsl:apply-templates select="ROOT/INFO/*"/>
        </table>		
        <!-- =====[[ /DEBUG ]]===== -->																												          

      </body>
    </html>

  </xsl:template>


  <!-- =====[[ TEMPLATES  ]]===== -->

  <!-- =====[[ ECCEZIONE  ]]===== -->
  <xsl:template match="ROOT/EXCEPTION">
    <xsl:value-of select="MESSAGE"/><br/>
    <pre><xsl:value-of select="STACKTRACE"/></pre>
  </xsl:template>
  <!-- =====[[ /ECCEZIONE  ]]===== -->

  <!-- =====[[ PARAMETERS  ]]===== -->
  <xsl:template match="ROOT/PARAMETERS/*">
    <tr>
      <td><xsl:value-of select="name()" /> [<xsl:value-of select="@INDEX" />]</td>		
      <td><xsl:value-of select="." /></td>
    </tr>
  </xsl:template>
  <!-- =====[[ /PARAMETERS  ]]===== -->

  <!-- =====[[ INFO  ]]===== -->
  <xsl:template match="ROOT/INFO/*">
    <tr>
      <td><xsl:value-of select="name()" /></td>		
      <td><xsl:value-of select="." /></td>
    </tr>
  </xsl:template>
  <!-- =====[[ /INFO  ]]===== -->
	
</xsl:stylesheet>


