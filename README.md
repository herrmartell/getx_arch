# Propuesta de arquitectura de Flutter
## Estructura del proyecto
#### /lib
Este es el directorio raíz del proyecto.
> #### /app
Aquí es donde los directorios y subdirectorios de la aplicación estarán contenidos.
>> #### /data
Este es el directorio responsable de contener todas las clases relacionadas a nuestros datos.
>>> #### /models
Nuestras clases, o modelos de datos responsables de abstraer nuestros objetos.
>>> #### /providers
Nuestros proveedores de datos, pueden ser una *API*, una base de datos local o remota, por ejemplo.
>>> #### /repositories
Aquí nuestros repositorios son sencillamente clases que mediarán la comunicación entre nuestros controladores y los datos.

Los controladores no necesitan saber de dónde provienen los datos, y podemos utilizar mas de un repositorio en un controlador si lo necesitamos.

Los repositorios deberán estar separados por entidades, y casi siempre pueden estar basados en las tablas de la base de datos (o de los modelos de datos). Dentro de los mismos estarán definidas las funciones que solicitan datos de una *API* o base de datos.
>> #### /modules
Cada módulo consiste en una *page* (página), su controlador respectivo, y sus dependencias o *bindings*. Consideramos cada pantalla como un módulo independiente, dado que solo tiene un controlador, y sus dependencias.

Si utilizamos *widgets* reusables en un módulo, o tenemos *pages* adicionales que son parte de un mismo flujo, puedes agregar un subdirectorio de la siguiente manera, a el mismo:
>>> #### /my_module
>>>> #### my_page.dart
>>>> #### my_controller.dart
>>>> #### my_binding.dart
>>>> #### /pages
>>>> #### /widgets

>>> #### /widgets
Widgets que pueden ser reutilizados en múltiples módulos.
>>> #### /routes
Este subdirectorio contendrá nuestras rutas y definiciones de páginas.
>>>> #### app_routes.dart
Este archivo contiene un directorio de constantes, por ejemplo:
```dart
class Routes { const home = '/home'; }
```
>>>> #### app_pages.dart
Este archivo contiene un arreglo de ruteo, por ejemplo:
```dart
class AppPages { 
	static final pages = [GetPage(name: Routes.home, page: () => HomePage())]; 
}
```
>>> #### /themes
Aquí podemos crear temas para los *widgets*, textos, colores y *assets*.
>>>> #### text_theme.dart
Ejemplo:
```dart 
final TextStyle textBody = TextStyle(fontSize: 30);
```
>>>> #### color_theme.dart
Ejemplo:
```dart 
final Color colorText = Color(0xFF000000);
```
>>>> #### app_theme.dart
Ejemplo:
```dart 
final TextTheme textTheme = TextTheme(headline1: TextStyle(color: colorText));
```
>>>> #### assets_theme.dart
Ejemplo:
```dart 
static const String myAsset = 'assets/my_asset.svg';
```
>>> #### /utils
Aquí podemos añadir utilidades para la aplicación, como *keys*, *masks*, o *helpers*. Es recomendado utilizar clases para hacer nuestras variables mas sencillas de usar.
>>>> #### keys.dart
>>>> #### masks.dart
>>>> #### helpers.dart

>> #### /services
Aquí podemos definir clases que persisten en memoria para acceder en cualquier momento a variables, funciones o datos, a través de la app. Tienen el mismo ciclo de vida de un controlador.

## Definiciones
### data
Aquí no tenemos mucho más que agregar, se trata de un repositorio donde abstraeremos todo lo relacionado a nuestros datos, los modelos, los repositorios, y proveedores de datos.
### providers
En algunas otras estructuras, el término **provider** puede tener diferentes implicaciones, en este caso en concreto, existe única y exclusivamente para hacer peticiones *http* o persistir datos en la base de datos.
### models
En nuestras clases modelo tendremos atributos y dos métodos: *toJson* y *fromJson*, responsables de convertir nuestro objeto a *json* o un *json* a nuestro objeto.
### repositories
Un repositorio es responsable de separar las entidades. Las entidades son todas las "tablas" de tu base de datos que interactuarán con tu proveedor.

El repositorio pretende abstraer y separar el origen de los datos de los controladores, de esta manera, si en algún momento se cambia la *API* del proyecto o la base de datos, solo hay que modificar los proveedores sin necesidad de cambiar los repositorios, ya que su única responsabilidad es llamar a la función del proveedor.
### modules
Los módulos contendrán los respectivos archivos: *my_page.dart*, *my_controller.dart* y *my_binding.dart*. Esto hace el proyecto mas pequeño, modular, y sencillo de mantener.
##### controller
Los controladores son la parte vital de la aplicación, pues contienen las variables donde se almacenan los valores que pueden cambiar durante la ejecución de la aplicación.

