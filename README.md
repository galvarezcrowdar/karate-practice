# karate-practice
 Repositorio para revision de practicas del Test Automation Engineer - 6ta Edición - 2022


Practicas realizadas: 

>[src/test/java/examples/clockify](src/test/java/examples/clockify) : Clase 15 - Pruebas de APIs con Karate
>
>1. Consultar proyecto por id. [Scenario: Find project By ID](src/test/java/examples/clockify/project.feature)
>2. Agregar horas a un proyecto. [Scenario Outline: Add a new time entry](src/test/java/examples/clockify/timeEntries.feature)
>3. Editar un campo de algún registro de hora. [Scenario Outline: Update time entry on workspace](src/test/java/examples/clockify/timeEntries.feature)
>4. Eliminar hora registrada. [Scenario: Delete time entry from workspace](src/test/java/examples/clockify/timeEntries.feature)

>[src/test/java/examples/shorten](src/test/java/examples/shorten) : Trabajo Práctico 10 - Pruebas con Karate
> 
> Para la API Shorten, realizar la implementación de las pruebas que se ven realizaron en la collection de Postman adjunta.
> Las verificaciones a realizar son las siguientes:
> - Shorten - Status 200 - Response {"result_url": Validar que es un String}
> - Shorten Sin Body - Status 400 - Validar Response {"error": "API Error: URL is empty"}
> - Shorten Invalid URL - Status 400 - Validar Response {"error": "API Error: After sanitization URL is empty"}
> - Shorten invalid Token - Status 403 - Validar Response {"message": "You are not subscribed to this API."}
>
>La especificación completa de la API la podes ver en esta URL:
https://rapidapi.com/BigLobster/api/url-shortener-service/

