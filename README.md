# notifications
Descripción
Este proyecto te permite implementar notificaciones push en tu aplicación Flutter utilizando Firebase Cloud Messaging (FCM). Puedes recibir notificaciones push de manera efectiva.

## Requisitos previos
Antes de ejecutar la aplicación, asegúrate de tener Flutter instalado en tu sistema. Puedes encontrar instrucciones para instalar Flutter [aquí](https://flutter.dev/).

## Configuración de Firebase
Crea un proyecto en Firebase.

Registra tu aplicación Flutter en la consola de Firebase como aplicación de flutter, no hacer de forma independiente en android e ios, seguir todos los pasos que indican.

Debes poder ver el archivo firebase_options.dart en tu proyecto.

## Dependencias
Este proyecto hace uso de las siguientes dependencias:

firebase_core: Configuración central de Firebase.

firebase_messaging: Implementa las notificaciones push con FCM.

firebase_in_app_messaging: Permite mostrar mensajes emergentes de Firebase In-App Messaging.

permission_handler: Gestiona los permisos necesarios para recibir notificaciones push.

Asegúrate de agregar estas dependencias a tu archivo pubspec.yaml:

## Enviar una notificacion
En el apartado de "Messaging" de Firebase, crearás una nueva campaña y seleccionarás "Mensajes de Firebase Notifications". En el botón "Enviar mensaje de prueba", deberás agregar el token de tu dispositivo. El token se obtiene en la consola al iniciar la aplicación.


## Ejecutando la aplicación
Después de completar la configuración anterior, puedes ejecutar la aplicación con:
flutter run