Los controladores son también responsables de consumir datos, a través de los repositorios, que a su vez solo realizan llamadas al origen de los datos a través de los proveedores.

> **REGLA**: Cada controlador deberá tener, única y exclusivamente, un repositorio. Si tenemos la necesidad de utilizar datos de dos repositorios distintos en la misma *page*, deberemos de utilizar dos *widgets* separados que consuman los datos de cada repositorio.

>**IMPORTANTE**: Puedes utilizar el mismo controlador en varias *pages*, solo si los datos en esos *pages*, consumen un solo y mismo repositorio.
##### binding
Ideal para el manejo de dependencias. Los *bindings* pueden inicializar controladores y repositorios, *APIs*, y lo que sea necesario, sin necesidad de llamarlos directamente desde un *page*.
##### page
Básicamente, nuestra interfaz.

# Mejores prácticas Dart/Flutter
## Guía de estilo
#### Siempre declarar return types
Cuando declaramos un método o función **siempre** debemos especificar un *return type*.
**BAD**:
```dart
main() { }

_bar() => _Foo();

class _Foo {
  _foo() => 42;
}
```
**GOOD**:
```dart
void main() { }

_Foo _bar() => _Foo();

class _Foo {
  int _foo() => 42;
}

typedef predicate = bool Function(Object o);
```
---
#### Evitar dynamic
Debemos evitar el uso de *dynamic* cuando no sea requerido. Dado que *dynamic* es el valor asumido del *return* de un método o función, usualmente no es necesario especificarlo.
**BAD**:
```dart
dynamic lookUpOrDefault(String name, Map map, dynamic defaultValue) {
  var value = map[name];
  if (value != null) return value;
  return defaultValue;
}
```
**GOOD**:
```dart
lookUpOrDefault(String name, Map map, defaultValue) {
  var value = map[name];
  if (value != null) return value;
  return defaultValue;
}
```
---
#### Evitar inicializar variables a null
No inicializar variables de manera explícita a un valor *null*. En Dart, una variable o campo que no está inicializado de forma explícita automáticamente es inicializada a *null*. Por lo tanto, no existe el concepto de *variable no-inicializada*. Agregar `= null` es redundante.
**BAD**:
```dart
int _nextId = null;

class LazyId {
  int _id = null;

  int get id {
    if (_nextId == null) _nextId = 0;
    if (_id == null) _id = _nextId++;

    return _id;
  }
}
```
**GOOD**:
```dart
int _nextId;

class LazyId {
  int _id;

  int get id {
    if (_nextId == null) _nextId = 0;
    if (_id == null) _id = _nextId++;

    return _id;
  }
}
```
---
#### Solo usar await en futures
Se debe evitar el uso de *await* en cualquier cosa que no sea un *future*. **await** solo es permitido para los tipos: `Future<X>`, `FutureOr<X>`, `Future<X>?`, `FutureOr<X>?` and `dynamic`. El caso especial de **await null** es permitido específicamente como una manera de introducir un *microtask delay*.
**BAD**:
```dart
main() async {
  print(await 23);
}
```
**GOOD**:
```dart
main() async {
  await null; 
  print(23);
}
```
---
#### Las constantes son definidas con lowerCamelCase
Se prefiere el uso de *lowerCamelCase* para el nombre de constantes.
**BAD**:
```dart
const PI = 3.14;
const kDefaultTimeout = 1000;
final URL_SCHEME = RegExp('^([a-z]+):');

class Dice {
  static final NUMBER_GENERATOR = Random();
}

```
**GOOD**:
```dart
const pi = 3.14;
const defaultTimeout = 1000;
final urlScheme = RegExp('^([a-z]+):');

class Dice {
  static final numberGenerator = Random();
}
```
---
#### Los nombres de los archivos son tipo my_file.dart
Úsese el siguiente formato para el nombre de los archivos **my_class_file.dart**.
**BAD**:
-   `SliderMenu.dart`
-   `filesystem.dart`
-   `file-system.dart`

**GOOD**:
-   `slider_menu.dart`
-   `file_system.dart`

#### Uso innecesario de setters y getters
Evitar envolver campos en *getters* y *setters*.

En Java y C#, es común el ocultar todos los campos detrás de *setters* y *getters* (o propiedades en C#), incluso si la implementación simplemente dirige al campo. De esa manera, si alguna vez requieres hacer mas trabajo en esos miembros, puedes hacerlo sin necesidad de tocar los archivos origen de una función o método. Esto es porque llamar un  método *getter* es distinto que el acceder a un campo, en Java, y acceder a una propiedad no es *binary compatible* con acceder un campo en C#.

Dart no tiene esta limitación. Los campos y los *setters* y *getters* son completamente indistinguibles.
**BAD**:
```dart
class Box {
  var _contents;
  get contents => _contents;
  set contents(value) {
    _contents = value;
  }
}
```
**GOOD**:
```dart
class Box {
  var contents;
}
```