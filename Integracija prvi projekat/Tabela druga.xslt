<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  

  <xsl:template match="Adresar">
    <html>
      <head>
        <title>Page Title</title>
      </head>
      <body>
        <h3>Adresa stalna i datum rođenja u opsegu od 1990-2005 godine: </h3>
        <h4>Osobe: </h4>
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
          <xsl:apply-templates select="Osoba" mode="adresadatumosobe"/>
        </table>

        <h4>Kompanije: </h4>
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
          <xsl:apply-templates select="Kompanija" mode="adresadatumkompanije"/>
        </table>

        <h3>Osobe cije prezime pocinje sa M</h3>
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
          <xsl:apply-templates select="Osoba" mode="prezimenam"/>
        </table>

        <h3>Kompanije sa nazivom duzim od 6</h3>
        <table border="1px">
          <tr bgcolor="#9acd32">
            <td>Naziv</td>
            <td>Ulica</td>
            <td>Broj</td>
            <td>Grad</td>
            <td>Drzava</td>
            <td>Telefon</td>
            <td>Email</td>
          </tr>
          <xsl:apply-templates select="Kompanija" mode="nazivod"/>
        </table>
      </body>
    </html>
  </xsl:template>


  <xsl:template match="Osoba" mode="adresadatumosobe">
    <xsl:if test="Adresa/@tipAdrese = 'stalna' and Datumrodjenja/godina &gt; 1990 and Datumrodjenja/godina &lt; 2005">
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

  <xsl:template match="Kompanija" mode="adresadatumkompanije">
    <xsl:if test="Adresa/@tipAdrese = 'stalna'">
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

  <xsl:template match="Osoba" mode="prezimenam">
    <xsl:if test="starts-with(Punoime/prezime,'M') ">
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

  <xsl:template match="Kompanija" mode="nazivod">
    <xsl:if test=" string-length(Naziv) &gt; 6 ">
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
