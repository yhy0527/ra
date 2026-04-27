<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <meta charset="UTF-8"/>
                <title>Guided Learning Records</title>
                <style>
                    body { font-family: Arial, sans-serif; max-width: 800px; margin: 20px auto; padding: 0 20px; }
                    .record { border: 1px solid #ccc; margin: 15px 0; padding: 10px; border-radius: 5px; }
                    .language { font-size: 1.4em; font-weight: bold; color: #2c3e50; }
                    .description { margin: 8px 0; font-style: italic; }
                    .grades { margin-top: 8px; }
                    .grade { display: inline-block; margin-right: 20px; }
                    .achieved { color: green; font-weight: bold; }
                    .unattained { color: red; }
                    footer { margin-top: 30px; text-align: center; font-size: 0.8em; border-top: 1px solid #ccc; padding-top: 10px; }
                </style>
            </head>
            <body>
                <h1 style="text-align:center;">Guided Learning Records</h1>
                <xsl:for-each select="//record[@type='guided']">
                    <xsl:sort select="language" order="ascending"/>
                    <div class="record">
                        <div class="language"><xsl:value-of select="language"/></div>
                        <div class="description"><xsl:value-of select="description"/></div>
                        <div class="grades">
                            <!-- Level A -->
                            <xsl:for-each select="grades/result[@level='A']">
                                <div class="grade">
                                    A: 
                                    <xsl:choose>
                                        <xsl:when test=". = 'ACHIEVED'"><span class="achieved">ACHIEVED</span></xsl:when>
                                        <xsl:otherwise><span class="unattained">UNATTAINED</span></xsl:otherwise>
                                    </xsl:choose>
                                </div>
                            </xsl:for-each>
                            <!-- Level B -->
                            <xsl:for-each select="grades/result[@level='B']">
                                <div class="grade">
                                    B: 
                                    <xsl:choose>
                                        <xsl:when test=". = 'ACHIEVED'"><span class="achieved">ACHIEVED</span></xsl:when>
                                        <xsl:otherwise><span class="unattained">UNATTAINED</span></xsl:otherwise>
                                    </xsl:choose>
                                </div>
                            </xsl:for-each>
                            <!-- Level C -->
                            <xsl:for-each select="grades/result[@level='C']">
                                <div class="grade">
                                    C: 
                                    <xsl:choose>
                                        <xsl:when test=". = 'ACHIEVED'"><span class="achieved">ACHIEVED</span></xsl:when>
                                        <xsl:otherwise><span class="unattained">UNATTAINED</span></xsl:otherwise>
                                    </xsl:choose>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </xsl:for-each>
                <footer>
                    <p>&copy; College Productions Ltd</p>
                </footer>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
