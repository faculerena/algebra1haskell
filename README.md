# Algebra 1 en Haskell

## Ejercicios hechos en clase durante 2C2022

No me hago responsable si estan mal hago lo mejor que puedo, revisenlo y cualquier cosa creen un issue o lo que sea si me olvido de actualizar!

Actualizado hasta clase 7.


# Gitkraken les facilita la vida. 

Las instrucciones siguen siendo válidas, pero si usan gitkraken, el paso 1, 3 y 4 se pueden hacer desde la configuracion de Kraken y realmente es *mucho* mejor para las cosas básicas (y no tan basicas) y el paso 2 no es necesario.

La seccion de subir los archivos pasa a ser "Stage all changes" y escribir el commit en GitKraken


Si necesitan una cuenta "Pro" de GitKraken, pedir a la facultad un certificado de alumno regular y enviarlo a GitHub para conseguir una "Cuenta de Estudiante"

## Como subir un archivo a GitHub - Preparacion:

Asumiendo que estas en linux, o en windows despues de instalar Git

### 0- Hacé git clone!

```
git clone https://github.com/faculerena/algebra1haskell
```

### 1- Personal Access Token

Ir a Configuracion, Dev Settings (es la ultima opcion en la columna de la izquierda) y generar un PAT (Personal Access Token), guardarlo porque lo podes ver una vez

### 2- Agregando sus datos a la terminal:

En la terminal ponen esto:
```
git config --global user.name "Tu nombre"
git config --global user.email “ejemplo@mail.com”
```

En ese caso usamos ``` --global ``` porque es su computadora y no necesitamos verificar en cada git que hagan quienes son.

```
git remote set-url origin git@github.com:faculerena/algebra1haskell.git
git remote -v 
```

### 3- Generar una key SSH:

```
ssh-keygen
```

Esto va a generar unos archivos, entre los cuales esta su clave publica (id_rsa.pub) y la clave privada (id_rsa)

### 4- Agregar una clave SSH a GitHub:

Abran id_rsa.pub (click derecho, abrir con - algun editor de texto-) 
Van a la pagina: https://github.com/settings/keys
Agregan una clave SSH y le dan permisos de read y write. Por favor, ponganle un nombre que se acuerden por las dudas que despues hagan más. Por referencia, la mia se llama algo del estilo PC_Casa_Fedora.

Si les pide una Passphrase en algun momento, es como un apodo para toda esa clave publica que es mucho texto, pongan una palabra como si fuese una contraseña, no se la olviden.


## Subiendo un archivo al repositorio:

Una vez que te agregue como colaborador, podes hacer esto:

### Paso 0: Pull

Antes de nada:

```
git pull
```

Lo que hace es actualizar el repositorio que tienen ustedes copiado en la computadora con lo que esta en Github.

#### Ahora hagan lo que necesiten!

### Paso 1: Commit

Cuando vayan a subir un archivo, o actualizar un archivo que editaron, tienen que poner en su terminal de confianza:

```
git add -A
```

Esto lo que hace es agregar todos los archivos modificados a la fila para ser subidos a GitHub

```
git commit -a -S -m "Qué hicieron?"
```

Ahora ponen git commit, que basicamente es comentar su subida. Agreguen entre las comillas que fue lo que hicieron, o si es una actualizacion pongan "Update hasta X ejercicio", "Update hasta X fecha", etc. Mientras mas detallado, un poco mejor.

### Paso 2: Push

```
git push origin main
```

Este comando es para subir los archivos, como es un repositorio basico y no hay mucho quilombo, solamente necesitamos subirlo a la rama principal (y única).