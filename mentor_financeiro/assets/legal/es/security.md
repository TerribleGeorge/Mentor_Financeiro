# Seguridad - Mentor Financeiro

**Última actualización:** 19 de mayo de 2026

Esta página explica las prácticas de seguridad de Mentor Financeiro en un lenguaje sencillo. Complementa la Política de Privacidad y los Términos de Uso.

## 1. Compromiso de seguridad

Mentor Financeiro fue desarrollado para ayudar con la organización financiera sin solicitar acceso directo a la cuenta bancaria, sin solicitar una contraseña bancaria y sin funcionar como banco, corredor o método de pago.

La aplicación puede almacenar datos financieros ingresados ​​por usted o identificados mediante funciones opcionales, por lo que tratamos la seguridad como una parte central del producto.

## 2. Qué no hace la aplicación

- No solicita contraseña bancaria, tarjeta o billetera digital.
- No accede a su cuenta bancaria.
- No mueve dinero.
- No realiza pagos, Pix, transferencias ni inversiones a tu nombre.
- No solicita código de seguridad de la tarjeta.
- No solicita código bancario OTP.
- No vende sus datos personales.

## 3. Medidas técnicas utilizadas

Dependiendo del recurso utilizado, la aplicación puede utilizar:

- Inicie sesión por Firebase Authentication.
- Cloud Firestore con datos asociados al usuario autenticado.
- Normas de seguridad para restringir el acceso a los datos propios del usuario.
- Comunicación cifrada por los SDK y servicios utilizados.
- Firebase Crashlytics para identificar fallas técnicas y corregir problemas.
- Los permisos Android se solicitan solo cuando están relacionados con las funciones de la aplicación.
- Almacenamiento local para preferencias, temas, caché y datos del dispositivo.

## 4. Monitoreo de notificaciones

El monitoreo de notificaciones es opcional y requiere activación manual en el Android.

Cuando está habilitada, la aplicación puede leer notificaciones admitidas para reconocer gastos, compras, pagos, suscripciones y transferencias. El objetivo es reducir el trabajo manual a la hora de registrar gastos.

Para reducir riesgos:

- La aplicación le informa el motivo del permiso antes de dirigirle a la configuración.
- El acceso se puede revocar en cualquier momento en la configuración de Android.
- El filtro busca eventos financieros compatibles, no conversaciones personales.
- La aplicación intenta ignorar códigos OTP, contraseñas, códigos de seguridad y mensajes de autenticación.
- La aplicación no utiliza esta función para acceder a bancos, tarjetas o billeteras digitales.

Aun así, las notificaciones pueden contener datos sensibles. Utilice esta función solo si acepta este tipo de procesamiento.

## 5. Permisos sensibles

La aplicación puede solicitar:

- **Internet:** conexión a Firebase, Google Play, API y recursos en línea.
- **Notificaciones:** envío de alertas desde la propia aplicación.
- **Ubicación:** adaptación de contenidos o comparativas al país/región, cuando esté autorizado.
- **Acceso a notificaciones Android:** identificación opcional de gastos a partir de notificaciones compatibles.
- **Compras dentro de la aplicación:** Premium suscripción por Google Play.

Usted controla estos permisos en la configuración de Android.

## 6. Tu parte en la seguridad

Para proteger sus datos:

- Utilice el bloqueo de pantalla en su dispositivo.
- No compartas tu cuenta.
- Mantenga actualizada la aplicación y Android.
- Revoca los permisos que ya no quieras utilizar.
- Verifique las transacciones identificadas automáticamente antes de tomar decisiones.
- No registre información que no desee conservar en la aplicación.
- Cancele suscripciones directamente en Google Play cuando no desee renovar.

## 7. Limitaciones

Ninguna aplicación, servidor, sistema operativo o servicio en la nube es 100% seguro. A pesar de las medidas adoptadas, pueden producirse fallos, indisponibilidad, errores de sincronización, pérdidas de acceso, problemas de terceros o intentos externos de abuso.

Mentor Financeiro busca reducir los riesgos de manera razonable, pero usted debe mantener copias o controles propios de la información financiera esencial.

## 8. Incidencias y contacto

Si nota un comportamiento extraño, acceso inadecuado, datos incorrectos, sospecha de violación de seguridad o problema con permisos confidenciales, comuníquese con:

**george.guimares@gmail.com**

Incluya, si es posible:

- Modelo de dispositivo.
- Versión Android.
- Versión de la aplicación.
- Descripción del problema.
- Capturas de pantalla sin exponer contraseñas, códigos o datos excesivos.
