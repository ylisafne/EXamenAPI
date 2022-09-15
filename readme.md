# Tarea:
------

## Requerimiento
1. Crear una tabla en SQL Server con el nombre persona, que tenga los siguientes campos, id de persona (incremental - llave primaria), nombre (string), apellido   (string), dni (string), fecha de nacimiento (date) y fec. del registro. A su vez crear los stores de insert y listar.

## Solucion
* Creamos la Base de datos con el nombre "Examen"
* Ejecutar el Script del archivo [Script.sql](./SqlScript.sql)

## Requerimiento
2. Crear un Api en .Net (C#) de tipo GET (Listar) y POST (Registrar) consumiendo la tabla Persona creada anteriormente.

## Solucion
* Descargar el repositorio [EXamenAPI](https://github.com/ylisafne/EXamenAPI) desde [GitHub](https://github.com/ylisafne/EXamenAPI)
* Si es necesario editar la cadena de conecion del archivo  [AppContext](./EXamenAPI/Models/APPContext.cs) ubicado en "EXamenAPI/Models/APPContext.cs"
* Ejecuta el servicio API desde Visual Studio (.net core 6)

# Requerimiento:
3. Consumir el Api creado en un nuevo proyecto en Web, puede usar bootstrap o alguna hoja de estilo personal. Mostrar mensaje indicando que se registro correctamente y luego listar.

## Solucion
* Requisitos para ejecutar angular
  _ Node.JS
  _ Angular CLI
  _ Ejecutar API [EXamenAPI](https://github.com/ylisafne/EXamenAPI)
* Descargar el repositorio [ExamenFE](https://github.com/ylisafne/ExamenFE) desde desde [GitHub](https://github.com/ylisafne/ExamenFE)
* Abre una ventana de cmd y cambia el directorio a la carpeta del Proyecto ExamenFE con el comando cd
```
cd (Ruta de Archivo)/ExamenFE
```
* Ejecuta el API en Visual Studio
* Para ejecutar el Front End ejecuta el Siguiente comando
```
cd ng serve --o
```
Video Explicando el Funcionamiento [Video](https://youtu.be/vXKIDJIs5qI)


