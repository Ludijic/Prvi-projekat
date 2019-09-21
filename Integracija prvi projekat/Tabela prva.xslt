<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>

  <xsl:template match="Adresar">
    <html>
      <head>
        <title>Page Title</title>
      </head>
      <body>
        <h3>Osobe sa vise od 2 mejla</h3>
        <table border="1">
          <tr bgcolor="#9acd32">
            <td>Ime</td>
            <td>Srednje ime</td>
            <td>Prezime</td>
            <td>Dan</td>
            <td>Mesec</td>
            <td>Godina</td>
            <td>Ulica</td>
            <td>Broj</td>
            <td>Grad</td>
            <td>Drzava</td>
            <td>Telefon</td>
            <td>Email</td>
          </tr>

          <xsl:apply-templates select="Osoba" mode="osoba"/>
        </table>
        
        <h3>Kompanije sa vise od 2 mejla</h3>
        <table border="1">
          <tr bgcolor="#9acd32">
            <td>Naziv</td>
            <td>Ulica</td>
            <td>Broj</td>
            <td>Grad</td>
            <td>Drzava</td>
            <td>Telefon</td>
            <td>Email</td>
          </tr>

          <xsl:apply-templates select="Kompanija" mode="kompanije"/>
        </table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Osoba" mode="osoba">
    <xsl:if test="count(Email) > 2">
      <tr>
        <td>
          <xsl:value-of select="Punoime/ime"/>
        </td>
        <td>
          <xsl:value-of select="Punoime/srednjeime"/>
        </td>
        <td>
          <xsl:value-of select="Punoime/prezime"/>
        </td>
        <td>
          <xsl:value-of select="Datumrodjenja/dan"/>
        </td>
        <td>
          <xsl:value-of select="Datumrodjenja/mesec"/>
        </td>
        <td>
          <xsl:value-of select="Datumrodjenja/godina"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/ulica"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/broj"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/grad"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/drzava"/>
        </td>
        <td>
          <xsl:value-of select="Telefon"/>
        </td>
       
        <xsl:for-each select="Email">
          <td>
             <xsl:value-of select="."/>
          </td>
        </xsl:for-each>
        
       </tr>
     </xsl:if>
  </xsl:template>
  
  <xsl:template match="Kompanija" mode="kompanije">
    <xsl:if test="count(Email) > 2">
      <tr>
        <td>
          <xsl:value-of select="Naziv"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/ulica"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/broj"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/grad"/>
        </td>
        <td>
          <xsl:value-of select="Adresa/drzava"/>
        </td>
        <td>
          <xsl:value-of select="Telefon"/>
        </td>

        <xsl:for-each select="Email">
          <td>
            <xsl:value-of select="."/>
          </td>
        </xsl:for-each>
          
      </tr>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>
