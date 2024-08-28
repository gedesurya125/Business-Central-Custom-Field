# Sources

- [Reference Video](https://www.youtube.com/watch?v=xob-ic-Pw98)

# Publishing

run command pallet AL:Publish without debugging or AL:Publish with debugging

# Publishing to production environment

1. generate permission set using command pallet AL:Generate Permission set as XML
2. create package using command pallet Al:Package
3. upload the extension to the production package by going to extension management and then upload the extension. The extension app file is the file that suffixed with .app

# API EXAMPLE TO FETCH THE LIST OF CUSTOM FIELDS

- https://api.businesscentral.dynamics.com/v2.0/{{tenant_id}}/Ambratec3/api/suryacompany/customfields/v1.0/customcategories?company='CRONUS DE'
